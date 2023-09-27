# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.4.2
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
sha1sums=('5e49f4b176d0338890f593b472496c006c921f43'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '6a6ef4c1a0e2137946bc2b0f424288c18c6250c7'
          '3592f1b5a2905d6eff49c243c172cf5cfbb8e47f'
          'c96b363489cf51d7d655a12d05464aed49f1fa53'
          'ef1071a8e0c4b93d14426f4238c84b02cbe9b277'
          '8b60c42567d2555096f95825faa93189c9173202'
          '5d51617d84ab2e784969fe7dec7e592a38e7d990'
          'b688752c3d187aae681fcaacec9cc51f62db07ae'
          'bee033d5c1c54ff8f657e1e49a57238ade2ea4cf'
          '1e06ca67aeafbc3981f5d504028fd25aadd3d145'
          '42a087049d6bca2d3f0ba45de0d737fc1628ac8b'
          'ea08ff8b76b4ba66c5e297a3f914ed127109faf2'
          'ba3d8247389f0e40c48d4a353aae9c59ec46a4e2'
          '7515192eeafb768e84776c79498f65fced853d13'
          'ca2ef3e435fdd4fe815a00458968bbc403e4d36f'
          'ad3307fa5fe1d9bd8f74b168b99692f5408294db'
          'c1d25a7b0810adbcee7ea9ac103ddaa44ba88d60'
          'cb8cc0f1244b1054c155943d1055e54e7dfce822'
          'b59f32d8f8d5d21ca77132c19f6de16097708cd7'
          '0caa146027721d06cf472f789431e263a8d4c276'
          '8b0910aede951aa048b3934d899c418a8830de5d'
          'd738fa40041ea88030494ac0b3e6a1e95a661a72'
          'e1ca3650fd0fc92863d75aaf458e9e2b8c9f5706'
          '816efa23828baca1fa654f82ffc2c1b50e0ec137'
          '1e36f55a2567a5968ff46a7a5b75a33110ebd267'
          'cef94a78e82159cb4ba2030bed4f5eb5b8095e9c'
          '6f50a6f3d96d061ab3251c316c342b18320c3bcd'
          '9bec795a57aab25ebbb95691e34623709bf288fc'
          '2a695a47f9dbf8c26e99e221d66481003a03c841'
          'fad11c44d172fa5f6f26bf5b1a2192fceb0c3b02'
          '377f80f7fb90d6390e50f612f8b872f34092a091'
          '635e1ffe09f9a7fda55f2bec94bf134717f217b0'
          'a82f12af3e774f08f65dda8f606bef4e4f9b65f8'
          'c556f45cffc854d59e832cd12793b0e752e3cb66'
          'e483aee8622c314ef252a1ee1cb4227559054e29'
          'a44a2453ad1178e36fe56a9bc0fe178737eae623'
          'a51f2faf7fd9a94daab400d9245034d03562478d'
          'c9f0aeae59db62fb4f6c5a380ef78b2a4aa82ca4'
          '5dd339e0f86210294f35d027210fb3352e4808c0'
          'b98fef5aa4b6e254f41bdd5fe952562f1a50ff72'
          '9a92e8e72aaf0490b22676d4e3f0956f0143508e'
          '9be25044d7c024dfe62ea19cc8da32cf0c4d20eb'
          'e774bc16842596ecf79834eeac06cdf7c66ddb9b'
          '8936f531f5e73f3f66132b5e9c0611c9c44bb1c2'
          '08cfc85c816a0cd021621e4eaccf1ffad0c8823d'
          'ff429739ad0c2c65337c7091560a68c3f70f1fea'
          'cdad3f0333d5c5533faceb05c1c591b9167a4767'
          'f0b1e4d241af7cdaa3008722868a135adc5ecf5b'
          '085e7bf08b72b9df8c8f2d8cfc54d7a79d7dcdc7'
          '91ee77fa92de2956b667875711ac744ef2f53e7f'
          'e40091f0e0310b689bad21f6f2e8b7898daf59c9'
          '0e9549dd7888ed90f912dfb00473626954e00851'
          'f680d3c302fa531259e9838a1e21abd242c81fcb'
          '9f6e54bea00dbdb2e38fe3c75b3b67a415226a38'
          'c911f8d0bca2cfbc8b9b9ca8af601e8a58bf2955'
          '3cc0a6a520250c798ec388c6627aefd6ddbaba8a'
          '9e7a8e20788c35a2fc802195d110921e490def9b'
          '03de3032b49e2cea7ee919768aa95a9cc66e71d7'
          'c9f3974b8a1cfbd19441793f5754ce8eed94bcf6'
          '19c58a3538416a7985b54648ebb035ef8f0f50da'
          '09b3c34dcc2dadac1b11ce62fa654dcb3d46e529'
          '53a391030cab1d5eab9f98d8b6c1e7a3b130cf1b'
          'd22094ef7b4c9ce4fb6faed10c935428b3f9127d'
          '61251e053a1dc22b49d0fceca52cca7067dbcc03'
          '563e9853d52778027267b450d76183d1d54a742a'
          'ba4c9ff47958ee067f57d3f87b5bcd78165f7c28'
          '1b1c79e1d3e0f89eaac8a6342a949e0d46a7d885'
          '31e5cc9baa9beef4e7f5eeb50329bbcdb51c8620'
          'ac14c90e40226c78584e785aafd7b840b2729372'
          'e1030e3d6a64e7c31500177246ac0b30f314ccd6'
          'f40635c869d34cd9bfbac25ea948d252c8a8adec'
          'f511b8f5c6b59a76a3c7ba9976acc1925c718c5d'
          '3e5834851ed74279d6d359b87e80797e710ce5df'
          '197a0590dfc633fc05c147659175000676fc00df'
          'd58d27334f7fb43a0b2d46456bb7c51b3bbb0379'
          '549ecf620e47b78c65b45c749ed12331b5958611'
          'f20c7f04734ca8101d04345617fd8c77abc88ba6'
          'cb6a2e7d962e394b5e50e0dd1d2eab61f2b9d01a'
          '475a4b885d5cc13b06e53d1121a6e3d7d74f4878'
          '8be753179dffd78ad98e0cd87cea748bdedf9c96'
          '5f90e24b97eb3b0b56871db940e3e4a0c4bb02c5'
          '214650e7cb316c4ca141a47eea5b248a7d5629f7'
          '2e3b36ee530b75e9c5fab8cf30960e0ba98988e9'
          '9526e67e07c489259386f353aea08e1e6f380dfd'
          'ed3882450df4cd5bbcc313964239789a01ffca6b'
          '44ce8961cdbb037691a1f00ccc5e0eaac504bbc4'
          'a3ff70b3aec88ef64f709e2538006f35c81c8e5b'
          'b78c82c662c9448dfb09351b404c480f285eece7'
          '46d9a9bad233e5029b09f6becb8d2146225c5b56'
          'a1dfda190d22bed229c51581d22ea49032bf6bb7')

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
