# Maintainer:CTech <ctech.exe@gmail.com>

pkgname=flatabulous
pkgver=15.04.1
pkgrel=1
pkgdesc="This is a Flat theme for Ubuntu and other Gnome based Linux Systems."
arch=('any')
url="https://blog.anmoljagetia.me/flatabulous-ubuntu-theme/"
license=('MIT')
depends=('gtk3')
source=("$pkgname-pkgver::https://github.com/anmoljagetia/Flatabulous/releases/download/15.04.1/Flatabulous-Theme.deb")
sha256sums=('bdfc94f4329c256dcfb0ab1ae7e577e0670dfecaae80e7b4e6187eddbd2db1fb')

package() {
	msg2 "Extracting data.tar.gz"
	bsdtar -zxf data.tar.gz -C "$pkgdir"
}
