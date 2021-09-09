# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat.zip")
sha256sums=('9f3823e887346a70a889f29881885292a4c00cc6983db7fe65f59df0f06ac6a1')

package() {
    unzip -o "${srcdir}/bat.zip"
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
