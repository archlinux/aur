# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('196c3a2331130c2fd256135f7e31154ee938df5f7efc79d13ffcaefa7ba84bff')
sha256sums_aarch64=('90fccb1645c73fe1967fbd0c96cc36f5b01e564efe670decfadbbf0e7cbce325')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
