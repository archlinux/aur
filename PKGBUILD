# Maintainer: Werner Redelius <echo d2VybmVyZnBAcG9zdGVvLmRlDQo= | base64 -d>
# https://github.com/WernerFP/Shades-of-gray-theme

_gituser=WernerFP
_gitname=Shades-of-gray-theme

pkgname=gtk-theme-shades-of-gray
pkgbase=${pkgname}

pkgver=1.1.1
pkgrel=1
pkgdesc='A dark GTK-theme (GNOME, Cinnamon, Xfce, Openbox) in 7 color variants with themes for Firefox and Thunderbird.'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL3')

conflicts=('gtk-theme-shades-of-gray')
depends=('gtk3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gtk-engines: for gtk2 themes')
makedepends=('git')

source=("https://github.com/$_gituser/$_gitname/archive/$pkgver.tar.gz")
md5sums=('ba0ecaf24267d7d4f357abbe897318ba')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  rm {LICENSE,README.md,preview_01.png}
  DESTDIR="$pkgdir/usr/share/themes"
  mkdir -p "$DESTDIR"
    mv Shades-of-gray "$DESTDIR/"
    mv Shades-of-gray-Arch "$DESTDIR/"
    mv Shades-of-gray-Cerulean "$DESTDIR/"
    mv Shades-of-gray-Firebrick "$DESTDIR/"
    mv Shades-of-gray-Harvest "$DESTDIR/"
    mv Shades-of-gray-Orient "$DESTDIR/"
    mv Shades-of-gray-Patina "$DESTDIR/"
}
