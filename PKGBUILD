pkgname='pastes'
pkgver='1.0.0'
pkgrel='1'

pkgdesc='Easily access pastes.dev from the command line'

url='https://codeberg.org/maxbossing/pastes'

arch=('any')

license=('GPL2')

depends=('bash' 'curl' 'coreutils')

source=("pastes")
b2sums=('SKIP')

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp "${srcdir}/pastes" "${pkgdir}/usr/bin/pastes"
    chmod +x "${pkgdir}/usr/bin/pastes"
}
