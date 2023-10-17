# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.5.1
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
sha1sums=('f124ab1803caeeb248ce0eee8bd9942cde374245'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '0d2c843d232cd63925205b094cdc8976ad593b06'
          '18f4265a03d0cfc3f3984d3f6f834f2ca311fa57'
          '216b3ce75a6b81e80f156f4d9d2b420bb60bbc54'
          'f116a7f76b431d164132331f9390b9f076327f9e'
          '109df7aa59bd6f3e655cca6f5862d1a5d6a01ad1'
          'f46a17410aa0c93e6d6cf7034f72582c6c9649e2'
          '70df511c7ffb6dcb638a90b801b1987794fde198'
          '395507ffea6afd3d1163f2e94c544ea1091b58e0'
          'bdb92566f2d6c25d3988b6ead3ca705626353f1f'
          'c9b2a9a0a68ce5c016cbf61e0e4d533b9b383198'
          '47455961165423ef1a5781fff668f2ae0e93c60c'
          '4a4a1ba3a8df96a36afd2b8925df59b416ed5768'
          'fb0bd99df597042db499f3b1a435b7f12f395c04'
          '5e1ebe08e5ee1ecffe9e1995d0ebc6899ce953bc'
          'fb31aad7af35f423c240102a5c785dccf880386c'
          '705e21c2e6e8649f25a501ba1f2930dab4303203'
          'aa785688c413c139c0d34facd32fdfe6ead61a92'
          '6181e847af3402c5207ffd00c0b315f17c009aa5'
          '0a03318e8b6dc79459bd60697107a96cce94d0e2'
          '69fd8c7d08ad010079c90ddbf354df7770a8adc4'
          '78eee5d76ae5bd2fcaa937430f02ccf3784d2f94'
          '014b6a802be2373044fbc830a789676051b50886'
          '338c38970cc60e47b69309d88aa848933d4d802b'
          '5d0ac7f3c90a6552cd0999a2e06c83ce9dc398b6'
          '823d7af8625a2031ee71f14ebddadcc51633fe7d'
          'd250e038f1d63974bb563611902393dbde24c6e1'
          '42bd5e6b2ad25ee18ec20acf1372a582622578a1'
          '1ab450970a73b2b77cbf3d8000b4c22aa6513398'
          'b4f30469b88de78aaff1ffa7de4eef0c77809078'
          '6c7622cf3dbf1123602d457991b23121d621ca87'
          '0fdb506e13f41ad9b8f20f20fee948ca8583966c'
          '3c312fae10557b520f348a06d356f58d27f10eec'
          '3231db8f892e2abd210869b628e8d426dec52135'
          'af9dc8c6dfa9a9161a58b3c876a2034919fdfa51'
          '3f6e69d15a15677ee3b1c3ab9e5f7fbb17e06094'
          '1705c611264d7bdbd32c3768a4de44ea41b98f6d'
          '2934fcbd33b64c8648ddd6d33d4b239737cbac91'
          'd5ba162c63bdb0202f248bcfbbc26938ec362b7c'
          '1f29ea01aeef24518881753383201d8f3c5eab77'
          'dde7dbaf8b6879bd5149e1cd3ea7db1ebbffec58'
          '9d68f267080349645324b91717dd918d17aa2a6f'
          '6146e594469d59553f3be2ccce00f1ad5a129483'
          '145e75fc95eae7e11de556190399a7bc262ec685'
          '228626dd2cb4f8c11be960174245331ebd8dd52b'
          '8f05ff10d32a0acc74c8d4fc2fa7d1e1c1216726'
          '5ffd3e21c6ab91c5e0d47704dc0d129463437cba'
          '7b064cd02e6e34e46986ef3b52109184114a0acf'
          'e2d7269f5d69d16b6488752cea652974eeaa594c'
          'ff83dbeed1008bd21b99a635ed9e9f823bc1c3e7'
          '741c3609883791a03d4e81931d8e29f8306561ce'
          '62dd3f8a257bee10a4abba74f2a385e597108bcb'
          '67c70057f41e0eb4e6b9e26c6cf4deb0f400e1fe'
          'fea1a1efa826e80c170458210b2ac8d06955f83e'
          'f5694ae530387775455c9050b151f1be5dc0c945'
          '10eb1ecce77817b1ac7a8a56371cc4ee01be6293'
          '2654722b9736bb2f21103bc41c16b6e4079b8279'
          '48d611ef96edda014c2fca398b21eb54f17da862'
          'd56214c761c9960cb9b98ed8acf7fec6b6ef75b8'
          '6b48fab031c4e4fe3b216031875b6771eebbcd39'
          '1e1e388a58a4f2b37359103526d45a7788b26faf'
          'c6bb1c5f77aae738b5731e8f317fbf621aef7de1'
          '39fcb504dd42ffa3677b6f133a3dfc2cfcff4bea'
          '1069cb199a3ed6fc54362eb673c69cc3708b9c9e'
          '7e189a5dc2618af3a27407a581e3a7db85371f47'
          'af58f13198e99cb5d8d4b4cb2d03e18712d82f49'
          '3c82ea7f870fabd9f1f2e217f5292e28871f5e66'
          '8539f2aca5b7d521f071cbdacb4faf3b2905b686'
          'c87c443e8e83fd104bf34e78d1baa5079f323ab2'
          '4d3b08fae6f5cacf9ef58e0f3264d536b9808747'
          'd85bae1d849eb43dc7df423b7e382419f993ddd3'
          'ecfbf635f7e8c029203a7355ff2e16212434290d'
          '80aa964fc7d45a37c388ea7a4b83a8495441763a'
          'ec674a27135be7bdd727122521217a4e37087bc1'
          '304bde6beb78641844f80de7c8044ad450171dfe'
          'fce0ab083a255f690a5bd873662e3fe1acbcb19d'
          '1209297dcbe310e23b725d9677d66334dd219fb5'
          'd1cc1d65fc6dd53fb8a58bf588bced38ee85a70a'
          '7d5a9dd64b4204cf72cde0a77bbe91b87b228300'
          '80e1748eba228c0b9b0867f7ae34a1e90e560abe'
          'ad933dbe36c08e393d144261f210dcc535a2dbad'
          '0f5ae47a82a0237878535ea2fab864ee50521213'
          '7b40c5c2f1e6b08c81986f91463cb9c2b23c00ea'
          '7a23c9a05f7dad86c8bc477c3f53c5ead7c52742'
          '643e1f83cf754afa02ade4d6b943cb07f17e42b9'
          '9c7f7d21435295ecba82f541532fdddf58e26b9a'
          '42b6c4cc2b558409348d7a81f5d509eb103dc004'
          '119196f6caeb6f20623585b60ed8526215e620f2'
          'a6e541ab5767823a57b1434c45e471543643f239'
          'c780162431ecd4be59144bc7508c078d984884f7')

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
