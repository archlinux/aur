pkgname=google-gemini-cli
_pkgname=gemini-cli
pkgver=0.1.9
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. "
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('0f995b6ecacb8a1059e8f4cca7c89008c8e17563ff67acd523bfe1cfbe8dfb83')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
