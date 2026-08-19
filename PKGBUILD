# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('23431e928f751544eef893c11d06d8889f3a8d1f59727aca0e86fc5171cffd78')
sha256sums_aarch64=('57b0c39ebde50c5f2f4a6080cac2b34ff4108c0ca4924187e0ac2d4b847212ba')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
