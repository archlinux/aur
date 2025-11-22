# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=kingfisher-bin
_name=kingfisher
pkgver=1.66.0
pkgrel=1
pkgdesc="Blazingly fast secret‑scanning and validation tool built in Rust. Pre-compiled."
arch=("i686" "x86_64" "aarch64")
license=("Apache-2.0")
url="https://github.com/mongodb/kingfisher"
conflicts=(kingfisher)
depends=('qt6-websockets')

source_x86_64=("${url}/releases/download/v${pkgver}/${_name}-linux-x64.tgz")
source_i686=("${url}/releases/download/v${pkgver}/${_name}-linux-x64.tgz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_name}-linux-arm64.tgz")

sha256sums_i686=('560ce2546e3acfca160e61c2d6628b6ac0b81ca24af3d699375f0a2a0b03ef9f')
sha256sums_x86_64=('560ce2546e3acfca160e61c2d6628b6ac0b81ca24af3d699375f0a2a0b03ef9f')
sha256sums_aarch64=('f4694b95a6a1aea84995b041c5b82ac39ddd4259fab137859d27664e548f9227')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_name}"
}
