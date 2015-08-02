#!/usr/bin/bash

# 2015-07-18 git-aurcheck by severach (GPLv3+)

# a helper like namcap that checks and offers solutions for common problems in git submissions to the AUR

# git is hard to learn, has a command sequence a bit over the top for AUR
# submissions, has dangerous command line defaults, and the AUR git server
# checks for little more than a missing .SRCINFO while reporting a horde of
# nonsensical errors. This checks a planned git submission and suggests
# appropriate next steps along with complete command lines with the safest
# available options.

# Commands that are safe and desirable are offered complete and ready to paste
# with the safe command line options.
# Commands that may not be safe or desirable are suggested but no pastable
# form is offered.

# Rather than guess the next steps and be wrong more often than not, run this
# over and over. All possible next steps are shown but only a few may be
# appropriate. Perform the first related steps and run again for updated next
# steps.

# This does not check the quality of your package. Use namecap for that, though
# I haven't found namecap to be very useful.

# Option -h for help.

# Return:
# 0 = all good
# 1 = some packages had warnings
# 2 = some packages had errors
# 3 = some packages had severe errors
# 99 = some packages haven't been upgraded to AUR git
# >=126 = something went wrong (probably your fault)

# See below for how to change the origin if you are seeing packages
# you don't have write access to.

set -u
set -e # This is tricky to code around.

if [ ! -s ~/.git-aurcheck ]; then
  cat > ~/.git-aurcheck << EOF
# Name configuration file for git-aurcheck, Arch Linux AUR4
# Enter a grep compatible search to allow git-aurcheck to detect your maintainer line
_opt_Maintainer='none'
#_opt_Maintainer='^# Maintainer:\s\+Your Name Here'
EOF
fi
source ~/.git-aurcheck
if [ "${_opt_Maintainer:=none}" = 'none' ]; then
  echo "Warning: Add your name to ~/.git-aurcheck for proper maintainer detection"
  echo ""
  sleep 1
fi

_opt_VERSION='0.2'
_opt_AUR4='aur'

# After August 8, these 3 time bomb lines can be removed and _opt_AUR4 can be gotten rid of altogether
if [ "$(date +'%s')" -lt 1439006400 ]; then # date +%s -d'2015-08-08'
  _opt_AUR4='aur4'
fi

for _var_cmd in 'mksrcinfo' 'md5sum' 'pcre2grep'; do
  if ! command -v "${_var_cmd}" >/dev/null 2>&1; then
    echo -e "Error: Required program could not be found: ${_var_cmd}"
    echo -e 'Please install pkgbuild-introspection or other supporting package'
    exit 126
  fi
done
unset _var_cmd

if [ "${EUID}" -eq 0 ]; then
  echo "root doesn't make packages. Please run as a user."
  exit 127
fi

# This dummy function supresses errors in package aur ksh
srcinfo_write_attr() {
  :
}

# Might not use all these
_fn_find_in_gitadds() {
  local _var_find
  if [ "${#_var_gitadds[@]}" -ne 0 ]; then
    for _var_find in "${_var_gitadds[@]}"; do
      if [ "${_var_find}" = "$1" ]; then
        return 0
      fi
    done
  fi
  return 1
}

_fn_find_in_allfiles() {
  local _var_find
  if [ "${#_var_allfiles[@]}" -ne 0 ]; then
    for _var_find in "${_var_allfiles[@]}"; do
      if [ "${_var_find}" = "$1" ]; then
        return 0
      fi
    done
  fi
  return 1
}

_fn_find_in_srcfileswantgit() {
  local _var_find
  if [ "${#_var_srcfileswantgit[@]}" -ne 0 ]; then
    for _var_find in "${_var_srcfileswantgit[@]}"; do
      if [ "${_var_find}" = "$1" ]; then
        return 0
      fi
    done
  fi
  return 1
}

_fn_find_in_srcfilesdontwantgit() {
  local _var_find
  if [ "${#_var_srcfilesdontwantgit[@]}" -ne 0 ]; then
    for _var_find in "${_var_srcfilesdontwantgit[@]}"; do
      if [ "${_var_find}" = "$1" ]; then
        return 0
      fi
    done
  fi
  return 1
}

_fn_find_in_srcfiles() {
  local _var_find
  if [ "${#_var_srcfiles[@]}" -ne 0 ]; then
    for _var_find in "${_var_srcfiles[@]}"; do
      if [ "${_var_find}" = "$1" ]; then
        return 0
      fi
    done
  fi
  return 1
}

_fn_find_in_gitfiles() {
  local _var_find
  if [ "${#_var_gitfiles[@]}" -ne 0 ]; then
    for _var_find in "${_var_gitfiles[@]}"; do
      if [ "${_var_find}" = "$1" ]; then
        return 0
      fi
    done
  fi
  return 1
}

# This accepts no parameters. The caller must cd to the directory to be checked.
_fn_aurcheck() {
  local _var_pwd="$(pwd)"
  local _var_pwdbn="$(basename "${_var_pwd}")"
  if [ -d '.git' ]; then
    # This is \n safe only because git escapes non printing characters
    # https://stackoverflow.com/questions/28417414/can-i-put-strings-divided-by-newlines-into-an-array-using-the-read-builtin
    local _var_gitfiles=() # because git-status --porcelain doesn't show all files
    # Despite claims, this still produces a non zero return code
    IFS=$'\n' read -r -d '' -a _var_gitfiles < <(git ls-files; echo -n $'\0') || :
    if [ "${#_var_gitfiles[@]}" -ne 0 ]; then
      local _var_idx
      local _var_file
      for _var_idx in "${!_var_gitfiles[@]}"; do
        _var_file="${_var_gitfiles[${_var_idx}]}"
        if [ "${_var_file: 0:1}" = '"' -a "${_var_file: -1:1}" = '"' ]; then
          _var_gitfiles[${_var_idx}]="$(printf '%b' "${_var_file: 1:-1}")" # unescape file name
        fi
      done
      unset _var_idx
      unset _var_file
    fi

    local _var_allfiles=()
    if [ "${#_var_gitfiles[@]}" -ne 0 ]; then
      _var_allfiles=("${_var_gitfiles[@]}")
    fi

if ! :; then
    # This code was part of revision 2 which may be needed again if we decide to decode git-status
    local _var_gitlines=()
    IFS=$'\n' read -r -d '' -a _var_gitlines < <(git status --porcelain; echo -n $'\0') || :
        local _var_gitline
        local _var_statIDX='' # Index
        local _var_statWT=''  # Worktree
        local _var_statQM=''  # ? if either are ?
        for _var_gitline in "${_var_gitlines[@]}"; do
          local _var_gitlinef="${_var_gitline:3}"   # git status FILE -> FILE is not handled. Paths are not handled.
          if [ "${_var_gitlinef: 0:1}" = '"' -a "${_var_gitlinef: -1:1}" = '"' ]; then
            _var_gitlinef="$(printf '%b' "${_var_gitlinef: 1:-1}")" # unescape file name
          fi
          if [ "${_var_gitlinef}" = "${_var_gitfile}" ]; then
            _var_statIDX="${_var_gitline: 0:1}"
            _var_statWT="${_var_gitline: 1:1}"
            [ "${_var_statIDX}" = '?' -o "${_var_statWT}" = '?' ] && _var_statQM='?'
            break
          fi
        done
fi

    local _var_gitadds=()

    declare -A _var_644 # this is also the required files array.
    _var_644['PKGBUILD']=' ' # neither ${:-default} nor ${:+exists} can tell the difference between '' blank and unset so we must make these non blank
    _var_644['.SRCINFO']=' Try: mksrcinfo'

    local _var_forbidgreps=('/sbin|! grep -l% "/sbin"' '/usr/tmp|! grep -l% "/usr/tmp"' '/usr/local|! grep -l% "/usr/local"' '/bin|! pcre2grep -l% "(?<!/usr)/bin"')
    local _var_srcfiles=()
    local _var_install=''
    local _var_changelog=''
    if [ -s 'PKGBUILD' ]; then
      if grep -ql '||\s*return\s\+1$' 'PKGBUILD'; then
        echo "Warning: '|| return 1' deprecated. Please remove. makepkg does this with 'set -e'"
        [ $returnv -ge 1 ] || returnv=1
      fi
      if grep -ql '\${*startdir' 'PKGBUILD'; then
        echo 'Warning: ${startdir} deprecated. Please remove. It can often be changed to ${srcdir}.'
        [ $returnv -ge 1 ] || returnv=1
      fi
      if ! grep -ql '^prepare\s*(' 'PKGBUILD' && grep -ql '\s*\./configure\s' 'PKGBUILD'; then
        echo 'Warning: Create a prepare() function and move configure and some patches to it so makepkg -e works properly.'
        [ $returnv -ge 1 ] || returnv=1
      fi
      if [ "${_opt_PEDANTIC}" -gt 0 ]; then
        if ! grep -ql "set -u" 'PKGBUILD' || ! grep -ql "set +u" 'PKGBUILD'; then
          echo 'Warning: set -u/set +u are recommended to catch script errors.'
          [ $returnv -ge 1 ] || returnv=1
        fi
        if [ "${_opt_PEDANTIC}" -gt 1 ]; then
          # These test commands are specially crafted to fail correctly with set -e
          local _var_forbiddens=('/sbin|! test -d "${pkgdir}/sbin"' '/usr/sbin|! test -d "${pkgdir}/usr/sbin"' '/usr/local|! test -d "${pkgdir}/usr/local"')
          local _var_forbidden
          for _var_forbidden in "${_var_forbidgreps[@]}"; do
            _var_forbiddens+=("${_var_forbidden//%/r}"' "${pkgdir}"') # [@] probably won't work
          done
          local _var_forbiddenspr=()
          for _var_forbidden in "${_var_forbiddens[@]}"; do
            _var_forbiddenspr+=("${_var_forbidden#*|}" "${_var_forbidden%%|*}")
          done
          for _var_forbidden in "${_var_forbiddens[@]}"; do
            if ! grep -qlF "${_var_forbidden#*|}" 'PKGBUILD'; then
              echo '  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)'
              printf '  %s || { echo "Forbidden: %s"; echo "${}"; }\n' "${_var_forbiddenspr[@]}" # Not sure why the extra ; is required
              [ $returnv -ge 1 ] || returnv=1
              break
            fi
          done
          unset _var_forbiddenspr
          unset _var_forbiddens
          unset _var_forbidden
        fi
        if ! grep -ql '^\s*sha256sums=' 'PKGBUILD' && ! grep -ql '^\s*sha384sums=' 'PKGBUILD' && ! grep -ql '^\s*sha512sums=' 'PKGBUILD'; then
          echo 'Warning: sha256sums or better are recommended. Check existing sums before upgrading.'
          [ $returnv -ge 1 ] || returnv=1
        fi
        if grep -ql '^\s*md5sums=' 'PKGBUILD' || grep -ql '^\s*sha1sums=' 'PKGBUILD' || grep -ql '^\s*sha224sums=' 'PKGBUILD'; then
          echo 'Warning: lesser md5sums,sha1sums,sha224sums should be removed.'
          [ $returnv -ge 1 ] || returnv=1
        fi
        if grep -qlE '\$(pkgname|pkgver|srcdir|pkgdir)' 'PKGBUILD'; then
          echo 'Warning: $vars should be converted to ${vars}.'
          [ $returnv -ge 1 ] || returnv=1
        fi
      fi

      # I'd like to recommend more $var to ${var} changes but I don't see a way to do it in grep.
      if [ "${_opt_Maintainer}" != 'none' ] && ! grep -ql "${_opt_Maintainer}" 'PKGBUILD'; then
        echo 'Warning: You are not listed as a maintainer in PKGBUILD.'
        [ $returnv -ge 1 ] || returnv=1
      fi
      local _var_tempdir="$(basename "$0")" # mksrcinfo doesn't let us specify a target file
      _var_tempdir="$(mktemp -d "${_var_tempdir}.XXXXX")"
      if pushd "${_var_tempdir}" >/dev/null; then
        if mksrcinfo "${_var_pwd}/PKGBUILD"; then
          # Use the updated .SRCINFO if we can get it
          _var_install="$(sed -ne 's:^\s\+install[^ =]* = \(.\+\)$:\1:p' '.SRCINFO')"
          _var_changelog="$(sed -ne 's:^\s\+changelog[^ =]* = \(.\+\)$:\1:p' '.SRCINFO')"
          IFS=$'\n' read -r -d '' -a _var_srcfiles < <(sed -ne 's:^\s\+source[^ =]* = \(.\+\)$:\1:p' '.SRCINFO'; echo -n $'\0') || :
          if [ ! -s "${_var_pwd}/.SRCINFO" ] || [ "$(md5sum < '.SRCINFO')" != "$(md5sum < "${_var_pwd}/.SRCINFO")" ]; then
            echo ".SRCINFO is missing or out of date. Try 'mksrcinfo'"
            [ $returnv -ge 2 ] || returnv=2
            _var_gitadds+=('.SRCINFO') # this is the first add so no dups possible
          fi
        else
          echo 'Your PKGBUILD crashes with mksrcinfo.'
          [ $returnv -ge 3 ] || returnv=3
        fi
        cd "${_var_pwd}"
        rm -rf "${_var_tempdir}"
        popd >/dev/null # why don't pushd and popd have a --quiet option?
      else
        rmdir -f "${_var_tempdir}"
      fi
      unset _var_tempdir
    fi
    # Nail the screwups no matter where they are!
    if [ -s '.SRCINFO' ]; then
      if [ -z "${_var_install}" ]; then
        _var_install="$(sed -ne 's:^\s\+install[^ =]* = \(.\+\)$:\1:p' '.SRCINFO')"
      fi
      if [ -z "${_var_changelog}" ]; then
        _var_changelog="$(sed -ne 's:^\s\+changelog[^ =]* = \(.\+\)$:\1:p' '.SRCINFO')"
      fi
      local _var_srcfiles1=()
      local _var_srcfile1
      IFS=$'\n' read -r -d '' -a _var_srcfiles1 < <(sed -ne 's:^\s\+source[^ =]* = \(.\+\)$:\1:p' '.SRCINFO'; echo -n $'\0') || :
      if [ "${#_var_srcfiles1[@]}" -ne 0 ]; then
        for _var_srcfile1 in "${_var_srcfiles1}"; do
          if ! _fn_find_in_srcfiles "${_var_srcfile1}"; then
            _var_srcfiles+=("${_var_srcfile1}")
          fi
        done
      fi
      unset _var_srcfiles1
      unset _var_srcfile1
    fi
    if [ ! -z "${_var_install}" ]; then
      _var_644["${_var_install}"]=' ' # Why is this a space? See above.
      if _fn_find_in_srcfiles "${_var_install}"; then
        echo "The install file ${_var_install} should be removed from the source array."
        [ $returnv -ge 2 ] || returnv=2
      fi
      if [ -s "${_var_install}" ]; then
        local _var_forbidgrep
        for _var_forbidgrep in "${_var_forbidgreps[@]}"; do
          _var_forbidgrep="${_var_forbidgrep//%/}"
          if ! eval "${_var_forbidgrep#*|} '${_var_install}'"; then
            echo "Warning: The install file ${_var_install} has some forbidden text: ${_var_forbidgrep%%|*}"
            [ $returnv -ge 1 ] || returnv=1
            break
          fi
        done
        unset _var_forbidgrep
      fi
    fi
    if [ ! -z "${_var_changelog}" ]; then
      _var_644["${_var_changelog}"]=' ' # Why is this a space? See above.
      if _fn_find_in_srcfiles "${_var_changelog}"; then
        echo "The changelog file ${_var_changelog} should be removed from the source array."
        [ $returnv -ge 2 ] || returnv=2
      fi
    fi
    unset _var_install
    unset _var_changelog

    # Generate specific arrays from _var_srcfiles. Note that since we're mean and read both .SRCINFO, there may be false dups.
    local _var_srclinks=() # Sometimes this contains false dups. I don't care since it's not used for anything yet.
    local _var_srcfileswantgit=()
    local _var_srcfilesdontwantgit=()
    local _var_srcvcs=0
    if [ "${#_var_srcfiles[@]}" -ne 0 ]; then
      local _var_srcfile
      local _var_idx
      local _var_srclink
      for _var_idx in "${!_var_srcfiles[@]}"; do
        _var_srcfile="${_var_srcfiles[${_var_idx}]}"
        _var_srclink=''
        if [ "${_var_srcfile/::/}" != "${_var_srcfile}" ]; then
          #_var_srclink="${_var_srcfile#*::}" # foo::git://
          #case "${_var_srclink}" in
          #bzr*|git*|hg*|svn*)_var_srcvcs=1;; # from makepkg
          #esac
          #_var_srcfile="${_var_srcfile%%::*}" # makepkg does it this way
          case "${_var_srcfile#*::}" in
          bzr*|git*|hg*|svn*);; # from makepkg, name is only useful if not before ::vcs
          *)
            _var_srcfilesdontwantgit+=("${_var_srcfile%%::*}");;
          esac
          _var_srcfiles[${_var_idx}]="${_var_srcfile}"
          _var_srcfile="${_var_srcfile##*::}"
        fi
        if [ "${_var_srcfile/:\/\//}" != "${_var_srcfile}" ]; then
          _var_srclink=("${_var_srcfile}") # We don't about what's on the end here
          case "${_var_srclink}" in
          bzr*|git*|hg*|svn*)_var_srcvcs=1;; # from makepkg
          *)
            _var_srcfile="${_var_srcfile##*/}" # bash string version of basename
            _var_srcfilesdontwantgit+=("${_var_srcfile}")
            _var_srcfiles[${_var_idx}]="${_var_srcfile}"
          esac
        else
          _var_srcfileswantgit+=("${_var_srcfile}")
        fi
        if [ ! -z "${_var_srclink}" ]; then
          _var_srclinks+=("${_var_srclink}")
        fi
        ! _fn_find_in_allfiles "${_var_srcfile}" && _var_allfiles+=("${_var_srcfile}")
        #echo "${_var_srcfile}"
      done
      unset _var_srcfile
      unset _var_idx
      unset _var_srclink
      if [ -f 'PKGBUILD' -a "${_var_srcvcs}" -ne 0 ]; then
        if ! grep -ql '^pkgver\s*(' 'PKGBUILD'; then
          echo 'Warning: A pkgver() function is usually useful for packages with vcs sources.'
          [ $returnv -ge 1 ] || returnv=1
        fi
      fi
    else
      echo 'Warning: .SRCINFO has no source files'
      [ $returnv -ge 1 ] || returnv=1
    fi
    unset _var_srcvcs
    unset _var_srclinks

    # This went through 3 revisions.
    # 1) Run through git ls-files with FSA. Unmaintainable mess.
    # 2) Run through git status --porcelain with FSA. Only shows diffs and still unmaintainable.
    # 3) Now it's a series of simple set operations. The sets can be verified with set > tmpfile.
    local _var_reqfile
    for _var_reqfile in "${!_var_644[@]}"; do
      ! _fn_find_in_allfiles "${_var_reqfile}" && _var_allfiles+=("${_var_reqfile}") # This probably isn't necessary
      ! _fn_find_in_srcfiles "${_var_reqfile}" && _var_srcfiles+=("${_var_reqfile}") # This probably isn't necessary
      ! _fn_find_in_srcfileswantgit "${_var_reqfile}" && _var_srcfileswantgit+=("${_var_reqfile}")
      if [ ! -s "${_var_reqfile}" ]; then
        echo "Required file ${_var_reqfile} doesn't exist or blank.${_var_644[${_var_reqfile}]}"
        [ $returnv -ge 2 ] || returnv=2
      elif [ "$(stat -c '%a' "${_var_reqfile}")" != '644' ]; then
        echo "File ${_var_reqfile} must have perms 644. Try: chmod 644 \"${_var_reqfile}\""
        [ $returnv -ge 2 ] || returnv=2
      fi
      if ! _fn_find_in_gitfiles "${_var_reqfile}" && ! _fn_find_in_gitadds "${_var_reqfile}"; then
        echo "Required file ${_var_reqfile} not in git. Try: git add \"${_var_reqfile}\""
        [ $returnv -ge 2 ] || returnv=2
        _var_gitadds+=("${_var_reqfile}")
      fi
    done
    unset _var_reqfile

    if [ "${#_var_srcfileswantgit[@]}" -ne 0 ]; then
      local _var_srcfile
      for _var_srcfile in "${_var_srcfileswantgit[@]}"; do
        if [ "${_var_644[${_var_srcfile}]:-xyzzy}" = 'xyzzy' ]; then
          if ! _fn_find_in_gitfiles "${_var_srcfile}" && ! _fn_find_in_gitadds "${_var_srcfile}"; then
            echo "Source file ${_var_srcfile} not in git. Try: git add \"${_var_srcfile}\""
            [ $returnv -ge 2 ] || returnv=2
            _var_gitadds+=("${_var_srcfile}")
          fi
          if [ ! -f "${_var_srcfile}" ]; then
            echo "Source file ${_var_srcfile} doesn't exist or blank."
            [ $returnv -ge 2 ] || returnv=2
          fi
        fi
      done
      unset _var_srcfile
    fi

    if [ "${#_var_gitfiles[@]}" -ne 0 ]; then
      local _var_gitfile
      for _var_gitfile in "${_var_gitfiles[@]}"; do
        if _fn_find_in_srcfilesdontwantgit "${_var_gitfile}"; then
          echo "Downloaded file ${_var_gitfile} should be removed from git. Try: git rm --cached \"${_var_gitfile}\""
          [ $returnv -ge 2 ] || returnv=2
        elif ! _fn_find_in_srcfileswantgit "${_var_gitfile}"; then
          echo "Warning: File ${_var_gitfile} in git not in PKGBUILD. Maybe try: git rm --cached \"${_var_gitfile}\""
          [ $returnv -ge 1 ] || returnv=1
        fi
      done
      unset _var_gitfile
    fi

    local _var_allfile
    local _var_perms
    for _var_allfile in "${_var_allfiles[@]}"; do
      if [ -f "${_var_allfile}" ]; then
        if [ -z "${_var_644[${_var_allfile}]:-}" ]; then
          _var_perms="$(stat -c '%a' "${_var_allfile}")"
          if [ "${_var_perms}" != '755' -a "${_var_perms}" != '644' ]; then
            if _fn_find_in_srcfileswantgit "${_var_allfile}"; then
              echo "File ${_var_allfile} must have perms 644 or 755"
            else
              echo "File ${_var_allfile} should have perms 644 or 755"
            fi
            [ $returnv -ge 2 ] || returnv=2
          fi
        fi
        if [ "$(stat -c '%U' "${_var_allfile}")" = 'root' ]; then
          echo "File ${_var_allfile} owned by root"
          [ $returnv -ge 2 ] || returnv=2
        fi
      fi
    done
    unset _var_perms
    unset _var_allfile

    #if ... We can do this if we decide to decode git-status
    #  echo "${_var_gitfile} has been modified. Try: 'git add ${_var_gitfile}' or 'git add -u'"
    #  [ $returnv -ge 2 ] || returnv=2
    #el
    # alas, git ls-files does not show us files that have been "git rm" but not pushed
    if [ "${#_var_gitadds[@]}" -gt 0 ]; then
      #_var_gitadds+=($'foo\t\n\r\lbar foobar' $'foo bar') # Test out %q
      echo -n 'Found: git add'
      builtin printf ' %q' "${_var_gitadds[@]}"
      echo ''
    fi
    local _var_gitmodified="$(git ls-files -m)"
    if [ ! -z "${_var_gitmodified}" ]; then
      echo "Warning: There are modified files. Try 'git status' and maybe 'git add -u'"
      [ $returnv -ge 1 ] || returnv=1
    fi

    local _var_returnvbeforestaged="${returnv}"
    if [ ! -z "$(git status --porcelain | grep -v '^?')" ]; then
      echo "Warning: There are staged files. Try 'git status' and maybe commit and push"
      [ $returnv -ge 1 ] || returnv=1
    fi
    set +e
    local _var_push
    _var_push="$(git cherry -v 2>/dev/null)" # local cannot be on this line or we lose the return value
    if [ $? -ne 0 ]; then
      # We want to only generate this warning near the commit instead of after every step.
      if [ "${_var_returnvbeforestaged}" -eq 0 ]; then
        if [ "${returnv}" -eq 0 ]; then
          echo "Warning: You have not made your first push to create the ${_opt_AUR4^^} package. Maybe try 'git push origin master'"
        else
          echo "Warning: You have not made your first push to create the ${_opt_AUR4^^} package. Maybe try 'git commit -m \"Initial Import\"' and 'git push origin master'"
        fi
        [ $returnv -ge 1 ] || returnv=1
      fi
    elif [ ! -z "${_var_push}" ]; then
      if [ "${#_var_gitadds[@]}" -gt 0 -o ! -z "${_var_gitmodified}" ]; then
        # http://stackoverflow.com/questions/927358/how-do-you-undo-the-last-commit\
        echo "There are modifications after a commit. A push or another commit may not do what you want. Maybe try: git reset --soft 'HEAD~1'; git status"
        [ $returnv -ge 2 ] || returnv=2
      else
        echo "Warning: There are commits not pushed. Try 'git cherry -v' and maybe push"
        [ $returnv -ge 1 ] || returnv=1
      fi
    fi
    set -e
    unset _var_push
    unset _var_returnvbeforestaged
    unset _var_gitmodified

    local _var_remoteurl="$(git ls-remote --get-url)"
    local _var_remoteurlbn="$(basename "${_var_remoteurl}" ".git")"
    if ! grep -ql '^ssh://' <<< "${_var_remoteurl}"; then
      echo "Warning: You don't have write access to this package so you can't fix these problems."
    fi
    # git-clone from AUR should block the cloning of new repository packages in core/extra, but it doesn't.
    if [ "${_var_remoteurlbn}" != "${_var_pwdbn}" ]; then
      echo '******************************************************'
      echo "The git package name doesn't match the folder name. Did you clone the wrong package?"
      git ls-remote --get-url
      echo "Folder: ${_var_pwdbn}"
      echo '******************************************************'
      [ $returnv -ge 3 ] || returnv=3
    fi
    unset _var_remoteurl
    unset _var_remoteurlbn
#set > x # look for variables we forgot to unset
  else
    echo "${_var_pwdbn} is not an ${_opt_AUR4} package."
    if [ "${_var_pwd}" = ~/build ]; then
      echo 'This looks like a build folder.'
      echo "To check all with write access try: $0 -a | less"
      echo "To check just one try: cd foo; $(basename "$0")"
    elif [ -d ~/build ]; then
      echo 'Run this in your build folder to check many packages.'
    fi
    if [ -f 'PKGBUILD' ]; then
      # rm -rf a folder that likely exists is quite dangerous so we do 3 safety steps: stop if files and folderse aren't right, set -e to crash on any error, and clone to a temp folder.
      # To keep things safe does make the command a bit complex. I'm hoping this is histexpand safe.
      echo 'You can easily upgrade to read or write access without losing your files with:'
      echo "Write: test -s PKGBUILD -a '!' -d .git -a '!' -d '${_var_pwdbn}.aurtmp' && { git clone 'ssh://aur@${_opt_AUR4}.archlinux.org/${_var_pwdbn}.git' '${_var_pwdbn}.aurtmp' && mv '${_var_pwdbn}.aurtmp/.git' . && rm -rf '${_var_pwdbn}.aurtmp'} || echo 'How about NO!'"
      echo "Read: test -s PKGBUILD -a '!' -d .git -a '!' -d '${_var_pwdbn}.aurtmp' && { git clone 'https://${_opt_AUR4}.archlinux.org/${_var_pwdbn}.git/ '${_var_pwdbn}.aurtmp'' && mv '${_var_pwdbn}.aurtmp/.git' . && rm -rf '${_var_pwdbn}.aurtmp'} || echo 'How about NO!'"
    fi
    [ $returnv -ge 3 ] || returnv=3
  fi

  local _var_file
  for _var_file in '.MTREE' '.AURINFO' '.PKGINFO' '.INSTALL'; do
    if [ -f "${_var_file}" ]; then
      echo "Warning: ${_var_file} should be deleted"
      [ $returnv -ge 1 ] || returnv=1
    fi
  done
}

_fn_usage() {
  local _var_BN="$(basename "$0")"
cat << EOF
git-aurcheck ${_opt_VERSION} (C)2015 by severach for Arch Linux (GPL3+)
  -h: crude help
  -a: from ~/build, check all packages with write access
  -p: pedantic, adds extra checks. Up to twice for maximum pedantry.

To check for problems in a package folder:
  cd ~/build/foo
  ${_var_BN}
To check for problems in all packages with git ssh write access
  cd ~/build
  ${_var_BN} -a
EOF
}

_opt_ALL=0
_opt_FORCE=0 # If ever implemented, would automatically perform as many safe changes as possible.
_opt_PEDANTIC=0

while getopts ':hafp' _var_opt; do
  case "${_var_opt}" in
    h) _fn_usage; exit 0;;
    a) _opt_ALL=1;;
    f) _opt_FORCE=1;; # cannot be specified with -a
    p) _opt_PEDANTIC=$((${_opt_PEDANTIC} + 1));;
    :) echo "$(basename "$0"): Option '-${OPTARG}' requires an argument" >&2
       exit 126 ;;
    *) echo "$(basename "$0"): Invalid option '-${OPTARG}'" >&2
       _fn_usage; exit 126 ;;
  esac
done
unset _var_opt

returnv=0
if [ "${_opt_ALL}" -ne 0 ]; then
  if [ -e 'PKGBUILD' ] ;then
    echo 'This looks like a package folder. Maybe you want to leave -a off.'
    exit 126
  else
    _opt_FORCE=0
    for builddir in *; do
      # It doesn't do any good to check packages that you can't fix because they aren't yours.
      # We consider writable ssh:// to be yours and read only http:// to not be yours.
      # Use https:// to clone packages you don't have write access to.
      # You can fix errant clones with the https url on the package page.
      # Example: (change aur4 to aur after 2015-08-08)
      # cd ~/build/foo
      # git ls-remote --get-url
      # git remote set-url origin "https://aur4.archlinux.org/$(basename "$(pwd)").git/"
      # git remote show origin -n
      if [ -s "${builddir}/.git/config" ] && grep -ql 'url = ssh://' "${builddir}/.git/config" && pushd "${builddir}" >/dev/null; then
        echo "Checking ${builddir}"
        _fn_aurcheck
        popd >/dev/null
      fi
    done
  fi
else
  _fn_aurcheck
fi

exit $returnv
