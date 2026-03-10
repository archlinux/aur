# Maintainer: Zyno Consulting <oss at zyno dot io>
pkgname=sp2p-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Secure peer-to-peer file transfer"
arch=("x86_64" "aarch64")
url="https://sp2p.io"
license=("MIT")
provides=("sp2p")
conflicts=("sp2p")
source_x86_64=("https://github.com/zyno-io/sp2p/releases/download/v0.2.0/sp2p_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zyno-io/sp2p/releases/download/v0.2.0/sp2p_linux_arm64.tar.gz")
sha256sums_x86_64=("464415c154a953257799718c18bba42914490715d3c1f4e331c3dae81647a501")
sha256sums_aarch64=("c80e68e9660fb590643b7cf06a0477d8e605963e50ff47f78647df23f85f0f19")

package() {
  install -Dm755 sp2p "${pkgdir}/usr/bin/sp2p"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
