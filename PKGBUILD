pkgname=google-gemini-cli
_pkgname=gemini-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. "
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('628c3a935935d6f83a4728c04dc6e9969e5c4a7d470e9a36ba9c8e054b5e0430')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
