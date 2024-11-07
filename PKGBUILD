# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=themer
pkgver=6.7.0
pkgrel=1
pkgdesc="takes a set of colors and generates themes for your apps"
arch=('any')
url="https://themer.dev/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=()
sha256sums=('07fb285069f4a24cb96934700a4d368cbe358f83b62657cf303559aa4b500106')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm644 "package/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
