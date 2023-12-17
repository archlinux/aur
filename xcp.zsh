#compdef xcp

typeset -A opt_args

_xcp() {
  local -a args

  # short + long
  args+=(
    '(- *)'{-h,--help}'[Print help]'
    \*{-v,--verbose}'[Increase verbosity (can be repeated)]'
    {-T,--no-target-directory}'[Overwrite target directory, do not create a subdirectory]'
    {-g,--glob}'[Expand filename patterns]'
    {-n,--no-clobber}'[Do not overwrite an existing file]'
    {-r,--recursive}'[Copy directories recursively]'
    {-w,--workers}'[Workers for recursive copies (0=auto)]:workers:(0 1 2 4 8 16 32)'
  )

  # long
  args+=(
    --block-size'[Block size for file operations]: :_numbers -u bytes size B K M G T P'
    --driver'[How to parallelize file operations]:driver:((
      parfile\:"parallelize at the file level"
      parblock\:"parallelize at the block level"
    ))'
    --fsync'[Sync each file to disk after it is written]'
    --gitignore'[Use .gitignore if present]'
    --no-perms'[Do not copy file permissions]'
    --no-progress'[Disable progress bar]'
  )

  # positional
  args+=(
    '*:paths:_files'
  )

  _arguments -s -S $args
}

_xcp "$@"
