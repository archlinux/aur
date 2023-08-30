# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.14.0 # renovate: datasource=github-releases depName=linkerd/linkerd2
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

sha256sums_x86_64=('3f520295020e147e4388190dc2a85a550e012da0f68905945b57e304c3940ffa')
sha256sums_arm=('a400e0a92747d902c339b051fc5196632ada0222e0901e6760361bec646e491b')
sha256sums_armv6h=('a400e0a92747d902c339b051fc5196632ada0222e0901e6760361bec646e491b')
sha256sums_armv7h=('a400e0a92747d902c339b051fc5196632ada0222e0901e6760361bec646e491b')
sha256sums_aarch64=('1719840400a5f326070616afaada0079e403a3933e47e93c1688038e26f4f007')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
