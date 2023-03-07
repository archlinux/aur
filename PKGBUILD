# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.10.7
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
sha1sums=('1eb511ac7e59e73ef0a044fb2f5ab5229673fdba'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'e702301f0f22304f3a83a22633ad610f0786a807'
          'b3e5e24ab720f56ca0de423cd6eaf794c981010e'
          '6e73ec88bb528a82942c7d26184a1627843a8480'
          '61905db13d275a90201ffa8b491930c0711a455b'
          'ada29f94ef2c6ad65208a60b96c7b7487d34e136'
          '24808a4573ea215cd8fc00749c8ac3c954b725f5'
          '227453fd49206202b0e3f65a92e3cd27b599fb71'
          '2d89852e6e9f603a62a9f32cf522a419e6d66152'
          'ea93534786d0ee9ae5a8104de05cde9116ca85c5'
          'ec8a5cdecc479df0742a95c7cdd90e2a18ae8874'
          'd7bcb8279720f4258f06fe52aefe2e2e23a2df22'
          '1b75be5c3d174e7028ccfba2f0149497a45688b9'
          '4aae8ccfdcc53719711696d336f2d642cee9309c'
          'cad49795f4fcc7296e8a10d8546dc8977e22c13d'
          '2b14b10cc13cd369981a25a3a48a86c75a63fd8d'
          '16453276147b8542ad707608077b1fb3eab5457f'
          'e2a577d6cc7fb8253abebf2b6f44f18679de300b'
          'b9c6d7e55a2e5f830738026a34ca42d4b493edf2'
          '819373f7b6e24edb3a50b4478feef72daaaa3c46'
          'e7676d69e59f6fe2a8eea437fe011b20e332888d'
          '28131c3c4c9039a18584a3855a9a496129065e92'
          '52389246a7dc45a839c631c103e706a6fce6f617'
          '0708c4e1a9da90e26332b0745da819e89611dca0'
          '63ad77c041abc0d0e37f49a18393eeac4eb0f862'
          '184e2dd1a07bf50df49be2b6aacb89e8f59af96b'
          '22f6be0ecd3c76d00d06354c779a01457a409f10'
          '9ad06c03ec13ca12004d9805b8c3b0638cc4865c'
          '42db672f24ec1e28125c54eaee70ba687d2866bd'
          '1402ed7f50cb97ae67825cf6647e5b29db4a9b70'
          '13dc1019f754e6bd05fe383969d3c2acb32e47ec'
          '1fc53181aca22fd30ab877318961d20bfe5da725'
          '7fe4f7969dfed812d3d5d6728c58122e69629e93'
          '4ffecbc3a4dffa768c5e19f1c76edbe972dc7857'
          '738645c809d92fafa34ab3a2cbf353cfdb32fb8e'
          'f5280fd370b05e5c6355fe5dab3757e568ad706c'
          '6dde21c50a98a7615e287dd5826e3067f62f586a'
          'e93bd55bc06ac068dbbaed740eedfa3ee9ac4aff'
          'ac5cddf1897741b81dd0e1c0923496e142997ef5'
          '2bd94dfef550632f889ce8805db500cb6ce93c5c'
          'd986e490438e0ca762bccccccb7c32aeb02d4b2a'
          '0db737e9abbb61405c75d26e13cecaa3495b5e1f'
          'd06ba0f934c2507ce02e321507d6484555728ba2'
          '7cb17f0a4db6bbeb197fe3e46fda4d6c153a4e5c'
          '53cf35294f0abfea68c91298bf594d2e3ca47f7f'
          '0317f3c3961b28c75577d20215c91371747d5f0d'
          '53736531948cd1e3fcdf0ff032e09dccbaf90164'
          'd8e9f9458fd2898eca86d85a6d9362c46169743d'
          'e5ad91efa3f927f1df9cea6b6036da1712ae70e7'
          '0771613bab6fe4cc7475a00560cc2f585dd5049a'
          '1b18142924a24dd281fdb711e9cd9631ea7e1729'
          'bd2626fc637c8a8ca739fe7d6f8d395202c19bc0'
          '2e5dec27d4ef0221e131f278bd9e35200dd89785'
          'febc9e33e7218166d04d7d1951e98e384665c9db'
          '0577630d53a19f4680e6856b3c545f47c6b166be'
          '7a54e8fbfd95fb4eb2ec6b032c88a7840657f445'
          'ac443644a4286eb87c29e119040080ad4d565b68'
          'e6b26f0a3b0bd740cf6e2139f5a79ebfd4d8b781'
          '7b3bdd944830eb16b4dd697bbee65ec78fcf782b'
          '5046314e13524705ba918610c6b547194f259b0b'
          'cd92e4f20e7ea1f353f7e9df131863d158cc84e9'
          'c5f61c354e79bbcd075f05d1e6014ac965f8b452'
          'cc49d64f9e1d978b147b8f45c748203e7052dd7b'
          '91c1b8e103f430217bdf1efeb2089fe5c8eccd01'
          'c60d3cd454da4188efe8462ae263d7ffd7807f59'
          'fff6996cae23f0993e22ed9f803f8b02a99929b7'
          'c7f8b385ca1e53cdb463d6589f5e6c0ae5cc51d5'
          'be20ebac95283b4e4c8b2142b48945c3bca20dc7'
          '481a4407bddef58310d29634b9584d65adb4864e'
          'bc91177b640b0b2b377b00086a5965936a3108eb'
          '18157483c294ee62af79f528eed4d9034c530d0e'
          '4a4508111f400d11cc00338c4dea968d29b71af8'
          '7181feb74ba31f49dd23c22c1680f8613ff70b02'
          '013af1a67aa101bc4d2e3b869a229ea1a94b33f2'
          '93f09aa8e35f1e2c3751da58ee4df352bc4301fb'
          '2db519aa304f380041f8682627e82cf504199223'
          '26e696c01f6470af1aba59e876e4392b7b6d315f'
          '699056cf6f022a737ad4b7f09b8837fd116acaa9'
          'f60023f081a3a4af128ebdb70e706048b8e5f0c2'
          'c31523feb72b64251e8cd266c97313b6bb7aa5d3'
          'fd94816604c1d8472d55a6d6c2306fe46296ad78'
          'f8cdeadbe2fb0016fa6ef555e4fe73637fffb439'
          '26c5d56381729cb006791bd1ab195455a49b1bce'
          '298c295c0b1758e9fde31e81dd2dd44f4079649f'
          'd956ae8c3df5b5cf81b780a16b73f403ffc95ff2'
          '5f3b34a58f5cf51e6cdd6f7966248fffb75cd1d2'
          '69393fa3d0848c4b530f8894c161048c381cac32'
          '447a60b4dad6c6da8d7f457dbd68e7c495d8b80d'
          'c6e63773e4d23468de91a5ca3c0f1328023859e2'
          '231ce013d31d24da2474dfa1b08148010e2af42a'
          '9605eb2bbdcf90482c0981bb968f82c7dba3b1c6'
          'deac6bdca3d89bbcfcd648f33ecf1f2c67a16f5e'
          '1e6b8ef967c333a57146670f78c5a12273b3162e'
          'b7b411e0c59ae80ddccf06b2a1970ca920dae2b2'
          'c75e7ba2e23e42eed5e0b31b8f7232addc14a75f'
          '7c0122e1651fc4c48e81363759d733c03efb74e0'
          'f41d8dd2b42f85e7135105e5ad108121b39bdc26'
          'c98e472f2f513d1dba445e8132adc56c469de8db'
          'd9502964d138e22ecef0b6a2d334e9dde82a051f'
          '8caa4c75b7b12d1795280ac6f53c977b9e74a3a0'
          '5d74437cca1e4694a3ddf84e394a732ee61ea374'
          '10a4a1fbdf5777f26f4126ab61379a846a5567b7'
          '176aa05957395ce8e51448ded091e88d52e89613'
          '73d3a053845fcfb4e7f1ece1ba224124ea3e85d3'
          '75f1f23312008885615e511185b2db762f815f2e'
          '89b24e473f382f94285bc4545da783f632f1964b'
          '940cda4b1e6a3aa62563d16822d04769fdbe2d52'
          '36bc013ed8a162f08df80e81a9f095b6a3ff358e'
          'c8d7388570df22fa1f1ebf5cd1618aaf70df78d3'
          '559ff51fe4fc643605c0af96d02782f7d723a1dd'
          'bcecc98c5e37c5172b37616832629a3e43ed083b'
          'acfe8070540a4094b8ffe7cec2680f865e2f0698'
          '803953ce2701eeaedf8aa4673eb409a01d45c26b'
          '5ab299bae15e97759f9d2035330289e8c7fdbc44'
          'c4894225f598b6bea82bfc4744d8614eb6a31465'
          'd45ba2f940f25d13d63abfe37721b01dd3278514'
          'b862039897f32b9b9efa6d1adf610e697c5c952c'
          '6abc70cf806f84d40572beae947cf3b9126fc429')

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
  libgcc1             = gcc-libs
  libpam0g            = pam
  libpng12-0          = libpng12
  libssl1.0.0         = openssl-1.0
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
  local meta="$(awk -F$'\n' -vRS= "/^Package:[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")\\n/{print}" Packages)"
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
    awk -F$'\n' -vRS= '/^Package:[[:blank:]]*coolwsd\n/{print}' Packages \
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
