# Maintainer: Mats Bakke <teknsl.mbk@protonmail.com>

pkgname='alacritty-xwayland'
pkgdesc='run alacritty with xwayland (#4739)'
pkgver='1.0.0'
pkgrel='0'
arch=('any')
url='https://github.com/alacritty/alacritty/issues/4739'
depends=('alacritty' 'sed')
source=('alacritty-xwayland.hook' 'alacritty-xwayland-patch')
md5sums=('SKIP' 'SKIP')

package() {
	install -Dm644 alacritty-xwayland.hook "$pkgdir/usr/share/libalpm/hooks"
	install -Dm755 alacritty-xwayland-patch "$pkgdir/usr/share/libalpm/scripts"
}

