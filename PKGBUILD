# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.9.3
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
sha1sums=('5a8250bfc3b00e00f90eea65f8ad7fc661994c59'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '97de5d78ba43b7ce69449fb19fd89e2e8061872a'
          '12cd2a46d19325d0191eb67f4e658be8d8b8a4e8'
          '84edc382705dc0a1dc5db1ed92c6f57718c97b0b'
          '041448c79514e363c09fc89ca929c6cd00f60edc'
          'a3b9fb37ef74525011417c51615ba57dc3a2fb13'
          'ac8bf306347a8353a2aab15eb53b105e4b21ecc9'
          '7ec50badc0e5f7aa7d5335a40e8e4736ecb4e052'
          '9cebcd0e318aaac002108d8fc1cbe40848c29177'
          '9413928c46dbfd1916a0c856b3b80d3b3c0178a6'
          '76dada98254b516967ac4f96409950e4c8fc1d72'
          'ce73acd387273103267bf9cb7e5b59b12fcb2dd3'
          'd27d22bbd087461f3f80b56fcc68517d705ee33e'
          '749f23218260c2eca2d7292b6617f320894b68b9'
          '8c69316d4f4047574ad8a80d362e2caa3a566d66'
          'c469be6a78d39ca99a7174f40ab5b7260d7061c3'
          'da5b48f2585558e14e3d55a03decf26cc6194dc4'
          '1debbaa607417b531c7cccfa1a885c74c3304993'
          '41e2691c5837f668ddbe0bbb0c0cf4b881a62f7a'
          '3e007ef402fa4ae78898de52fd2270e556de0e88'
          'b4dfc098d8e6830a7bf0d79150bebbe1c0fef6b9'
          'ca82760d13b21b1909a5a467762c96847808c53f'
          '9c4e4f0c47bf4764537b04ccd00866deac19df20'
          'f9df9404379c29fe3ce839f76c7e8135e8541313'
          '29486ab6942149fa15947369eff16a2078d69212'
          'f4b738c39ec662b7f7de140a54f8fc7671c9b1f2'
          'ca9b6af74939a5b74944f869606d3912397c6514'
          '2650773d8f3cccb512e2f6fe3d04138ba873f73f'
          '4ea3d29c1360b0c0c8d21ab7f6eb088e16436b64'
          '9c8c3e81789a010d34e52648fd147a54f538c2af'
          '16c884ef7ee6e21fb4baadc0f5b145b9bbb5631a'
          '44543dfa6df1548d0a419b0cd47cc607b1d3b267'
          'ebe086eb95ac5da301ef6d5ea05eb302373b3753'
          '748104c07d6b6b37d1039e3debe49165bbf83f4d'
          '49d46e756e92207853524162e788ce321cea7904'
          '9a6b2f7f3bca9693172990dbebf1533c25478b59'
          '9d938f88e33da82bd4d7d4ce29edbb0b41686b5f'
          '56befbb1941dfc921f66739d8e361dd8bf570ffb'
          'f3cc3e07d021c9ff760c1008aac0a2775720c313'
          'd44f5c6dbaad03e3591325d7417ceda7039302db'
          'fe8724eb84a07f6e2c81de9e1f8a621dc8732c73'
          '674db25fa2e42e5661f87f670481b08ae537e76e'
          '509060c72e5e39403980061c352fb4024ad4571f'
          '7a220ce36394f48068d8b853736c68fa19c9e367'
          'fab740cef239a9c35a88541371e55fb0fd5c1382'
          'a4671b83a892a146ab6daca80cc737fe55922763'
          '228e683836778fa1919fb76d976d4b9b30dbd6bb'
          'd05797974d446e05fcfde8bfd7aa05edec1189a1'
          'f5090241b951d8eed28677c9037c2155db26c07d'
          '57acc27f91becc61a3c9f02200785dd0a8b1b30f'
          'cc4da4e56f83192fb4ee1535297735bfc60af53c'
          'de9e4678acd2e00b72c24e704c75f82dbd949493'
          '5dbaf0099bc4d7c527dc79e428ed62689663e7c4'
          'a14e9231769653d4bdacbccab6c7c38d88e320e7'
          'a72757a120a1dcb9715d9c7ec55463b41c50c5c5'
          '97e88484807ba33f96160d07aaa4536a3b11abe3'
          'a5460a79c00e02ada5ff15f29142295277ec8063'
          '48119332298b1689f2255b05ccb02f01112c1020'
          'a10ccde80c124c1568472855c4a593efd8ab6078'
          'b2f4ec388ae25f7772214403e9ff977a52f3c508'
          '84a10305c9c9c1140be5114a57c6415cf9b8d648'
          'fd16a44a60aa15a0d80ab4d60d24b3c4dad7ac0b'
          '16e6dceb6e83f01093734b8b5d5e486f2e84b9a2'
          '2a9817de4fb47767977f217078a985e240da0283'
          'dbed48674eaadd0808503dcd76a4ca4fcc533afd'
          'f7339d95bcd96f3e164e17eadbc815f71e2a6d36'
          '0ad20839dca3acc2dcc6d987eb002fbbb69f19d7'
          '5cfffbbdceff3dacb9ceb7390b3790d6f803cb66'
          'f532991f3142de53c503676c87ac33f91bae41e6'
          'c3715a6750f0768ac52e62938f55f981dd217496'
          '4b0d05ac0a0b35d498be9ec7761da6e0aeddec0c'
          '24d0974843f42967e448e47462c28f9c5814c202'
          '2529cdfcfff9e161fe72a3c23caff0c1abfc4291'
          '3bde1d53b3bcf6eb7b33d82963115b8452f4a9fb'
          '6e69f66bb5f2847b9020d46692b030b20b180135'
          'e9d5b2673a608f65e013a160b6f35679d51dd6d5'
          '441fd45ca65cb9e7d68c1bd6eddbd0b38385edd1'
          '0ff51fa48de2b75b897a26abfd367a056ae01ee7'
          '251edb4bc3d747e9cfdbf40c08a11070b947d5f1'
          'aadeee2c56c8f4335089cbadf6d139acff098bfd'
          'b9e92f392dd6daac9707f5b42b9d0035b5f51373'
          '527e4fbe68f6c6cb4d3b1b753a50cfcb3b196365'
          '25226db825090cc1610e7f7d3859f6e598fced54'
          '7d753d9ad28a36e8701d8222f820995d86db56a0'
          'e39fa5f4d6bebf64513f40d08d636208ea835d81'
          '5ebb59ab39fa2f95bced7dc42fe77529f7590b9a'
          'c310d8fb715617b05a4b698ae67e697eec83d90f'
          '446f5f50b809471c1051cf5a07cb8025002b8e4b'
          '0d12fb49468b83cbce2e2e92db111336a671e2f0'
          '4dac9743617c19c30e41b35a31b0a199a75f75a4'
          '52cffae38a7ca8c1a6756b563fa486c9900cb251'
          'a2688a60077d22746ec962dbf44216395ace2784'
          '376c3e406485dfc8721122a0b2a1b84771dcd4ec'
          'e27bddba53d083f980ee37523c157d22fdc61c6b'
          'f0a062ea8b044a635dc1781c7ecd0dfc0301c034'
          '4923d7fc3619a254843f82e30148cfeb4a5357a7'
          '01ecb05f347a76d6ae53f293d2dec602183ac736'
          '1bf19e9a6ac586dda80727d44f2a978f40a8f568'
          'a8a85acfc1570f2ede806e8c3b5855127eafac28'
          'bff42f96b33b1932d75b17f7e44bab19f3fefe39'
          '37605b1ee39b76f5ced26afa7493a1b473dfbada'
          '43d514372d4326f36019ccfc23ea48c1ccaeedff'
          '36475e6389537f99a9a3b9d74d6caeb5541a5d09'
          'cd5a9acc07a90e712b3efe1a68656e18b640d563'
          'c62d80e442ba051e489406a93df8b5af3ff4f94b'
          '9c941595fc681769d904d53e48276e01c1c53fe9'
          '657c0fb3ecb1b2be6b18473b0317216af55ac207'
          '723571246487c0210f9a13a0eb94b54f6fb72a2a'
          'def29ab88cc656031decefde2072423a5f3b28fe'
          '2cdba0002fdea0fe476c977e0bc61f867c3949b4'
          '4e0ddcccbe5e0ee34e997efe56be55a44064aca8'
          '745a8c91a93ef4d0f2d3a38e82f2c709f5b716f4'
          '34ef11b2421778fd8fc5a75a2968d19fd54e15f2'
          '53a0c832058d11b0b0e63387ce6181ea2b5e7e0f'
          '973fde6cc7799266edc31de4a27b1fef03190026'
          'a4a211a1b5e3480db74859ca9ef7f64d311586c4'
          'e272a4fc340ee3f5d94a7ed34c4f15a4bc9413e8'
          '7592ed2be89016315ce2e9cee905f093ef31bad4')

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
