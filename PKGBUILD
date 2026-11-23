# Maintainer: sprobie <sprobie1@gmail.com>
pkgname=mkbrr-bin
pkgver=1.28.0
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
provides=('mkbrr')
conflicts=('mkbrr')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/autobrr/mkbrr/releases/download/v${pkgver}/mkbrr_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('ca2cc2021069465286b20c6ad5a6813d0f83954eca08061d803248cb81d4b804')

package() {
    install -Dm755 "$srcdir/usr/bin/mkbrr" "$pkgdir/usr/bin/mkbrr"
}

