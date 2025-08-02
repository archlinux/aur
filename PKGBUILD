# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=qwen-code
pkgver=0.0.4_nightly.0
_pkgver=$(echo $pkgver | tr _ -)
pkgrel=1
pkgdesc="qwen-code is a coding agent that lives in digital world (fork of gemini-cli)."
arch=('x86_64')
url="https://github.com/QwenLM/qwen-code"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@qwen-code/$pkgname/-/$pkgname-$_pkgver.tgz")
sha256sums=('38718febce21f22e4b3115ff4ac958be8c78321551574f09baa418314be37aaf')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
