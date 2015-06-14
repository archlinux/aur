augroup filetypedetect
    au! BufRead,BufNewFile /var/log/*/*.log,*.info,*.err set filetype=syslog
    au! BufRead,BufNewFile /var/log/*/*.log-[0-9]\{8\},*.info-[0-9]\{8\},*.err-[0-9]\{8\},*.warn-[0-9]\{8\} set filetype=syslog
    au! BufRead,BufNewFile /var/log/*/*.log.[0-9]\{1,2\},*.info.[0-9]\{1,2\},*.err.[0-9]\{1,2\},*.warn.[0-9]\{1,2\} set filetype=syslog
augroup END
