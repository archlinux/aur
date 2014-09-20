pkgname=moonshine
pkgver=0.0.11
pkgrel=1

pkgdesc="A lightweight Lua VM for the browser"
url="http://moonshinejs.org"
arch=('any')
license=('GPL3')

depends=('lua' 'nodejs')

source=(http://registry.npmjs.org/moonshine/-/moonshine-$pkgver.tgz)

noextract=(moonshine-$pkgver.tgz)

sha1sums=(ae822c99c67974e323c98607cc3caef0b2d5f6ad)

package() {
	npm install -g --prefix "$pkgdir"/usr moonshine-$pkgver.tgz
}
