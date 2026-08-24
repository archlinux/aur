# Maintainer: Zyno Consulting <oss at zyno dot io>
pkgname=sp2p-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Secure peer-to-peer file transfer"
arch=('x86_64' 'aarch64')
url="https://sp2p.io"
license=('MIT')
provides=('sp2p')
conflicts=('sp2p')
source_x86_64=("https://github.com/zyno-io/sp2p/releases/download/v0.3.0/sp2p_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zyno-io/sp2p/releases/download/v0.3.0/sp2p_linux_arm64.tar.gz")
sha256sums_x86_64=('b8b3aeae1f002bc8079c6069f6e9a5417216a2a8e7c1a918197e25730b16d960')
sha256sums_aarch64=('de30ce9e91dd9aac4ad3d9e9cfb2defcc8cfc2f07bc08d8341fbe7c56376e4bf')

package() {
  install -Dm755 sp2p "${pkgdir}/usr/bin/sp2p"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
