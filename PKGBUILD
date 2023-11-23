# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.14.5 # renovate: datasource=github-releases depName=linkerd/linkerd2
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

sha256sums_x86_64=('4d841a018abfee42362dccf06e47b24d1e874eb711da906d8435a74bb11462b0')
sha256sums_arm=('1ff86a7d7cc4c20b36afa43a24a78ad56093262c540d9355353e9d19258a1021')
sha256sums_armv6h=('1ff86a7d7cc4c20b36afa43a24a78ad56093262c540d9355353e9d19258a1021')
sha256sums_armv7h=('1ff86a7d7cc4c20b36afa43a24a78ad56093262c540d9355353e9d19258a1021')
sha256sums_aarch64=('e6ba7a5a03eac81d39fbb269f6fcee92218be2e76e052a9841f270eb0a71c9f7')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
