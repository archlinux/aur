# Maintainer: oscareczek <at gmail dot com>
pkgname=86box-roms
pkgver=3.11
pkgrel=1
pkgdesc='ROMs for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1be53a31a2067a078801cc552d967855e2642248c596dfbb2622900fb347f0382209514015df85525e507ae38afe7f5aa96c3fd40a61a8e310ccceb203d0228f')

package() {
    cd "${srcdir}/roms-${pkgver}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
