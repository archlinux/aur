# Maintainer:  Daniel Fichtinger <daniel@ficd.ca>

_pkgname="codebook"
pkgname="${_pkgname}-bin"
pkgver=0.2.12
pkgrel=1
pkgdesc="An unholy spellchecker for code."
arch=('x86_64' 'aarch64')
url="https://github.com/blopker/${_pkgname}"
license=("MIT")
depends=('gcc-libs' 'glibc')
provides=('codebook-lsp')
conflicts=('codebook-lsp')
source=("https://github.com/blopker/${_pkgname}/releases/download/v${pkgver}/codebook-lsp-${CARCH}-unknown-linux-musl.tar.gz")

sha256sums=('SKIP')

package() {
    install -Dm 755 "${srcdir}/codebook-lsp" -t "${pkgdir}/usr/bin/"
}
