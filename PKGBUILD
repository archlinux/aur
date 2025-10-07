pkgname=github-copilot-cli-bin
realname=copilot
pkgver=0.0.335
pkgrel=1
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal. "
arch=('x86_64')
url="https://github.com/github/copilot-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@github/$realname/-/$realname-$pkgver.tgz")
sha256sums=('21f053840ce1dd41fa0c648a3d2163418e7d5d671ffde7a59fd9dca73560862b')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}
