# Maintainer: Murat Çileli <murat.cileli@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

_pkgname=adwaita-creamy
pkgname=$_pkgname-gtk-theme
pkgver=3.24.10
pkgrel=1
pkgdesc="Refreshed new Adwaita theme with creamy colors and minor changes."
url="https://github.com/murat-cileli/$_pkgname"
arch=('any')
license=('MIT')
source=("https://github.com/murat-cileli/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('7283c24ca62bf7cd2f3792d5d9868419acae78e1728778c39f7f17633a1bcb32')

package() {
    cd $_pkgname-$pkgver
    find gtk-2.0 gtk-3.0 index.theme -type f -exec \
        install -Dm644 {} "$pkgdir/usr/share/themes/$_pkgname/{}" \;
}
