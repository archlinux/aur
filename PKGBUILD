# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=lightdm-webkit-theme-contemporary
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="Simple LightDM WebKit theme"
depends=('lightdm-webkit2-greeter')
makedepends=('git')
arch=('x86_64')
license=('GPL')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/contemporary-lightdm-webkit-theme.git')
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/lightdm-webkit/themes/contemporary/"
        cp "$srcdir/$pkgname-$pkgver/"* "$pkgdir/usr/share/lightdm-webkit/themes/contemporary/"
}
