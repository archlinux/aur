pkgname=molotov-deb
pkgver=8.1.2
pkgrel=1
pkgdesc="Molotov TV client"
arch=('x86_64')
url="https://www.molotov.tv/"
license=('unknown')
conflicts=('molotov')
depends=('at-spi2-core' 'libcups' 'gtk3' 'pango' 'alsa-lib')
source=("https://desktop-app.molotov.tv/stable/linux/x64/Molotov-x64-$pkgver.deb")
sha256sums=('ba0aba5015048388a1f189e6b8c2095babb73774767b677fef7c60497e7b5a75')

package() {
    tar -xf data.tar.zst -C "$pkgdir"
}
