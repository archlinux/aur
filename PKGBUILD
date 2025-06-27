pkgname=google-gemini-cli
_pkgname=gemini-cli
pkgver=0.1.5
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. "
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('4bf071659e4c5008bfdc17aa6592babd047cd12f79b86bd5e547bf3edb59e9c8')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
