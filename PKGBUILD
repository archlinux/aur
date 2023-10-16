# Maintainer: Lili1228 <aur at gramywpsl dot pl>
pkgname=86box-roms
pkgver=4.0.1
pkgrel=1
pkgdesc='ROMs for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('012110b858244c9eea187b58adc0904b40721e248a69dcbe40cf03a3fc0e21c27a57b2228562fc493910f0d9402b9a3fe0f016a339a1fcbcd75cdc477e666cdb')

package() {
    cd "${srcdir}/roms-${pkgver}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
