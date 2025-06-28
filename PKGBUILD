pkgname=google-gemini-cli
_pkgname=gemini-cli
pkgver=0.1.7
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. "
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('7d960ff5f7332149419fd32cf483f30def1c7fe9b9ffee490b98957b8e04df32')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
