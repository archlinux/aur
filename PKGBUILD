# Maintainer: Anapopo <favoursmoe@gmail.com>

pkgname=fchinanet-sh
pkgver=0.0.2
pkgrel=1
pkgdesc="Easy to use, Lightweight ChinaNet Campus Authorization Tool"
url="https://github.com/anapopo/fchinanet.sh"
license=('MIT')
depends=('sh')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('0d8be25ce194f576c5887686d68ba3a1')

package() {
  cd ${srcdir}/FChinaNet.sh-${pkgver}
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 verify.sh "${pkgdir}/usr/bin/fnet"
}
