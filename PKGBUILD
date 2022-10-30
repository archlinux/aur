# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.11
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/tshakalekholoane/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("bat_$pkgver"::"https://github.com/tshakalekholoane/bat/releases/download/${pkgver}/bat")
sha256sums=('67fd33adb575b2fd01e81b4a6a3d2f0bc43b769ea91c49ea7bc99195b0bdc606')

package() {
    mv "${srcdir}/bat_$pkgver" "${srcdir}/bat-asus-battery"
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
