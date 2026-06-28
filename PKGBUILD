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
sha256sums_x86_64=('8dea1225e6048a8630c661c3e8a0d627b4e2156c9d2084e363dd40580de77911')
sha256sums_aarch64=('9604b0d9add93669f561b6a9c2007f9b213699d2d9a233eed3942b43d0af2feb')

package() {
    install -Dm755 "${srcdir}/fastapi-lsp" "${pkgdir}/usr/bin/fastapi-lsp"
}
