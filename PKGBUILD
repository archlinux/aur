# Maintainer: FadeMind <fademind@gmail.com>

pkgname=k3b-l10n-frameworks
pkgver=2.9.90
pkgrel=1
pkgdesc="Language packs for k3b-frameworks"
arch=('any')
url="http://sourceforge.net/projects/k3b/"
license=('GPL')
depends=('k3b-frameworks-git')
source=("l10n.tar.xz::https://copy.com/NYodE8OczBGfVbyo?download=1")
sha256sums=('a09329d92b38c02e8d1d2b74ecea61af220834f5923593a3cb24bbabfcc28fa8')

package() {
	install -dm755 ${pkgdir}/usr/share/locale/
	cd ${srcdir}/l10n/
	cp -rf * ${pkgdir}/usr/share/locale/
}
