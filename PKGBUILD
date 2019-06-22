# Maintainer: Murat Çileli <murat.cileli@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

_pkgname=adwaita-creamy
pkgname=$_pkgname-gtk-theme
pkgver=3.24.9
pkgrel=1
pkgdesc="Refreshed new Adwaita theme with creamy colors and minor changes."
url="https://github.com/murat-cileli/$_pkgname"
arch=('any')
license=('MIT')
source=("https://github.com/murat-cileli/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('a370eab23b46b54188f7f5777af368712fe393f7c4e0b7b02386b9312100f8c6')

package() {
    cd $_pkgname-$pkgver
    find gtk-2.0 gtk-3.0 index.theme -type f -exec \
        install -Dm644 {} "$pkgdir/usr/share/themes/$_pkgname/{}" \;
}
