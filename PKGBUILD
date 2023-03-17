# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.11.1
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
sha1sums=('a959cdc8e003e882ec45e909b5e40b1607f181a5'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'cc71b4c649c349f31351c24cab25102c19aa9aa2'
          '725ba4f296e9d1a78ee70a2e23f67cab085c1662'
          'dcc55830ecff9517a23acbb46670bd463511198e'
          '9bd20a875adb8e55c9a545a000233a7fcaa48bd5'
          '3d9e1788ace0de32910cebc4a354f99865d20471'
          '3a4d2d3ac2ad3e8587e5dde21857cd41e42cacf0'
          '906f293e5c5deeb1a7469419e5ac8c212ff91464'
          'c2403c6c5befd5a28e3e48685136279bc02a51f3'
          'c928889adc7871ff2532bb4e2fb84589c7293573'
          'f106906eebb3be86cab834c59fb108848d19cc57'
          'd878e342c5eb234071965152fe4a7c41ccec355a'
          '837f4c9101509d394d4dac664853e3e76f7c3fdd'
          'a9ed783a007d64de8193adc720762773d6004243'
          'e5e2b8042b7f12bef6abdf9fe8ee35af45ff0dc2'
          'e60ea5614db8b10574b9f850598d43ee065759aa'
          'd2a458026ad6d6414b1a31df8d9f25a515d30d5f'
          'b99b9c460fc3286d39f6bcb3551a13a4af6c1298'
          '876c908d28fecf59db9e1a5466beabd9f1ea60f8'
          '026596e26ee61e71b6f9375060b9e0333ca06846'
          '00ffe95ce111e12596580104283264db4eb5e367'
          'f2567c148c705669ff09fbbad115718df4438fc9'
          '35f2a8501d2090ed0b77ab944045970655d6ea61'
          'bb6418d807776288f1999b1c2baab7b3074c0531'
          '9cb9c587ff3ce26bd167b0d7fba0261958da950a'
          '95ff37f02d059150d3dd97abc2fb99558b9df9b0'
          '885cdb5ef4049b69564366bc8c3cf27f1bf90091'
          'c4618b28a268d85051c48e05e3d6cedc34c999c8'
          '55a66676dc95d4d30f939e6607d7b9f1ec329601'
          '06ae7404a45ced6f3194ef167e9d1646d029c00d'
          '17d0eb57b0ef895a45c30c5756b995b801f86659'
          '0486f45e12a22db8dfe3e3cec1a2012307430464'
          '5545bb09600a01b7e30ad57974f2793083a555bd'
          'f0b0e1456e14c397de2872d1e6687e94c1651731'
          '0a536959e896659f79a7bf96140cbcfa2c4414cf'
          '40a7582e62624362eb28ca35344b1708f9512842'
          '7b6f762c3efbb178074f4b95214da47d0bf88ed1'
          'a7b659c80701b3c43cff5689938219b3e407327e'
          '66711b0769807f262ba760c84b882729297c3265'
          '6cd5779dc8c742d0470810842dc2e2d099f9e12e'
          '23076666bc659bccb37d4eeb16c206a21b6ee8d2'
          'c3621dc501db2eaa7b04716631f1055cccb7e470'
          'f324bd1803b708b2fc110f37886ad76a93b1b4cb'
          'db2df19ec495fae8d8c6f32f5a52e1e2fef817c9'
          '11ffc6ac21da6af32e330dbe055f9d3b8fc2e348'
          '785224fab953708f9eb2908821817e2d5b9ddbde'
          '99da9d5b2afee3ccae9f6d6de711dab3893ae349'
          '12c42b10700f76d5e10002c190bad7bc439e868f'
          '20481b8b4051e4b6eed0089b1ac2b02eb107732d'
          '7228913656a9495e5c59e40020c88074b6358147'
          '263917c2192632d92a3ff081e27f19521cff69b1'
          '2ae542cee67694e7f2601c067f17f1e2b5d60d9a'
          '4705e91b994d1d8d59bedae8472ccb744fb2928b'
          'ee841d8b45b95b3505d7aebcd2f20ad57adce62e'
          'c6c77e4744732ed78326dc5ab4fda5b25cef96d3'
          '930959fba26e53ece5adbf6491c33803c80239e8'
          '2c8f395711679804a5763815e4c16f55290d647e'
          '1ea39ad13fb3011792e331561c91f3d414099477'
          'c0baaf2f89d0fb56f7111722fe07764ee9edc0f6'
          'dbf53b4d342de4dbfdc8d93dcb59672879512766'
          '3ed0ccfce6791a117b055da06ce67729c3a931da'
          '6a818940656286bb555632045e37401ae7cea739'
          '3d290a5a2a1d667d367f77a47951a7a75dd62710'
          '597efd176c13199f94400c90dc0509c795035b84'
          '96290f819fdba643ab7e9f79a1f6ee6f8e8b4c0f'
          '50a5abcc0380def661550ec36eddecaf142927c5'
          '26881cdd3d3cbf2a556e96fc7bdb3f3d30d9ab6f'
          '0ddd2187f2eea4f87eebfcf707a2688f71f3cd28'
          '5e2bf10fcf6375a67a4ebb8204b1706a12835904'
          'd965df0c0995430d304f9c27577501f29be9f6ab'
          '05d3be49bf87fa1f398e9a090bd3eed7a65c1dfb'
          '0d41b2cb00139edeaccf11cf05a42f56f72a0847'
          'bbe51ee6a1d4df2b15ca52ccf762770af82302f2'
          '35d2592cbdd46fc86e9fd7b0e92c4636c4ee9082'
          '69690f97b7b12de1655c3d65b5b9dff6a42011a7'
          '0d9629d66fd691b5625ec6efae5a8bdf84c80c72'
          '7cb61e838f438d66bf6e6ac94c34d8913bc88d55'
          '7b55a50a0b380a91ff93fbe482a9bfe37413cea2'
          '7fffd97b5bb5e204bfee5dc0af0b58e327fa460e'
          '5c8905ca0fb95b4a8b9c6ea8ce407bac2e76d9ea'
          '516ac26d6d1295affcf85f43fa54554774c35167'
          '77ba03f50c259af529d5ac53447353e3e2bed496'
          'addfcf445d4a639de8cea925842e6ebcfcf59c16'
          '75616a5777d518de490648dac8bf64818d385677'
          '567b5f2cbbf3a865fc1d32b40fc0bd8e182cfdb0'
          '7a48d9b1922a76b76f90849829c233e2ea98be93'
          'b260aacf3f8c75530c51d04552bfac859cfacc54'
          '6ce471472cdf631b8d5eee284ce46e69a20bb988'
          '470afd4ee62980acd03201fcdd558738268c4364'
          '58aac880dac1cecc161c28ccba23505607487b2a'
          '26b3c1a80fcb02bab66cdbebc660affc14432d31'
          'ffea2c7d71aab195a38d7f3acd947e482250d917'
          'a63d55407259b8c96ce044c0f9617b7d1c3c5301'
          '020ca6d65def859e895c4d015e74c954468a83c4'
          'e9011df8e36314e8b1f47f1001d86e70b702455f'
          'e2054dd35b6999e6ba5deb31cb7a21fa556624ed'
          '7b07ed8b9b7db8c5f26cb08c6d3709d43338a723'
          'e7837ee3ca37fbd18c162a37b8117c726a505cfc'
          '64b18d23098d79c7356633a528b455b3d5567076'
          '7bc2e54e48f5c77a265c383f3ca66b0e0faa3cac'
          'da985ef60fc3a05eb2040bac2e5667ac4aa18584'
          '395e48c1e5f0006ef1c92dd4ef2842b0f26e5898'
          '764d538c17ea55571290f0c2e493dd612071273c'
          '2e5ce0f2d40ad7449b93def294e8c4f905fd8bb2'
          '3510cdd1257ec81346a49a7139222ea6616e969d'
          '4a6e8d3b912db7a927a481191cbdeb2f05401441'
          'f655b3f85ffde5bebc5476fdf570981eabb45f59'
          'd92eee95046cca00e5086910d292f3ce4427b4ea'
          '31c49afabb26c924283e0fa0ab58ac2bb037ce47'
          'dc06394a062ae71ba84ebb56db26898152e6d690'
          '7497b8534ab8d624306ee16af2e155258ba8d88b'
          '05310d201a7327051af684e19324ccc53e57a8cd'
          '903c8c10482696188cd6316c75854ded0fb590b6'
          'a8449d9637b405f5a921c4170c53ed7b10557c21'
          'cca7a05a1a0a4dabdbffefcc61ceb77193c447d6'
          'c5bfc8f8d20ccf70503a8d9eedc8e4e75bedd7d3'
          '6895dbc6b0a630171029957f0f101276efb1567a'
          '5cd4af246643dec773dd3c3a3d730595795f90a1')

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
