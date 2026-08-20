# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('29db2fa828ebcd9be996be6e5432b4a6ba294c3a183c6e0d29b6a345760fc953')
sha256sums_aarch64=('22d44d8cbbcd19e2564b37b458e84e697d857e24b16297ed09e66ef395ee979e')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
