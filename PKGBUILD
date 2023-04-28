# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.13.2
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

sha256sums_x86_64=('c8894c7890690e4bfd99c46f65def67314b9579bda5f69aac717d9216e506016')
sha256sums_arm=('47da7b0d6f743c3bbf5bb04a658cafd62d0cd13722ab5fa8f3caed33a63ea73b')
sha256sums_armv6h=('47da7b0d6f743c3bbf5bb04a658cafd62d0cd13722ab5fa8f3caed33a63ea73b')
sha256sums_armv7h=('47da7b0d6f743c3bbf5bb04a658cafd62d0cd13722ab5fa8f3caed33a63ea73b')
sha256sums_aarch64=('0378baa029490d120ad655d12329822468b3f39ee1df20a72cbd56f01835c1e4')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
