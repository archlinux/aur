# Maintainer: shmilee <shmilee.zju@gmail.com>

_npmname=hexo
pkgname=nodejs-hexo
pkgver=2.8.3
pkgrel=1
pkgdesc="A fast, simple & powerful blog framework, powered by Node.js."
arch=('any')
url="http://hexo.io"
license=('MIT')
depends=('nodejs')
options=(!strip)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -dm755 "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
