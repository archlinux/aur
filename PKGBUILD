# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.6
pkgrel=2
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat")
sha256sums=('2324af8a848857a05c54dd6fec5eb776d2450081ec92aed164d629cd08d575f1')

package() {
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dvm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
