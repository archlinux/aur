pkgname=molotov-deb
pkgver=7.4.1
pkgrel=1
pkgdesc="Molotov TV client"
arch=('x86_64')
url="https://www.molotov.tv/"
license=('unknown')
conflicts=('molotov')
depends=('at-spi2-core' 'libcups' 'gtk3' 'pango' 'alsa-lib')
source=("https://desktop-app.molotov.tv/stable/linux/x64/Molotov-x64-$pkgver.deb")
sha256sums=('366cd7cc908a25cde36bd616294158a02deb068f9063da6150553d519c40a2ad')

package() {
    tar -xf data.tar.zst -C "$pkgdir"
}
