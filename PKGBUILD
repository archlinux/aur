# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=86box-roms
pkgver=4.1
pkgrel=1
pkgdesc='ROMs for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3c579cf6252de087eae781226d955a8be26326c45ec5e6e62be36d2aa442411139d353c3f8e96839f5a12f8eb996e466dd3f3cf0c7ea39a76a42fe0412bc6b2c')

package() {
    cd "${srcdir}/roms-${pkgver}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
