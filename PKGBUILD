# Maintainer: Anapopo <favoursmoe@gmail.com>

pkgname=fchinanet-sh
pkgver=0.0.3
pkgrel=1
pkgdesc="Easy to use, Lightweight ChinaNet Campus Authorization Tool"
url="https://github.com/anapopo/fchinanet.sh"
license=('MIT')
depends=('sh')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('af8c9510dabec06308b0028f2f00b30d')

package() {
  cd ${srcdir}/FChinaNet.sh-${pkgver}
  install -Dm 755 verify.sh "${pkgdir}/usr/bin/fnet"
}
