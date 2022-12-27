# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.9.2
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
sha1sums=('7706eeafd9ac126d8be27b71a0c6677896f475a4'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '52a6a3e85aaf5ed9b184e1eef36ab5ff789a90fc'
          '4c6259a69c5914ad862061c13d3df2ecc3e0db0f'
          'bb23c425b2edb7e90370658a90d7f871b29a2b3a'
          '253a4908c9c9324e79c69b9a17a3e14964f51abe'
          '9a7255434ab4264aaf9854eb123bdc19cb2077d0'
          '191befcfc6b4a1c169edabab3b9af295d9f80203'
          '83c0157dc42b3576fcb06aaa53bee7b578ad7bd1'
          'f67adb9019a01419813d8188c76b1a8fb2264eaf'
          'df3d093e3423d0d399056d29f5a788bc9dfdfd13'
          'e2e460024fea3127bc16d963c0c85982c0137f9d'
          '15f60868b263ddfd845e7de1122d1b781cef0dbc'
          '1b44646825e3a2a80e3f1b09fd824242e947d6ab'
          '14d42978a09393cd03f9fe7afd1e6ee87f18d852'
          '58819ed99e29c0171573eeefebebe8b027cfc794'
          'e54089a0288c753b4d9ed443ab86145c38f17b6c'
          '9280678f0c2f3536510b233d86f88c3f7e468b3f'
          'd006620fca248e979b5c8ec4509b4c3416703301'
          '0e2cd791d8e2676b1ce4fbf3dfbbc92b9ac5b9b1'
          'f44bff681032761b0bb12ca16d6572c30bf96293'
          '863ee47e58c4c62a5c920e1be37bad5c690d3e02'
          '110a5074605d7c5927ad705d0f95bbf7d814c494'
          '8a46b5309820236b96f9d30b45157ec6b064035a'
          'e14157da44ada7ed3beea4e48f74bc26078ebabc'
          '3c191ab1cc9bcf726b5113112e6c29fa5e1b5f48'
          'f8f14dc8e7e325cde90e550307e2781f07410b75'
          'ec024fe313f3f9eb262553c65603f85e49ca0af3'
          '99e92988b3e21915598012e16344f962fb389be6'
          '39ae6861c9ebdacaebdf0bc6ffa27f115287f8ee'
          '21ad67b4d7b46b9d18f4881c783876c5a3d44f50'
          '18b88b4693cde3f8be2bcb85adf58fc00d6f1329'
          'a7b2b361a06e2acc0e96325afd8ba2dd2de53f04'
          'bb4658b19292d1968157af4c7b4725ad18742a47'
          '1cd128d5ca3a3002735f48035d512b4e967e9d9a'
          '39d7cea2f0843b7fbe7652f91281e8ee74146110'
          '067ba0ba01c47d8341c2ca0e73576e8dcaf14006'
          '879e95d588d987ff0ae40fb57a2bfed5af440973'
          '2457eeee7b63c5924c0dac42bb696a4cb70ea252'
          'a147540c6e876ad9b7bb4ad13090f7bd73b206e0'
          '6514262bbcccdd93db17e6283f79dcc9adb43786'
          'c35b24900b4668cf337043af090aac234cb9cce6'
          '4840d1606599b8676b44c5fe0235183fd5d5097d'
          '59fd7eaae0b9ab1d8143580f8f715424ecea833f'
          '73a0e271e60d06b044afa0877b992e3cd13a3733'
          '8d9ae4c4baf8773635c3d9b2479ccfd588a9aacd'
          '808f4fec6ab8e1cd361754f32f338852d8ddca29'
          'f6f361af99e43fa6f51b7f526645267de441a8c2'
          '914ae57be5418747610f7531a28c7c309c912694'
          '0d6159f333a3aca9d84dd313d269c73e146e49ce'
          'd06dfccad804c774e6bec6026dddd59abe4ba65c'
          'ed1d4cc233df2c6b80159622e0d5be4c21529c1d'
          'f5a54d358ed29b4a08b5f154e6c6b00d1ffef0e0'
          '8339809cd773c492fde7f232156201b45ef67f58'
          '0782b214c0c8f3740533cb0286fa0bb1b8a4ed0a'
          '1baccccd4b3288cc698aa3e1a11060a96cbfdef3'
          '9ec0714a78343241d4926ae49ace94f8bc32c148'
          '721e30265a966460514f1983df0e3cef72c44b8c'
          'c5e487b245deb501dde5106fe78c8064417ec15a'
          '255ef8929943555a0d7d5d4c7c60bf01dca5fee4'
          'acec7386e8efa6ccfc082108a9c530b79eb41b86'
          '3d81305e102adb80c4eed2482e883ef65ea908a7'
          '3ca1f95a29101de4ff76f9034e0f974544cc86e7'
          '245a4b8a6756e0a38d4b357165cf0da8b9a0ca70'
          'bad20479acd1f073723513c21c672dd055fe2988'
          '279fe499915b2b290cba0e8b807dcaf579985194'
          'b213c3ec6feeac7325aa01a6ad46e82835ff918a'
          '9380f632897c513b025fd46aa1505d8df6610a57'
          'f5ae5db4208d12f7e54b77e189d900aed0700709'
          '2c0d2e8124d458bef93dc41971635c2bd4318c78'
          'cd77e0127cb6579562bdbddb5f97d9bf37bbe1ed'
          '60bd749954de69d7c48e1f0a5dd4a8f7a5b2d733'
          'd1315a65d48f5f533239d781404ebb50553a6110'
          '05325d871dc7c990f2fd83f99029ce8e334ba02e'
          '1de020dbe02f763a87897cfdb6c3d7d00d57039a'
          '5e4b120522bd305a8c2ccfa808955c61378fa3ef'
          '7d948b8d1c27a5f556fc6d2b92f612fc9df7f64d'
          '8270d64cd1987688727b4da117cf85214160bfe3'
          '4ee969ff33dca227c2b56c1b128c778740f640bf'
          'a951021c55f7da3af7b1b9ce98663809ee5d2ae9'
          '22974cf442ba2aa1e5db45d6cb65bae83dd26c1d'
          '89045e3bf7da2d66cf656467148febc1e084a31f'
          'abce328fb3d1df633251080b26801be50c3d344b'
          '7894a8863398893cde96a0ff496aad05dd98770c'
          'd0ac244039dca3002feb0a633037013d9325adc7'
          'a6704a9b69eb709fd9c78a092d9bf2b9aef74795'
          '9725698371aa744db175b5c3784ec861ae021579'
          'd5d62b0a9649f4c19b62ff95afb72f9584153161'
          'f5f90e85f5d1a9f87640e026daaf456692b30ab7'
          '5fe6c9d1e1632ae0257710d28bceaf5104689c95'
          'e5c56b2a4345f6d5010e460e198d83ee8b0b926e'
          'a44bac2875694152a8c65b78220e48ac20e9ac01'
          '35b24e209ef0e8d60cc12b4218cb4166e78c03e9'
          'b5d0b38c4aef4eb5884aebe390d36a1a085beafe'
          '93bc79d19ad14430e9fa834cd17559e3db82277e'
          'd1d4580f3244d39ded1c31872941fa7ff0b1e919'
          'a31cfc1fcea21eb3de36a2b05158259d1b51ce2c'
          '9aa809a0388f002b573234513f8dbc17a3467c0d'
          '6f96b9f24a2683e6285bcfd6ea3ba7409ffaeabe'
          'ecc796aebc2ae7f8e89abcc3b1af3317c6337285'
          'a6e66667302199e7d4a299e4caddd617b19407fa'
          'bb1368c15c44ff6d2024d6635a9be89ab398b220'
          '6d3168baf6e65ceba2ac896ce23ce98b3b48eca9'
          '4dc529f00380c24406376615a1083766674f6b82'
          '9e462540e058c13ec900c15029d6f6a3f9c9360e'
          '8a62e9e16813bc8b775b94f6c8538f5c8cf97327'
          '36097a6fc2773635e8621d0b8979772e848b7685'
          '43b6d6ade01baacd1156a9d8fb7a191c1d42560e'
          '23d39e05594b7c1359f730ad10a8778e36920dd8'
          '1564ee3d80df9f5558cb63e6810380cdf490f0cd'
          '26df7a401bbdbb84f1c43a9dfee28f6ef9234941'
          '6d0eba8a44700bbbc4555097fbaee4babe24c942'
          'b328f3325722dbed58d89284276444b8dcd1a364'
          'c7c29c4ec968b37ae5f77709588537d6634cbd88'
          '77e13a61d343a8a2824a34721ee179e81c74e84f'
          '071c7f26e7ff716e00e5c77d488e80c5a6afa89a'
          '69a2e4c092846cf30b2c6258dd8f3727bd758670'
          '9f32691d2319e2b5485c6ae5b877cf7d87301ae3'
          '70fcc831991117e7dbcbb7aab812864fd753da02')

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
