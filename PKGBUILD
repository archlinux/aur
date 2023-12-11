# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.6.2
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
sha1sums=('309487b2ead166c0c520d1638500771c6c7aaca6'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'e8161d2cf1e4c5f1536ab36be4f8019a6d8f6880'
          '817c5ed800d5b0b6a9b55f911d3449857831299f'
          '74bf5180e1b7a24ab4ed00e176f0adb942d590df'
          'c4e186bc939816f7040a858c46e861bb72d5dadf'
          'bb5a7500087c239676b4c198d6654b0aaf7f9395'
          'b667e115fcecbec79339ae88c53e8ec63ddcabfe'
          '7571501f99286909ef0e4c1ff1e14bddfdb2e1ab'
          'cc8c06db2a9a7d8ecaab5f52c91ec8fcde3f33b1'
          '37227fc25a5652f04d5e83df5f5bb543d156d83b'
          '05c71e0a9098de3d5fe15ccbd8f0392294f46c21'
          'bdfbc2489f71cf7eda907369819c3833202b3a0e'
          'cc939dd2c9366fc1ad390727bdc15a8e6481a053'
          'faec709bd0fe29646d7a37f5627ba7e5627442f9'
          'e984d21ecd671413bce2921a3d1ced36e5bfcbfd'
          'a186a3f0d4ff9e1f45427c31374ea97927eaf3fd'
          '076ffbc872defbdd5180d383569e6fccc53cd986'
          'd8ac51969fb06decd5d82404b57bacb5e7563452'
          '8b13df0a42892e0875ed08dd2cbcf34ab956092d'
          '0e9214b6388dbe366469290bb5341ee0f1ba5bb0'
          '2671d42a7b39cf8f35e00c5418ba12f557a3d584'
          'b51b8f44a22dffe2b6eeafaba01b1283cfbd4bb9'
          '6218370870022fbd12da2d58108f7544b97784c4'
          'e9761eb431740cc1bfa7c02b6df492cbd75deba5'
          '0ce556c8024601f1ba8222593826c7793222fc0e'
          'b0efddb0bd3bad5fda0b8e5a4b9431d3310ef4fb'
          'bf173b36ba343f57b8d11fe950a444e5650aecbc'
          '0007d1537c860d1cbe50e40d54304d93a1783570'
          '547256a0398396220204e1852ded5d568d2fee89'
          '8a7130430f5d146d8d54eaabdc196a5d8c2f436e'
          'a1b2a7ca02291f7d45eff10effbfacfdf4146154'
          '07ff76ad61fabf4032c95f6674bc879fa93e8591'
          '7ad446de238f57a696545ac19c6e8b1818734c13'
          'a321fd582b5c91b9bc5ab2993c19bb4827933f53'
          '074202ae1d8b4a4d6fec5b064e822e01903c8533'
          '9d1475f8efe240f696a080c722fe235ffcd916e8'
          'e07d05a8726c7a4731d19223a0fcc8f34751ae5e'
          '60a0d11623243c5e15e320babd66effa861e2769'
          'c5b3c671e741b7c2995433f2b55424b030e9e764'
          '2ba148eec86eb06cfec374ac4504171a2c688c0c'
          '1d2bad285325e28cbd72a15ee5323c8134b1183d'
          '25730ec51c631fe3e9c156db419f50d87e33d732'
          '25637446ef1165d7258fe2f81bfca97916796d98'
          '8c6452974a3610f112e7e1cc6f3cd6937e94cd5e'
          '883ca9f7e3d8dc65e5ba8a2c36dfa6446b6df73c'
          '14daf8c356af2d321af455b2d389c6890904c3c1'
          'c6e29b9032aba7973eb65e017fdcee9ea9da2eab'
          'd7939ceefd7afcebbb41e5747a382ee4c87a1e94'
          '5321ff62f475779f73bda55dab12e0866a5c86b6'
          'ecd0ddd5b8093847febfa56c262d29e8051f5c69'
          '29c5e18393c3c20c1b74d67511133ebe6f1c9ee2'
          'f78a9cea56a9cc0a5adc4180f41a586a78f316be'
          '2493b615dd59d188e0f982d236b2382ca9230e4d'
          '3af479752e807a5ae0f11b886774cb3bdf7cac0b'
          '299f72a2e3d9a194f2f63d174c1889e0e03ff45d'
          '12c5a14c62d1669859db5720211b59d08e927083'
          '00180be571f34a9aa951bd4a4403c88db4cf2b8c'
          '950ad5ab944992ef4da29c0486fb48d9a7cad1c4'
          '92c23bce63f42062bd451425723b5f21635967d1'
          'd0de143b0601221c725581fa0baa4d2a3dae692a'
          'e248c9059fd4fc321ade2bcd2413a198e487de8d'
          '59f6442bb210a9528110fb5d65dfbc1018da9d06'
          'f3ed0c828ab6e254ce3bd425cfb6bbe4e8d23a74'
          '64c7e836c250307bf7955f55d27c0c91f35f6b76'
          'f40053f831f084f86a1a85b8fb9963a5090b512d'
          '06054f8a595c730614bff60fca5767241caa3bf7'
          '2cfe7dbbeff1f81e2844bc5a0ae2024dcf3c748b'
          'f87a8a8ed62062b17529ec9dc1111ab85b63b24a'
          '7a5add12ed11a52184b4e970983a25461b021dee'
          '5ad7a20b5af7ee823e041b313c356184ae575cdc'
          'd45aba7a41d962779754d9093a66336f58c6d8cf'
          'e36a414eb270cd9df9129b33fdf2238114ff080c'
          'b486ada540701dc20cae17f02621c41e4fbb9bb5'
          'aa1a7bbde77f3c0ff0918f7f4ac1582f1f9ce565'
          '85d6852a55b398ffdaee5f685d3eab7314f2fda2'
          '606f6ae9d5eed7b4a6a6b662ab6f3844ece79b1e'
          'fcccaf19f48546ee5fd356bee9d4b7039080a425'
          '625dc6009f5b003c7473538fc3394281dfe528e7'
          '61fd0d7c820ef038ce88c17b374eca68782a6936'
          'f30ca3d58fd8d0e2e4108ee8d854e1548a8f2b94'
          'b3181e6bc0e38b0185321791f3fb074cfa1e8c00'
          'f9a9997b1ccbb9bda56855e237aed1ebaf3cbbb2'
          '6d62e5b5e5a23aa70fac78190fba1194bb9a2ae3'
          'ac22beaf877561f89f305001efda45355b99bcf5'
          '90951e9a67e1ec80623dd1f9d1a148bc427c7532'
          '06eb56dd3966cdffcd4b05d776d15c6b2d64a93f'
          '7480f11b5a35c873050e25f05df58cada83ccf69'
          '1f943943a8edd567a1b22b84dd03a788502b1000'
          '30d7f6991a1ec4c76de469156b34688bd443a447'
          '477df20a61dbb1cee4ba6d36947db8ed48292109')

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
