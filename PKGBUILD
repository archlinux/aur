# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=pulseaudiocontrol
pkgver=1.1.3
pkgrel=1
pkgdesc="Pulseaudio command line control"
arch=('any')
url="https://github.com/YanDoroshenko/pulseaudio-control"
license=('GPL')
depends=('libpulse>=4.0' 'pulseaudio>=4.0' 'sed')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname"-"$pkgver".tar.xz")
sha256sums=('32e1dcb08fc1517e91dd008b4df2734818ea6cb37957d4b53db32aaf1853a719')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname"-"$pkgver"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}
