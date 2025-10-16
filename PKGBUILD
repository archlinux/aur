# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc-bin
pkgver=7.0.3
pkgrel=1
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'aarch64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
provides=('ggc')
conflicts=('ggc' 'ggc-git')
source_x86_64=("ggc-$pkgver-x86_64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_amd64.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
source_aarch64=("ggc-$pkgver-arm64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_arm64.tar.gz"
              "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
b2sums_x86_64=('6243e0ca8b0bc98e02463bb3f5be437c79fec3fdc87e06750655cf2c082cc6dd0932c0d8d6b458da4dc8d63bf9b5151450da571271156f00ff29e43a399bc169'
               '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')
b2sums_aarch64=('bbff548a304d07d9e9986564768b6056cb244d51628f8d8d72b1fb664d3b5c5438e409d3914937396a3c9c6899dd20a2bc824f7d90c00896a224b71ac2e8fe5a'
              '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')

package() {
  install -Dm755 ggc "$pkgdir/usr/bin/ggc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
