# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.15.2
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
sha1sums=('c9c3573290fcee6fe24d2630c087dac6116113a7'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'b80f79c529fdb926677640aae14a84aed686fd40'
          '97fa5e0da4da2dd4d8d76e73401eea9d2d4be6f6'
          'bb2358b77acf080d29af26548624f795a4e6370c'
          '93f50eaf5e4e2b7ed410be8fb27cc57bee6443e0'
          '3a2e597c52b524119c9cc1be0fb8f002fa670fa6'
          '929afd276f51931889c4c0a17d185fc2a86b7f2c'
          '46a7f5e1ce0da4aae18cda0c91ffec9a0adc302a'
          'e3dcd93cbe93b8f0fd9b09f4259d190a8c3761a5'
          '733cb8706b07f69a1c9a48a7fc1bf03150af9efa'
          '56e6ec777d3070621e7ed5f52882ddc935d2c16c'
          'd598781aca05d194f21ea31276c6f1be72cbf408'
          '170bdaaa143d286e30ca73dd19af3d672b0353d9'
          'e8f582183d71aaa69e1b0a922eec8edc178f6f1d'
          '2625473abe9f9c63b5da1cb1e33e9276b796f3c2'
          '996654a5b072cb0f79bc2fab03155c3e4690e0a9'
          'f6330695802983fef4c366a8576c66595bcc397a'
          '2a50d1a3e3bc209a521908dd3f0b0dfef5063e89'
          '4378bad6ee5f5f746b0da79fb12e39c75e328a85'
          '9684367652f29435a1c342018416597e0f1c7517'
          'fcbf04692fbcd287eef8239a74b0e786515313a7'
          '1b8271a4005ad79f861d5f690dc41bbdf0b4b881'
          '8e901bb3103421dc7dc0a0608225ace8075dd89d'
          '3ba9730f6be8caff198840e8a36c6cc77baddaec'
          'cc22c563db7a84a8e5783318fde492c658ee186b'
          '50d5cbb29cba711d3f35b68f40c6333321b0868b'
          '3d5d66b2331d848c90972dccd86d932abd384c35'
          'f1bb2061aaf6298f31720cb11515b1962a5bcd8d'
          '3134f6e66eec5761516a477768bf5a97b74e2413'
          'a154b6f701b0d2912cfc9a67c47783b51b6c2ffd'
          '386784cff7abb33fe44e4f0dca3e61982e10db46'
          'f822539393e7f25c7d5fba8f8393aae3a9fc16e4'
          'a721e6111c10b502ea51a0504f88a8fe42b754b6'
          '3199b08a686f46d8d554db223ea27cd6cf132df3'
          '21f4791f3b61b26bdc427288bea2e3ef2cd3ed6a'
          '46377cef80bc294b417c7bb629eeb1ed041acad1'
          'd384cc40a8cdaf79c21f0efb8b9357f654b5c04d'
          '8c62f877aab426fa3bd3789c0c4e7feb3e5eca96'
          'f0c6fdcac5c4cdf1f6546324aa95c72daa2db884'
          '91f088974c92bc37be29afe860adf553317ea332'
          '00cc768795e62a472e0cce35269be4250869e51b'
          'c2e3e9769539561f9ae68aa74c9e79386768aca1'
          '522f478978236a2c6e0c73a08dbfe5d5046823a0'
          '623ec33185c0e97203d7667878e7fe9082d85dc3'
          '71c1a0b7b4471cb4958d39620440c04d01b3fba3'
          '97ed53db87e537598f8673a33b9292783415c9b0'
          '8e1b493913f6286492ad2724e8a5a02b66ae1045'
          '647d1cc15dcb4de502e7bc89a83427d944872f21'
          '9cb6c58e50c57fd6ebb0589113d79d2987c7fbce'
          'abfab0a2bcaee61c57ac5254e5e40c8ac16d9fa7'
          '1a21bb48a5030c3cde09ca1456edfc92a31cf2cd'
          'e8d91f8a18fbb58475e976974f27a91f82ca0b0f'
          'bf392347f3d2813ac09ab31c8c418d1467596cdf'
          'd56bb9c651fdd276646f623026f4f892617e4f24'
          'b6f199e1a64018685182b1ec6fbbfc531e37ea70'
          '998adff194ea85af60fb3eb5ad62695e11d12e9c'
          'ec9cf0e77bdcb8cad12af16d866f72a77eb3c1d0'
          '0870ef68165be31d55d23eed1ffdbe995f793677'
          'db4852e73be974f37645b2d6c8cf47d682cb5f15'
          'a8aa97c21ad822632488573087d1eb34c6c7ba31'
          '9f74eeccff52b7d288193b6172d79873b08b49f3'
          '4f992e56783b57133f0ba8947ed573648540e36b'
          'b16d5a6847844a26dbcfc98055da4a326adc406d'
          '48988eca75f5c86c610295fc422859aa3be7f16c'
          '58fca3bfa5a7cc9ae114be5e8265cc4dbb8b0611'
          '2b178855324bdc043250639d415ecc2faf4a174a'
          'f7e67da50d1e38512fc12f4706b82b53fb399d7d'
          'd856f79105264297d93bdb448eff94bcca0da7e1'
          '92978c90769d7ebf49af76eac850c1c9683b2c5b'
          '1c450a888b66482035629c29dd5701a9a4c621e7'
          'a64222b1e41c458da753f79c4a051e752670b691'
          'd0facf7b8e40b4552d200a33a29da095bd32c091'
          '1c5f6406ccb778d1414a521185d5d16a788db5c7'
          '953df17b291e39899cde6de7b8a5de6a2b421722'
          '12f2040b7855ee75d7d817bcdfce4fef79fa8b20'
          '07f8f271e3322e60f3b48531fd80056daf9020fd'
          '247334159f5bada5d9171a3b76c008b6e077a6b3'
          'c0bea6cabf3e57a7de06328c8185c4eb02514a03'
          '4de10a3772708cb9aa176a22d217d9bbce955e2c'
          '7b73393c29a083c348ad3979a5eae84436f6811f'
          '319de00c083613c35bc30a903b2123a1bc1c4994'
          '57f7f4e89f67703dc64df900d10a935b85a2ec1c'
          'c2de40630dee6cbb92d8d99a20737f9cc54214bf'
          '762178e53f4c87467669e8b6c124a454d1e7b4a8'
          'c7a09d4a910d020c0e53c2d654c6e68de5f38bcc'
          '0c66d109332144f7b3b674e574d721bbfe492b88'
          '486a2c49028ae62e05a03c0f50b818f194919c64'
          'd413b7bfc25909d4f6c51c815ee27349b7d2222c'
          '9101457f54c29e2a2975e2bce32fa8bce764aaeb'
          '9c32a1bea2380969053fd916634753fd44e45a94'
          '42ad1eec3f89284343105f2fc2f77c38696bc560'
          '1eb5c6ab81f99e78930502bddc1419676bc8d12e'
          'b36b5774fffe265c116a1f1153ba8996540ede95'
          'b2f4147cdd109ee24b2a47dbc442718c6481c4cb'
          '64a80c6f197add8356a6e327a7621ab80d35c931'
          '8cdeb8f120f742247945c8d190b32f70798b8ebf'
          '5cdcab8e86bedcc52fce76279a661118ce96b2cb'
          '6da00327bbd2d473dcbaf40598bcb0b2f83cc84c'
          '08a61158dc5226fd21a9f95f773f43057c8e9df2'
          '5e7182ada7fcc739041ffc6369c9f8dd0e539f57'
          'cd37aa70a8d44ca88518bff04a3cd994a6e95261'
          '4407b2684ac842401f23fd23a0f924509cb5593e'
          '93efd63f990771d03dfd2614d9a4bc7c10b468d8'
          'f958df8f43c07bcae5a6c860953b25f1f2afa0ef'
          '90a6a9e619961a280c5f6d16f0f2ab6384d6c5d3'
          '5ec5d424a4e25c8a8ac0f12aca69319ae63f43a9'
          '7a775ee6bcebaf45f952bb929279d0dd14b1aed0'
          '028d5ceb44900531f3fe4b7f46449f415370282a'
          '046bfc4efbaea6a7289743dc86a5af6ff0fdf71c'
          '6faece5a2eaaf8159d4e1d082fbe213caa723cd2'
          'b8aa7e89749451b4e341df56f048f8f25f73eb99'
          'd3e224677ea96fb1c657dc5861773d8cd5047f60'
          'b4daa82afe6a9fa62b448d7afa103ea39142619a'
          'e882bd098f517ae9d4c9a1a3caa673f99482dd79'
          'b8a1a3c226cea3d83e098104beba1d953d301591'
          '809d3804eef114baff0ad1b89f4a6b72430dc07b'
          'a7465cea7e43c8fd990b23052fc9b477688e58d5'
          '4a2c479284e5af75fe8b57a7e2d7ce82ab34c796')

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
