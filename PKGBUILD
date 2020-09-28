pkgname=kos32-sdk-bin
groups=('kos32-dev')
pkgver=0.3
pkgrel=2
pkgdesc="SDK for Kolibri OS + Toolchain by Serge."
arch=('x86_64')
license=('GPLv3')
depends=('gcc')
conflicts=('kos32-sdk' 'fasm' 'sasm')
source=("https://github.com/turbocat2001/kos32-sdk-linux/releases/download/${pkgver}-deb/kos32-sdk-${pkgver}.deb")
md5sums=('SKIP')
options=('!strip')

package() {
     cd $pkgdir
     tar -xf $srcdir/data.tar.xz
}
