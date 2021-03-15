# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger at gmail dot com>
# Contriubtor: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=tilix-bin
_pkgname=tilix
pkgver=1.9.4
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="https://github.com/gnunn1/tilix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'libx11')
optdepends=('python-nautilus: for "Open Tilix Here" support in nautilus'
            'vte3-notification: for desktop notifications support'
            'vte3-tilix: for notifications, triggers and badges support'
			'libsecret: for password manager')
provides=('terminix' 'tilix')
conflicts=('terminix' 'tilix')
source=(${_pkgname}-${pkgver}.zip::https://github.com/gnunn1/tilix/releases/download/${pkgver}/${_pkgname}-${pkgver}_x86_64-linux-gnu.zip)
md5sums=('7b8e24c0cafb04b070b1167985a9d597')

package() {
	cp -ar "${_pkgname}-${pkgver}" $pkgdir/usr
}
