# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.12
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/tshakalekholoane/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("bat_$pkgver"::"https://github.com/tshakalekholoane/bat/releases/download/${pkgver}/bat")
sha256sums=('b52deaca4515fd35022d39ee029b54d42019ce2c8008b8f9ce79f408ec3bc5d7')

package() {
    mv "${srcdir}/bat_$pkgver" "${srcdir}/bat-asus-battery"
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
