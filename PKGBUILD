# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.14.3
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
sha1sums=('ae7a391d2b9675fd1a2f7e3fdff4638fa590bddc'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '2a834e93e414482a52981eec28200d3e4f441158'
          '1a06c3325068be922b018a1c4c9609474990639e'
          'df26d61146de24477810f292b681ce0d50628ca6'
          '12a58e5be0c9b3707825eb83de0bc0fcc3a132cc'
          '754446cdf0822e6336d3141b338528b41546ea07'
          '9c3501d77bf9536117bd7926a548fe44b675c3cf'
          '1fa310f4762fee9e1fa3a1120a37367a6141020a'
          '8e20228c732677cde73445af0978dde8268f9b4e'
          '4633ee1a4c0d886d03fa96e9fd5c657411680c58'
          '233cd5cc844f0e6def5c390531368b46fb839f55'
          'b00404c73c29376de32f638791cb5fba570735b1'
          'f383300efb2e334c5c6643f63862c8fe9659ba93'
          'f7fa3725949ccb2b98af88094bd360644ee9d557'
          '6427f8655b3a937bd80dc869a553b0858a11172d'
          '0f88fc959e9c85a8b7064a3e6ad77dbe0f3312de'
          '19d0fef32f1fc7abd847013292b90ed4b9b32c61'
          'c1770adbfc38d8e80b87fe2a85dc47a1810488a3'
          '4919668f1f5d0d8b54615f8e569c02fea12ec0f0'
          '5bd7f3c253f98a7aaae3643a2c9ed1a82eab4e08'
          '96e31ca218e5ce19094c0b346ef88c1855197d29'
          'f43768d9a8bf75fe88999a57d705ca180b5e6d97'
          '57bdd1e23d3e667ead3a189fd40d720412b590a0'
          '00127793f6fe7237c07e8caa69fcdc36172ee0aa'
          '027b3a6cc104132a40665b933d594cdd7488cbd4'
          'fca7fbc94f251cdc956982bc95d1e6320e33b4d6'
          '8fdc30bd9a975167e6728520f19ae9a77401a3a4'
          'fde5f231153d48a80c0a237b5c98ede4660d26ae'
          '26f7fd8c34470608e21aea5449df6b6a0550c454'
          '09f8e45b4fcdbfa435f52aaca54ecd3528c23d10'
          '2361b29118294718bc4ab7e2dd72110562985784'
          '7f6073e4c614bb0edc32737aa5478dfa93359b6d'
          'ba2b5c64854c807a5995ad2cc26045ccdcb80821'
          'd0cef51a7dedc44c7881c8e909fddbdd84065824'
          '86855dcedb3f9c47ab23ddc32edf6505cfb360a9'
          'fc55737958605ca6e2ad7149428a7e1547e63791'
          '5d40b6dbdee8297cda7ec97987ab6f44a26b55f9'
          '8219e36c4863f81e77c5974307af7dda28ef126d'
          '3ac4f767a018dfbce1035f3243ae17cda16d2cf1'
          '16bd3e2cddcee09a468188f456340bc83f974537'
          '0a5365395ad1c070bd7b51fc3af17005921ee759'
          'd682848d4602c79b4e8d6fe10df075f9cb9cda07'
          '2084557141278dfe508436d95d6c1758883b0c56'
          'b9574283ba8a9ff8e76623c1fa95a9e3cd388753'
          'c5a3943ebc408c39c1705c52f4f69691327cf324'
          '09c4ebbdfb5a3488a7a090ed22b9b2d56dd24758'
          'a8951e62028489f5a9d9351db7b831961a7d63c0'
          '2422c80e341988b06f2de9e0bd93f52b479241cc'
          'd58bcc416c840b9d55774082a706d8895b1f77bd'
          '898ae1e25366c432af5ab3ac91771729177e8590'
          '0e9b64716c16aeabed05f29558d185a8bdd1b838'
          'dcc021a3cac78ece1119a64c6cbf015e9222cb5d'
          '23c609ba71f59ea2def6b051dedfe9370dace47f'
          '07a69bf9d085ba2fcf06bae025e670790479db15'
          '271353fc062087f4a73dfc72872c9dc90d3baa19'
          'd2504b0767a9eefa4925873f027c6c987b6fcc71'
          'ea1724f6ffe9220a9293e847432408b1844cb2d7'
          'dc2d2f60bfb91c3aa6d1594be0fe3e8a1708fcd4'
          '522ac8d4d090a4796c1459cab720a002d634b03c'
          '48eae9e7ff6ddb6c3514089a8971a2ed4e36c263'
          'fd8cf617c609ed902b21009cea90ea38844f46f0'
          'ad73621a2ad160db5f4bcc545ae808d6f92ce076'
          'eeba9123aeda78b0e4324fe39fa5769a4a12097d'
          'eeb03423b89d04a42cb1f5939025819c62b47cb1'
          '9aebcfcf5bb1caa6c54f8d3c33bbcede8e7fe341'
          '9741c5f544f9318b88b4caa30a5c30647a49c518'
          'a16390157dd4dc919febbdd8d0e671fa8ac11b50'
          '57c7bc4bd7a1c3a414b666ca8397ee18d58b9a14'
          'deefb7f52a677b2be47ac45c93b78f3fd0fc6436'
          '85d1e3d5f84aaf81ce291415bd5e0c408b433ea3'
          '32d129f554bc0f36cf6be4e8ebc235e2c87cb6d1'
          '93487b9992a480fcd16d6b5c91f8b0d071348e3a'
          'ebae48d2942f5559511be8a893a07b4a11c1b088'
          'c076a6a7956c9101a79c50cbb4183ff0fb576342'
          '635779cb34efeb1258b7e9ac8c9bdb76486c1198'
          '7fc0309d97eb857f594a04a83552155d0d541e57'
          'bb20b0daf2a6da3f8558cf68b684e747c4177506'
          'bee18774abded534e6a911ec09f71a5f98973351'
          '9defcfd968ea04764c1b554cbd272fdd0e270d8d'
          'dd6837bfc58648093e1047682535dc6cccfa9b46'
          'd3b578d9f969cb230b311de49ae9f1b15e5df87b'
          'ff62c3ae1cb2aa4c1117d9a7039c294040932fed'
          '34bac4e74462a387ca7e25ca521c256a20f78dc1'
          '80409ca2a87b6a01d80193c190f87a4dd0208cba'
          '9ee0cba7cd44c355ccc8be39aa367846ad3edeaa'
          '00eed55ae66f4dfb75f5477f96a7f7d1752ca5c8'
          'e7e5a5734c15fe7aa84c37f7f7668a55c444bb44'
          'fb4e1c23eec0330e254d28c05e51c05962cb2bee'
          '1dfe21a600aaceb0e83e9b80a6af82775f1306f3'
          'eade07b838d15fbf206e790ed6bbabfc3a362583'
          'a40f5ffc3459a7bf5e7a51958ddef3332b7302cb'
          '4a3f05d5c71ee61ac645b40ffc78746e576c2eee'
          '2802aed7f50c7b5f16f8205c9a632e6ce264e731'
          '1eb2f9ef268f0cda15abd7dbcef629365013d78b'
          'd2e544a0d35ce7a93bcb134f2f9bf637cfa8c22a'
          '6c98b736936b6cd67340c071e476f56edb3aaa36'
          '33a59761056fcc22e7890ff9128914300743eda2'
          '2a29015a55feef61e8ca5127d251e74125079e64'
          '50e25be912c7b6e418e6a0f2a38121d2d7ab6057'
          '34f00309e1090d12bc40b8b22b0cec571f2c4888'
          '081e6a64a933d2bfd8451e86f4431f576b1952e9'
          'f7453becd17eaab32c6c81e79a6bc1b6ed9d4263'
          '587332fc5a10bf0bfb08d517f9bf193044f1bd62'
          'e03ae0fc001164fed22a7328b4063fca2696663a'
          'fc8623a510780187c03a24c3b71205d7f9bd7bc3'
          '7f3d55a8620e669ec49adef6d733099f13e519c6'
          '4b08bd82c11545ca3a38972c95a16692321dcce0'
          'e51c83f794ce86f3cfc4025358b9173c4f2ffcc4'
          '8047bfa50a3a09910ba7e2055e1fb88f6829e28f'
          'c32be6471957a8c2c0efa454a2ed147029af3f02'
          '2c8b94c28336bd95b9378b4abf980c6532c4c4d1'
          '697976a0acaacd65e6e238764ecc75f3496d94e5'
          'd451577ea25e801d452d5f09fa215a96d6200396'
          '61ffa35cf71c4203da621e5100389e8dc5ed5e8c'
          'fdd15ce67d8279340bcd91d83387adae827455c7'
          '591ad04ad14d89ac642e3580aacc5eaac363b994'
          'e15d35016b45e11ee7f770ceec2f35918a0a1656'
          'f5f5f7f2ef3e6a7ed0898be8df95bde6a11a79d8')

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
