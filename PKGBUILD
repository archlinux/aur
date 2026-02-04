pkgname=po-llm-bin
pkgver=0.2.0
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

sha256sums=('99f90cc2f31ce90af1d2ae35252c553b338bfb12252829f04081500a032b473b')

package() {
  install -Dm755 po-llm "$pkgdir/usr/bin/po-llm"
}
