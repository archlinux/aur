# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.13.1
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
sha1sums=('e654a0c3907e1ae8e717d441b0d44d6fa22b7076'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '9ed4c762ec157788105e553732b8ff5abdad83e5'
          'b8b4a9e38a6a51891d3e6d0545d344456000ecd6'
          'b9ec9c7ea3c300d4d08ca74ff023be9628941a04'
          '0d89bfd069d913f27f10a281e4164efb828f6c4c'
          'f1414af13b81e914cd79a0b8615d0d64238c1c3d'
          'a5ffb66aec9c888685f17ed2f7193da613651e1a'
          'ff192be30182d1780d83b32ef62553205e6052b3'
          'c1a751b66340322c5a153bdc88db4ecda23d5b93'
          '1293effb28070fa8b9d96b301abd0f87ce86bd12'
          '9ea56ca2903e7e7457bad306169a2ca828e6e580'
          '576cdae0d36d7844c6455ad4aa6ee99a2feb1d0c'
          'dd62071e49ceecbd04c13afe54ebf3aff7bf7caf'
          'db07db08610e56e56001925ab8a856fa013539f6'
          '37595be92a4ccfe5fee8f0dbc272b305b48fe782'
          'b07af24c86c52d3e6774746ad153e66531fe077a'
          'bedc666875e2ba0447cec120919b92e0120c72b3'
          '77891be4ccbaabcaef14df78dfa9c429ac69fd69'
          'cfd88b34ca6d6be96e9dfde33b40c5704dc76624'
          '600018576a0a19624a85377daeaf9533bf9140b2'
          '707224366eeb9e3b2191c2b651e17bc971a2d706'
          '87bdbdfcffe2232a5a106963710cc0f85a62bad2'
          '69faf153c960be83329417e3b3c3c8d8c1c68feb'
          'b732e91da92e9446e0c399ff2bcfce1e96cd0ca0'
          '95f01825c5bf3613ebdd159f9a51dc5c9bb99b33'
          'cc83824f246d3fe94a615f366e28e7b90979cf5e'
          '553368dcc4bc39eee1359986d9f25bd82c44945b'
          '52a64b3b852c14407e67ca41db08d0367addeb4c'
          '23ebf1bd96aca5cd59be4ae71f993a300e70a46d'
          '749ee5e3ac45c2e8de33ea379aee9d7c67d6bf0b'
          'e256052298ee54be222b7f69e98186722aa4cfd6'
          '2a6aa6d123318e2d6cabb2d8b1c8ce31f0b52734'
          '11de743f26a2410fa8c7af159b7cd9cc085b6419'
          '2231c3de1094c52c5b6c54f6b970b0bfb03c2a59'
          '6e33e4abea22828e1a34c6dab4095c31b87bfefc'
          '4fb8194feede502290efd94bd682510b1f7922db'
          '995aba655feba775fdd37b0e5eb18090239bd389'
          '462ee5514ff41db0b04441fe2443626d1301097e'
          'bf85a78152ac82f2da25fccfd2d2068211118d8f'
          '71ed40be53bc1a9d13c6a9cc5e9cf00d03cce1c9'
          'e8a7542eaf06306573e9a84673a37671ab9b36c0'
          '65d919c7ee5b7fe3c432d9cb8dffd711ab0baf2d'
          '68db4da0b0365da6f673ff102425218e3dbd399c'
          '7de2a8e89c6470794ae88b3f3b1175fa371220f2'
          'b3808d434ca0054f62ee93a0b09f4093b45aaf22'
          'f871619569181879ba6ed0329c898660fb72de86'
          '14670de31134e34602d434a0a3256b69953936e7'
          '51dcf36e5eac6ba2db36e64f38518f7d96ada491'
          'e5d85b47ab1c4224385ce631b2cd1aa4dcfc6470'
          'f392524851fb67d238507b50c8cc7807d0ce7826'
          '4d95e9d82d7115af14baa4674731de1fc4d31d1c'
          '40e2fc80455d2746e974b35a63e3b803fb452123'
          'ce108ced6f2c14b5939651f1bff74f3d47fa4a26'
          'b50fef144d5320beb63ca5d9fd9ae27a834a6f5b'
          'd8b2e106c97ac49415fa5e12ac8054d1cff61ba0'
          'c1d605b390a92b1493efafe1133d6af8f6f462fa'
          'c6400cf49ed1879fc002449de3b48fbbd6cd64db'
          '6191e1e46f02827148a7eac2d9b30a239c1c69d6'
          '1a4063b9d38480404e033bf1c09f6874490cc3da'
          '91457cae618dd233850b186ea417e3e48bbeb260'
          '6938ce8172a6f21cb812a9eefbade04120d767e6'
          '2a337f9a7d22323d649e2e60b5ba6c16d3a4bdc6'
          '7183731480ec94a346d6eae57ccbba0694b0ef12'
          'd79ab2fef6e514b30cfc21d1541ca70a6a51f2a4'
          'cc70e9227eb5377dd4ec0ff5d1d36f62f2805975'
          '1ca60b47d368402214442e47e50ad9d21a7c2d99'
          'b00547907a67b457665fcbba2a9aee21628733ae'
          'ddbfeb3a675e4b6c249c8ef793763041026fef9e'
          'ae0dc4b6b05710281691cb440e961dfdc4e23efc'
          'c9f1aaeba54a7b40315d003cd1f7a23f3ae30a72'
          '618e932dac9dd0c52dae679d17d33c6c84ea614c'
          '5ee07564f058c2fb8a274d4bde02121a1e170267'
          'f6f4cb46c8380cb50073ed1964f716984d83c07f'
          '837a22deacfac996eade86db955d8253a643eca0'
          'f8c115f09a49418ae00cd705f9de787e9f5106b7'
          '61b2cc57d3b92df1ae86ec37381d4289868abeb4'
          '6ad7a8a3e741cc8e30500981c10f402092388732'
          '1e946b4b8c2ecb6741c7cd333ff25efc22d10e09'
          '6a3957caa727b4d0f7a8113016f58be093419cf2'
          '364f90bb1e8755478903a0f7d3035c7b70e7cc37'
          '45de2ec24486a60162d60f0c2cbfa238034c49f2'
          '933e39540e7382e82a1a3c5c964775dcadc3b72e'
          '2298c01d283a87defae582be50d5db387339cc25'
          '8e4c09fafb907e7bdf597c673ad0c929724116c1'
          'e30d49b6adcf3fb310305e9578b46397fe0813b3'
          '13f25f31734b4ba0aea656207f702f3afbff5512'
          '3fab34af35902332dcfb25e0271ad337cf8cf4ca'
          '572e4e3cad14289739ae9d860c6a9c801130aa11'
          '94799e403e57ebbb99362c9c47a74b4e82f31d7e'
          'e7f9c814123695c025467576f7e5742c9bfb2bab'
          'ec741f599eb0a97dc5b6ae86b82095d1b445f706'
          'de2db7a1b9e7ebe4501252269617c63e354a4884'
          '4cfd09b446a30576e047b46a07a42240d11513e2'
          'f2fb50c90baabd0d08ebcce241075ca767b8aebc'
          '757a5d078b0bd22e9c151a10a329290ca64635d0'
          '04ba23f16ca692901524bff6d4ba700e174ff9e3'
          'c698f0492d835a1be260bde6ec8688abc333ad68'
          'eeaff8686ad3d7375d27289ecd8ffa4bcf765bd3'
          'a9f3e5f3bed7f31e85d7d4fcecf82c7043c08cd3'
          'e1bead0d08ed26a7cb83e7276777440ac63889b8'
          '55f4c24097d167cc619353e25094c4ff3743fa63'
          'abe03216b6bb596a6d30c260b41f1c7a87345a0f'
          'b919c01ff17336061ab00a48e9b74b6063087300'
          '617ab7500c434a9e5966c86b2d647b32897ffb3d'
          '944c7571edfc9e1b30c83160da781a3f3b32af7d'
          'ae6f0d6b2576f18cf56baf5716d2ac3a106c31a6'
          '099e3617b11cd8a70d48eef727aa2b11e43c693a'
          '4b7ba7569c48c9da22588e92e6632595aa56143f'
          'fb77e477e73be0347b1a2d81bcc58bc146a1a697'
          '45367429430d2e474081435c7159af8cbe75aa5b'
          'e3f21b54cf506b9bd8209218ed244a0e3e9d5ddb'
          '58f244a7825d472ab565847701d782fb7eac6513'
          '2e058068cced9866c95d279a0fc24255325caa41'
          '6e17c37e442c76dcb0540b99fb28a3dba0df9aca'
          'a4ce399fb013e03428b812276e4f9b2e2b53b909'
          '6d55f46399a1aafe983a930d5155033b10648a2c'
          '5910f0fecb87ac48ecd69e5c00be7b5e338a1095'
          '79494cdbdac0f1eff2439acfcea6dc777db904bf')

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
