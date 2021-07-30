# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat")
sha256sums=('70be38077d0dbd11b340f53d9905f2cf4a3f45e4fe62b831acd63929f20470b2')

package() {
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dvm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
