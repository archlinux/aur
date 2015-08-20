# Maintainer: Ista Zahn <istazahn@gmail.com>
# Source: http://junolab.org
pkgname=juno
pkgver=1.0.2
pkgrel=0
pkgdesc="IDE for Julia based on lighttable"
arch=('x86_64')
url="http://junolab.org"
license=("GPL")
depends=("julia" "nss" "alsa-lib" "desktop-file-utils" "gconf" "gtk2")
conflicts=(${pkgname}-git)
source=("https://junolab.s3.amazonaws.com/release/1.0.2/juno-linux-x64.zip")
install=juno.install

md5sums=('4217aa28b3c11c5c7eaabc2f1368e3fa')

package() {
  cp -R $srcdir "${pkgdir}/opt/"
  cd "${pkgdir}/opt/"
  rm juno-linux-x64.zip
  mv juno-linux64 juno
  cd juno
  mv Juno juno
}
