# Maintainer: sprobie <sprobie1@gmail.com>
pkgname=mkbrr-bin
pkgver=1.22.0
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
provides=('mkbrr')
conflicts=('mkbrr')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/autobrr/mkbrr/releases/download/v${pkgver}/mkbrr_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('9025712d723f816b6aa0e8ce33d302fcb5bda13d31e06a6ff6f6cf497cd9742e')

package() {
    install -Dm755 "$srcdir/usr/bin/mkbrr" "$pkgdir/usr/bin/mkbrr"
}

