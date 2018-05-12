# Maintainer: Anapopo <favoursmoe@gmail.com>

pkgname=fchinanet-sh
pkgver=0.0.4
pkgrel=1
pkgdesc="Easy to use, Lightweight ChinaNet Campus Authorization Tool"
url="https://github.com/anapopo/fchinanet.sh"
license=('MIT')
depends=('sh')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('50ad5ed96cd290fac4c7b1eb5becd3c2')

package() {
  cd ${srcdir}/FChinaNet.sh-${pkgver}
  install -Dm 755 verify.sh "${pkgdir}/usr/bin/fnet"
}
