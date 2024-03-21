# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=86box-roms
pkgver=4.1.1
pkgrel=1
pkgdesc='ROMs for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c7313f7561d7ea02bbd551b5df588dde637000891af21d1c2a40df53e874f447b30a7ea82e5236418b4a27925fc41783edc3ecdd234e17722fc1e0433bf26909')

package() {
    cd "${srcdir}/roms-${pkgver}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
