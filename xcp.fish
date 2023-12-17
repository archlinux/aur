# https://fishshell.com/docs/current/completions.html

# short + long
complete -c xcp -s T -l no-target-directory -d 'Overwrite target directory, do not create a subdirectory'
complete -c xcp -s g -l glob                -d 'Expand filename patterns'
complete -c xcp -s h -l help                -d 'Print help'
complete -c xcp -s n -l no-clobber          -d 'Do not overwrite an existing file'
complete -c xcp -s r -l recursive           -d 'Copy directories recursively'
complete -c xcp -s v -l verbose             -d 'Increase verbosity (can be repeated)'
complete -c xcp -s w -l workers             -d 'Workers for recursive copies (0=auto)' -x -a '0 1 2 4 8 16 32'

# long
complete -c xcp -l fsync       -d 'Sync each file to disk after it is written'
complete -c xcp -l gitignore   -d 'Use .gitignore if present'
complete -c xcp -l no-perms    -d 'Do not copy file permissions'
complete -c xcp -l no-progress -d 'Disable progress bar'
complete -c xcp -l block-size  -d 'Block size for file operations'                -x -a '(seq 1 16){K,M,G}'
complete -c xcp -l driver      -d 'Parallelize at the file or at the block level' -x -a 'parfile parblock'

