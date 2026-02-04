pkgname=po-llm-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Translate PO files using LLM"
arch=('x86_64')
url="https://github.com/Abab-bk/po-llm"
license=('MIT')
depends=('glibc')
provides=('po-llm')
conflicts=('po-llm')

source=(
  "https://github.com/Abab-bk/po-llm/releases/download/v${pkgver}/po-llm-x86_64-unknown-linux-gnu.tar.xz"
)

sha256sums=('6a5e0bd7ddac15a087ab1657ffb7e66325f2ab14e05be9acf9472305b5893939')

package() {
  install -Dm755 po-llm "$pkgdir/usr/bin/po-llm"
}
