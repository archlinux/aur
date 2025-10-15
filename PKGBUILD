# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
# Maintainer: FrancyAngy <francesco@scsdc-co.org>
pkgname=dinfo
pkgver=1.2.3.002
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml, .json and html output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained")
sha256sums=('5327d469217c1141a05d50d8a9a9d765d2029e4eb5822f3ef67edd960ce0ea1f')

package() {
    install -dm755 "$pkgdir/usr/lib/dinfo"
    install -Dm755 "$srcdir/../dinfo-linux-x64-self-contained" "$pkgdir/usr/lib/dinfo/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "$pkgdir/usr/lib/dinfo/dinfo" "$pkgdir/usr/bin/dinfo"
}
