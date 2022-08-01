# Maintainer: oscareczek <at gmail dot com>
pkgname=86box-roms
pkgver=3.7
pkgrel=1
pkgdesc='ROMs for the 86Box emulator.'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('23cfcd5e060f3528ba96982e0bb6b807eb47554d13840ed6610c82d2ff84f33d02c9d9582aff8ceffc2013c5f59956c2f5273e648b9b7abe68581083100d86d3')

package() {
    cd "${srcdir}/roms-${pkgver}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
