# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgbase=fantasque-sans-mono
pkgname=('otf-fantasque-sans-mono' 'ttf-fantasque-sans-mono')
pkgver=1.7.1
pkgrel=1
pkgdesc="A font family with a great monospaced variant for programmers."
arch=('any')
url="https://github.com/belluzj/fantasque-sans"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/belluzj/fantasque-sans/releases/download/v${pkgver}/FantasqueSansMono.tar.gz")
sha512sums=('ca1a4203d6c79a4f2cb319ba069bebe7720acf8bb32b49bea1e7573f10820b90fde1f4e566a1434e208fb7ad4a3de1e5815716ffb21c5f2e491c663b86c7b258')

package_otf-fantasque-sans-mono() {
    install -dm755 "${pkgdir}/usr/share/fonts/OTF"
    install -m644 "${srcdir}/OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF"
    install -D -m644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_ttf-fantasque-sans-mono() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -D -m644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}
