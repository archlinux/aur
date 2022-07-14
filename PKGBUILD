# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.11.4
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

sha256sums_x86_64=('bf8075489353f050d5839c7674f8d1f9dd98a8ede6bb3a77b5942859722b6d15')
sha256sums_arm=('f555244f872999d832ceee19a8b63f50c6df304e38f299258e0de3c6c90d7606')
sha256sums_armv6h=('f555244f872999d832ceee19a8b63f50c6df304e38f299258e0de3c6c90d7606')
sha256sums_armv7h=('f555244f872999d832ceee19a8b63f50c6df304e38f299258e0de3c6c90d7606')
sha256sums_aarch64=('d0435b00e5083a25c8e3488843fae61dd239af1283b509fa803cd843340f6367')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
