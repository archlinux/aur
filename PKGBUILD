# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=vimdebug
_npmver=1.0.0
pkgname=nodejs-vim-debugger
pkgver=$_npmver
pkgrel=1
pkgdesc="node.js step by step debugging from vim"
arch=(any)
url="https://github.com/sidorares/node-vim-debugger"
license=('MIT')
depends=('vim' 'nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('2644cda7dfebb0fa84eee9c5b2f1a08cc31482e1')

package() {
  cd "$srcdir/package"
  /usr/bin/npm i -g --unsafe-perm --prefix "$pkgdir/usr"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
