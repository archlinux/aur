# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=22.05.8.4
pkgrel=3
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
sha1sums=('73dedf5abeca55f9de00c0c0caf2997021c26065'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '49ab6cea96ce0007f3a97fa24eae9120cd772cbf'
          '6db3341814ae0d571cf1479b12d2cef0753512a8'
          '590224fe9d573e89fa97c80d676f90f91898bb38'
          '388b69ddde76775d179d4ee4025d3e51d2b7af71'
          '8ee46871dd60b5c9ff9816aac343360646de7673'
          'd7438c8eb7ac750c036cf1cd9c13a4d4738c912c'
          'a128c5baf62221d70b93f9f3974637ad40a48208'
          'cc0a29571cf10f86b76c70dc4c3ee12504a1dbf1'
          '9ad916eba4d72c0122b0e3d6b5589a9461fe27f8'
          '8c9c4c871d0eeb547040c0497b7ff651de7bd43a'
          'f0fe22d526a11e41863c9bd542585ce676d607ef'
          '07de5bb0f9c083c46c5c7b40b1499798458a79f9'
          'b1fc8bbce479ef5f8c8e52a545b92195fdbbb8d0'
          '359d1cd1e464f73d6b7b97fbc81144960f02f163'
          '395ef6c449a4d90bee1f0c17d27583211334223c'
          'd825e3f1d8c7e4b9a765ab968cb586f6cde7a121'
          'f9028c66176150c382ae43b4614f59aea2eb8b2a'
          '4b1f3e03757ea16008a2be4b3c47f6d9af56a655'
          'd28e41fbf3ebf4b60a7e3aecc3bdb92a7e8a8a5e'
          '680d27e5644589da5fde90bf9d2d4be3ab5fcaff'
          'ab7e3f9cc89b1a94127306cf31df6d321e5d2ac2'
          '79dd21c8f39aad77b47a6fedabeccc254bfb5251'
          'cd1386b66bf4fc2b43bfc93739af7aff41272afc'
          'aab6d0cb563fbbddbdf68670fcb495c3597d7dd6'
          'a57ad341b1e70f277b0aa3a5521519ec6aca28be'
          '5b4524110a107e7eb0376e1f7c66e80ac3e87796'
          'fba89448ca000cc537b0795cd04f95d9c8cb902d'
          '3e1a3e3978ed6fef12f169e17f7ed0d2221b1ebd'
          '683613770b457add62d01fb54d5424a5207c9e0b'
          '69482e744ffefe38d2721fa6cef5e49f63813e43'
          '03f2cb933dea03083ed988cda36d64657dc99d06'
          '52fd9e5477a86c698b1bba59239a5c19fb572126'
          'ed8bba072206d3b1d4492d329ac756beb30c9b3f'
          'ea5b23d3268aadb4122b034b5ce2c1f81e934a90'
          '06b4b370ef636b1d1cdd824ab35f959c3ae63134'
          '7afb9924fd8c0ff4e33fa609b28eb3df3f18236f'
          '1231158ff5c08cdd3a2da2b59020abd78b11a2f2'
          '365ce3f1560e98623cf306c1c18a4f5d3d57c791'
          'f6d549bd571e7c64c3bdb43b20c114395390d265'
          'e296841594934fcc05fb8accfd1833563166ff18'
          '587ea79d173ad9ff8e5a8b815f9a2e4cd9bced4c'
          '6738c25d84779c161a78ce239fc7b84f9b1f106c'
          '577f8f661dda9c37e98f6d13eea4fce1a27aa69e'
          '9edccccc49fee470aeae6aeaa4f04e9a388e0037'
          '8ed1b47c8c1b0321650d90ce593b400be66fbe4c'
          '340b4bc7f22f601b2ead7d660cd750a0679625b3'
          '018a9d1060e986e866905dd89e7e2d01a005680c'
          '429aceb5bd90645f7813644b0e726eedca290d0d'
          'f882a932e42f180d36c714444b3ae9d25240f726'
          '6fe55ff5ecac372fbb20db39496ab750d2717ef8'
          '47c3fc6e7915fc634db3c996cc43d2459019ff9d'
          '777e92f3d0182448d1a29d70cacfa1c55ca5c955'
          '57a55d9733434f1947a50e9515b8ba481f8d3193'
          'ea25206e582fb6933be7257634da185b4c7361ea'
          'cc0c50052dd464f55f79488ffc8d6f8ab1585fd3'
          'b921cc680cc87399ac9273d954f15355ddbea083'
          'e1885f56d7203b80908c3ee4231e83ba4ba0f8d2'
          '4402468cf73d1c14159151541df6e67bff127675'
          '5479e04e9df42f20fed97d6287edcf92fbeea4dc'
          '88b8176b78d8ed5eabf9daee38d389b429f7a152'
          '902120e1fb94fd1e2db855f01bf6968ae86da76d'
          'af1124024fb9599667c9d34c8eb95e7afdfd8947'
          '907af1455d3e2823f889214a2592fbdeb9bea037'
          '7dff47d105c426656d9b0de1f5cb7d763e911199'
          'c82b3f8b7c81d40e05d7834452f64b962303caf0'
          '8cc32fbae2cc0eb2c6f9544d245a39bd9360def2'
          '207ea1b805b6fe5d6e5e0a597525f690781c3dfc'
          'e2b1862da8c33f047d4ecd5d2ae4d982df9a7f63'
          'baeaa539595b975978d921ce7a0992ece57c867d'
          'f5ff92f17ebb55d97ca14f38c3498b6abf937e9d'
          '59e177256fecf6f75a5336f56f5bf572994b28cd'
          'f53d069f65919928088a6a4686e0d5d77861c4b0'
          '20ad0abf56286689aa19867215c3f856e651d63d'
          'b523b98290110ab3baac4db4191e42eff1612e05'
          'da7061d29e6fbacc965be91ecb1a15323b86083e'
          '4852b352dcb85bdba5ef07ffdaecaeb4b16fa9c4'
          '832745aa8b5f1b8f40f12e71a0227a80094b59cb'
          'a29d42bfeef9c005bad5e2ea4af50173bf9960b4'
          '871f92a7cb88d6c0aa1c6387d3d3a14ebc0bbac0'
          '525a162d967d52e38aa8fe7146f7400d1be38b61'
          'fa7c8f206003ef753cab23134d0973f0b9a3e626'
          '7426cd061b2400c4896dc4bca61ef1458b945a72'
          'f373714109c4a57fc1e9a13c41d3e158bd857ca9'
          '0a42a09209fec9dcf6785a6878b6f7af035fda9a'
          '31434957f6a01ff89732f7a669f5523a9b75fd8f'
          '1c30be9ace893403d28d6b5902be46ea71d3579c'
          '7c3bfd1348d3887e9c5770efd65d00b57526dfed'
          '7d78208bc03a954dad50c36fdd4031e6ec814558'
          '2b9ff815b052203e696383d29dd0c08356bc0456'
          'f1c78fe7dca8c4e1b8dfbcf0bbaee5c58930fb72'
          'abf2ea055f6d1ac789730361302bcfc69319527b'
          '74bfb3c2d0a8166206d4f97f3d91463cc0f6a77d'
          '611a0a5b754b5c0a662ad04df19149894afb2a61'
          'fe66c6cc07ba23e5b3e4c041a14b7240994cd7f1'
          'bf4c2e6cd560a2ff9da0151fa6b702c31afa6a53'
          '9c4e01cea37a8abe223cfa38c9a0150e222be273'
          'b5325403130d25ea32c965caf002b6f240c4eee4'
          'a56bdf18f84a6f43308370a1c7908d6cc0b0ab9a'
          '776b7f2dd8930821ff8da4820b39f90fe443e56f'
          'c85bd7a57b6ab1d698fb78977428312def2e1f95'
          '8c6145d5b18881090bf036fc9da2f9422affdeb4'
          'bc17621bc35c8c2762b6432756634840d02e3911'
          'eccd95a3be6e400504f46e3c870a2eaeaec38ef8'
          '2850a945019c7517fb413be3b466a66967ed735f'
          '9590a975b8c4308e931905d4db09a8f5308ae297'
          '3ee564e4c78aac1dda403da66783fa6b96501f79'
          '47813c112ae2c3de0fa40af9d44d3774fa5f97e6'
          '26f415403f32f177a0e2bd8565dc1e9911b4be09'
          'a6108cd249674226b6e9a0a776288ea05b40f9b1'
          'f4220daddb99a897221616b7588d7bac48697ba0'
          'c91e6ba05ba4a817bf345f2bb5c21c42cb7c7011'
          '007b6da2f05ae8e4d4486cb90b98b294f669aa18'
          'b72334a4d57e7717efccb63b3107fb3a10129d92'
          '743c19f655840db8517d2a7670425153af7e0688'
          'f568ea368ae36a256ffed2e7ff1f759c3815035a'
          '26e514b222a78e8efe0fdc26ec3877774348fb21'
          'c55cbb8343a7a8911e94ac3088dc58b178ace237')

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
