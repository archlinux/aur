# Maintainer: Pouyan Heyratpour <p.heyratpour@gmail.com>

pkgname=dia-shapes
pkgver=0.3.0
pkgrel=1
pkgdesc="Shapes Installer for Dia (diagram creation program)"
arch=('x86_64')
url="http://dia-installer.de/diashapes/index.html"
license=('GPL2')
groups=('base-devel')
depends=()
source=(http://netix.dl.sourceforge.net/project/dia-installer/diashapes/0.3.0/diashapes_0.3.0-1_amd64.deb)
md5sums=('786655b65ccebc7b2290bd4c3bf2d65b')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
