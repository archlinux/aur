# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.1.2
pkgrel=2
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
sha1sums=('723a3cb70149653b536dd81611344d6e68438ae4'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '9fb6722e26b56977a4160813e8875f217af3df39'
          '9f5fb443c16a4e9108d5dc7139f9e2aca1f8d110'
          'c0f4ece09cb44a68e9010e04b59ede48d14956c3'
          'bca470671d81f49eb73ada20ccd1e3369bba6732'
          'f6de5c982238b480781454bf176b3ae6dff79a11'
          'b3d9a039418becc85546ff119764b512d9b28ae6'
          '2cd847e6cf0d4a00ec86e112bb2abee4b6ec84ed'
          'e12a0941e7b337f8fdd7c3a2e40d8b56848455f4'
          'f8ef687a07d5733e1f0bafb22623c31bc9ba0c94'
          'c0b305856b1842dd53f363b11ad842eabef0c437'
          '33f3283f9e82ed1132a1fd46fe223fa62704de56'
          '3e82bfdc77014c83762b866a944d8d37b0d8fec0'
          'dc971fc1100f575da2f3402f5048002e15b20727'
          'f75918ea042ed1b4958fa167c6fe345cbf460695'
          'c63dd2f4ead9169bf18ff0b44d8bb9b4a7655045'
          'f0299c9b9ec7bdc4dc0e8569938577df65e0b6da'
          '3a4c37967c16a26ce71d0ad5ee346443dec70c59'
          '31cd2eaf41da508c3a3a92e068d2912e189bac99'
          '6b7d91de8884f542b2bcdd8b074fc4c9b5e5f5d7'
          '052768181f022569d5e08e7530018e829a917acd'
          'dae8122e33a13b613b356890104320ad84a26135'
          '5ba11fafb882c4350f673bdfebe2ed0be0b8843d'
          '437bd11e28dd38984d032a9a009ebfe8b97e2b54'
          '6e15877c9739087b6a2a88a84ebdc0cbe2b8f3bc'
          'ce026c23809958095e1dff5da1011cf0555bdce7'
          'a4528b42ab6adb4d844aaedc3f33644c0f10c84e'
          'e456c9895838be69cc46169c863091383a439e1d'
          'cb455357bcd7ffaef277adb9c5d58d407d8eb767'
          'd577e32db76412503b9321dd40854b206dc70cb3'
          '0a3fa64944d1376fcd79886492722d46c7a2eb1e'
          'b601071ea11ef62aeba2babff9957453c5f19fbc'
          '617bed523685411d335505ff59d05249c60df56a'
          '86f22313e3696d450b4f0ffaa44907f2df2306e4'
          'a6d596badfefe1d14f237afc09b9e96ec46288fb'
          '806777fac2efa5dee843f74378617f974b964761'
          '0afa89af5ec41b4261fca3a4f385ade0689052d1'
          '7e6e6dd2d553a762f54dd85b940a3d1d645b23a1'
          '1cedc1bf99a6ed5cf3fac94e5fdcea2e2230784e'
          'aa05b8a3bd447bfc0e5e05a701c0a244b8378642'
          '3c7a464eab23de3ba61d11a82003f26314c4285b'
          'b55f24d36297ce704581204c5714ef97cb272d00'
          '05d9af052537abf3ea522c47f7c1ab45d3aa6596'
          '7843e1270e21eaf10553b0553e8249c2cdc9964c'
          '2d384ae38ca0d3d950365f611c51fb74059a7da9'
          'b19759daa6200df069208230170fcd9e624540aa'
          'eba588809f29fa470d6a373492231774514f884b'
          '7b3b80dc49d683951bfa5e4d51f8c00cb9d53638'
          '0df3bfa1a0ee704870957b694b6bdfaf39f5dd5c'
          '1d6e6f47918d0a3dd990c58a7cb624cb2d4ae82e'
          '16a5819976ab727aa52ee8e3adf5e38e18cb9ae8'
          'bb0ad6559f92258ff5bbd7f765e9595699e7324c'
          '0dd36028a6f7f9ffd53dd1205e823a8c2be0f93f'
          '8336a261b1c1c4f31bac6b5301fac7ffabf6b36b'
          '350506c2edf69fd92546849f44cf8eeb0ac4352c'
          '485e2c2b6af0e9e9c7365d9ae1c3324026e7b9f7'
          '12b5bc57e3a419b985331d137e758551f6f718a5'
          'f401e774d97ee8d87b8b24fa0b9f939dc84c5be0'
          '7cc4a3ed3cdf89def45b6a62c7109388b4f10ca2'
          'f6633af045f4122a5a69e06910e9e2d8d3c662fd'
          'd049eabda45369b3b2c9a8d43c0272b05ac011c2'
          '574e8d6d370ae8aabf416b65098ed4079a9ad101'
          'b7ff72a90989195d0e3b62c6889eae634c3f7651'
          'd154a0a69b2a780c126aaa13d1c8431dfa5797a5'
          'b9bd9545ca63f24f9947b0e02d43d9a4880fce25'
          'bd0bdf03f7390dd7b99e95a7e7895139ff183f3f'
          'e7a13a5d1671b7973f00b30d846cf55038764aa1'
          'ee34370bc0302e1a3a7b3e55e62de30e6ff8b894'
          'cdd76523267971a46295a36703f6ba8f64fef4fe'
          '9437c92693667a0c7834b5aed519843de39aaea2'
          '60f58b6938583e8027ff700ee8faaff0aed2200a'
          'd4a22701302e6661fe6c3c1754d02734b80f9f9d'
          'c2d2a094705485532389783733007dc4d1565ab6'
          '13d6a88e67f20fa04e98f08f99bde8584361ebaf'
          '37469152ec0f48265f5c77a111ed3dd3191c19bf'
          'c66ddbd457700fc0e5d79c3d6de445b7175aa942'
          'e6afe2e6fab07c218785726d80f6123007a29ff1'
          '1d9adf2c743d95733f1da36b2026cdd0e1890703'
          '7c329503905dfe53b3fc7eec1a1e22f37a560228'
          '20614e060f7898dfa5667e471d2fdafd57c2e406'
          '4febcd7b577c2e3fdd211fbb2b7b72731a905203'
          '5c426c3d29340af50e3dd74e1132f8ca4be83dc4'
          'fcd5ac0e242a9c21a7acecb41e477956b2e8fddd'
          '24c68476da5e37abad951eea4eba5fb00e4a9b59'
          '321ac25d7ba1e0ddcc230ca57700ded5fb522a5b'
          '163de940952bb95e61b3714dee7894af76b300a0'
          '8690342243e8aecf29ddc5b767ef3520f4a647f3'
          'd4888c4a2c76b06069875ce6dfe55faccdd8cd0d'
          '5aafe7ca4780ac36a8ad290388c87e88de5c1a61'
          '1611a0bb76fec5465945bbf791649cdbcb9a74c9')

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
