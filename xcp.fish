# https://fishshell.com/docs/current/completions.html

# short + long, no arguments
complete -c xcp -s T -l no-target-directory -d 'Overwrite target directory, do not create a subdirectory'
complete -c xcp -s g -l glob                -d 'Expand filename patterns'
complete -c xcp -s h -l help                -d 'Print help'
complete -c xcp -s n -l no-clobber          -d 'Do not overwrite an existing file'
complete -c xcp -s r -l recursive           -d 'Copy directories recursively'
complete -c xcp -s v -l verbose             -d 'Increase verbosity'

# long, no arguments
complete -c xcp -l fsync       -d 'Sync each file to disk after it is written'
complete -c xcp -l gitignore   -d 'Use .gitignore if present'
complete -c xcp -l no-perms    -d 'Do not copy file permissions'
complete -c xcp -l no-progress -d 'Disable progress bar'

# with arguments
complete -c xcp -x -s w -l workers     -a '0 1 2 4 8 16 32'    -d 'Workers for recursive copies (≤0 means use number of CPUs)'
complete -c xcp -x      -l block-size  -a '(seq 1 16){K,M,G}'  -d 'Block size for file operations'
complete -c xcp -x      -l driver      -a 'parfile parblock'   -d 'Parallelize at the file or at the block level'

