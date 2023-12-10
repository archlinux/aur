# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.14.6 # renovate: datasource=github-releases depName=linkerd/linkerd2
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

sha256sums_x86_64=('7b6d74357e64f758f1e5ba512bb2518b175c74cc9d06d46cd0a4d6f58f91dbe9')
sha256sums_arm=('9261c5c20c63c45124c35e12c2e31ac2e483637e57c7d86961e9a5ef3e8a70f8')
sha256sums_armv6h=('9261c5c20c63c45124c35e12c2e31ac2e483637e57c7d86961e9a5ef3e8a70f8')
sha256sums_armv7h=('9261c5c20c63c45124c35e12c2e31ac2e483637e57c7d86961e9a5ef3e8a70f8')
sha256sums_aarch64=('186d7e49c95a01a2c4061288563d6a41b5fa3e5f5effb03bc2e6518815777166')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
