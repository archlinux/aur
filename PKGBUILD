# Maintainer: Ista Zahn <istazahn@gmail.com>
# Source: http://junolab.org
pkgname=juno
pkgver=1.0.0
pkgrel=2
pkgdesc="IDE for Julia based on lighttable"
arch=('x86_64')
url="http://junolab.org"
license=("GPL")
depends=("julia" "nss" "alsa-lib" "desktop-file-utils" "gconf" "gtk2")
conflicts=(${pkgname}-git)
source=("https://junolab.s3.amazonaws.com/release/1.0.0/juno-linux-x64.zip")
install=juno.install

md5sums=('de3210449d95ec02e00820a0b6ef06cf')

package() {
  cp -R $srcdir "${pkgdir}/opt/"
  cd "${pkgdir}/opt/"
  rm juno-linux-x64.zip
  mv linux64 juno
  cd juno
  mv Juno juno
}

# vim:set ts=2 sw=2 et:
