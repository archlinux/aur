# Maintainer:

# options - defaults
if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=3.1.0}

# basic info
_pkgname="mapton"
_snapname="$_pkgname"
pkgname="$_pkgname-latest-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc="Some kind of map application"
#_url="https://mapton.org"
#_url="https://github.com/trixon/mapton"
url="https://snapcraft.io/_snapname"
arch=('x86_64')
license=('Apache')

# update version
case "${_autoupdate::1}" in
  't'|'y'|'1')
    _response=$(
      curl -H 'Snap-Device-Series: 16' --no-progress-meter "http://api.snapcraft.io/v2/snaps/info/$_snapname" \
        | sed 's@,@,\n@g'
    )

    _dl_url=$(
      printf '%s' "$_response" \
        | grep '"url"' \
        | sed -E 's@^"url":"(https:.*\.snap)".*$@\1@'
    )

    _pkgver_new=$(
      printf '%s' "$_response" \
        | grep '"version"' \
        | sed -E 's@^"version":"([0-9]+\.[0-9]+\.[0-9]+)".*$@\1@'
    )

    # sha3-384 checksum
    _cksum=$(
      printf '%s' "$_response" \
        | grep '"sha3-384"' \
        | sed -E 's@^"sha3-384":"([a-f0-9]+)".*$@\1@'
    )

    _filename="$_pkgname-$_pkgver_new.snap"

    # update _pkgver
    if [ x"$_pkgver" != x"$_pkgver_new" ] ; then
      _pkgver="$_pkgver_new"
      sed -Ei "s@^(\s*: \\\$\{_pkgver):=[0-9]+.*\}\$@\1:=$_pkgver}@" "$startdir/PKGBUILD"
    fi

    pkgver() {
      printf '%s' "$_pkgver"
    }
    ;;
esac

depends=()
makedepends=(
  'sha3sum'
  'squashfs-tools'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")
fi

source=(
  "$_filename"::"$_dl_url"
)
sha256sums=(
  'SKIP'
)

prepare() {
  # check upstream sha3-384sum
  printf '%s  %s' "$_cksum" "$_filename" | sha3-384sum -c

  # unpack
  mkdir -p "$_pkgname-$_pkgver"
  unsquashfs -q -n -f -d "$_pkgname-$_pkgver/" "$_filename"

  # exec script
  sed -Ei \
    -e 's@(\s+DEFAULT_USERDIR_ROOT)=\$\{SNAP_USER_COMMON\}/\.mapton$@\1="$XDG_CONFIG_HOME/mapton"@' \
    -e 's@(\s+DEFAULT_CACHEDIR_ROOT)=\$\{SNAP_USER_COMMON\}/\.cache/mapton@\1="$XDG_CACHE_HOME/mapton"@' \
    "$_pkgname-$_pkgver/$_pkgname/bin/$_snapname"

  # .desktop
  mv "$_pkgname-$_pkgver/meta/gui/$_snapname.desktop" "$srcdir/$_pkgname.desktop"
  sed -i \
    -e 's@${SNAP}/meta/gui/icon.png@'"${_pkgname}"'@g' \
    "$srcdir/$_pkgname.desktop"

  # icon
  mv "$_pkgname-$_pkgver/meta/gui/icon.png" "$srcdir/"

  # unnecessary files
  rm -r "$_pkgname-$_pkgver"/{meta/,snap/}
}

package() {
  # opt
  install -d "$pkgdir/opt/$_pkgname"
  mv "$srcdir/$_pkgname-$pkgver/$_pkgname"/* "$pkgdir/opt/$_pkgname/"

  # symlink
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/bin/$_snapname" "$pkgdir/usr/bin/$_pkgname"

  # icons
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

  # .desktop
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
