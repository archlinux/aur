# Maintainer: Pierre Killy <myFirstName dot myLastNAme at gmail dot com>

pkgname=termshot
pkgver="1.2"
pkgrel=1
pkgdesc="Turns a cli command's output into a screenshot including colors and interactive text"
arch=('any')
url="https://github.com/pierrekilly/shell-utils"
license=('MIT')
groups=('pk-shell-utils')
depends=('phantomjs' 'imagemagick' 'ptyget' 'aha')
source=(
	"termshot-${pkgver}"::"https://raw.githubusercontent.com/pierrekilly/shell-utils/v${pkgver}/termshot/termshot"
	"LICENSE-${pkgver}"::"https://raw.githubusercontent.com/pierrekilly/shell-utils/v${pkgver}/LICENSE"
)
sha512sums=(
	'c9a9bffae8154af8ccd1a31cd020b0280d64fceafe2b290efc7d209baabfd296f6f7369aaccf8b25c7e9c5ba82ad7f73cd2d3abc0e17c2ca5392770583a9e985'
	'd5b15c6b6ecc1e496b487ce982ff767c2c1ca0dba73e2f64e5bfff4873332ac99efbe34f0bebac676de8a300fdef7b2029e6ea6e66671b9d31ad28a3c37baaf0'
)

package(){
	install -D "termshot-${pkgver}" "${pkgdir}/usr/bin/termshot"
	install -D "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

