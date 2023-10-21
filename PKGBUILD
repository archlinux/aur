pkgname=kwin-scripts-truely-maximized
pkgver=1.0.1
pkgrel=1
pkgdesc="A Kwin script that truely maximizes your screen space by hiding the title bars of your windows when they are maximized."
arch=('any')
url='https://github.com/fin444/truely-maximized'
license=("GPL")
depends=('kwin')
source=("$url/releases/download/v$pkgver/truely-maximized-$pkgver.kwinscript")
sha512sums=('f0c9edd2d0f90b534bd1f71f4297c7e728146504c077fd7b25b37e11fab9f510351b04a319ced9cb8b0cb5970a7eb9cb134c4d6a566bad907742681089df326f')

package() {
	plasmapkg2 -t kwinscript -p $pkgdir/usr/share/kwin/scripts -i truely-maximized-$pkgver.kwinscript
}
