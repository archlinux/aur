# Maintainer: kyndair <kyndair at gmail dot com>
pkgname=unxwb
pkgver=0.3.2
pkgrel=1
pkgdesc="Utility to unpack xwb audio archives containing either wav or xwma sound files"
arch=('i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://aluigi.altervista.org/"
license=('GPL')
source=('https://web.archive.org/web/20160309150618/http://helicoid.de/scumm/unxwb-mi.zip')
sha256sums=('f4f5d9e19f850faf62f9267a535611304c73f78ef2c23f57e9391fcbcfa5c010')

build() {
    cd "$pkgname"/
    gcc -lz unxwb.c -o unxwb
}

package() {
    install -Dm755 "${srcdir}/$pkgname/unxwb" "${pkgdir}/usr/bin/unxwb"
}
