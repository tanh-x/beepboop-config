function nfzf
    set file (fzf --preview='cat {} | head -n 32')
    if test "$status" = 0
        nano $file
    end
end