# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.14.2 # renovate: datasource=github-releases depName=linkerd/linkerd2
pkgrel=1
pkgdesc="Ultralight, security-first service mesh for Kubernetes. Main repo for Linkerd 2.x"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://linkerd.io/"
license=('Apache')
depends=('glibc')
conflicts=("linkerd")

source_x86_64=("linkerd-${pkgver}-x86_64::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-amd64")
source_arm=("linkerd-${pkgver}-arm::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm")
source_armv6h=("linkerd-${pkgver}-armv6h::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm")
source_armv7h=("linkerd-${pkgver}-armv7h::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm")
source_aarch64=("linkerd-${pkgver}-aarch64::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm64")

sha256sums_x86_64=('3bae278ddcd6bac1aaa48012511a3be891dcc841308e4cab5f56f62dc8131d22')
sha256sums_arm=('7ab852e8e159f65ab6888ca0dd6b6cf9a3f54941fa24a0e374f1c6813d0517f1')
sha256sums_armv6h=('7ab852e8e159f65ab6888ca0dd6b6cf9a3f54941fa24a0e374f1c6813d0517f1')
sha256sums_armv7h=('7ab852e8e159f65ab6888ca0dd6b6cf9a3f54941fa24a0e374f1c6813d0517f1')
sha256sums_aarch64=('07300820aae04e684870f205ebc992fb5226dd78c730950527d8a908e5362c86')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
