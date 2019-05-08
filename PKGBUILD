# Maintainer: Murat Çileli <murat.cileli@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

_pkgname=adwaita-creamy
pkgname=$_pkgname-gtk-theme
pkgver=3.24.8
pkgrel=2
pkgdesc="Refreshed new Adwaita theme with creamy colors and minor changes."
url="https://github.com/murat-cileli/$_pkgname"
arch=('any')
license=('MIT')
source=("https://github.com/murat-cileli/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('1a90d1c117b4b2c5e1d877288ace89dd269caef16038c611fa50fa245f7c1279')

package() {
    cd $_pkgname-$pkgver
    find gtk-2.0 gtk-3.0 index.theme -type f -exec \
        install -Dm644 {} "$pkgdir/usr/share/themes/$_pkgname/{}" \;
}
