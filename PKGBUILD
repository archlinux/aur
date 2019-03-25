# Maintainer: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>,
pkgname=sleuthkit-java
pkgver=4.6.5
pkgrel=1
pkgdesc='Java bindings for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL', 'custom:"IBM Public Licence"', 'GPL2')
depends=(java-runtime sleuthkit)
makedepends=()
source=(https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-${pkgver}/sleuthkit-java_${pkgver}-${pkgrel}_amd64.deb)
md5sums=('0c9705ef3c1e90b53b48fc53a522e0a2')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}