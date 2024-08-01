# Maintainer: maoyaotang <292898660@ddl.com>
pkgname=collect-wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="收集好看的壁纸"
arch=('any')
url="https://gitee.com/mao-yaotang/collect-wallpapers/"
license=('MIT')
source=("git+https://gitee.com/mao-yaotang/collect-wallpapers.git")
md5sums=('SKIP')

package() {
	cd "${srcdir}/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "${srcdir}/$pkgname/wallpapers"
	install -Dm644 * -t "$pkgdir/usr/share/backgrounds/gnome"
	cd "${srcdir}/$pkgname/gnome-background-properties"
	install -Dm644 * -t "$pkgdir/usr/share/gnome-background-properties"
}
