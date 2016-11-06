# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=pulseaudiocontrol
pkgver=1.1.1
pkgrel=1
pkgdesc="Pulseaudio command line control"
arch=('any')
url="https://github.com/YanDoroshenko/pulseaudio-control"
license=('GPL')
depends=('libpulse>=4.0' 'pulseaudio>=4.0' 'sed')
provides=('pulseaudio-ctl' 'pulseaudio_ctl')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname"-"$pkgver".tar.xz")
sha256sums=('378f508fad45100bc5f6deba7bf600dca0b66a2f24acce35b85e504c4da961a6')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname"-"$pkgver"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}
