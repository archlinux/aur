# Maintainer: Pierre Killy <myFirstName dot myLastNAme at gmail dot com>

pkgname=termshot
pkgver="1.1"
pkgrel=2
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
	'73d457722c78682dea5950f735f2c8365ebd7e29494f886781375709ade6c591311f63ea4a04dd360d81f5d087ccbe390103fe3a525eefdd96fdb6127af823f7'
	'd5b15c6b6ecc1e496b487ce982ff767c2c1ca0dba73e2f64e5bfff4873332ac99efbe34f0bebac676de8a300fdef7b2029e6ea6e66671b9d31ad28a3c37baaf0'
)

package(){
	install -D "termshot-${pkgver}" "${pkgdir}/usr/bin/termshot"
	install -D "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

