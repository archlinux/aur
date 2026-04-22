pkgname=molotov-deb
pkgver=7.5.2
pkgrel=1
pkgdesc="Molotov TV client"
arch=('x86_64')
url="https://www.molotov.tv/"
license=('unknown')
conflicts=('molotov')
depends=('at-spi2-core' 'libcups' 'gtk3' 'pango' 'alsa-lib')
source=("https://desktop-app.molotov.tv/stable/linux/x64/Molotov-x64-$pkgver.deb")
sha256sums=('0a24387fb8cdcc31e048c06fc83e5e01b041cb1528963aee7857eef6625446d6')

package() {
    tar -xf data.tar.zst -C "$pkgdir"
}
