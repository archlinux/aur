# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('4cb6b498420c2c35f94b2ca6c4156a194f0100f1670225265b9d245e48544ed1')
sha256sums_aarch64=('f87d9c8285db69b185309b4e426915c2378f7d2d153d68c60835f039266f3f29')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
