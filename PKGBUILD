# Maintainer: sprobie <sprobie1@gmail.com>
pkgname=mkbrr-bin
pkgver=1.25.0
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
provides=('mkbrr')
conflicts=('mkbrr')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/autobrr/mkbrr/releases/download/v${pkgver}/mkbrr_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('77d59910bc31da1a7c7ca1423db8597ea9877b293081cd2f03246db71be66c27')

package() {
    install -Dm755 "$srcdir/usr/bin/mkbrr" "$pkgdir/usr/bin/mkbrr"
}

