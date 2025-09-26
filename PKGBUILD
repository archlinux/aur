pkgname=github-copilot-cli-bin
realname=copilot
pkgver=0.0.327
pkgrel=1
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal. "
arch=('x86_64')
url="https://github.com/github/copilot-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@github/$realname/-/$realname-$pkgver.tgz")
sha256sums=('a9eea2e5ffde66e464a3a55a23fc5f94d5710d984eded395478571654a3eacc4')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}
