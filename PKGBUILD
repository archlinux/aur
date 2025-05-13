pkgname=linker-cli
pkgver=0.1.5
pkgrel=1
pkgdesc="Link manager from the terminal"
arch=('x86_64')
url="https://github.com/ChristianRegueiro/linker"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChristianRegueiro/linker/releases/download/$pkgver/linker-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7c3663843a405f98c27d11311158804d134751d6b75cbe7e5cc21e67a5a86b59')

package() {
  cd release

  # Si dentro hay un solo archivo llamado linker:
  install -Dm755 linker "$pkgdir/usr/bin/linker-cli"
}
