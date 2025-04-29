# Maintainer: Bruno Oliveira crazyshare01@gmail.com
pkgname=fonts
pkgver=1.0
pkgrel=1
pkgdesc="A personal collection of fonts for use in any projects"
arch=('any')
url="https://github.com/hk3wxy/fonts"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hk3wxy/fonts/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0685762bdfe38bf64aa0d2b9ba295cb42f79c7d8') 
depends=()

package() {
    install -d "$pkgdir/usr/share/fonts/your-fonts"
    cp -r "$srcdir/fonts/"* "$pkgdir/usr/share/fonts/your-fonts/"
}
