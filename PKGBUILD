_npmname=mstdn
_npmver=0.2.5
pkgname=mstdn # All lowercase
pkgver=0.2.5
pkgrel=1
pkgdesc="Tiny web-based mastodon client for your desktop"
arch=(any)
url="https://github.com/rhysd/Mstdn#readme"
license=()
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(ed5015be453f593aa209a962658e431b97721adc)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
