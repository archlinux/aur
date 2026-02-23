# Maintainer: <agustinballesteros04@gmail.com>
pkgname=llmfit
pkgver=0.3.8
pkgrel=1
pkgdesc="CLI tool to tell which LLM models will run best on your hardware"
arch=('x86_64')
url="https://github.com/AlexsJones/llmfit"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}-linux.tar.gz::https://github.com/AlexsJones/llmfit/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz
")
sha256sums=('e6a51aadfa192f09c594d8f94f6f6a7590269b564900184f0ef2862bc0228846')

package() {
  cd "${srcdir}/llmfit-v${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 llmfit "$pkgdir/usr/bin/llmfit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
