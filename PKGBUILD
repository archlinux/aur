# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat")
sha256sums=('44d8db162a29900b7399cd7a5d0965510e05dbd61fee8fb6531cc7054cb4417e')

package() {
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dvm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
