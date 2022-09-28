# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=linkerd-bin
pkgver=2.12.1
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

sha256sums_x86_64=('b4958ab065ecb87baf4c62ef042afc938f80cb8d0558b9759917c46a74f1fd82')
sha256sums_arm=('dffbe2d94e4c519109b34038c9a52fd251b504d748bf875c829ebd2997a7637f')
sha256sums_armv6h=('dffbe2d94e4c519109b34038c9a52fd251b504d748bf875c829ebd2997a7637f')
sha256sums_armv7h=('dffbe2d94e4c519109b34038c9a52fd251b504d748bf875c829ebd2997a7637f')
sha256sums_aarch64=('d810b64bd885e4e3e4a9d4d03254fc843cb2e0b56a4674e2559b6485eec533ca')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
