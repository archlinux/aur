# Maintainer: <agustinballesteros04@gmail.com>
pkgname=llmfit
pkgver=0.4.5
pkgrel=1
pkgdesc="CLI tool to tell which LLM models will run best on your hardware"
arch=('x86_64')
url="https://github.com/AlexsJones/llmfit"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}-linux.tar.gz::https://github.com/AlexsJones/llmfit/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz
")
sha256sums=('34cabf0c9fd8422e34220e2de1a6f476ef6abdc114fef9a6be85ef31973d53bc')


package() {
  cd "${srcdir}/llmfit-v${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 llmfit "$pkgdir/usr/bin/llmfit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
