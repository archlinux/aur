# Contributor: muhas <muhas@mail.ru>
pkgname=dscp
pkgver=0.0.2
pkgrel=1
pkgdesc="frontend for scp and ssh (dsh like)"
url="https://github.com/muhas/dscp"
license=("GPL")
depends=('openssh')
arch=('any')
source=(https://github.com/muhas/dscp/archive/${pkgver}.tar.gz)
md5sums=('3367fb1508de9b6c94b89a3760e993d3')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
}


