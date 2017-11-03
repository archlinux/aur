#
# RVM profile
#
# /etc/profile.d/rvm.sh # sh extension required for loading.
#

if
  [ -n "${BASH_VERSION:-}" -o -n "${ZSH_VERSION:-}" ] &&
  test "`\command \ps -p $$ -o ucomm=`" != dash &&
  test "`\command \ps -p $$ -o ucomm=`" != sh
then
  # Load user rvmrc configurations, if exist
  for file in "/etc/rvmrc" "$HOME/.rvmrc"
  do
    [[ -s "$file" ]] && source $file
  done

  if [ ! -d "$HOME/.rvm" ]; then
    cp -r /etc/skel/.rvm "$HOME"
  fi

  source "/usr/share/rvm/scripts/rvm"

  # Add $rvm_bin_path to $PATH if necessary. Make sure this is the last PATH variable change.
  if [[ -n "${rvm_bin_path}" && ! ":${PATH}:" == *":${rvm_bin_path}:"* ]]
  then PATH="${PATH}:${rvm_bin_path}"
  fi
fi
