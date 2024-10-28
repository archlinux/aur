# Maintainer: Eikano <lcuoin@gmail.com>
# Contributor: kccat <kg.kg.gl+aur at gmail dot com>

pkgname=ttf-opposans
pkgver=20241023
pkgrel=1
pkgdesc="OPPO Sans"
arch=('any')
license=('custom')
url='https://open.oppomobile.com/new/developmentDoc/info?id=13223'

source=("https://openfs.oppomobile.com/open/oop/202410/18/62d51f494591f1a9040d83b597745911.zip")

sha256sums=('f8bef382e209a4965fe589efdb72fd6bef45a9b4fdb494e20ffa16b31cd364d5')

package() {
	cd "$srcdir/OPPO_Sans_4.0"
	install -Dm644 "OPPO Sans 4.0.ttf" "$pkgdir/usr/share/fonts/TTF/OPPO_Sans_4.0.ttf"
	install -Dm644 "OPPO Sans 4.0 License Notice.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
