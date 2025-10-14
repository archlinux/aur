pkgname=github-copilot-cli-bin
realname=copilot
pkgver=0.0.340
pkgrel=2
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal. "
arch=('x86_64')
url="https://github.com/github/copilot-cli"
license=('proprietary')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@github/$realname/-/$realname-$pkgver.tgz")
sha256sums=('613a516679aee2d1d56fe1f5c25adbe3de9eb26dfe22ba6b2c20e8436bd1f7cc')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}
