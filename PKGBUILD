# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.6.3
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
sha1sums=('b336864c0590f765426c9fb3c3cac3b0f463d1f5'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '339ab8a87e454db5650f552d279c3780a710e693'
          '59260c19019852aa49a1e769d045d05bff455c6b'
          '3f89a92782bdd0a835683f2780b030f0f961e338'
          'cf55e4eddd02a3695c431bc4bfc589a92119f64c'
          '9d8e6c7b3a5d9e4e57d6d019bd4064bb93a42ea6'
          '737e73a753dbf5ff54b0783421f029f76d124844'
          '5390f56d75fe3b9d85e5ae1a2ec1ce30a73099ed'
          '01b8b7c9ede6e84f82924063073f10e4685379c8'
          '15da32fdda9bb918481678e1fa0cab76789416e6'
          'ce0b1fa262a51878c55e1d13f085133af9e401b6'
          '0372b8c2d88c0c1ecab8aae03fe7da95322d9093'
          '51fbaf654dbe6f3d32d46d9c413907a1aefab5f7'
          'f2159f3c938e7ef4b3ce91c0d39a584da5dbfcd7'
          '2fc01b40a1fb4c2528e3c33ad6938b9a745dbdaa'
          '4836487f5df86229da1be2104ea8f384e1e67054'
          '92abb128d7a99343207865b31af9a3e22226ee82'
          'b1ab4474965f487d4a1ec361304b1939e1a81cf2'
          '1bef1399e62a1415cd5cd426768f5be9ae1381b8'
          '490e08b6e9fc79357a2574ae927aeb900581ad12'
          '3c532f29e81fdef5d8f0a5f8fb7c53b018efb6f7'
          '2ecc872ae80d46bb3fc7f9e4b2b320433e74afe7'
          'e302bd1a9281e5b8402b9d66c99d5e9ec3b7d72d'
          '88f7ec386904c7dcc04637ab073df0e841932acf'
          'b46a168cd5c5fc95adff20271ae4e76ed8705fa6'
          '1dcb83427c3639e7d6e16347f80bd55015e76f71'
          'd43b34b9d925cce42cb3fe013b7010eb5c58f038'
          'cce162e63c52cbd4b9b4e3fee314bd830d4226e3'
          '5e17c255f41546e15f83925cbcbdc49d0aa9323d'
          '3dacbb9f9a98297a2eb6b9a263289df69154f0fe'
          'f68ad147baa7c9c1718d1fc2abf0e15f035110a8'
          '5b902e5c0852db27fae0ad58debc8f681ded5a6b'
          '263a86f3a24109a626e033ded878773d17c0eda9'
          '1d1d0d65e99ae57e39f90762a6509fe9fea1627e'
          '96fb7c7be8675c673988212d2a93fa318eae2d03'
          'fd28bec3a3d4cbe47aa69529c9d6941bec4f4a11'
          '8059d0821932f048ecb4697f066ce027d5b3cf7d'
          'cb4c166afb01a6044cb36e56f2bd95c390f141af'
          '1245c9e4a9d5c28a2c92104b80e8934b4d8f406c'
          '6cf743efe92e118af84fdff7ab2d0dfc048e6a76'
          'ce24047b2f4d014bca36a7335e14c6bd5df2e76e'
          'bee8a1453e0ee01167c381db836e8bbb232f0e03'
          'ac7af58b4d463721a83e74195c452cdc4acd333b'
          'ea3a2b27208721a2fd236ab1e0d20ac518f76d1e'
          'bb0773a018a86a939db48f014545b6d15726587f'
          '708c015021431902a0566255a8a18a1197f3b1ef'
          '76f9f18ac8e3596d6a61c5bd751e9c48034d8c44'
          '47d235cca368cf91f9376d8b4fde63c473a55cb6'
          '023b287f1ec8b47d8a0ee86868f6a7c0811d13af'
          '8d2c1cbf5e8efe3b350052694723f4e83afdb9d9'
          '34c8508e42963bc7dd4b395ae22eaddf69c108c5'
          'd023aa212d6434bd93687cd12b91fcf7a00c4d6e'
          '0a202b33228718ea01fe57c8dcc312a76038f1b0'
          '3988d933914ccbd3ca41666616611029232b9167'
          '426a1bf8849a8a4f2f8e775e72b5f4ed61b54faf'
          '759316bb8794c029228121aae7aef9bdf77ab61e'
          '55828e2de3bfb031adbe4b9b4a46a9b95abb7b38'
          '1f4aa0007e1913dcf8a17c042424c5403bcea720'
          'ff06f0d955acd7dca8acf4b743c270adaf3fe51f'
          '8497fbdbd792f53b14fdc13fa943c8b588e56a65'
          '493c9b1d507a58ef2305b3f35bfbb8ed1f911a0c'
          '6a75a61058a2ede7d6821143c54b2d2a576591d7'
          '3401e77437340d895c181ccf38849125e6d0d95a'
          '088b223f4892ec4c5abbd8b1b415f5231fd377d0'
          'd98f58722096a3a01fb4bb50ba0578d9443077f1'
          '4a4afd6bc63b7db6820a1a797fc26e0ff807e317'
          '61e146c765a640ab315173f1af2b5bb917bc40ff'
          'ac92058b45a6f8171a9ef0a21a4ae9c7e4637f60'
          '301f394f6280a399cf1e21de84221ebe53d64cb6'
          '8e1826e91625b56e9eb10e992d24f45e336b7c76'
          '27219151d8cfe05118038db2590706c3a86bce8d'
          '13e10b3f8b432dccbb55385cd5fe2add368c284c'
          '73c5c5e3959260fe3cb74c14e41d2d93a1e7f8eb'
          'ce256e8b43734f096451957481c9b1e16803da1c'
          '0e1ef7a77e18397729e26b749999ffa0bdedeef3'
          '2b9df4b2358eea47e5097b12de072ba006f5c45e'
          '581d22c13acd1a81ba35e331732f57b8c66d57ff'
          'b2ce940a7043e891b155a71d0f4213f669a4c04b'
          'a83799272feb539e9cb4ef42f49ada5f997f35d5'
          'fbfdc23a85c6418b9582787fda62beb91ce141ad'
          '427618aca62082f29dc71e64535f1be33b6447ad'
          'eebcea4c68917ad3aaab081a4ef3c2261bee00a2'
          'a76df764308c587d5e0cb5449770eaffee8a4200'
          '360c42b19ce498363a972e62b01482d8ec1e5ee1'
          'bce171a3b8223d824aaacef4b5da081141c57b08'
          '0570d40e90c058cf232baa974be83b0383ab2349'
          'f408255eb322325e723a8ed0f6b86a66569fa668'
          '0a6abd40b222a409501f5d87644856a67d0eec29'
          '3c1bb02f6d9b8b562d6eb92a2a79fa8a1c29b27f'
          'c7760048e7178f00b618b3e5db9ef26d7aefb243')

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
