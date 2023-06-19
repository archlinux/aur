# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.0.5
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
sha1sums=('e585a1146e913787cc1904dea47774bfcc81a5a9'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'e2164865c5c00dc707d7918956d3a910f97ddc38'
          '7eae416a6e81a4e015cf4c5af5c5e919d1b5cca5'
          '900cb4284c72b3fced6794e9ba86fc5ffb52aeec'
          '043eb041588cc84f8baa8e1f931fbd1aa2d82e97'
          '4fa7502b81105947b251a0f191e232d4fb2ae96d'
          '0c52b29eea93218589ceb866c9b73acb1cf98a24'
          'cc12893a7d1d9898a8cd51e451fed2356009743e'
          'ff367632ad3bf33cc3ab23b59dd9735a09ecce3a'
          '8ec8d33f93c1e47fd16e4ce91a7d9cf9906c041a'
          '05d41fdc7a8e1a90a1890568354b99a426f54ed5'
          '3f9336c0006ab648ca7c1ae69dd9db6cd9bb4fce'
          '6312c79130439e75caa1c75d66a92c6d27c88834'
          '90b8c38c37c8aaaec7384914a56944deb10a4d73'
          '8a004335ee16714d4951f4c049544b0cde7125a7'
          'a1c3c77c9e653d613435247c3ffae88fa61fb7ec'
          '68ee0b1a61258627cc1334c1a9cc146ca6b58348'
          'e6838d86d882e2fe7120f39a378d3804e72e7af6'
          '962d17ae411b7f7d9a19936e657ec63c9eb2640b'
          'ea8fd96569d09fc4a920acfaa55a7b6931345121'
          '2befece9773aa64fc83e36823bf3d8346274d974'
          '94076629fc54de970b22f86d839ccb748dbbadbb'
          'fb27b4adcca6b3fe14020b2bf6a1dbf67cc7b1df'
          '12f0e7afa53383ffa709743b0df57df1df73399c'
          '41844ab78dc652fc4740f954c543f8b823d34d0a'
          '6d2b0053dadb3e41071f02a9c3859fb0e662e7cf'
          'b8d2ba5e8d11d0e7e5400ebc284f6e525b33731a'
          'e282da8c3b76128f2f202bb3c307867fb85ea08a'
          '701206858c5f00750f257e24e21aa24551b85d36'
          'f0bb5138a361f64bc002079cd255afc7f5669394'
          '7071943232ba5dbc1ab349671d382aa29d690ac6'
          '8f043fe251d46d126e2bc20c846ba51bd1d90911'
          'c5e6b2ee8236eaa1cb8294f86873c2f412e96d19'
          'e84fd18661ccb04ea3fa23e059ac6bde1b742afd'
          'cc78cf9d1a71177fe326a72fbcb65b761793acf3'
          '7d5b26c4f4a2408fa8a78b8bd734b4e7cb8a8149'
          'a73f40822da0e3cb09235daeca1455009570a392'
          '0b64be8d2720fa435ebe5fa82465550af5b5d8d5'
          '683b83751cec24dbcfd1e649841ce6ac8ae7e24c'
          'fdf62051b8ad797c78990ea9378b42d351670756'
          'f446ad6550d35ba82148b73f9ae091644a7d6a14'
          'b83577ea1739177aedd0f4147d63388fb436a7fe'
          'd86c4866a5b22619bec49489922b10557cab4df0'
          'd06a976152a69eb8a4b78133cdb3db92dff4c28f'
          '118ec078470e2cfb164e02fdbd6c102271e6d813'
          'dd005724566d10701ddc365fdbc9fe32a459056f'
          '0b384758009f4fc3c539bd82275e1ed74111a3f4'
          '6f968aff4fb70f050ce584058e8111a0de8605f1'
          '2bd26bc346e8c6aaf9b31215aebb3d8460fc71aa'
          '6494c79b7d9312987c0aab5093dc8eeac05bf8c3'
          '85b68c127985f1eb18603873619ec1050a0377a1'
          '47ccbb83cd12132f30f6d74c8c9cb59bc822839c'
          '44f34c31d402284fa247bb2201602028b48b28e6'
          '0918d27cbd55ad3ff3c6b640807e66717af16393'
          '4fa34b28b3359d30a3414404b7419e2caddc2469'
          'd86eae1e20b0a4a5e4ccab1418df346d545829c8'
          'b82142c80c924b20f247fc4fccc3bde4d14d93b4'
          'e14788624ae54ba1a9def7b39dda1cb92263ee9c'
          'ef92401c6c8d2cc11e130a125db390e0fd496864'
          '26e4aeaac7776821eab52302919dadccfc5d1f99'
          'b9b1422b733f52c117d8d8a8548e078bd2d67daf'
          '2f831ba50159cc77ae3b6e7562c84a12a58357d9'
          '7d20d037fa8a73ed83d2a62061f20ee506bffd7f'
          '5c86c926c3d6d8fb26e9416126561d6b4048e5f2'
          'a625c74e9da36276ad78dccbf01250ae08c2f63f'
          '5cf088e1eb0bfc3bf813ed92c48ec108376d786e'
          '673a263b7dd70399541b0a42fcb16c0f36f47f1b'
          'ac8a7ada84ecdc07e40b4ee447eb295f9b630c26'
          '4eb33cbb46b09412a06b26aba988cf1b12e86d97'
          'b282d938ea1435615ea0817d7db4f2c7b342a11b'
          'ecc13ec05e5c6ba5cf0afa44ea9295faadd333c3'
          'fb66be71081a9be2f5d153055cb7e5de082d51d7'
          '1643bf821a97ea28aa3ef9300b578085bf59c03c'
          '63438a87a1a3d7e5ced2a5b3d9d8a31ed475f63e'
          'ab0eeee5655009b9b316e656daabfb4bd2b51e38'
          '2b5984976f3c1f3c85ead8f207ddfdf88b93616d'
          'bb4c08ad4b5501dce0ce6643aff1ec759665e8b5'
          '809af0be5f05b5d461ec17c84ebeec6eeaaf0291'
          'c322a90a1b3d49a1855c4cb48360cb83772c4620'
          '565428fe4e8f39a0c35c5822f061d878c4bacefb'
          'a6ed6471ace7a94893bee909ebaa29d879eb1173'
          '338a8a04ed1f18957071cdb8d5d01b3332717b40'
          '0912c981c06e77917bafa838d884a986ce531c1a'
          'e89a27bcbfc3e8ee5b18e435ff75542fc8601717'
          '1b507ddf3635b3d52b397e02a4aec4ef3d014ecd'
          'e8a0261229a5dd920bf55c07eaa233733dec5b04'
          '22400f8f2d3dc1e61516823e1f3b775efefe8eb5'
          '4104df68bedbf4d86c56d3a1e55e1fbbdb314e13'
          '2e757b3c468184a1029f8d9fa6b92549bf124037'
          'a42f3d212a8038af67ea254095214a6f894b871c')

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
