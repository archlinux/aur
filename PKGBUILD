pkgname=molotov-deb
pkgver=7.1.0
pkgrel=1
pkgdesc="Molotov TV client"
arch=('x86_64')
url="https://www.molotov.tv/"
license=('unknown')
conflicts=('molotov')
depends=('at-spi2-core' 'libcups' 'gtk3' 'pango' 'alsa-lib')
source=("https://desktop-app.molotov.tv/stable/linux/x64/Molotov-x64-$pkgver.deb")
sha256sums=('cccf457e2678f318dd0cf47082a99091b63b5517d29a35eef9932f25ee567944')

package() {
    tar -xf data.tar.zst -C "$pkgdir"
}
