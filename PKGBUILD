# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.6.4
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
sha1sums=('d6c885d0fb7ba1bcd233034398d6e4c22121756a'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '339ab8a87e454db5650f552d279c3780a710e693'
          'e328b5478661ef45be8591ea89be7e88eff6b806'
          '7dfec858301731ef2c5152762006c87cfd76a7ae'
          '0f81b5aff76cdea0deca2684cfe4171ba3308542'
          '9594f5bc5766c8c76a2b408d578be9589073c657'
          '2ca4b3a2f0c06ac7f12d2995e9acf2bcb86254f7'
          '59d1b7c07d08a8e761e1fafaa298905d6b7c0edd'
          '8bdb2b6a0d4be081abb94698f7ed3a9eef62d66f'
          '487b8c420255c8e22ff128e2335e926d6344f733'
          'eaacc75171be12e7d8aeb3a3bb4eaff7af67086b'
          '3be22bd36302f9e9b888dd19788cacad03a7b9d4'
          'e11e97cafb36363ccbf6cc39ed3331bac08af0e7'
          'a50262e7ba30b374f0faf8243142a9d906c12f25'
          '14c068ca26a78d528e6588c128c0313dff0a442f'
          '01c28754ee09eaba856de26076b02211789ffa8c'
          '82f7f26104beda04f7be14febd740a89dde9d912'
          '29b0033decc5b5e1787f9251ded35681d86dfd11'
          'ec95461199719c2c205bfeae82e99165c2992d00'
          '4f6125ec416deb0d2f5b4d6bfeab785d42379ebd'
          'e6d7b8c09fcdccd2d6c2283c81fefc9a989e271f'
          '73665c9a4e25fa85650c9e2e334dee6ba65b29ea'
          '676f22912d4d84a78f7a2123c4def98b6730cc9d'
          '7452677a0e01fa3141918481a69c93ae48970142'
          '1b4ebba11453981befd599c482ea9299dc627984'
          '8d2afcaf6036720dc6653f078f29c2229441fb63'
          'bfc35a8db28dc423deb6f33c1137b06ac075e07f'
          '00dbb5b87e43956ca791ba47c0a56e87ab3d3216'
          'a69784b183914735772d56fa4939c74a1b86ba47'
          'b13faa71963d7846805ac8726725d1a4987f2b21'
          'c1a4acb5aadd2de47e888ac6366d47b33b40ed76'
          '764d197f0dd29247ec2d141ac58445efd9a27f25'
          '2d03abbcea2b749244388b7dc91042aa213a722b'
          'e1c7c5fd3d7d4eba3390725844d6743e7e69e21f'
          'cb916461be07740e4b8cc274003946e483c32bf1'
          'd5b8196f97e746c8338ba3a0cce152c3acc40392'
          'a78eb9feca54055c5162fa3dec9428400d9923f8'
          'b3038317566399660eec47a5c27ba784b9843718'
          'c4ccd670311e4839fbf34c0926ea28546974e497'
          '03b9628d975a104837b2d34d8022c5520eb5e02f'
          'b6d2839aed5bf9223eaaa76daf9ec4047730c0d7'
          'adce414cacb453e346a0f5360d06815bf5a1e98b'
          '8f708796c9d9987d46041b6d1276c8468af379fb'
          '7a2dc15db9007a96404a843927b352da9f513999'
          '5ee27f704f7c8561871b6778f4db5b142eb37802'
          'e894e84b8858d13193d4478337e31aa27e3e102f'
          'f2b39fa3217c594e9ea22a54b824e488d2c8e52b'
          '0d565d518ae639cb1f6078e2b26705b3f4091982'
          'c6fd07e9e913c36ae7795cc200ace98f93b84d62'
          '7b93cac1bb4d3a85580670f87613296a1b49194c'
          '1b3c9b5b3755a9700fdaba168b7ee2e0a8c537b6'
          'd6a6a3ce822b0a879fd7f1cbda0790c54f5a3958'
          '8c343506ad206d557223f5d9dba543e5ad6d6123'
          'cb2bc727a84c6bb4f3a5bac30e55b547a77b6db6'
          '6b1043ecdde2ffb52ec676d69f2125f8ab313d44'
          '27a6a8b497833c66f358774509dd654b38b1fee4'
          '1b00b0edf04b60c1e8bb3c3b07dd21832290aa26'
          '7c38540f74860ccffc662afcfa9c0b57994716d9'
          '77cb8bb79a8c1e8564068e64fb7ca5781da4e605'
          'bbe8985d6a9e43cdf00a1ede65828c2c07a3fa09'
          'f207fd1138e9bbfe8da99fead62413d4fd8d1e95'
          'e616d2dc3f92881e37633922df82da1d9153ff17'
          'df5e404f015ccf19770f50429fa0d20f41e5263c'
          '1f74e4303ef76ca8e8cc6e822fdff34cecf8b15e'
          'b07805424d40fce98cf25f46a67925657ca72219'
          '1561b6032dc8adb3ff7534340df9de30439fa04d'
          'a387cc4787cba6712398ac77e463b75367e1aa3d'
          '6d0d89d59b3da430789993d28d39b12ff4f2efc0'
          '5e08e8a02565298fc90742124ba7b1040518e795'
          '2bf0156fc9bce45e825faf67939ff6933eeb8b6c'
          'bd95befc04cacb6f4ee5dfa279922dbdbcf05ba9'
          'e8c65f896a6a7ebd4d56e531c3eea3a8ba08e73f'
          '53c0e330b2b8c871f2928b8fdb47b3291ff90843'
          '2aa6d70361b1027022fcee6e140b2796371f2db9'
          'c91d045a15a43e75a362fd4563297d9a0b2cff52'
          '9bc04ab0823d95c9943e406449db1db308bb0f42'
          'f886c139913c25d308b5ae1ca3ecdf916e8dd23e'
          'b27a5e21450c9a5b4fb149b419a369d4ee0e5e37'
          '3900d769bd189f489a7f82842a0a5dfdd540f983'
          '3bfcb27c9c5687c7dc2ce5c9c98a3979fe0abb73'
          '235e136dc29b2e2d759afb18e15a903ab867683f'
          '29b6548b2255030f71e0bbc9025e6976f610cdfc'
          '70000ca5daeb318aa8c2619988bb2ec332ed8f96'
          '464b862e89b02669008764c78447529df754ade4'
          '5b4bdedb07ea5161b147d2e9b62b16bc8f42a21e'
          'e1d369881b4417c99834a7ebbd03119210bba08e'
          '2a90ed858feac58ff37919c01ad9029daf4c7fa1'
          '5b67446bf37fd61f8336da57792d93254c021c20'
          '897b3052c75087c2e7de821fd70c3539144f7227'
          '216fca3b5dafa0d8bd0e521a38c377e0def45411')

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
