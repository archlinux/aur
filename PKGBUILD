# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.5.2
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
sha1sums=('9946f27daefd07ab7c33845c9cfe589cad957058'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          'ed8a137ba17893c62b034fae4a999ac86c20bea0'
          'a770dc48a4cda924041ed0be0cffa84c8d008617'
          'c86795f2ccc6c0fa601e3f298530793dc3f873ad'
          '663935ac9d6abcc98bc65b9f4950517640cd3bff'
          '9c61725465eb58f135a8b0f755c8bd6b2db12700'
          'ad196c03cd05e914683a9a59af7483d3415c5770'
          '0c786d279eadde2280ed44df3c651fb42a2ebefd'
          '70a5396f5fda251269685f78435b7654a037e456'
          '1bf93940d4c95832b21cdf0eee74c4392c93f38b'
          '90c4d7b4eac3aaae5c4ef6c1b083a55718bb3854'
          '099587f78e7e048771b29afb9ae1c455f5efa5ef'
          '51f364baeff8cd6eba6b7ce7151089e930f9f5df'
          '5b86718108042242e30c3a181918e271c5bc42c4'
          'f18f7744f9a533cf62d165f3a033f098e692c821'
          '6952ae6ea70d6f9d31032222d6237faf3969b092'
          'c0b588e79cf8335ec42d550698f58e6bdfe24fb4'
          '085b35436de30388c0c03b03afb21529780f2f33'
          '8ac7d1e8adb480905b82de8cb5e4cdef71d3e237'
          '41b5b0e96f4f62402b166a87dd68b1e5f663e8c6'
          '63fb31e277d5cad8615856954543b3d895d7ce47'
          'd7c97c6f4a08c8b99a79e380df94daab04d21b23'
          '9a79d8579cae408e381cbc6c455441d8cdf96276'
          '170f6f1386ec2b7417098091af6b8ce2b4284b7d'
          '4b2ebd6ed668bb78be983393292164d465ddb6ec'
          '1b729df8f832e7895203c13a1ec1f18baea3da17'
          'd8a9ca2b6397572d7357f7697a8502bb78d2a489'
          '02bf8d937b5e88d5812e4871733ae24bb1bdd703'
          'bc8e15e749d57a6b54681133ddc3852edaed546a'
          '82a0a6a004122361a1b9ac6559d515ec6365e587'
          '7857bb4978047174d12b67cbed62dc0e3d1e307a'
          '37085b331cd2d70a20c91a24e2f3add3279a3014'
          '327f590142c117a41a6c929e4c21bb5f12febc43'
          'a45c7f8d45d4bcecafa56c5163de232d9349f79e'
          '69d87711f55e5fd4c04982665519b64e16283321'
          'ac755c0c3c735e224dad2b286e2111645e42b42b'
          'cd79af86121ffbb0d5d5f1b6e89fe013e866d3fb'
          'b3bff0b86155cee88ed848e8555cefa55a627c70'
          'e590629c9dc5b58571fb05b220fc985f9207ab1c'
          'a9a31b00b71e68e4a1b358ee7010525d1a9b909f'
          '7ae9a1bc849595920a4b089086ae37a46510a4ac'
          '10c28c3ab962dc2795b7274f8b60d460623bfe09'
          'db194d8beadb452f16c3b83a3b5999fac94efc47'
          '931813dbfeed06c1c0d8f30fa322a922db2f10eb'
          '1af734a2adc79d3f28505a1657d1f4546491bee7'
          '13dff3244d831027af2d01e72829598ae5845097'
          'ebcdedcb238c9ba6551dcbdf2c65275cf143c274'
          '5e6d82cbbd6df31f6619de2835655d56eca0b8a0'
          '27d15a8a15bdc0b96d54cbeffd5632313b5f437d'
          'b2c11ccbf79d2bd6aac675f43b769febc9cc8884'
          '259fb11f304e234982b628287b0e331a55038114'
          '0a14b6710ae2434a9c033fe2d11eaeeeddb80bc5'
          '043ef08336b0af749e6c541a5c583117fb3fafd1'
          'e1bc46ac34685c45ca2212f0b97a59fd8ed0b55f'
          '25294269c5cdf5a4e363b3ddfdf37bc406202829'
          '4e290ed9b6b641f81a81543282c4db29f3043f73'
          'ccb15caa53122d876e02488cd94656d2e556e169'
          '16c12e5be27746b097dee13946947198102583db'
          'edc0ff0cc0ce0e7268de5310fcd08008064bb146'
          '3b4841a920de00ba73fba1d473d7f7fb4c29067e'
          '99ea68f960da46b52b7a704115e523d1c3d06c39'
          'aa30d9001bf67868b243d86098b39756b9a597f8'
          '3ca27cb145fa30c422b21986329531e5e530ef04'
          '0f8f3c9a023bbf3e0c5a136771f5ec9421a45c81'
          '375b01a2528ec47508b248fc34fda7eae41c80af'
          '5e7fcb4e06b0a870f115fbbde108aa9fc9434a72'
          '53299fe0416f2f14087e051ba4aead218652aa9c'
          '2bec9ae95b5b5262c11539042711f7072f57c282'
          '1a71e64823707987764d7a70e7cdb930c6e88302'
          'fa6d6afa485c506d9561ba5d82b1a7b4de8c3871'
          '14349ca333348233373eaea0444711516f37f6bd'
          'c61450157e03634b281e6a5073c6b68df487bfe3'
          '431850c25e15e009b4aeba3f19454b3d54ae1234'
          '128345eec40f77188e7116359ae8bdc4ac67eb7f'
          '056cb1cac059a324f955be018824ef2151777eaf'
          'dce3d9d4b3e949977271662700f29b68f2c164ad'
          '199902e695458a833d22017cd69a9e6c1b876288'
          '80946283bdc22d3a9e58ca2867fd39db67670488'
          '6d43cb3ff8d3fdda4e8db977fceda65791af56cb'
          'cf3214f1a6d3ee0310ad319624cac96665aedce4'
          '347fbd3c3a039c2f37ab55b9c3e6f82bdaf0131f'
          '990b599f28db72cd04a70170a0862eef91cc46da'
          '0bc03c9dcb4281c77371074b3b915e9826f1ad75'
          'cdaf27dc8267682c5765b90f8fe6875473150eeb'
          '60bd9b413bf75d1a603c68fd607196ce25886b61'
          '6afc4627a31cd8194519b4a202749966ba3c38e6'
          'ac6ecd3a010b66e12d3ee8866fbbdc6bc129ac98'
          'e56c5deb92cae4ae423a69a39371c3780572abdb'
          '61a154fd18e2f0a3f5804049a76f48e7818b636f'
          'f7a170834dee76752c97eaa8e22e4e4c047087a6')

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
