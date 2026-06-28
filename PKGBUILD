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
sha256sums_x86_64=('dd1cc2ed75cecb0a39bc97375a50b9f42d4300e5c30d23970e179e19504932df')
sha256sums_aarch64=('d304048d64531ded07a5515662b4b1a603ad96fdaf40dcf80e2dd3b2f673590c')

package() {
    install -Dm755 "${srcdir}/fastapi-lsp" "${pkgdir}/usr/bin/fastapi-lsp"
}
