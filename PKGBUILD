pkgname=google-gemini-cli
_pkgname=gemini-cli
pkgver=0.1.4
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. "
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('400eb9b5cb8ec71c8a391444b5412882001d7fa3aedff3911ad0f8145110fca0')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
