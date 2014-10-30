pkgname=moonshine
pkgver=0.1.3
pkgrel=1

pkgdesc="A lightweight Lua VM for the browser"
url="http://moonshinejs.org"
arch=('any')
license=('GPL3')

depends=('lua' 'nodejs')

source=("https://github.com/gamesys/moonshine/archive/$pkgver.tar.gz")

noextract=("$pkgver.tgz")

sha1sums=('3068f8bd95a32626dda2907792fce6bae2aaddcf')

package() {
	npm install -g --prefix "$pkgdir"/usr "$pkgver.tar.gz"
}
