# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc-bin
pkgver=7.0.2
pkgrel=1
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'arm64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
provides=('ggc')
conflicts=('ggc' 'ggc-git')
source_x86_64=("ggc-$pkgver-x86_64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_amd64.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
source_arm64=("ggc-$pkgver-arm64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_arm64.tar.gz"
              "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
b2sums_x86_64=('9175d6578617b30089746e512e747bdbcb96e841961a20ddc57a1e15411f543d305da69b0daa058fc7a5089996c8bee4789ce2763b6758efebf161e7d8a03076'
               '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')
b2sums_arm64=('ec138558ba0f4b7e96e008640f8a1b1927297472ad2f20f4290125f932682c727e083552678f0dfbbf6f1b1d087f7e8eeaae28ef13341e1f9d7387708ac0d463'
              '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')

package() {
  install -Dm755 ggc "$pkgdir/usr/bin/ggc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
