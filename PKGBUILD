# Maintainer: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname='pac-util'
pkgver=1
pkgrel=1
pkgdesc='A pacman maintenance utility'
arch=('any')
url='https://github.com/jadenPete/pac'
license=('MIT')

depends=('expac'
         'ncurses'
         'pacman-contrib')

optdepends=('trizen: AUR support'
            'yay: AUR support')

source=("https://github.com/jadenPete/pac/archive/v${pkgver}.tar.gz")
sha256sums=('bdf2ee8f79301ad7d50aae3a609e6be642ecc2036faaf026c0eb89533371a90b')

package() {
	install -D "pac-${pkgver}/pac" "${pkgdir}/usr/bin/pac"
}
