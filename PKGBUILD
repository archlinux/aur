# Maintainer: Anapopo <favoursmoe@gmail.com>

pkgname=fchinanet-sh
pkgver=0.0.1
pkgrel=1
pkgdesc="Easy to use, Light Weight ChinaNet Campus Authorization Tool"
url="https://github.com/anapopo/fchinanet.sh"
license=('MIT')
depends=('sh')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('7485c32eb463d37a12eed707f1ea51c0')

package() {
  cd ${srcdir}/FChinaNet.sh-${pkgver}
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 verify.sh "${pkgdir}/usr/bin/fnet"
}
