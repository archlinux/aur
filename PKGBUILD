# Maintainer: Adrian Petrescu <apetresc at gmail.com>
pkgname=termpub
pkgver=2020.12.06.1
pkgrel=1
pkgdesc="Epubreader for the terminal"
arch=(x86_64)
url="https://github.com/mdom/termpub"
license=('GPL')
depends=('python')
source=("https://github.com/mdom/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=('a014beb13d8185a6593753528e322489')


package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="$pkgdir"
}
