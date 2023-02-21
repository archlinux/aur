# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.10.2
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
sha1sums=('1547e71fd56a03c84dd3250faa427fe67854dd58'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'e702301f0f22304f3a83a22633ad610f0786a807'
          '310f7450c65f23ddacb487bd897e1d2357a424d1'
          '89ffed1b3c684e37ea16a2baa506adb8f836f774'
          '1ae08049084c44d2ad3616294aab02554568dbb0'
          '8f0b39d40aaa5166b92fe87418a9592b1013d8a7'
          '64dc742dd2737e3fc4ce32c6c81e7578af422562'
          '3ea6917c2db71b812670922ff7f438971cf80e05'
          '0ea54d16192eac5d697de96ef8ce48c04f949ff6'
          'c252a785bb250046abff66397e724528fc01ec40'
          '615bfeee3f86983727a772af105345aacb3ff28e'
          '61dd2b81321249d0c2f84de106ab6274d5c5f96f'
          'd71e8447de2771a5e3682c736a4706efc181508e'
          'fbebb85fa0a3fdd74bc1ee2365846c02e46e3c2f'
          '77210854615161d1e35cbb80bfe1d66c7803b5bb'
          'eb94d69324a1aea28f82cf36173d8274df5ba4bd'
          '7c3985c434e25c4dec68c1b2a54296f8f44f2c5f'
          '5b5190a141ea1e241146a6cf7d740b62b851983c'
          '3aa1152edf443673154685724a6638584b3dda9b'
          '6f59b72e8dadf6db3bf190b4c9684fb069e39aa6'
          '62bb9fd4054036aa7525565a1700426e33bbb213'
          '43b4423cc786309ed5f3714385b488b141e85d51'
          '642a9cafc0d6b70cdbe0672ba49e5e333a1a62c8'
          'b4f7688e42489b657fccbccf746d1be31b246487'
          'e472a697f905deaf48c12a2c2662ab2d30cda3fb'
          '3fa1fac26d0291323658205c157b2489fd1d0dbe'
          'd775393f808ee2c2d0939673081f9dd0a3dfdd48'
          '5ee6ec3b4cfb52c56897e6255ad77b47b15e97da'
          'b22273691df9c21b45c30be879189397fba46880'
          'c3eb63fbfce05ae731b93cbbae732db6bdead4c8'
          'aeed7b57e013ed6214dd3df5e902b16bb2da03a8'
          'f46ae2991a9fd35815cdb26545ec7809f99b7dc9'
          'a24eb9137bb8b6f4185044600287961535e3954c'
          'fa3ba39bb1bb90bee66c37c0f76ede2f15f56a2e'
          '33f5869a685344866f093109ed49fcb66bd73db2'
          '23e3a237e56b823490c620210f0c18bf92e44f6a'
          '749298cb743c2b6a3eb647a874269e1e17b32c14'
          'e39ec855a3300588c703164aaab9c163a0befa9a'
          'c9be116dd67233ce4b5580028da9f11958555bbe'
          '7c53edd2dc55078d58cd3e811f772a463ec9ddb1'
          '1404324181bfd3bc5b0ec8c064b11f94e39ab86d'
          '7b067ac1e3153ca5fa3a5f86942dfda9623c16e1'
          'b6ff199b30141ce75e9f6aa7ec4086499967f7f2'
          '1d1c7321d6eb8301a1b5c81e190347206bbebd2e'
          'd6de95495943bf3cb5637b5b0c16cdb8923e49d8'
          '83559f725d7d2079fc1fa18a2b33fa8e0dd1bb08'
          'ce4ce14fcc150d9d120590375676ae88769be4e1'
          '859f94f51b25ae616237b090b4a910595a1a5952'
          '2d59ff49dc6897b164b9530def21bfaf7ed45c36'
          'a7236f024520e3c1df36290b8e0fa15e5105d142'
          'f12644827c3eaa5862a3d6cb129702794d6ff495'
          '7fae91bbd3fce9f23d5c16327d737c0661edd8ba'
          '76abba3c5e3236b765efad5b2229ee7e0e3cc670'
          '3be8431c49a7d3ff05aad0baafddfe478dce3a85'
          '057ec2febfdac64c6232da04df13d260c36df723'
          '57876186cd10f3d756677bba5c6890db4a8a7cec'
          '4059a2e062a32743f6abc0104ebe025202bffbe9'
          '0c706ba9be1e0a41dd781fe2146305fb6cac71ae'
          'fb180d7a169284126b15e4da2122ca4ef57fec00'
          'ee7da26174206d4b6e889b80c8fd93cb9b7c3ef0'
          '2e94e8745086a8652681953bffe2010bb0492dd4'
          'e156498a90905cda0329dd8a5c0bbe98b3d0b2e5'
          'ef4a3e06c08b662b606089eed0409ebb46dbc67e'
          'b8f0d6870e6fc95d4f0c3e4b43fcc3470fe80743'
          'babf2e61760377737e10f9545602c9d7e4293749'
          '3d0ad578db88d6f0fe78fbd4a230d7a57a94f74a'
          '5c2b2ec16e7854759407945bef160bc5dd6c22d9'
          '79f72243839da98c6fd2276be1c1f3371b4f2ccb'
          '23aff105e75e79f9e7caf27b4c0c88427356adf9'
          'b688c9e669a4daeac5a2c48241d5f530c4ddc701'
          'e3dce9d52ef52af5fcf0059bc074c2f93451afe8'
          'ca06113d681a386f33a6456bc2b872fda410cc98'
          '2b3182a20e76c22ab8da27c094ce994a7b5f8899'
          '146c6d64e49198ffe478221557bb12acab47d896'
          'f8c56d6b89a52ada48c7986e93946f273678b694'
          '30ba7074bd46149a24f8cc5c8fb400a80cfd4f68'
          '51aa6dcd73f48e36d05cd2852bcac8ef2fec25af'
          '74717af21e5284ed0de1e2bbf6e608475924adf2'
          'd005ad52df9df3b4fdc51130ada4563a151ae097'
          'd8edab4ee48d5b7bef18be620bd54a2575b7902e'
          'c503a7b7308ff4e6041f92ca4cbe143da924da94'
          '22bd2e8f08a5fabaac9ccb8b3d289db06bad30d8'
          '1d62595f573d1290b39bab9e982698ed4fa6d621'
          'fca13f23cd55979a2ad0a75501ae695a3cadb354'
          'e7885dd07d27dfd36c796398de53bf94ccc90904'
          '9e36906afb33b79c26ca98fb40581c2d21f2d69f'
          'f52a3ff154fa3b05b5464c4fa9396c0c16ea260f'
          '92d179ca06b72682e86f500e6fa13198cd3ddd42'
          '654648888ca498fbdc585f1c00163a15be6cbaaf'
          '5d3cf98a3a79a406b24a8a4120a079d0c962b785'
          'cc598168d7e5c320c96ecc2a589b81bf658db7cc'
          'cbbad7b9d0c6b83c5368b21a0e07ec06a9baf715'
          'c10c2321b7d8674a70e7d9101d9f3b2fc567fa25'
          '82e7b6317b2af9c48ddb1eebd0ef2acba09fcb60'
          '6268fdaf5dda436a12b7d33c9c24d1d74c42a82c'
          '09e0325eeeb6cdc2da3dfe3fc05e15753ed9d4ac'
          'dea4d0565d6e8b0750d404f4e3ccd0a22513d663'
          'a4c9479aa2e0665f6daa8439206beaa766a335ce'
          '5eac710a55c0f871cc6ffdb9c9f83a3f653a73b7'
          '93c32518fa679a2818498ede9b0b00c7470cc963'
          '31da386070b68d1d94f3eae72f08cfea7bb3b711'
          '5609843a5d3d466f8c7423ab9dd063c462a20981'
          'acefdf5ba59b71e7b6e7458a20da6eeff9b3c8d1'
          'd8f2f29e35f4a0713f55596ee1bad2b5ef53da93'
          '0e91250ba853885639ec6541647dac8df825d285'
          '8caa524a428f4edca25aea8c0a84b8f3f7ae205d'
          '96fc025b911344f44652679ce40dd539ea0d2628'
          '2beb022f073b2f2274a82bd4d71aadd758ab3e6c'
          'bd25ed6576d97ef398ebd79aa0cf7318233fa3b7'
          '98489e0c59e7962ad3b09b321237bb3091530d70'
          '6e0322e656bb1fc0a9ff0bfd820154f0f6a7b535'
          '37df4f6206e7734951eacd8ca47fb47981f03b91'
          '95433dc67a6e9834268e8307a6e28017f7f21d75'
          '77da8458f44d9081b5f1fd65fc4436b6e9da7bb2'
          'edabcd7ef290f10c3ccfeba56c833348b5d998b4'
          'c7eff0b387a3b8d5a6966760aee568e6277f487a'
          'a6559c6b4051893ebc7895b2723dbe0defc5dae6'
          'e61f8652472baae20ee74ce2b9f8868faf70e868')

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
