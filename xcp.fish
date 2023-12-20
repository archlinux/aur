set -l drivers 'parfile parblock'
set -l reflinks 'auto always never'

# short + long
complete -c xcp -s T -l no-target-directory -d 'Overwrite target directory, do not create a subdirectory'
complete -c xcp -s g -l glob                -d 'Expand filename patterns'
complete -c xcp -s h -l help -f             -d 'Print help'
complete -c xcp -s n -l no-clobber          -d 'Do not overwrite an existing file'
complete -c xcp -s r -l recursive           -d 'Copy directories recursively'
complete -c xcp -s v -l verbose             -d 'Increase verbosity (can be repeated)'
complete -c xcp -s w -l workers             -d 'Workers for recursive copies (0=auto)' -x -a '(seq 0 (getconf _NPROCESSORS_ONLN))'

# long
complete -c xcp -l fsync       -d 'Sync each file to disk after it is written'
complete -c xcp -l gitignore   -d 'Use .gitignore if present'
complete -c xcp -l no-perms    -d 'Do not copy file permissions'
complete -c xcp -l no-progress -d 'Disable progress bar'
complete -c xcp -l block-size  -d 'Block size for file operations' -x -a '(seq 1 16){K,M,G}'
complete -c xcp -l driver      -d 'Parallelize at the file or at the block level' -x -a "$drivers"
complete -c xcp -l reflink     -d 'Whether and how to use reflinks' -x -a "$reflinks"

# docs: https://fishshell.com/docs/current/completions.html
# path: /usr/share/fish/vendor_completions.d/xcp.fish
# vim: sw=2 sts=2 et ai ft=fish
