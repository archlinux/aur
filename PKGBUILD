# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.5.4
pkgrel=2
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
sha1sums=('83ced29f9336432f04975e4ede613c2be59353f5'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '4015c285e1fdf6c0d016635c19294e612914351c'
          'b8736c8acacaf18ab6d5f2a788335a889538a748'
          'aeded866a6047656686041e041fe9083adf847a3'
          '2ddfbffed0db95076228236e1805c5c4bbd6a130'
          '4a54e6777a2969640cbed85e21a06451315b0087'
          'b844b4344f3e7d79ea590b19861b36a9f4273576'
          '57435bb87406c85b8bf103368e9b5f0379c027d0'
          'ae3bc878d86db196af0c214a0df58ce388687dbf'
          '5e865d5fca68c1c0e8663bed0b9cb26f7f85d7f6'
          '7ae408dbfc67e9904563464a3f73818c833f1c37'
          '40d97a159b176a2c961b5b86ea3c040b1ea5e44c'
          'a76c029df7764765b106c3e44e038841eb41e67a'
          '029a793d8ed45fd13ec69642ca23fd7a003d8f06'
          'b838c2f08897b7ed6dc96267b5831680818df874'
          'd9191d039c17bf07fb41984a503d7266b4a44ba2'
          'f595479d8c39de4c339a857079ff7365cceef434'
          '2b4e6f2426252328b5f5053d363cab9e7b4c6e52'
          '1c59e69eade18c11af0922c53e7a779c5e61f0ee'
          'e8bf5144b4dfe4468280e0aeee5448117f0b3a02'
          'b62bbcc5af2029aedf6a9764bd14b753ffe5523f'
          'e77a7d192b2306d29b7a73cdb904fa43d9341c83'
          '8443e5e4de4758755a2dbd800b897c39b39a2ea7'
          'd141f5f7fe68e88e28df4f93326ba63f92d9b138'
          '2518bc0bcbf4a5c19627ac7f210d9a8c257045c3'
          '4b142fedfc448f01df44f9affe15aea22beeab24'
          'e61235e27b463ec758c49f2f9ca9b72b3be31cda'
          '702483a1ae2abe127271ecd7bbaeb2c3fe3049bc'
          '244232fc5e2d9f66d950d5ea14fe8707cc13a4eb'
          '5243c5125375b731248310b8766cdfa117ca2d85'
          'b9d39d5e2b36e483989c35a5a7e4f9bcf3b9a692'
          '67675487a52d0073e3099ea63293859e85a83df8'
          '21cfc187341b1a92e9fd332addae42bd6dfa44b0'
          '0c39114a9a7496b6dbb3cbc284f9e6cafa1def41'
          'd175a2f219434e2fabd6260825defe10b32945d7'
          'af56acd0e2aa1d15a6edb958339f7f785df71887'
          '9d9832a65af764c4046d50e09342744228c51bb6'
          'cb3ac77f10ba363a2bca1046c8ad9fd88262e834'
          'f212ea4ab96c9ed1d5515c4e6870ac8441409149'
          '745490cc3b5ef409ce3acdcc29a8fc85e6a37b6c'
          '42801fd777ca2f84742ed4c5976d1a931874bfdf'
          '92829a6f467d1839ee06c55f536a3696c12dfda9'
          '284e8cb5acf48f157cb89cafe3bfa6f787dd121d'
          '24bc4fbb3bbcefc07f30d04708459b496429e9c8'
          '2842a088c85dfcec3450a864da1e416568b16eda'
          'df4e3900967ae14087ed7d2ccdc93567c99da992'
          'fbd55dbe5173aaf6914048c6239c72436bdf8243'
          'e10a3847ef65d3e6d849be57f3e638bf0d994497'
          'd5f9465f85935d784707d6e4b9710885558f1fea'
          '856bcf156b1a45c4674ef726b4fa8a7e4c6881b8'
          'a397ee9c6155eea168440310b27fb49092be7d42'
          '86ad3cba277a82dfad2f4037199af01819744185'
          '1dc207c92bc644bd38394a9a075a2dea2816b760'
          '4f695e1bd2943ba1ba021af78a2a6365abfbead4'
          '8ca10ea57a3dc5e170530f604285d27add4ed901'
          '18854eff032068795f55ff848463d3ecf9944606'
          '3a5d4251b9d671e58a99772f770f2dc7bd8df2f7'
          'ca4a7cb1fe4174a747bb9bbeaa537e6afa995ece'
          '2f0c45ed00f511d51406e5c083433e0eab4d3bec'
          '1d178a8a5787d86a33ae9c022f258558fb34a74e'
          'e4e88ea95c04498d90924870fd5a4999332513a5'
          'b226324b5afdbf7f37774d11280bbc37606902f7'
          '863dcb3f6e7ab4177dd166500d182764d86aea21'
          'c833d6cb292075898a1472345c8aea62d5ca5eaa'
          'db4c83d2e50b002f82f0d4808796906112b81ecd'
          '41a051eb02b7c82cb63b75fc92db878acab3e283'
          '4b333e074ae0d88065b48558fcba442c35540fb6'
          '8b7fe7cc87fd13fc35a664307efe6a4073956491'
          '6f29b4d9c47a1e30b3c3a8d211766fd3c5af840a'
          'b289f29ec13f79547c75871dfc50151d7afaf31e'
          '60c35ff6313ca33854bdbaf4fb190f3e6b21b3d1'
          '59d3a88892c618d1fe1ad15e64503cdf9f57d624'
          'c79a40938daee69c167447b963688e33a94c2cfb'
          '89df4af3b3a2f3999410898f7a30c08eb76b8c98'
          '47841861951451a93e04a8388be9ac8f5ccfb420'
          '415e8b7ae6bb19b896d692af0f076f003bd25f94'
          '86f93d17b7b8f54224ef6826c9492a578b848c3d'
          'ce68ab77149fb68a36d62115011ebe183397ada7'
          '55d199e65492983f5e2544d2bd58d10488f61841'
          '58f6251297f1966bc62908230b49ae8c9047eddb'
          '29d0fdf61345378985427fa6a20f7f4ffc30effa'
          '0e9d1f04e60240d2b820856171f3530cc28ac4c5'
          'eb12aa684237f40f547f940d64e2c4bb9ee5dc43'
          '4a223b0b868e545d776ad6ab3a97edbcc984f6da'
          '0a24b0c869368fee28c35f5de88cef2562554a0a'
          '8e479468e1e3c8a078a8079ee6a73eb2e5b95712'
          'a3724e0625d20cef00eb4b985be35b704fdc3286'
          'd86b7f73628e470319f12916ba41bd075117cd2c'
          '22280193b1308d0a414ce2ee7b42f2d6a9b13c33'
          '0556c48fb7edc17b3cd7698ff05d89fd22694a56')

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
