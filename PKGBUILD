# Maintainer: Alex Oleshkevich <techsupport@investerra.ch>
pkgbase=fastapi-lsp
pkgname=fastapi-lsp
pkgver=0.1.6
pkgrel=1
pkgdesc="Language server for FastAPI and Starlette"
arch=('x86_64' 'aarch64')
url="https://github.com/alex-oleshkevich/fastapi-lsp"
license=('MIT')
provides=('fastapi-lsp')
conflicts=('fastapi-lsp')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/fastapi-lsp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/fastapi-lsp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('dcf9d0ed31f34c14e96876620f30629aa79a32972bbd24f3b6ce3e14ec1d0f77')
sha256sums_aarch64=('2914bf7e359c5bf08bc9f149da5cd7ab2adbebb2c6eac3129df525d99377b7d1')

package() {
    install -Dm755 "${srcdir}/fastapi-lsp" "${pkgdir}/usr/bin/fastapi-lsp"
}
