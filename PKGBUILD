# Maintainer: sprobie <sprobie1@gmail.com>
pkgname=mkbrr-bin
pkgver=1.23.0
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
provides=('mkbrr')
conflicts=('mkbrr')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/autobrr/mkbrr/releases/download/v${pkgver}/mkbrr_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('35177d8acdb2001d1d61ce77ad59775a65ae10a5e227d6fbf5c619f18c1c482e')

package() {
    install -Dm755 "$srcdir/usr/bin/mkbrr" "$pkgdir/usr/bin/mkbrr"
}

