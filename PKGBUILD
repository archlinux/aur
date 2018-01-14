# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=pacman-expire-cache
pkgver=0.1
pkgrel=1
pkgdesc="Tool for deleting old cached package files for pacman"
arch=(any)
url=http://ikn.org.uk/pacman-expire-cache
license=(BSD)
makedepends=()
depends=()
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9d78101778213dc27825106d9ad52146')

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install

    license_dir="$pkgdir"/usr/share/licenses/pacman-expire-cache
    install -d "$license_dir"
    install -m 644 LICENSE "$license_dir"/LICENSE
}
