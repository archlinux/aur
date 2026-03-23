# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgname=genv
pkgver=0.2.0
pkgrel=1
pkgdesc="Track, sync, and reproduce your software environment across Linux, macOS, and WSL2."
arch=('x86_64' 'aarch64')
url="https://github.com/ks1686/genv"
license=('MIT')
source_x86_64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "./genv" "${pkgdir}/usr/bin/genv"
}
