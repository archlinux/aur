# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=themer
pkgver=6.0.0
pkgrel=1
pkgdesc="takes a set of colors and generates themes for your apps"
arch=('any')
url="https://themer.dev/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=()
sha256sums=('c07c117e03237d9f9e0c5bc8220c0328172504ef1e5911a9a64cd5953fd626e7')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm644 "package/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
