# Maintainer: Alex Oleshkevich <techsupport@investerra.ch>
pkgbase=fastapi-lsp
pkgname=fastapi-lsp
pkgver=0.1.9
pkgrel=1
pkgdesc="Language server for FastAPI and Starlette"
arch=('x86_64' 'aarch64')
url="https://github.com/alex-oleshkevich/fastapi-lsp"
license=('MIT')
provides=('fastapi-lsp')
conflicts=('fastapi-lsp')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/fastapi-lsp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/fastapi-lsp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ffd0138ce71890bad4766fd42a81fc59e5a1eaa9991e138612eeef220cc10d59')
sha256sums_aarch64=('8d1ea03455292b66c1bbcdbaf7d92378586212b1db94b68e8bdf0a9924ca4897')

package() {
    install -Dm755 "${srcdir}/fastapi-lsp" "${pkgdir}/usr/bin/fastapi-lsp"
}
