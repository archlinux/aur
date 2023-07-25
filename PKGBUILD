# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.2.2
pkgrel=1
arch=('x86_64')
url="https://www.collaboraoffice.com/code/"
license=('MPL')
makedepends=(curl fontconfig libcap)
# ↑ excluding base (bzip2 coreutils gawk grep gzip sed systemd tar util-linux xz)

optdepends=(
  'hunspell: Use with language-specific hunspell dictionaries for LibreOffice spell-check'
  'hyphen: Use with language-specific hyphen rules for LibreOffice hyphenation'
)

depends=()

source=(
  'https://www.collaboraoffice.com/repos/CollaboraOnline/CODE/Packages'
  install
  mkcert_example.sh
  sysusers
  tmpfiles
)
sha1sums=('69d2b1c2bc81c7ad9806475c89c734a048e5b9b6'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'd69b2f6007fc2156559550ea9de774da460df2a7'
          '1e668469cba4d6b4bfc7275ac8d6f7d1e7f0f0b5'
          'e0ca522232bb2c5f494d3da9fea625a9390a036e'
          '4f698a9c5b202e441c75df5479352b3dccd1b196'
          'bac6b5a126b505b219e2fba34cf35d170ffe5000'
          '1eabb79ac6fbc59ef6fab02509dad71323e22015'
          '3a1ee7fb33afa23e11815e0542cc5f745927f4d3'
          '5841669a7a7736f192e7b64c41ca29b4ab6c2304'
          '454f1f75cc0fa1ef5989c68c67dfc63323d6cf81'
          'df65e85c5302cb1fbe7a5bf16c3e40725c09e0e6'
          'ae81ab943412f1d150598468c6bcdf5951d32f59'
          'e75f7f6e1da232084a561f6f922fd26e1fc6f406'
          'd90248d6f4916af0d77e2e3a9b229750e0398de6'
          'cfc325acbd0c6d0e1b2d22ef0bdf26c620909540'
          'fbe5bd4c03c7c129510ef7283c436bc60475a096'
          '2b9a92d7f5e4881f9dd8a82c5f672db0f7d961a4'
          '540cd90c0f9db7a73004ed9a965dca55a0e46fe3'
          '62c866217c59b9b47b112ae8da3361b30e5c1e02'
          'b34251d90da1681fd911f8d79c672230cee95eab'
          'f90cbcf7d8a5d702e461be3af726810bb0e9d798'
          'b0bf83d4b0be1624671c81a907ea7a38d80eb7c0'
          '3f1a044d8fef8f65267d808ee93c5da96c6b62a1'
          '8e5de1259a6b05f2df35abc537580054b84b44ec'
          '5bb49f191f487a88a3cba44161f01ea015a5c4be'
          '7dd4b367e6c39f2dba7dde59384d573c13878119'
          '2d0643716cf2958a31e529e683b97085c62b01e3'
          '0a59393e7d065fc56975d2f8cd17b51a5bb748a4'
          '1a6d72fe2a000e955a31f65a63ddadc155adfb27'
          'db8089e78cd98b604b4ea8885985d8a3e57287c9'
          'fcf72aebe02e2865ca33b1b235b40e6bd7d79b9a'
          '5f25f610cd5fd41ffd41be638a6e4d8c9c819348'
          '936b510c58f83312b1c9ec0c425f1224b171f2ef'
          '167ef190bd1dfaef96854a5d4c35469cbb3a9059'
          '8e256dcada518762f40e7dcbf288e56f06a1f1af'
          'f2d38cbe76ed1d00657d8512cd6cfbd09858a826'
          '666d1c9f611252c1fe26f05d57a7782eda1d566c'
          'c367ba241e8d74dbeb21e9f354ba775d6cf1cd7b'
          'f8b1265c698874c579e28c11ab528caf3e7c9c11'
          '2ce3e12f66b098a8acdb2978a37a890cb121e654'
          '41c6f0690b37d7b5c72e20c9bd633bd97a2a4ccb'
          'fa3d90c9efba6820b636e9be237c10027d69c1d3'
          'cfa909bdd37522564aa3f0621c923d556585a8be'
          'ad9ff5e17ef375ee2560449a41c1d4619ee1bf42'
          '7db116b6c1da554234a84332680866a55c69720f'
          'ce3820b873f19ffba024365c3d980222d7143f7d'
          '2cdc078bb90a93fd8adb830c765fa51209148dd1'
          '0f5e3363757833d529ddc8e5792576e2cbeef4ba'
          '7071b91f257ea78367fdaaed6f566d0e8afdc5a2'
          'c7eac00099436b631fe24b72f3bcb2f316768947'
          'f651eeb16485260b7e71edfa5e5e06c94fbcec28'
          '2c2cee756a8cd6f289b796b69c202156c7d13b3c'
          '55f0f6c7596d43b6981c6eb0c12308fc108fa2b4'
          'b9e757049f9319e4c393741036aadd80325c5cf4'
          'cc357e06f676303f85ab9718c1374029462dbb03'
          '0e1c08c5419d8d234c41a7c3c27e956110d1896a'
          '0c6c1819a7fef4706a8af4f7535ac8fa4b28d09e'
          '3752e279148a359d6bf30e6a339a12ad43e96b42'
          'dc3ef73bf8fd978696975452715ea1891c34aa64'
          '68873919dc1ad0f602e032e7606e52f331baf831'
          'b004963eaa4f6b92ab4109abfccfcc25c9050304'
          '180b8d02858227b74742cb51ec53cd0987a4e579'
          'bd2ee543acc31979a764641569b754bff8c8ef7d'
          '6b21837ebb6ba7dd1542b3de3ed345a0fdba3547'
          '107c94bf3f8ce21ce155bf2e78d20c125ed004ea'
          '5dad831e07b5a989a9b65e33594427eb064cb8bc'
          '3144bc1bb542c28232fba04b80e18a088c9913ef'
          '1072fc2b60859932a2f5f14ed26f47b738175ca0'
          '2f937bc0c8c927a8b6a5b484fa236504053100b1'
          'dc7fadc430fc804d0c88033d96441aad5880a8e4'
          '557ae092f9bc1e02baba76c875d0daddab7eb423'
          'e39672d196abe10d1e037c347928cf9f7beb6677'
          'a4919106a33ebc483b0e20bd980e1624bfa55f0a'
          '2ecb6b36b96c63c5eebb0059dce8fe1ee0a7c85d'
          '48a37053261a1926a3fe3f7a30d01cfbeb946b44'
          '68e2472667d4cdf33a7903d371ef9e5bf6d34b68'
          '33ef35304b9d3107f6824b55356e0f89740f7cf8'
          'ec6694d8e7689ca795dcdf2f69724d7a4b69176a'
          '7e1f0de8c9f36a09d2dfd880bfe6197606157c73'
          '5f59a84bd00040acb3164a250b9872a1086c0136'
          'f4da5337485a8d6dfa18c573b8bd860df9f6ca19'
          '53df18966391750487778245ea465f7cf805ef4b'
          '385c82f4ce42526d8f6a584af20701dc3d5626ae'
          '333fd7c2445bf9ddf28cd03a84ab478969c89bb7'
          '6145eb9588857db4339a421e9f44ed204f4d1402'
          '5137f1b5ef2ac6d133e8533a87b96e410abe0f47'
          '1a73a984ec43da96d518976137c4e447a3ee3a41'
          '88452a48ac17cd54dfaec3a7f84bd3264e514be3'
          'fc7cf7bf8243331a82b37543560f4b26589331fc'
          '2e4d76aa4122f9189d0bc5f3a5ae0d6c953e8a84')

# From deb’s conffiles
backup=(
  # new:
  etc/apache2/conf-available/coolwsd.conf
  etc/coolwsd/coolkitconfig.xcu
  etc/coolwsd/coolwsd.xml
  etc/nginx/snippets/coolwsd.conf
  # old:
  etc/apache2/conf-available/loolwsd.conf
  etc/loolwsd/loolkitconfig.xcu
  etc/loolwsd/loolwsd.xml
  etc/nginx/snippets/loolwsd.conf

  etc/sysconfig/loolwsd
)

# From deb’s pre/post scripts
install=install

# From Dockerfile (https://github.com/CollaboraOnline/online/tree/master/docker), minus i18n files
_upstream_deps=(coolwsd code-brand)

# DEBIAN–ARCHLINUX EQUIVALENCES
#
# In case of a new upstream release:
#
# 1. Move all lines from $_upstream_equiv to $_upstream_equiv_OLD.
#
# 2. Run `makepkg -s` iteratively:
#  * Each time a dependency is missing, move it back from $_upstream_equiv_OLD to $_upstream_equiv.
#  * If a dependency is new, add a new line in $_upstream_equiv with nothing after the “=” sign.
#
# 3. When the package is done, in a terminal run: ./missing-deps.sh
#
# 4. For each “not found” line:
#  * If the missing file should be provided by a new dependency in $_upstream_equiv,
#    then put after the “=” sign the name of an Archlinux package that provides this file;
#    you may need to create the package if it does not exist (usually old versions).
#  * Else the missing file is probably expected to be present on any Debian/Ubuntu system;
#    thus add the missing dependency in the $depends array.
#
# 5. Review files under ./src/_control/* and see if install/upgrade actions have changed.
_upstream_equiv='
  adduser             = 
  cpio                = cpio
  expat               = expat
  fontconfig          = fontconfig
  init-system-helpers = 
  libc6               = gcc-libs
  libcap2             = libcap
  libcap2-bin         = libcap
  libgcc-s1           = gcc-libs
  libgcc1             = gcc-libs
  libpam0g            = pam
  libpng12-0          = libpng12
  libstdc++6          = gcc-libs
  openssh-client      = openssh
  systemd             = systemd
  zlib1g              = zlib
'
_upstream_equiv_OLD='
  locales-all         = glibc
'

_main_debs=
_i18n_debs=
declare -A __main_debs __i18n_debs

# >>>> START OF DYNAMIC ADAPTATION OF PKGBUILD
_upstream_handle_dep() {
  local dep="$2"
  local eqv="$(grep "^[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")[[:blank:]]*=" <<<"$_upstream_equiv")"
  local meta="$(awk -F$'\n' -vRS= "/^Package:[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")\\n/ && /_(all|amd64)\\.deb\\n/{print}" Packages)"
  local seen depurl
  if [ -n "$eqv" ]; then
    dep="$(sed 's/.*=[[:blank:]]*//' <<<"$eqv")"
    [ -n "$dep" ] || return
    for seen in "${depends[@]}"; do
      [ "$seen" == "$dep" ] && return
    done
    depends+=("$dep")
  elif [ -n "$meta" ]; then
    depurl="$(sed -rn "s#^Filename:[[:blank:]]*(.*/)?#${source[0]%Packages}#p" <<<"$meta")"
    for seen in "${source[@]}"; do
      [ "$seen" == "$depurl" ] && return
    done
    # when a new .DEB is needed, put it in the right array of dependencies
    [ $1 == main ] && __main_debs[$dep]="$depurl" || __i18n_debs[$dep]="$depurl"
    source+=("$depurl")
    while read dep; do if [ -n "$dep" ]; then
      _upstream_handle_dep "$1" "$dep"
    fi; done < <(
        sed -rn "s#^Depends:[[:blank:]]*##p" <<<"$meta" \
      | sed 's#([^)]*)##g; s#[[:blank:]]*,[[:blank:]]*#\n#g'
    )
  else
    echo "Unknown dependency: $dep" >&2; exit 1
  fi
}

if [ ${#source[*]} -eq 5 ]; then
  curl -s "${source[0]}" >Packages
  pkgver=$(
    awk -F$'\n' -vRS= '/^Package:[[:blank:]]*coolwsd\n/ && /_(all|amd64)\.deb\n/{print}' Packages \
    | sed -n 's/^Version:[[:blank:]]*\(.*\)-.*/\1/p'
  )

  # first register each .DEB as an unconfirmed main (i.e. not i18n) dependency
  for d in "${_upstream_deps[@]}"; do __main_debs[$d]=_pending_; done
  if [ -z "$_I18N_EREGEX" ]; then
    # go with that if no i18n has been requested
    pkgname=$_pkgname
    eval 'package() { _main_package; }'
  else
    # else register the function for building the main package, and dynamically discover i18n packages
    pkgname=($_pkgname)
    eval "package_$_pkgname() { _main_package; }"
    for p in $( \
      sed -nr 's#^Package:[[:blank:]]*((collaboraoffice-dict|collaboraofficebasis)-[a-z]{2}(-[a-z]+)?)$#\1#p' Packages \
      | grep -ve '-en-us$' \
      | sort -u \
      | grep -E "(dict|basis)-($_I18N_EREGEX)\$")
    do
      # for each .DEB file found that matches the requested i18n regex, register that .DEB as a i18n one
      __i18n_debs[$p]=_pending_
    done
    while read l; do
      # and register the function for building each of the i18n packages
      pkgname+=(${_pkgname}_${l})
      eval "package_${_pkgname}_${l}() { _i18n_package $l; }"
    done < <( \
      sed -nr 's#^Package:[[:blank:]]*(collaboraoffice-dict-|collaboraofficebasis-)([a-z]{2}(-[a-z]+)?)$#\2#p' Packages \
      | grep -vxF en-us \
      | sort -u \
      | grep -Exe "$_I18N_EREGEX")
  fi

  for dep in "${!__main_debs[@]}"; do
    # recursive dependencies for the main package
    _upstream_handle_dep main "$dep"
  done
  for dep in "${!__i18n_debs[@]}"; do
    # recursive dependencies for the i18n packages
    _upstream_handle_dep i18n "$dep"
  done
  _main_debs="$(IFS='|'; echo "${__main_debs[*]}")"
  _i18n_debs="$(IFS='|'; echo "${__i18n_debs[*]}")"
fi
# some debug:
echo "MAIN DEBs: $_main_debs" >&2
echo "I18N DEBs: $_i18n_debs" >&2
unset _upstream_handle_dep _upstream_equiv _upstream_deps __main_debs __i18n_debs
# <<<< END OF DYNAMIC ADAPTATION OF PKGBUILD

_unpack_deb_file() {
  local target="$1"
  local deb="$2"
  local archive="$3"
  local data="$(ar t "$deb" | grep "^${archive}\.")"
  if [ -n "$data" ]; then
    [ -d "$target" ] || mkdir -p "$target"
    case "$data" in
    *.bz2) ar p "$deb" "$data" | tar -C "$target" -xjf - ;;
    *.gz) ar p "$deb" "$data" | tar -C "$target" -xzf - ;;
    *.xz) ar p "$deb" "$data" | tar -C "$target" -xJf - ;;
    *) echo "Unknown file format: $data" >&2; exit 1 ;;
    esac
  fi
}

_i18n_package() {
  depends=()
  backup=()
  install=
  pkgdesc="Language ${1} internationalization files for Collabora CODE (LibreOffice Online)"

  local data f
  cd "$pkgdir"

  while read f; do
    [[ "$f" =~ (dict|basis)-$1 ]] || continue
    f="$srcdir/$(basename "$f")"
    _unpack_deb_file "$pkgdir" "$f" data
  done < <(tr '|' '\n' <<<"$_i18n_debs")
  chown -R $(id -nu):$(id -ng) .
}

_main_package() {
  pkgdesc="Collabora CODE (LibreOffice Online) server for Nextcloud or ownCloud, without Docker"

  local data f
  cd "$pkgdir"

  while read f; do
    f="$srcdir/$(basename "$f")"
    _unpack_deb_file "$pkgdir" "$f" data
    _unpack_deb_file "$srcdir/_control/$(basename "$f")" "$f" control
  done < <(tr '|' '\n' <<<"$_main_debs")
  find "$srcdir/_control" -type f \( -name control -o -name copyright -o -name md5sums \) -exec rm -f {} +
  find "$srcdir/_control" -depth -empty -exec rm -rf {} \;
  chown -R $(id -nu):$(id -ng) .

  # /lib is deprecated
  mv {lib,usr/lib}

  # use systemd for user allocation
  install -Dm0644 "$srcdir"/sysusers usr/lib/sysusers.d/$_pkgname.conf

  # replace cron with systemd
  rm -rf etc/cron.d
  install -Dm0644 "$srcdir"/tmpfiles usr/lib/tmpfiles.d/$_pkgname.conf

  # add dependency on systemd
  sed -i '/^\[Unit\]/ a \
After=systemd-tmpfiles-setup.service' usr/lib/systemd/system/coolwsd.service

  # keep the cert-making script from the Dockerfile for reference
  install -Dm0755 "$srcdir"/mkcert_example.sh usr/share/doc/coolwsd/example.mkcert.sh

  # do not provide libreoffice for the desktop (seems broken…)
  rm -rf opt/collaboraoffice/share/xdg

  # fix lib + desktop files’ permissions
  chmod a+x opt/collaboraoffice/program/lib*.so

  # https://github.com/CollaboraOnline/Docker-CODE/issues/32
  [ -d etc/sysconfig ] || mkdir etc/sysconfig
  echo 'SLEEPFORDEBUGGER=0' >>etc/sysconfig/coolwsd
}
