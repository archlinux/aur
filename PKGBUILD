# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=lightdm-webkit-theme-material-git
pkgver=20151117
pkgrel=1
pkgdesc="A material design LightDM theme"

arch=('any')
url="https://github.com/artur9010/lightdm-webkit-material"
license='WTFPL'
depends=('lightdm-webkit2-greeter')
makedepends=('git')
source=('git+https://github.com/artur9010/lightdm-webkit-material.git')
md5sums=('SKIP')

package() {
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material"
	cp -r "$srcdir/lightdm-webkit-material/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material/"
}
