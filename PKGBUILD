# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=dmenu-term
pkgver=1.0.0
pkgrel=1
license=('MIT')
pkgdesc='dmenu as a terminal with fuzzy filter'
url='https://github.com/maximbaz/dmenu-term'
arch=('any')
provides=('dmenu')
conflicts=('dmenu')
optdepends=('fzf: fuzzy filter'
            'kitty: currently supported terminal')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('dab361685a4c3e3f54e4870ce3c34d8bb0e8aabeae504174d0c8ca6dd7cf513e'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
