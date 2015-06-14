# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
pkgname=gimp-ultimate-web-gradients
pkgver=1
pkgrel=1
pkgdesc="The complete 130 Ultimate Web 2.0 Gradients for Gimp!"
arch=('i686' 'x86_64')
url="http://gimp-tutorials.net/"
license=('GPL')
depends=('gimp>2.4')
makedepends=('unzip')
source=("http://gimp-tutorials.net/files/130-UltimateWeb2-0-Gradients-for-Gimp.zip")
build() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/gimp/2.0/gradients || return 1
  install -Dm644 gradients/* ${pkgdir}/usr/share/gimp/2.0/gradients/ || return 1
  install -dm755 ${pkgdir}/usr/share/${pkgname} || return 1
  install -Dm644 {130-UltimateWeb2.0Gradients.xcf,130-UltimateWeb20-Gradients-for-Gimp.png,README.txt} \
	  ${pkgdir}/usr/share/${pkgname}/ || return 1

}
md5sums=('13e560f14898042b30f8a71212400089')
