pkgname=molotov-deb
pkgver=7.2.0
pkgrel=1
pkgdesc="Molotov TV client"
arch=('x86_64')
url="https://www.molotov.tv/"
license=('unknown')
conflicts=('molotov')
depends=('at-spi2-core' 'libcups' 'gtk3' 'pango' 'alsa-lib')
source=("https://desktop-app.molotov.tv/stable/linux/x64/Molotov-x64-$pkgver.deb")
sha256sums=('2eef94a2db05efa870a040008433089c48e51e6d92ef24f200224a377548061b')

package() {
    tar -xf data.tar.zst -C "$pkgdir"
}
