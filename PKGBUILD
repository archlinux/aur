# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.14
pkgrel=3
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=("x86_64")
url="https://github.com/tshakalekholoane/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("bat_$pkgver"::"https://github.com/tshakalekholoane/bat/releases/download/${pkgver}/bat")
sha256sums=('9eac11ee313c2efde9318ea425e2f94a203d3b3008fcf09b306fa135837033b9')

package() {
    mv "${srcdir}/bat_$pkgver" "${srcdir}/bat-asus-battery"
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
