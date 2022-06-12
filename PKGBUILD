# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/tshakalekholoane/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/tshakalekholoane/bat/releases/download/${pkgver}/bat.zip")
sha256sums=('f4465da2add99b7d196ebe1ad32c3f80eb83aece0410f761cba6f076b88b74b5')

package() {
    unzip -o "${srcdir}/bat.zip"
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
