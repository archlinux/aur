# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=2.0.4
pkgrel=1
pkgdesc="A Python script that automates the process of signing Git sources via GPG"
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('gnupg' 'git' 'python' 'python-pygithub' 'python-gitpython' 'python-gnupg')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.asc::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('ddca12c7e9a565d8e11a4aa739fc46dbb230d3605a1338097036f5218440487ed099a78da5bd56f79c955412142ea7713180bdfc72d181a2056dbdc95168c95a'
            'SKIP')
# NicoHood <archlinux {cat} nicohood {dog} de>
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161')

package() {
    install -Dm755 "${pkgname}-${pkgver}/gpgit.py" "${pkgdir}/usr/bin/gpgit"
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
