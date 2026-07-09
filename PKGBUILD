# Maintainer: codeztech <alex@dinofudge.co.uk>
pkgname=awiki
pkgver=1.0.1
pkgrel=1
pkgdesc="A python-only CLI tool to search and read the Arch Wiki directly in your terminal"
arch=('any')
url="https://github.com/SmoothCdoer9981/awiki"
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SmoothCdoer9981/awiki/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d272d93aee558ff89f4847ad16e1e8a8305025c2cb954dd272dd19d54034e2f7')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/awiki" "${pkgdir}/usr/bin/awiki"
}
