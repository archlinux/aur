# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=qwen-code
pkgver=0.0.1_alpha.12
_pkgver=$(echo $pkgver | tr _ -)
pkgrel=1
pkgdesc="qwen-code is a coding agent that lives in digital world (fork of gemini-cli)."
arch=('x86_64')
url="https://github.com/QwenLM/qwen-code"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@qwen-code/$pkgname/-/$pkgname-$_pkgver.tgz")
sha256sums=('1f89f7f20c8278ce05dbff7b7e5bf6c1ed15385d8cb5790214a99ad261b761eb')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
