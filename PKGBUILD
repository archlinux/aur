pkgname='pastes'
pkgver='1.1.1'
pkgrel='1'

pkgdesc='Easily access pastes.dev from the command line'

url='https://codeberg.org/maxbossing/pastes'

arch=('any')

license=('GPL2')

depends=('bash' 'curl' 'coreutils')

source=("pastes")
b2sums=('0c58d54fdc4c2ef3af0220cdd6a91b6cd06f5b1673dd2767aa05780bd466f62226e3ed67039d4f54750a08cc9c6d9b01d5fb670ae8446e607a2229e3989dc17f')

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp "${srcdir}/pastes" "${pkgdir}/usr/bin/pastes"
    chmod +x "${pkgdir}/usr/bin/pastes"
}

