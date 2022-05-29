# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.9
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/tshakalekholoane/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/tshakalekholoane/bat/releases/download/${pkgver}/bat.zip")
sha256sums=('096a69ebf67c1d8cc8b13def86c9b27dcc337da18b0693918fb10f858c210417')

package() {
    unzip -o "${srcdir}/bat.zip"
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
