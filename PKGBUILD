# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=adminer-skins-hydra
pkgver=1.0.1
pkgrel=1
pkgdesc="Hydra theme for Adminer"
arch=('any')
url='https://github.com/Niyko/Hydra-Dark-Theme-for-Adminer'
license=('Apache License, Version 2.0')
depends=('adminer')
provides=('adminer-skin')
conflicts=('adminer-skin')
source=("adminer.css::https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css")
sha256sums=('da28a493071deff6cd50465f2a2062420f8167f11ca3b95e71a1ffcedb2c81df')

package() {
	install -Dm644 "${srcdir}/adminer.css" "${pkgdir}/usr/share/webapps/adminer/adminer.css"
}
