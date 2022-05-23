# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-roms
_date=20220523
pkgver=3.5
pkgrel=1
pkgdesc='ROMs for the 86Box emulator.'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/${_date}.tar.gz")
sha512sums=('56981c38af41d0b3e348a068aa9e9ae45071bbea47c00d827c15afb50734ff433993479d8c373f49e70a297ce1d8e2f20496bb42be779e9a88fcd1ddca5c6f6f')

package() {
    cd "${srcdir}/roms-${_date}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
