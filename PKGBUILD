# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Chocopwowwa <chocopowwwa@gmail.com>
# Source: https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/ttf-roboto

pkgname=ttf-autour-one
pkgver=1
pkgrel=2
pkgdesc="A font inspired by handwritten letters on Ludwig Hohlwein posters."
url='https://fonts.google.com/specimen/Autour+One'
arch=('any')
license=('OFL')
provides=('ttf-font')
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Autour%20One")
sha256sums=('2284dc6172dc70edf6185354757a405677bc9d27581e6991eaaed5ae09050c78')

package() {
	install -Dm 644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm 644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
