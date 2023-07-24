# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.2.1
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
sha1sums=('f3105b84f478ed73faa53a6add3d958b7f4a0f44'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '72bad7954b7a1da7dccdf8a31ddbcd5053f2a008'
          'db3fd202e9e98d956a3ed43406fab153ed6285c2'
          '43c90f5f6bca25475aadd87f53fffacde5ebcdd0'
          '0fc401f7e94aa908fe427bb9b92af4a3c2bb6d59'
          '78024c93fcedafed474987f2ac2c8978f079d6fa'
          'd62e7a5748da63b0dc6c29ad52a3f313d4249853'
          '5d6d6aea969507fd24b047aacce404d8a94ac147'
          '2e153b4d59b06c7e1155e13ac43ceee49318353c'
          '415abbe558e10fae7b085347bcdaf7d0b8005631'
          '6e57a38c44527302441d871c69226da00fce42e4'
          '46356d8eaab71112a1c3006e2654c0f1d0e11715'
          '0a60f6ef6a849384bce52b0f74b4fe3048349f28'
          '81bf60ba0dbc978f81a170b30b8bfef602de4b7b'
          '7ddc438e9916c3acb972323ead3d1b8ae5ab44ae'
          'afd9a28ffcbb6c31e15d8e0ce1831681d8b3c782'
          'ee3da6bdfae2e3c1ae3a57c8ec13c4e04e1289b5'
          '347d30700662d1b2ad08400f440b7e01d95d1e4e'
          'fe2266efaa18f6732d6169b2ff6893e0e2c95fa7'
          '67ccff8dc456fe984f7c2ddea222dc36ba2984e5'
          'd488275319c25e093ac7c1468db2944499e88c47'
          'e00c6043ef0c3621927094ca8f3223ae113437cf'
          '6ec029c22cda7705e221c0b11f38251a5b74baee'
          '58321529ef333fd71daa256755a9fa7263abf6c6'
          '0b5dcdeaaf085ec2d865e540792721b153940f1c'
          'cf8f6333b6265943fade1c4bbd9161a02a7580aa'
          'ebe43ff504fb5897a83a33c13002c377ca454ce4'
          'aa3e38a84fe2d676fdefcc518d0cb0690f07e8fd'
          '6ba0e45de6c15c27e4ea0ac5bcd867802fecb149'
          '8368f6c1076470385111cd67dcbb3fa412ec96e4'
          '8a2edddda6afd88ee86c3bbb05c35adafa908c82'
          'ca8d1c6c98f7332fbf6f9e941c1277986b39c337'
          '6d5c846fa9960b57b6ea2321a886f1ac0a2f5f0d'
          '47c8e82bbf311f31213a17610fe16368e5539eaf'
          'dd126c3ab4ff25588ffc7fac5bf2831e518460b2'
          'd1c8996846dd97c2ad959e9cbf454a357930e0cf'
          'dc2e69718456296bafa8f467ca21bf3a3ae020c2'
          'e615cb566c9111e20939d593f346cf26ae1e6179'
          '6d8ae55d4e737e04b26d7cf6d5a6c9b632d91344'
          '9b5336f128794cbf499a176057829348ceaa16d2'
          '2ede47adf2a3d76096c92187a9a6031231d8b5e9'
          '1c5d42cc00d194ebf69c1f2a7f197ec10cf50077'
          'bafb86d15b0c77898196bcbd942c2ed2ba48622e'
          'd63364d765f59d50b512818f9e890388a118b561'
          '0dcc536640b2203270ca8368cb3bf4d3e148cf71'
          'cefbd66a03491b9e6415a2b340d56f80d529753c'
          '1939986591e8990bcb811f9d315d4e457d47f8a8'
          '581ca8ba441a659eda14683ff26e60b7b9bd1ff6'
          '02758386450c7fb7235d3cb8ca53e1cc2f894e1a'
          '402c011a796da83003b67fbad4ba948fe1666f95'
          '49efb7c10c42759256e0bc4e897674cbac795854'
          'd09201cfc1f04069d86dd395f6cd76d13c9b1045'
          'c37bd6fdf880f5708f321fc6aee958654fd25003'
          '7afc1c7f6fd5910e39b27b7786b5adcc313ee70f'
          '6e13d2605532f6ef1cab21465ed27902c0fbd952'
          '96639499840b89b8f40935fe7153ce2295c89404'
          '07b6a71639b117448c4edd25730984252c3d8a54'
          'd09b5f5fc9c5d60bbc5789cd9522d6382291946e'
          'd28422edcd6622e44ae7e512969124784f766b42'
          'e4351525db964b53d3f5810b5906c75f1f85f318'
          'edb905f078c7e5495e5c775edecab9e58b72d02a'
          'ecc282cad40b50a7390623be0d9207cdda53e445'
          'fbd9444bfd1ae6707e884031134d3bc55ae3bcba'
          'b8472a67da59847f7070d2f879a49ac8d76d9678'
          '48ac1171db80f3159e2c80e508e42b403df4c55f'
          'c6adb734e25ba2b04f1046ca7175cb5066ef463a'
          '85def7366ce0232f28c58aff09f0159607b2755e'
          '39122438e36b2e5e83a830217ab8f996a2eea539'
          'ed62bac61cd0a6a8548b8c5ae25c57951e418ff3'
          '61555262afd148d20b9de783302ff68f670f775f'
          '5f9161be9cca34238f9ad0c0449ee9cf4a136d40'
          'b6b5204f776d53252d9b3f6ab2e39449cf9b5427'
          '65ca1411085455b150cfa78df3998d258e316159'
          'e8b662a584b829dc91180dbd2058f3d708d9371d'
          '23fde0deb27a7b7a3c60471ed6e7460dcb079b7f'
          'bc923bb8cb43a42fe0f60036c2830927db2041dd'
          '1eb0b9a699d9d89b3347eb77aedaa442ff19f878'
          '7f536c649bb92bc33653364efd71a9a263007c24'
          'fb949bb0d32ab710427b5bb5d5f2d9ecb1e80d4f'
          'b2d83b3b48c10e7e953cf2122b8482ac6162c3f0'
          '9aa274a857d7578e7e0d93fa5c3a3e895e15ee14'
          'ee7ed62dcfc83f5e71c4b0a1c92dd3a98b6d8a87'
          '6342ab80972e5b7a906fba1ebaa1740c48e095d0'
          'b40e7861a9ca410588254981d798d398d8811730'
          '198af7e051a7c7d4b485ad5ef2532725b0dfd999'
          'c61093364da2ad2174a4fbdf0a30c92cdbc1eab7'
          '8d8e5fd39552d48ce3c47e07700aa345aa7eecae'
          '001a3ac1c66a140c355c32275f6fe6a54c10b4e7'
          'e13271c63268a985556ba2addf229f101c42ce20'
          '5071f74bb32431479c958177b0382f8da94cb157')

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
