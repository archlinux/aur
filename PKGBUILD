# Maintainer: Amirreza Firoozi <firoozi128.af@gmail.com>
pkgname=dist_detect
pkgver=1.8
pkgrel=1
epoch=
pkgdesc="a simple script that helps you detect your distro name easily  "
arch=('i686' 'x86_64')
url="https://Github.com/AmirrezaFiroozi/dist_detect"
license=('GPL3')
depends=('')
install=
md5sums=('SKIP')
changelog=
source=("https://github.com/AmirrezaFiroozi/dist_detect/archive/v${pkgver}.tar.gz")
noextract=()

package() {
mkdir -p $pkgname/usr/bin/
mkdir -p $pkgname/usr/share/man/man1/
cd "$srcdir"/${pkgname}-${pkgver}/
    install -Dm0755 "dist_detect_main" $pkgdir/usr/bin/dist_detect
    install -Dm0755 "dist_detect.1.gz" $pkgdir/usr/share/man/man1/dist_detect.1.gz
}

