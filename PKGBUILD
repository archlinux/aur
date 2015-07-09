# Maintainer: Bartosz Chmura <chmurli@gmail.com>
# Old Maintainer: FJ <joostef@gmail.com>

pkgname=asciiquarium
pkgver=1.1
pkgrel=3
pkgdesc="An aquarium/sea animation in ASCII art"
arch=('any')
license=('GPL')
url=("http://www.robobunny.com/projects/$pkgname/")
depends=('perl-term-animation')
optdepends=('weatherspect: A weather simulator using ASCII animations [AUR]')
source=("$pkgname.tar.gz::http://www.robobunny.com/projects/$pkgname/$pkgname.tar.gz")
sha256sums=('1b08c6613525e75e87546f4e8984ab3b33f1e922080268c749f1777d56c9d361')


package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m0755 ${srcdir}/${pkgname}_${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
