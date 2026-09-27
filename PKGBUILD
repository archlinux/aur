# Maintainer: Zyno Consulting <oss at zyno dot io>
pkgname=sp2p-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Secure peer-to-peer file transfer"
arch=('x86_64' 'aarch64')
url="https://sp2p.io"
license=('MIT')
provides=('sp2p')
conflicts=('sp2p')
source_x86_64=("https://github.com/zyno-io/sp2p/releases/download/v0.6.1/sp2p_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zyno-io/sp2p/releases/download/v0.6.1/sp2p_linux_arm64.tar.gz")
sha256sums_x86_64=('3f70fc7c770990b7ab7751120da4634ed9ee02db442d71abfd7f54840936d363')
sha256sums_aarch64=('c0fbbc08c2035bb43ee8c95cdf57188753a867215b33902010de9072033c4c4f')

package() {
  install -Dm755 sp2p "${pkgdir}/usr/bin/sp2p"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
