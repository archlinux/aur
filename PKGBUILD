# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.12.4
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
sha1sums=('0894f01f806998572f8d5db68587bb38fd41dce0'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'cc71b4c649c349f31351c24cab25102c19aa9aa2'
          '6959c0aaceab082ac6468a22d9b84a8e84cfd6b5'
          '79da0f7bf4bfe7de1e8db71ff63a2f3f826d2e0f'
          'f8a43eecf486938cc88875b871f46b38996d3b38'
          'bfdf0ce51e4a9c622cb85a0d279d50beb86c5700'
          '03dd6e0d22fb699a7d634406b26725f70f372bd0'
          '21ffd25106d4c25f8ca0d7a470ef55e094dc6828'
          '9d7669f49ac0df5c2075c73f035eabc9e69d8a4b'
          '8f96ae4e0b6f18d4e9f7037c52e6fc0e7ef91d7b'
          '5bef10788ebe58d8a5f744b07b2d5ddadf5f3f4a'
          '7da33c10cb1a2dfbc04896d095444c27ec7051ba'
          'b4cd16106f5f139ee7216430d82c8bc8f6e8b50d'
          '22feef2a366b0403958a20755d50e2dc717ac635'
          'ab3fc37699ed91bb6e30028b72f9e97cf355da59'
          'e54778d03305df366a76c4052a12906f3e9b3eaa'
          '6847d81e3ce0693a040a0a17ff9ba3d11762174b'
          '3c289c292014f41f232c5c9cf7bde653b3e06cc7'
          '6077a8465de51e06ae639974acdfb70738bbdc74'
          'c7e2709eb1ad73217a99bf8b05da42d559f6f9ff'
          '9dcedfd36f0740c5bd89068aefe2f5e83fcc34ed'
          '9a068885f730a649460d553a14aabcbcbf0f6f9b'
          'af4f733514803c45440eea0952c6fec53ac2cdee'
          'c6a57e619b34fa245b0e606a13c153b62b1cef30'
          '03075daaabaed01d2f40f254e446ab708b66c945'
          '5ae0c205c82f933817e016eaaca0f7f79604ab36'
          '5ab1bc6c5170a18ce82501801d77533a8ab59c25'
          'c1c4abc550aa391156acc10fb2964713201105ae'
          '5f66c31ab91f493d737dc7f7da4c6bf001397769'
          '14fada885cf6df19bf46ba4fb20cfaa17f5b4bf2'
          'de613693a03b556065649c33beb26343a2e57a6b'
          '8bfd8d28b0ddcf3ab9943cf0d9ca0039ff463c30'
          '46f61ae45c3a6c1a4aed6aaff119b6a03b36947d'
          '2986e53a2b0f305e13a6dd5302a2487c4dea7f9b'
          '9e146bb4cf0e7cd62a254f141a6d3de8eee7f920'
          'af9b2d30e19c919e17f702636698de18afe14cb2'
          '32a32df2144cab3ed342ed1da6b0c9f37b757877'
          '33e3fe42ad81ead7704332632be091fc681be2a6'
          '94968e5440b240f7a3fe92627b91c5d719c1282b'
          '4a5fa23cc51eb2b7e4ec9cb1e2f0c13829f4581c'
          'b6e8304e9b75215b1492df35627744f17317275a'
          '0eb8a3672255f4326d90936682daf7922b831a2e'
          '9195d03ec9dd02bfc1ebb236d4f3d2dc3e387673'
          '5322fc4b99d2b03cef56b4e61dfe6e6665897d37'
          'da52e0bbd8e62f8e2c44a7d8a183b016d68c15ec'
          '5b2cba5fcac1e6884249f7326a7a974bb99395fe'
          '9a6fa6cb44566015e98903cc9f2e27d4945e3f07'
          '85d57c5fd8cbaa8c9acf069e2fa44e7bb347aa2f'
          '0361eb1e149dae5c4dec809c881c27788432931a'
          '9edd4ae058e60da857fd4d8cc72599eb7ffa900e'
          'b251f6f325ea87baa5392ee3cb8c53596c748265'
          'fd160915c819591732ff37bc2064f06fc89f6c70'
          'ef6a7f7e098b63335424c9968c11b829dbeeb8a1'
          '010e921512cb47735f085471e31b02da5051b5b9'
          'a893cd9898fe478a7e345d3aafcaa813b4f9232d'
          'be1d598ea711c28f3d9c64bff9d1c3d8f691e4a8'
          '961b85bf9a27106e9fba6cb50f52af7fc74e0df2'
          '7001e19f96ede79cdb542d3005e35fec469d91f7'
          '30e9ea873c56dbe89c6c19cbbf0f20d9f6e40ec1'
          '59272d837a49d1e30b008852a73a713631d966a8'
          'f4d0525a17e8ed17ba4a815f7d0de18c7e40141c'
          '7e20611b03e451a6e9b39125047eb16e899e60bc'
          'cde7d7bb84eef8ac487f88af7cf4ed12a35e386d'
          'c67831547df2b3e47674352d8bd8b9c7f6ff4563'
          'eceaa2b1e15f6d7bbb24700a4b89e960c4f9b919'
          '496b6939e99c7a076c47301ca95f536467b28914'
          'c18eb2bbafcc60c42dde6846ad0e9e0816e7e85b'
          '6adad2cc121b682741ae6594a5b78f543dfce87e'
          'f026b7c6787de71833d655c0b3354354a5d429a0'
          'ef03cc336ed6c0ea6a3a0797ec3fe86eae420bce'
          'a17f454c0d5b1dfea400eed0d04cc8df3e100a2f'
          '40924232e728b7f167aa07a7e04a7d9de4383344'
          'bfb4337a71590d3b8acc2815db4729057d9e35e1'
          '46cc4d7da98e0020d606121d2bd33b8b1122921e'
          '1454439b23ae0297b83439ff6ea2cd894de70515'
          '2a68ff4feb7b82427e12dc197c0d965b908c2e6c'
          'da784fde2ab11a04009b4ee141bfd6cbc54f0d61'
          '57bf65d442d8dda2d0a061393a6fba739fed6ef2'
          'bd91edcdb04c6dc0690e7f5d08f439ff56e53fe3'
          '7055173d303ff7b5e762eaf37ec2935e6be7bbf5'
          '15675a29b3debdecff630e741daf46b9db6ee291'
          'ee05fee5f99cbfa76cb5c6ef504ffd9c0b8810ba'
          '82c5fc8e4d6bb6ec5c2f446f30b9b17db019f19d'
          '1584b5dfc4745ca58b74745c285d8234582a008e'
          'df4b53a12174da318ec547391453ccd159693e72'
          '50306759cd77ba1b1ae0734216e6133d65c9ac8b'
          'd0074f72eec242266914f8d188cbc3e6c06df8b0'
          'ffdd3f89b1cbeeb3beaff98e0e97a5d5b20bd9bb'
          'e9736806312ed0815bc60830911605d02afc67af'
          '9cdd3a993b5fda4d431a5ce3ea62745d1e5b374f'
          '9a8429ec611828948a9659c3699c0880f83f889b'
          '36de0342cfb77cde406450725e670a49b7d31380'
          '2e84821db8533bd7280355c326c9a396053b9bfe'
          'b2a1eb3e43cedcd5748fbf68b8f2ca9b200ae94f'
          '0264b7e2d9fa8515f8f713632c1e63c0145819c4'
          '1705183567ed196b75a2136b92eb8dc31b743c42'
          '299eea93a367c9906591ac750a68076ddafde180'
          'a3921bbfe7c00994f37a9f7f13dfe2119cfd24a2'
          '287bd4a5796b83e91d5fb92c2279c48ad716580a'
          '10385baec6698f17ced1b2d7d493ff0a989bfec7'
          'f1bee1c99918f781082326f5d33c756ed7ab2be4'
          '869e3681ad49a37dd74a80fe4bc4545be1ec9117'
          '30819a82eb13a44f60b1ff23ad3e52d29999a059'
          'a13a976752c7332d3e872336be23d90dcab49893'
          'f9f5db029437bedbe1ca2e43da58a1fa38cf503b'
          'a3d2e3247fee5fea7864777c4666e096e5aba6a3'
          'd52de7a6aab2d723bb0b54b37e69333d79dfdf56'
          '0ef623f7ee7399c292a14286ee217b26206dcbd4'
          '4ba149f99e2dedff6d11983b22f7bd14baca1965'
          'e4d609e80829adb902cef53dc43e777b4fbe98bd'
          'cd73da1e2ba3504fa446b8049d821557511f9eb9'
          'b167f4674a2a90fe577f351735476cb7c9954785'
          '99180d0dd075cc678cbee9ad7f663bdf42143636'
          '7a51570365d81ac6d4ae173ae29c9c8b37396a8f'
          '6fd2db276783927bb4a4e2354618662bf0ff2c8f'
          'de80e89600de87daf2cb22a8caa12eb3aa4bc9c0'
          'b1cfc96309da2a4c03b898030bd7ba5d2de18ad6'
          '2600636ce9aa0450b5ffd1677a2fda6bbf79b99a')

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
