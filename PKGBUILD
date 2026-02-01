pkgname=po-llm-bin
pkgver=0.1.0
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

sha256sums=('aafe6780e0d7af3b909e321b8ece580d152aaa84e9987c38f6ef160cfbe5103b')

package() {
  install -Dm755 po-llm "$pkgdir/usr/bin/po-llm"
}
