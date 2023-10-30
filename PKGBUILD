# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Yves G. <theYinYeti@yalis.fr>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.5.3
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
sha1sums=('3f00bdf972407e7c75a50a12f080797dc873e5d5'
          '69c3f1ee98aa44aae759c011fcfac6502676535e'
          '3fe2db88f4f7ee203520c59760582103d3e41210'
          'b44b1ddaa362c6fdf65a0899beaa40dada3b232e'
          '21b07d04a02cd35e9563db94b7101e98878bdd2b'
          '2233b59013d6f6eed2259b8923576c1115317260'
          'c68a3bee0af568525df5b0d2e7d55e2757db1fd8'
          '147b46d174c8e20062072e0ed8cd2b50024ecfcd'
          'ed215ebfda915fcdb9fbf3734f7c23bd6c738bb2'
          '59a06aa3273b9b3fd7beb0b79a495462f3728d34'
          'ba4e69ea6654e7de66aa58f0709e186991fe8f1d'
          '07e1cf147e3ec14cf7435855ee4b485f62199aa4'
          'cac897daddd67ce5457918bc2853308364c88aa2'
          '081259c2e36c2f4dc6c759c4bec64fb754fc30ce'
          '0a2d7f32e777172c58dc858333e32871c1c06209'
          '509e6eca278f7c7181bd74294dbddab9075e49ff'
          '649e9f9fb3efbe6a20f4f57d669e757ae97ae1db'
          '0decefe37cebc0d2513e3d0e17b12091550a263b'
          '4e985d67711f4db56e2bd0dd25db4867aa70584f'
          '72af672d2877c29da856bfb7c7891a8f8b780910'
          '02b5860c4ad0b670282058137ec12037552c6f6e'
          '119b347b372d2699b525ffe1cdf9f6de4692ee2f'
          '351c1094e78734798e4a7fba98b41aa85c17101d'
          'ac4476105fcbf929c22b0fc663ddcd307f96d7ca'
          '4ef73f51082597ca82cb755c7bab0ad320eb6416'
          '86adc90782726dddec37986a232ba879f7f742e9'
          '65587ef02011cf1167a037bbc768e5eed7e40c86'
          'dfd8b84570f0c43fbd59cc95572725e69f43bdaa'
          '27e6e11405b356b6088f9c5a396696180fe12ef6'
          '9b24199bbca777da2a9d49b80202b1fa2d1f770e'
          '755b7222dfe3180c0bea87091597c05f1d92d8ee'
          '6a5d806645909564e4795da780637c5a0073fd84'
          '9525d849129bb7b5bbe6e87040e51bccdfdacb97'
          'd3376497c6ba52ff9f7d7c9fa498964ccc9a3f45'
          '3c11405454f00c404bedf3437cc8c9d73f2383c4'
          '74a1d5f113a679823db8d28f9339472818057dd7'
          'e86e71ccc62cb870ab6f80c0201b60a980601b0d'
          'b68cd777f2857e399351442b4e7b615737fae671'
          'b853c5cf05dfbdf30b11e3cf67af4af9e0dab121'
          'ec8a047664911f82acc0cc7a043ad0682096dcf1'
          '2f28cbec3dc364337a2201ca699d71d1f6c1093b'
          '02b16e1da7bbd6934534127a16397a92801d3e20'
          '25aa2b7be4bb11b44ff1eace77e66cb808a28295'
          'be4cdd60a90517d1bc6ba2565deee2969ef9a8aa'
          'b2572ba6d43708e0bb4c3bfdd08c68e5a1607e47'
          '77a219ad64e24d92926b7724ff784548faf15057'
          '8848e4de1a692be526e9abe9293fd1e3b6584f61'
          'ca88f10df2e8fc5dc5c14ec104513bd99d0eb41b'
          '7eb03fe14479691d6f45725d2c8ef8403d48ea00'
          'f127a40cd8a2efe1bd499d9b2879977ebbc26034'
          'fa0cee2d5b1641282f1c509b1841b9a04364cf24'
          'a89e1d85d0b0eac802503663c42ab9b4166140f1'
          '8dd3b864ab1273c82164977d481f044b161438f8'
          '2935b16b4c4a061d939a0a0b4ad96f6da1a42022'
          '42e0737cf33bfe068eb9965faa5be7a5f03df160'
          'fa73400be6c0729a1ffb23d320821ce491716dea'
          '5bfefcfb9ea06d322148da232b09f6eaf0758d03'
          '4e990fb464164d921faeb34a1109a3cc1312186d'
          '46ec468d1fd0ebd892e513808295f2386f8eede7'
          'a19697da996c569f824a9510dfc4852446b2cc6d'
          '07bbe3397c5fdf9ca53281a71ec9e5cd3d38c4cc'
          '2d5d77bd52242e67158db821b2b69b578067537b'
          '7fb8e4c1bace0bcb0a9e82533ab173dd9389f7bc'
          '60047cc15ab6657dbbc03921a422dbc5e19a54d4'
          '7586ff854a7b1fb23037849c80f4699e77557aac'
          'e305026a0398ecb20e8ca872f58473b8df5d6ddc'
          'a99190b6c5353b427bcf85038412efa10d73cdce'
          '5385723ebc44658c63243651233eb57bf6897424'
          '7f41064f920e76ca94015ae10f29d0a0ba2c9f57'
          'a25181d8b94db8a4dcfa4017abbef0cf999e7d76'
          'ff3f2c599b7bae387b7fada993aafa83cecd138a'
          '290e054d2aee963197c08f530835e8b371c3f26b'
          '6b861207f74d8f1fecbce8e85325d6d38bfe3db2'
          'f95d0aedefdf83f617a38a8ab723cc516d233996'
          '699a772c17f6ec396d6c6d2d03fd71eddd81356f'
          'c88fa1a116bffb992f1365cc7d29fb8a9715064f'
          '7ddd575f8a8b725b61b0a2b2eafdc7df05b71169'
          'bbe5fa43f2359ac38c98cbd83581471493c48a26'
          '1fd0d57e89ef2fe216555b9837c6e0470bf03c0e'
          '67f7e963ef0eeed4b3b65b6a8fbc3c52d9fe33d3'
          'd533b170ac8e10775d41cad96b9309ac584ec5d2'
          '77746f67d9afd0b716cc6d5e20736cdd77804f27'
          '8664168485ae3300d754d82eacda13b42880f149'
          'b31a04ccb90a31183bdedb8814c7e96e7e83ba2d'
          '459c13617018ccb9f960a080a4d7d28d5fa5ce60'
          'eebb83e6939b3cbfdf087c18a2d3e83d68c92578'
          '467298ff27a0ca8f740fd7eaba292874e0dea8c3'
          'f370b3db10b319b2939b55093e6492f65ab9d27e'
          '00575104702b77ab6476ccc9e55c5d3098c26697'
          '0e5c1035f7669be940c016adacf56f287f56de4b'
          '37eae0d1ffe05d18fa925cdcc596c25b3be867b2'
          'cf4c1efd05800aa7eae77c6563786d8a04f3b0bf'
          '3297e01bb8acb58f8f349a90f73c7523adff624c'
          'b92251f1ac9821e3417ad67cd99261cc12685bd1')

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
