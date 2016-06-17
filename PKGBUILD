# Maintainer: Gabriel Cavallo <gabrielcavallo@mail.com>
_pkgname=Arcbox
pkgname="openbox-theme-arcbox"
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple openbox theme for Arc GTK2/3 theme."
arch=('any')
url="https://github.com/gcavallo/$_pkgname"
license=('GPL3')
depends=('openbox')
optdepends=(
	'gtk-theme-arc: gtk theme'
	'arc-firefox-theme-git: firefox theme'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gcavallo/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('f4e803e2457b68fd54f1d37a961e160fec39073efdcbf6f7af00619a17ddbe0a')

package() {
	mkdir -p "$pkgdir/usr/share/themes/$_pkgname"
	tar -xf "$_pkgname-$pkgver.tar.gz" -C "$pkgdir/usr/share/themes/$_pkgname" --strip-components=1
}
