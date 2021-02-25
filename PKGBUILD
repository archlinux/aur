pkgname=germanium
pkgver=0.2.0
pkgrel=1
pkgdesc='Generate image from source code'
arch=('x86_64')
url="https://github.com/matsuyoshi30/germanium"
makedepends=()
source=("$url/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tar.gz")
md5sums=('0a6ab1ee15c1d92943fb450720281ec2')

package() {
  install -Dm755 ./${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
