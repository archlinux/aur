_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=2.0.5
pkgrel=2
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('7cd17ea4e3c1989a55c1195c7f077a938f2b3f402b858225639b8425fda16397')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
