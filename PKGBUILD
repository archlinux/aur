# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=pulseaudiocontrol
pkgver=1.1.4
pkgrel=1
pkgdesc="Pulseaudio command line control"
arch=('any')
url="https://github.com/YanDoroshenko/pulseaudio-control"
license=('GPL')
depends=('libpulse>=4.0' 'pulseaudio>=4.0' 'sed')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname"-"$pkgver".tar.xz")
sha256sums=('8bf79e46099411e2c8bc6e88e10103650b44b93ba323965504e3319494bb748c')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname"-"$pkgver"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}
