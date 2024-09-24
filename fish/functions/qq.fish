function qq
    nohup $argv > /var/tmp/stdout.txt 2> /var/tmp/stderr.txt &
end