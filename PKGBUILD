# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=asciinema-edit
pkgver=0.0.6
pkgrel=1
pkgdesc="asciinema casts post-production tools."
url="https://github.com/cirocosta/asciinema-edit"
arch=('any')
license=('MIT')

source=("https://github.com/cirocosta/asciinema-edit/releases/download/${pkgver}/asciinema-edit_0.0.6_linux_amd64.tar.gz")
sha512sums=('d99dac29a22532b3558ae59d8dfcfe08a227d64f10de4dda3be7cd17052ff303c12745d5a46fac269a9df143feb67c28b015bbadaa6f87d6f03b39193deca9a5')

package() {
    install -Dm755 "asciinema-edit" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
