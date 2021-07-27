# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.8
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat")
sha256sums=('5b1f6f6bdd0a349828a76326fcab2198dc7626cd61385874e5cc2e4b857ba6ae')

package() {
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dvm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
