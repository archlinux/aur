#compdef xcp

typeset -A opt_args

_xcp() {
  local -a args

  # short + long
  args+=(
    '(- *)'{-h,--help}'[Print help]'
    '*'{-v,--verbose}'[Increase verbosity (can be repeated)]'
    {-T,--no-target-directory}'[Overwrite target directory, do not create a subdirectory]'
    {-g,--glob}'[Expand filename patterns]'
    {-n,--no-clobber}'[Do not overwrite an existing file]'
    {-r,--recursive}'[Copy directories recursively]'
    {-w,--workers}'[Workers for recursive copies (0=auto)]:workers:_values workers {0..$(getconf _NPROCESSORS_ONLN)}'
  )

  # long
  args+=(
    --block-size'[Block size for file operations]: :_numbers -u bytes -d 1M size B K M G T P'
    --driver'[How to parallelize file operations]:driver:((
      parfile\:"parallelize at the file level"
      parblock\:"parallelize at the block level"
    ))'
    --reflink'[Whether and how to use reflinks]:reflink:((
      auto\:"attempt to reflink and fallback to a copy (default)"
      always\:"return an error if it cannot reflink"
      never\:"always perform a full data copy"
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

# vim: sw=2 sts=2 et ai ft=zsh
# path: /usr/share/zsh/site-functions/_xcp
