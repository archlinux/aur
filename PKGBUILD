# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.7
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat")
sha256sums=('637a721ab92705094297bf8fa72c1eb4a4b7e227f3e3f203db8056ac6cbc71c5')

package() {
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dvm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
