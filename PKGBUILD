# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'arm64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
provides=('ggc')
conflicts=('ggc' 'ggc-git')
source_x86_64=("ggc-$pkgver-$CARCH.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_amd64.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
source_arm64=("ggc-$pkgver-$CARCH.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_arm64.tar.gz"
              "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
sha256sums_x86_64=('fdf8a12127a6b17bb9ed7e48e15c7d4daf1d2c08f8d5058620f22e6e45e0531e'
                   'd0e9480976c5fa8f5171284f8b1d39bb5534a801f32d25bce1fbe6424d0a522c')
sha256sums_arm64=('fdf8a12127a6b17bb9ed7e48e15c7d4daf1d2c08f8d5058620f22e6e45e0531e'
                  'd0e9480976c5fa8f5171284f8b1d39bb5534a801f32d25bce1fbe6424d0a522c')

package() {
  install -Dm755 ggc "$pkgdir/usr/bin/ggc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
