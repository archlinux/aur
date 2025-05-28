# Maintainer: sprobie <sprobie1@gmail.com>
pkgname=mkbrr-bin
pkgver=1.12.0
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
provides=('mkbrr')
conflicts=('mkbrr')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/autobrr/mkbrr/releases/download/v${pkgver}/mkbrr_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('b2ccd12e669ec7719f1e17f5a738f17c71275aecacb7e170f3169ed12e3b2c44')

package() {
    install -Dm755 "$srcdir/usr/bin/mkbrr" "$pkgdir/usr/bin/mkbrr"
}

