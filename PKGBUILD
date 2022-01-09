# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=adminer-skins-hydra
pkgver=1.0.2
pkgrel=1
_verhash=8070d583299a79b31a308f24972719e6bccb8456
pkgdesc="Hydra theme for Adminer"
arch=('any')
url='https://github.com/Niyko/Hydra-Dark-Theme-for-Adminer'
license=('Apache License, Version 2.0')
depends=('adminer')
provides=('adminer-skin')
conflicts=('adminer-skin')
source=("adminer.css::https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/${_verhash}/adminer.css")
sha256sums=('28eaab1d9ea75a8a8c4f191449569694306ea746f3df52a189c49d0a1bc5b74d')

package() {
	install -Dm644 "${srcdir}/adminer.css" "${pkgdir}/usr/share/webapps/adminer/adminer.css"
}
