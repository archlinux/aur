# Maintainer: Lili1228 <aur at gramywpsl dot pl>
pkgname=86box-roms
pkgver=4.0
pkgrel=1
pkgdesc='ROMs for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('57e6e0270325fba54b7f8954251f2428d5b28b0ae90dcdd63448e24061dbe086641ca1d6350da5f195f0d47e96725a9c3797cd543d84482915f444b40a61fe90')

package() {
    cd "${srcdir}/roms-${pkgver}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
