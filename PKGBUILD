# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.14.8 # renovate: datasource=github-releases depName=linkerd/linkerd2
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

sha256sums_x86_64=('76e33148bb35248ec62ffbbbc8b125fc053ff1aa3ed986bc1410e96c89006b3f')
sha256sums_arm=('7c62a9bc091d02ea8425a4dcabb0251569d40edf899d800c50a96d6b172ffa3f')
sha256sums_armv6h=('7c62a9bc091d02ea8425a4dcabb0251569d40edf899d800c50a96d6b172ffa3f')
sha256sums_armv7h=('7c62a9bc091d02ea8425a4dcabb0251569d40edf899d800c50a96d6b172ffa3f')
sha256sums_aarch64=('e258b2c655c0dae63c29bb64b886f1c9b7411e6aefdf6d74f4cc40421e3a9236')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
