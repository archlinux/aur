# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=pacman-expire-cache
pkgver=0.2
pkgrel=1
pkgdesc="Tool for deleting old cached package files for pacman"
arch=(any)
url=http://ikn.org.uk/tool/pacman-expire-cache
license=(BSD)
makedepends=()
depends=()
source=(http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c8fc4c6e0c95d39dfe5a0cffbbc43dfb')

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install

    license_dir="$pkgdir"/usr/share/licenses/pacman-expire-cache
    install -d "$license_dir"
    install -m 644 LICENSE "$license_dir"/LICENSE
}
