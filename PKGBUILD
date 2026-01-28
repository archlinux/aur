# Maintainer: bodhi.zazen <bodhi.zazen@proton.me>
pkgname=display-dhammapada
pkgver=2.0
pkgrel=1
pkgdesc="display-dhammapada"
arch=('any')
license=('GPLv3')
url="https://gitlab.com/bodhi.zazen/display-dhammapada"
depends=('fortune-mod-dhammapada-1.0' "bash")
source=("dhammapada.about" "dhammapada.m.about" "dhammapada.de.about" "dhammapada.pl.about" "display-dhammapada" "display-dhammapada.1.gz")

package() {
    # Create the destination directory
    install -d "${pkgdir}/usr/share/display-dhammapada/"
    install -d "${pkgdir}/usr/bin/"

    # Copy the source file to the destination
    install -m 644 "${srcdir}/dhammapada.about" "${pkgdir}/usr/share/display-dhammapada/dhammapada.about"
    install -m 644 "${srcdir}/dhammapada.m.about" "${pkgdir}/usr/share/display-dhammapada/dhammapada.m.about"
    install -m 644 "${srcdir}/dhammapada.de.about" "${pkgdir}/usr/share/display-dhammapada/dhammapada.de.about"
    install -m 644 "${srcdir}/dhammapada.pl.about" "${pkgdir}/usr/share/display-dhammapada/dhammapada.pl.about"
    install -Dm755 "${srcdir}/display-dhammapada" "${pkgdir}/usr/bin/display-dhammapada"
    install -Dm644 "${srcdir}/display-dhammapada.1.gz" "${pkgdir}/usr/share/man/man1/display-dhammapada.1.gz"
}

sha256sums=('55aed3bd5a0a80ecff5a6e5a65b5e9d579bbf600706856e83895b02fba539a7f'
            '2a67fe3c801483f5885342f34ed843fd7dd11100285a8eb38015187eab4e5245'
            'cd6dd5f178eab774f7caf55f72747ca6cf9d0be98c74f725acc883f687a31a8f'
            '0aec40c21d9be7c384f8250e371b39b025a00dde62d8a7b3b5fce5f35156112c'
            '849ad64a9ad040eff24395fe9dc49bf770262bfadd52253b9ef1512311aec547'
            'cfc7393d1c2319104e8b0740f88384c8927276300b7828d3a2f2b35d7fc9887f')
