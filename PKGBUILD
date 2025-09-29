pkgname=github-copilot-cli-bin
realname=copilot
pkgver=0.0.328
pkgrel=1
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal. "
arch=('x86_64')
url="https://github.com/github/copilot-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@github/$realname/-/$realname-$pkgver.tgz")
sha256sums=('e4749ff34cda21106a92c89dd446a3dcb5316db45749f8691e87706693bc3e4b')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}
