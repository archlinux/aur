org=zed-industries
realname=claude-code-acp
pkgname=$realname
pkgver=0.5.5
pkgrel=1
pkgdesc="Use Claude Code from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@$org/$realname/-/$realname-$pkgver.tgz")
sha256sums=('db8eb9ceb4b4edae5657a4d43fd321b1c2e847d1a02203b5aaacd4d3b2f5ba2b')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}
