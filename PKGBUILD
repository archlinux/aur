# Maintainer: Zyno Consulting <oss at zyno dot io>
pkgname=sp2p-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Secure peer-to-peer file transfer"
arch=('x86_64' 'aarch64')
url="https://sp2p.io"
license=('MIT')
provides=('sp2p')
conflicts=('sp2p')
source_x86_64=("https://github.com/zyno-io/sp2p/releases/download/v0.7.5/sp2p_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zyno-io/sp2p/releases/download/v0.7.5/sp2p_linux_arm64.tar.gz")
sha256sums_x86_64=('ce317c6b305c0c1519c7e4f47f11433e607521b2d779c8a6f703f116fb8ecb76')
sha256sums_aarch64=('265596726b1cc49990d4862a6bdc4bf6cd74711bd6eb64e43065faee7a8af3ee')

package() {
  install -Dm755 sp2p "${pkgdir}/usr/bin/sp2p"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
