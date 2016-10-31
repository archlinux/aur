# Maintainer: Pouyan Heyratpour <p.heyratpour@gmail.com>

pkgname=dia-shapes
pkgver=0.6.0
pkgrel=3
depends=('dia')
pkgdesc="Additional Shapes for Dia (diagram creation program)"
arch=('i686' 'x86_64')
url="http://dia-installer.de/diashapes/index.html"
license=('GPL2')
groups=('base-devel')
source=(http://ftp.us.debian.org/debian/pool/main/d/dia-shapes/dia-shapes_0.6.0-3_all.deb)
md5sums=('9a5ce955cbed2beb5f33288e632a3214')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
}
