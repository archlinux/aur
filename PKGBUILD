# Maintainer: Jaryl Chng <mrciku@gmail.com>
pkgname=sleuthkit-java
pkgver=4.6.1
pkgrel=1
pkgdesc='Java dependencies for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL, custom:"IBM Public Licence", GPL2')
provides=(sleuthkit)
depends=(java-runtime sleuthkit)
makedepends=()
source=(https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.6.1/${pkgname}_${pkgver}-${pkgrel}_amd64.deb)
sha256sums=(aadc96a3ddaddeb5d76aca4072ab4a68404533f89ff15d8a13c491d077efe151)

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}