# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.11.2
pkgrel=1
pkgdesc="Ultralight, security-first service mesh for Kubernetes. Main repo for Linkerd 2.x"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://linkerd.io/"
license=('Apache')
depends=('glibc')

source_x86_64=("linkerd-x86_64::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-amd64")
source_arm=("linkerd-arm::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm")
source_armv6h=("linkerd-armv6h::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm")
source_armv7h=("linkerd-armv7h::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm")
source_aarch64=("linkerd-aarch64::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-arm64")

sha256sums_x86_64=('269d2f1ca468ac67f05bcfeb3524e8203dbc003643a4b003d1001acfc17ff7d9')
sha256sums_arm=('5c0346b298c3f989b425e54f48dd13ef2d83f241abc1a88f7e415d4f1f15fcef')
sha256sums_armv6h=('5c0346b298c3f989b425e54f48dd13ef2d83f241abc1a88f7e415d4f1f15fcef')
sha256sums_armv7h=('5c0346b298c3f989b425e54f48dd13ef2d83f241abc1a88f7e415d4f1f15fcef')
sha256sums_aarch64=('5f596a0bb1aaa8fc0c3e7bcf442d242cf06817951dcc47ac022b819b20ae411e')

package() {
    install -Dm755 linkerd-${arch} "${pkgdir}/usr/bin/linkerd"
}
