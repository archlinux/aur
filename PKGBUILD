# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ye Jingchen <ye.jingchen@gmail.com>
pkgname=capitaine-cursors
pkgver=r2
pkgrel=1
pkgdesc="An x-cursor theme inspired by macOS and based on KDE Breeze"
arch=('any')
url="https://github.com/keeferrourke/capitaine-cursors"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/keeferrourke/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('c144c2f2884b7367951aa2fa98a9982a')
sha256sums=('98aa7a0fd2593447688a6378089f8d9366a3f125976eda141bac54ded758acbd')

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/icons"
	cp -r bin/xcursors "${pkgdir}/usr/share/icons/Capitaine"

	find ${pkgdir} -type f -exec chmod 644 {} \;
}
