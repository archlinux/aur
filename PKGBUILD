# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.14.4
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
sha1sums=('8ea8ed742df6d381390742740da587a0a1b90721'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '2a834e93e414482a52981eec28200d3e4f441158'
          '92d581e931dbd20ef082c251fb68a1ccf2615048'
          'a49800b43570a9f38e083004b0b3ad09b6954b00'
          'aeba1b6af43a0b44755dadbcda69092d6a6ef5a1'
          'e347875b702741635bc22f21cf9654df78015506'
          '0cece10edc07c8fd04041e38332b463f98eb5f15'
          'aa41d41e7b2d70c747dff7ddb5b517dd3865df68'
          'c6a8b51cddb24e7d8e4bb904ccf35029484198df'
          '66d22c45045697211031075379d5c1469c14f181'
          'b2b34b3fa09148cde4abc6e1c0dbe6911cde3618'
          '84731335431866513d5efebb1032378e6f9f4f30'
          '9aafaaf1382bd0ca8ee5b6e6791152e84119ad03'
          'b18fe533f97f8533debb7b32eae1b016270537e2'
          '619951e442357e087aac6e41d5f8d53c0dd87fe1'
          '6e1f5d1cc6d45227f45f32ddd1cb1317521cb006'
          '0c9929b342005abad096bf9d6e10c17fd7e9e2e6'
          '151cac866a3a1fb2180adf354287bfb0abe86039'
          'c5a3fec40443f033d7706188fcd0abf17b10fe8c'
          '0ffee278463cb969dcb9d127e5c4a8cb051da16a'
          '908b486a08608b8b79ec7d78ae702f812ce40700'
          '6313f87550bdb425567240e8b08e7c6b4f67d479'
          'bbb462c912987dcf5af1373e54cb46825bf118c0'
          '1a31e798e2947c3cf8e5ebdb8ac97ce4df991e8d'
          '4eae070ccca54d98bdfbcbc6a8da00526ef34c7a'
          '3cda4744dda69b004c3f5084c65d86a9ed71343b'
          'f9d9be33291c1edfb4aaf4777162dfba12696d82'
          '5c674152def99482b9a0a172626900427f0ae64e'
          'fdebc7e766799cd65f067d98a97164e11a2beae3'
          'd25834398d827b04a1617f3825fb59a3e7e407fd'
          '6fafc36f87422b4e6e77c58aff2184e030274587'
          '0c5e4eb223574860beb3580c37e5f6911a2a7780'
          '791ae621e618eccb214c2d31d9c2661d2a8b945c'
          '1505f02b6328a62ef489309dc1874c1fbcdba052'
          '1a128bca99a26f8b61ebcd6c803137b09a36b300'
          '2701b6557b3ea2e87b1a1ea44be34273948e8a4c'
          '3a926814b1504dcea96721a42094283793f2b4a7'
          '8ae9008e5dac4edcf5468140857df4fcacd4cc4b'
          '40ef69ab56a337fb8049edfb00af31ea4763b6c4'
          'b1f6be07eae0915f1f73dfb5d758a139f8650c6f'
          '60528dbd6cdb86726e647fa9fa89c1780ab0b824'
          'e5dd52dacf0586b813a5e6ecc648de7637f93497'
          'cab96cbf8827a58e528d3b85d5a06a494c8ea42e'
          '5d3239200efd283350d9cbfde8f514744bae3b6b'
          'f30dd177ac6a5d5bd169ff24a3ab24a3ec06c383'
          'e69d32a514c49ff0f483484f360ede0cfdb9c4ef'
          '937ef6e877be2c3afeaba8ba875292392a14246d'
          '7285fbf94627c47ccead5e1ce357a76dd71647b3'
          'bc75ca549ee8c9af480b22eb2e0f7b7e940962fe'
          'f9affe45961cccce08b986782aaf7ca70380c06a'
          '3be54dd008a9368ba0ec3e0c6c967517220a9f09'
          '8c795eecbb690d07043e9e76d1e9cab77ee0c4ad'
          '3c94d6d550d14ae4a1f37d92e3a342e7c0e8577f'
          'b1083b9d1374a60d2158e1a11b190d0b338461dd'
          '5e80ac23f502e899a267f55fe72e00b5eaad18f5'
          '8426278b392b0d84100a735b65c605b862097cc6'
          'a7b08738c72ea1686f4e74d11f47c9870bb3e81f'
          '3c655df696a67d63f961bf43ef8f5a7cbd5ef4c4'
          'f24e8a8586af9387186f6735d92a4661dd380865'
          'd62f19ba2705871acf445a1ed645af569a289984'
          'b5e72f7a84ed05ba3c1cc2e6c7ce606be8794a5e'
          'd7d05ec7c25a3542dc016edbb8c88b893cad324d'
          '56238a6ae2f8fa24adef4f04f5545f16f4cddafe'
          '70bd033150f449895fbd32fe41655020e6968c85'
          '037cf3fc83b0bcc6a1f036094a488fd3b1f3fd1d'
          '206f03811f4840a0c407866f1a1bccb04099ca0c'
          'aaeecd08e72d34897e854095ae37b0af8c1f8ba8'
          'a854c6f02eb90e50bec26e719181acb6f2bb5ebf'
          '5eb827d0c72f51dffb34d33af437e2952f852f98'
          '66decdd400047cf2b19ddde0fbe11e4e877c4c0a'
          '5b0adca8cba6ab1bc6f6a33dcbae963cd9458580'
          '18978712b08cbf112086643f77b98afac6a30bc9'
          '386d87c656357b86a10c1f4bf19f4ab7a95bd547'
          'b0cd363af59ae3473bd305f99219cef178f29d27'
          'a51841a3b3d3c13ba3a7011072c63f9a94c12b85'
          '5a5e753d2eb312d7099ba2dc4a384b9c3796bf64'
          'a0c7e88ed77fbbbbb75f0cf8ff01598fe720b6b0'
          '81657bcb1571ac7b4e4db7cb82db3be96e6eef40'
          '1a93ce3ee4d2114c470b50b592a37f2f791c3955'
          '6992b324cc0e7d4b082d83c9b6f706ea9f2bd24f'
          '2aaa220420678af0353fb5b21b0f493982456a45'
          '24d5f44eae6e9bf03a53b44beecdc5bfb31d9f01'
          '9acdbb29d591f5c97fbf61ecd65e11bfd525f90c'
          '6b3227e6ed3e55e73f814e831db4df44cdadf565'
          'a24b3d2b196adeb6b206e65e7ac1a28262010fd6'
          '966a0d1fb90830c6e9c8e2e14601aaaa9f4d0dc0'
          'c9068ad95967879d753ad642512b397f90b95bba'
          '259d3f8ee7da9f42baeb03e56d10a76c6029bcad'
          '29dbf00f353edec03d00d804ea1d60e70b5435e6'
          '488fea9823fdad94a1e5f036402d051883270e4d'
          '0029ec994add791f4a428ad05e005efa9108854c'
          'cb7789efc957ce0ac2a9b79e5ee677a901db2928'
          '55c1669ada68fcb58598595c908a8d92c0fd773f'
          'c104beaaad6a66746e8e3f514a1e70b476f88b47'
          'bcdbea13f68167fdc99d9f82b73ad7f289c6482c'
          '7c42de7f46e47a6c8defac535d77b1ca1aa45124'
          '9596ecdb5d43deeed44393a141e5208b514c9016'
          'b4c027274a7a2e05d85c7c2117da7f504023c49e'
          'a93523dc12fd4987fd9ce411de014e89319e4f4a'
          '9ef234e1d0dd20fb9568186b069dfc79acb99091'
          '1754299d9451c92ab7ce2ab37b18798bca2de381'
          '16b4690e57b3eeae0d692222cebd0461327b295f'
          '84c509bac4bbddcdb227ffe84d47f21ae173f2fa'
          '9a9e120941173c82855fbb85294e65ad15c99db6'
          'ca01f857fef72adf99aadfc584df4f779b11b07e'
          '60c6159d0220a662eb29273a6f5cc31e3bfc1783'
          'ac0d311e4589224addbc909177077e696643cb87'
          '0c43455f26bf4ec04a45c19381be8ea08f9235c8'
          'e4e3ef5b73146b483fbe6642def9185e66467e68'
          '1eb24f3f9b8231db5b769d2de7b81e30399da814'
          '4b8970688d46b131935aa132666d29339a89113e'
          '011a463627f066f7695d1bf5e98cbbfe981d839f'
          '9172df8de8eb9962a1e64a712ac48e5882c75e1a'
          'd3c2a78179a300e317f9056d049d205744f60e7c'
          '932e0e4ae3a1c36e4caf2995af6410688ed20e43'
          'c4ababc31ddf0d3181f703c92363c1499bcc3cfc'
          '488d77542e7fe85bb3a0306549253f5b50f6457d'
          '1f18794fd5a594c125bcfa6ba146aedb1e18b244')

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
