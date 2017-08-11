# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=('antu-icon-theme')
_commit=80368f22e924f1c6a91872af359bd2078f355094
pkgver=0.0.1.g${_commit:0:7}
pkgrel=1
pkgdesc="An icon theme (mainly for Plasma Desktop)"
arch=('any')
url="https://github.com/fabianalexisinostroza/Antu-icons"
license=('Custom: LIMA')
options=('!strip')
source=("${url}/archive/${_commit}.zip")
sha256sums=('5159c70333ad9f0e38c09075ca5ffd0582a5958cae6be58991d9ea78eeec7a2d')

package() {
    install -d "${pkgdir}"/usr/share/icons/Antu
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    cp -r Antu-icons-${_commit}/* ${pkgdir}/usr/share/icons/Antu
    mv "${pkgdir}"/usr/share/icons/Antu/LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    rm "${pkgdir}"/usr/share/icons/Antu/README.md
}
