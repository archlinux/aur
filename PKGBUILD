org=zed-industries
realname=claude-code-acp
pkgname=$realname
pkgver=0.4.5
pkgrel=1
pkgdesc="Use Claude Code from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@$org/$realname/-/$realname-$pkgver.tgz")
sha256sums=('bc37479a46b9c2f9f53136c6d8d2f29331da8735abdf203ce8f56e06e60872c3')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}
