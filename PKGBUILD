# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=qwen-code
pkgver=0.0.5_nightly.1
_pkgver=$(echo $pkgver | tr _ -)
pkgrel=1
pkgdesc="qwen-code is a coding agent that lives in digital world (fork of gemini-cli)."
arch=('x86_64')
url="https://github.com/QwenLM/qwen-code"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@qwen-code/$pkgname/-/$pkgname-$_pkgver.tgz")
sha256sums=('8614e31432725be2fd46a6983c2af5a1a06e6c687df834ceef5fd514a56618f5')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
