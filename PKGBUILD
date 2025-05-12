pkgname=linker-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="Link manager from the terminal"
arch=('x86_64')
url="https://github.com/ChristianRegueiro/linker"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChristianRegueiro/linker/releases/download/v$pkgver/linker-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  cd release

  # Si dentro hay un solo archivo llamado linker:
  install -Dm755 linker "$pkgdir/usr/bin/linker-cli"
}
