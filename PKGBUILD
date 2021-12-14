# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
provides=('bat-asus-battery')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat")
sha256sums=('f8bd1314538d68ee19fee6bbf39649b0ab883f0f2b4c3e19d3f21761ac607738')

package() {
    # unzip -o "${srcdir}/bat.zip"
    mv "${srcdir}/bat" "${srcdir}/bat-asus-battery"
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
}
