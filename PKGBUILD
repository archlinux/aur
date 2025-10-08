pkgname=github-copilot-cli-bin
realname=copilot
pkgver=0.0.336
pkgrel=1
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal. "
arch=('x86_64')
url="https://github.com/github/copilot-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@github/$realname/-/$realname-$pkgver.tgz")
sha256sums=('9d72e55f5c24dee1cf817f603c3881dfe980b8ca04df3452feb8a93a016eb2df')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}
