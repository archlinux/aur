# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kwt
pkgdesc="Kubernetes Workstation Tools CLI"
pkgver=0.0.8
pkgrel=1
url="https://carvel.dev/kwt"
arch=(x86_64 aarch64)
license=(Apache)
provides=(kwt)
conflicts=(kwt kwt-bin kwt-git carvel-tools)

source_x86_64=(
    kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64
)
sha256sums_x86_64=('1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87')
sha256sums_aarch64=('7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f')
source_aarch64=(
    kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64
)
package() {
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt"
}
