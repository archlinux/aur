# Maintainer: Alex Oleshkevich <techsupport@investerra.ch>
pkgbase=fastapi-lsp
pkgname=fastapi-lsp
pkgver=0.1.8
pkgrel=1
pkgdesc="Language server for FastAPI and Starlette"
arch=('x86_64' 'aarch64')
url="https://github.com/alex-oleshkevich/fastapi-lsp"
license=('MIT')
provides=('fastapi-lsp')
conflicts=('fastapi-lsp')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/fastapi-lsp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/fastapi-lsp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ad9a4ce362765dcc4fa6845384089d4a1975a1866f24472d0266072fadca9d67')
sha256sums_aarch64=('0f0aae8b0c605a2fcd815f4cc52278f95fc760ad3276da02b1b34a0f31bc13ed')

package() {
    install -Dm755 "${srcdir}/fastapi-lsp" "${pkgdir}/usr/bin/fastapi-lsp"
}
