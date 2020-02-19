# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=amazon-corretto-11
pkgver=11.0.6.10.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=11' 'java-runtime=11' 'java-environment=11')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-11-amazon-corretto"
}

md5sums=('cfb0b142edf7ebc2f87a27405c8d39fc')
