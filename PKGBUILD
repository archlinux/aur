# Maintainer: nbebaw <nader.bebawy@gmx.de>
pkgname=archub
pkgver=0.0.2
pkgrel=1
pkgdesc="Archub is command-line tool designed for managing packages in AUR"
arch=("any")
url="https://github.com/nbebaw/Archub"
license=('MIT')
depends=("git")
makedepends=("git")
checkdepends=("git")
source=("https://github.com/nbebaw/Archub/releases/download/v$pkgver/archub")
md5sums=("SKIP")

package() {
	install -Dm755 archub ${pkgdir}/usr/local/bin/archub
}
