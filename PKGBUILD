# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xcursor-simpleandsoft
pkgver=0.2
pkgrel=9
pkgdesc="A simple and soft X cursor theme"
arch=('any')
url="https://store.kde.org/p/999946/"
#url="https://www.gnome-look.org/p/999946/"
license=('GPL')
# https://pkgbuild.com/~kkeen/sources/28427-simpleandsoft-0.2.tar.gz
source=("https://distribute.kde.org/khotnewstuff/mousethemes/downloads/28427-simpleandsoft-$pkgver.tar.gz"
	index.theme)
sha256sums=('d55e2e3c60544a66eab492b818e40b605a0516fe22096456c3907710bd8a8297'
            '2f410b3699a9ed2b49f6e13bc9958e7a6d91045f33e59780c24ae76b7c0c2ec1')

package() {
  mkdir -p "$pkgdir/usr/share/icons/Simple-and-Soft"
  cp -R "$srcdir/simpleandsoft/cursors" \
	"$pkgdir/usr/share/icons/Simple-and-Soft/cursors"
  install -Dm644 "$srcdir/index.theme" \
	"$pkgdir/usr/share/icons/Simple-and-Soft/index.theme"
}
