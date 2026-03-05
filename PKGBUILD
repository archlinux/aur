# Maintainer: Zyno Consulting <oss at zyno dot io>
pkgname=sp2p-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Secure peer-to-peer file transfer"
arch=("x86_64" "aarch64")
url="https://sp2p.io"
license=("MIT")
provides=("sp2p")
conflicts=("sp2p")
source_x86_64=("https://github.com/zyno-io/sp2p/releases/download/v0.1.0/sp2p_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zyno-io/sp2p/releases/download/v0.1.0/sp2p_linux_arm64.tar.gz")
sha256sums_x86_64=("51b8f50a1f308de962a700cd1df15ad7cec5714d75fc7f2d1f2b1296eaa1787f")
sha256sums_aarch64=("1620c7a38fee9f61a37856533739726bb09cfb566ea46032af223ee9f37d2480")

package() {
  install -Dm755 sp2p "${pkgdir}/usr/bin/sp2p"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
