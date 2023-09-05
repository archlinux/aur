# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.3.1
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
sha1sums=('c44d39e2a70ca8c075737a954acdf9a415d5e665'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'd69b2f6007fc2156559550ea9de774da460df2a7'
          'ee79fa2628490d52080da4c15d40dcc950ef0025'
          '9a1a9bf80c62c1ce842b0f5d023ea6511b47d89e'
          'f04f9a74236affae4e9bb933311863bb13789cdb'
          '12b42816b418cafb1333907ce0faf1ef019ce07e'
          '6a39ca712d05c260ac2e3e21da2cf88995d3ced8'
          '6c48e1e67a58308300b51da11d4587c5d59006c7'
          'b12b4c1735193e32620608f6b05312615343c7a2'
          '1e1f94ae70196898372159339cf3289762a2cdc0'
          '9c29bcb6cb2d05852716760f16f2a5cb07644ab6'
          'caca6e48793a7ac429c6b58928f9a6eb0927c039'
          '4d379339e38ef6acb7f8d7ccf66724417bbd1ef6'
          'e10ab04f20ea2f9fb5a919aafb4e59f739013593'
          '7292aaecb1dd75c45b87b09e50025c9092af2343'
          '2bd53c796bd9568046dd62cd98713d0edc3297bd'
          '86b22ba313857322cc043a9b23e10732fbcadb9f'
          'c503fd36ed550eb27a0be677b426427cbbd48495'
          '1772d2dec2910354ef7b40b5c828a89f04a452e5'
          '064fee76db4961dfe8a0e2456f52dafb4dd5d3fd'
          'b99d4bf1fee6650ab670536a20a8dbac892357fd'
          'c452cc3779f7405f0a6cd8f5d3641802376f75f7'
          'fd59ea1af173f5cefa149cb550850a3c0d68acc7'
          'e968e5e9e5cb1053fe37fcedcef1fac0acabd660'
          'b1817d00389f7d5a2276a08d699a0e83563d2aaa'
          '3e50446da122b2e4007f5a7d23fc96a7deebc57e'
          '1d5168117f3b1bd116506469eb922e3dbf4b2ab4'
          'df14aa4b00361bdf224aede4d99c0448f1441f34'
          'f3413a71963cb491787c33986c0b544126adf8c3'
          '6628328e4a266d333f79c6ab276dec81ba4afcb9'
          'e724453f49ec0c01755c5e43fba7289ef71c65bd'
          '6cae1c32b573857633d52c926eb0423b4cf59cc4'
          'bc7cac050826da31c0284961edf6fa8686a60349'
          '14d995cc25a1ca42a034da4294eafa59b8792945'
          'e84b807da17147ed927b7ccb94977fe8a89feb27'
          'd61da28228fe945c89e3fb417e1b5cad18a29780'
          '863b9f03c0a85dd917662398e87528fcce579ab9'
          '83390ee4101d6c6a3bc4051ef2dc56ccdd237169'
          'cdbf3d983bb9174b20a56136be6ee018622a2439'
          'c6b88e13553edbe7d1e146cf7c7e9453e44e4b00'
          '4b16c45180f88f3d73907dc9e785c702f92d7524'
          '44d1dad352c1a06c346dd60b40ad335274c680a8'
          '93438dd3f4ec3b635c10de91eb21632590a06ac8'
          '2131d5a26e24fbea0bdd854dba9c8787d1ae4d49'
          'b30f3ff48a15356a644f00f5fe97b0e5631cc406'
          'fd339b5df704bbc67e21afd086d961ceecfaf241'
          'd68346627690a3a2078d9fb1b30a4b3d1f190640'
          '631a68c577ad7af4f1735d7344dd8b7f231ac1a6'
          '857184e612969b86bb33c579469c8a8f6f71d770'
          '5c03a8614b17d38f813d0730572720d77a6c1399'
          'fbb152bb0f2cd41c97d5fb6f2798b2a266dd1c20'
          '5399da8bb4db01f233ad207653fee414a85b7213'
          'e612bb95292e2676c2fab58e6e0589db8bcda624'
          'be9fa59131142b077e26d352ec614713e6a7c19b'
          'ecaee0bb7f4e0889b083e9635eb2668c26e473af'
          '13d8c78168d4bdb4010923b358d325f20b42a6aa'
          '61dd29b8207b41176c6e2af156d9bc2968f6b180'
          '0cefdc9c3b050e2cf1ffe5a5d7ee67d94f599540'
          '119adba19c4a59ac0d51f052f40f8309ea26c2a1'
          'dc9df0d15bd781fee13ef30274b5a9ee7eca929f'
          '8a9e9300ac38e1c9a2bd43eabc9b9c9bb48ef27b'
          'c61db71c6b324403298aaf850d91c6b6a7165fbe'
          'b03a4f25ecee900a2e0731fc8e00e89f101e234f'
          '45895307561e1b2044594abcdafcf951e43e80a4'
          'c5c8d8e5ec3cc4150a104ddfa00bfc905a784c5e'
          'dd130ae8bba735a50e1ec1b5ff2c5d21013645e4'
          '851cfdc07a8c4f07c1ecb6188e760e62fc1d6684'
          '5474d9289d2f0db6793f904c558b00b9f681908d'
          '11012b62a803cb9da0b15a5fd8530738823f6e0f'
          '004c5e236bf740d64cd691e937548bd89eb1da62'
          '6698384938f936358f3dfa7b85b76730abd1371e'
          'fb80ceab9474093e3ce5542437b068eb245961ee'
          'abdd87a4816c7d5329f7d5669c60d3fdcd7d3788'
          '81c2f329122f5a78bafab5fd33c9851c486777d7'
          '43ffb0272dd3bbb54a27e435c89e71980ff9daa9'
          'dddc90f6b99dfd0d02380df05dc586bb1797a526'
          'a22668eb1939efc04495b70c0832d534d39663c6'
          'dd84e71a479cab5053c7789221cb006ce66ea15b'
          'de8b56e5800d579528e449c0f6f8d8b25e7da0a0'
          '163e5faab94040036b1e95ce69b3478bfb7fefd6'
          '7f323fcc1a2c3f5f926392d77d53d24f1bb893c6'
          'e2445ad42fc50ee62f590a8c609acbea74f89557'
          '4443d1125c15e2d9ef2b19d91e89c54fb859bfd6'
          'd34e0027719d1c001faded13c99342e32909b675'
          'f6f716338d137b8acc39830f9cf391bda8630d43'
          'd757eaca82b300547012a9ed8e5e50b87b5c91c1'
          'bd627551e7923ab1899f17e1b5aa16f9475c9496'
          '60b7e04c947988731dbba63b9b5b0e15d3ae8a60'
          '96d6957c86ebe81dda07da82e3cc4c6d45186ad8'
          '4748d825a8e4f64926a4a68ea7f44548aecb8fbd')

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
