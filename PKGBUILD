# Maintainer: plokid <910576949@qq.com>
# Contributer: thepoy <thepoy@163.com>

pkgname=fcitx5-skin-seasons
pkgver=1.0
pkgrel=1
pkgdesc='Simple style skin for fcitx5'
url='https://github.com/thep0y/fcitx5-themes'
arch=('any')
license=('custom')
depends=('fcitx5')
source=('git+https://github.com/thep0y/fcitx5-themes.git')
md5sums=('SKIP')

package() { 
	mkdir -p ${pkgdir}/usr/share/fcitx5/themes/
	mv ${srcdir}/fcitx5-themes/spring ${pkgdir}/usr/share/fcitx5/themes/
	mv ${srcdir}/fcitx5-themes/summer ${pkgdir}/usr/share/fcitx5/themes/
	mv ${srcdir}/fcitx5-themes/autumn ${pkgdir}/usr/share/fcitx5/themes/
	mv ${srcdir}/fcitx5-themes/winter ${pkgdir}/usr/share/fcitx5/themes/
	mv ${srcdir}/fcitx5-themes/green ${pkgdir}/usr/share/fcitx5/themes/
	mv ${srcdir}/fcitx5-themes/transparent-green ${pkgdir}/usr/share/fcitx5/themes/
}
