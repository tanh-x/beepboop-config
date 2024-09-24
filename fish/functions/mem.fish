#!/usr/bin/fish

function mem
    set unit "m"
    set pid ""

    for arg in $argv
        switch $arg
            case '-b'
                set unit "b"
            case '-k'
                set unit "k"
            case '-m'
                set unit "m"
            case '*'
                set pid $arg
        end
    end

    if test -z "$pid"
        echo "Usage: mem -[b|k|m] <pid>"
        return 1
    end

    set process_name (grep '^Name:' /proc/$pid/status | awk '{print $2}')
    set rss (grep VmRSS /proc/$pid/status | awk '{print $2}')
    set swap (grep VmSwap /proc/$pid/status | awk '{print $2}')

    if test -z "$rss"
        set rss 0
    end

    if test -z "$swap"
        set swap 0
    end

    set total_memory_kb (math $rss + $swap)

    switch $unit
        case 'b'
            set total_memory (math "$total_memory_kb * 1024")
            set unit_str "bytes"
        case 'k'
            set total_memory $total_memory_kb
            set unit_str "KB"
        case 'm'
            set total_memory (math "$total_memory_kb / 1024")
            set unit_str "MB"
    end

    echo "$process_name: $total_memory $unit_str"
end
