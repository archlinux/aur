# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=amazon-corretto-8
pkgver=8.232.09.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=8' 'java-runtime=8' 'java-environment=8')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
source=("https://d3pxv6yz143wms.cloudfront.net/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-8-amazon-corretto"
}

md5sums=('3511152bd52c867f8b550d7c8d7764aa')
