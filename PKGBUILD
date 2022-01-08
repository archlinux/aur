# Maintainer: Mats Bakke <teknsl.mbk@protonmail.com>

pkgname='alacritty-xwayland'
pkgdesc='run alacritty with xwayland (#4739)'
pkgver='1.0.0'
pkgrel='1'
arch=('any')
url='https://github.com/alacritty/alacritty/issues/4739'
depends=('alacritty' 'sed')
install="${pkgname}.install"
source=("${pkgname}.hook" "${pkgname}-patch")
md5sums=('SKIP' 'SKIP')

package() {
	install -Dm 644 ${pkgname}.hook "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
	install -Dm 755 ${pkgname}-patch "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-patch"
}

