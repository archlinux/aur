# Maintainer: Bernhard Landauer <oberon@manjaro.org>
pkgname=bleufear-gtk-theme
pkgver=20150105
pkgrel=1
_repo=BleuFear
_snapshot=9616a1e42ca27149c73a0ac190693f1e0dc863e0
pkgdesc="A dark GTK3-GTK2 theme with a wild streak of electric blue"
url="https://github.com/maxfierke/$_repo"
license=('GPL3')
arch=('any')
depends=('gtk-engine-murrine')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_snapshot.tar.gz")
md5sums=('f398cfb734f7d918665f0ac6b6a7e592')

package() {
	cd $_repo-$_snapshot
	mkdir -p $pkgdir/usr/share/themes/$_repo
	cp -r * $pkgdir/usr/share/themes/$_repo
}
