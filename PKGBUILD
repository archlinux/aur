# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-roms
_date=20220319
pkgver=3.3
pkgrel=2
pkgdesc='ROMs for the 86Box emulator.'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/${_date}.tar.gz")
sha512sums=('4647fe9f1690e1a0e368b6a8f10af17c15dbca8edd1bb55d83c85e1cb99dc1dbea254023d441a1fead617f4478ef19bbf051a3d1cc5e90ab79238dd3bff18f9e')

package() {
    cd "${srcdir}/roms-${_date}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
