_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=3.3.1
pkgrel=2
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('5a10a1ef666e0b81374cd0609e7086023f8e148a2830ea5b5668ccf54f636ad7')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
