# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=pulseaudiocontrol
pkgver=1.1.5
pkgrel=1
pkgdesc="Pulseaudio command line control"
arch=('any')
url="https://github.com/YanDoroshenko/pulseaudio-control"
license=('GPL')
depends=('libpulse>=4.0' 'pulseaudio>=4.0' 'sed')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname"-"$pkgver".tar.xz")
sha256sums=('9a1678875e4fde5cc756ec18f4b5cf369a91be12557081f38f072ec2d8f3e7ff')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname"-"$pkgver"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}
