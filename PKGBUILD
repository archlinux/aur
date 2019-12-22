_npmname='reveal-md'
pkgname='nodejs-reveal-md'
pkgver=3.4.2
pkgrel=2
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('15d6c4f4dfa466f47f7128355ed8ebdb79619a9792e526fd914d5e5a1b30e76d')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
