# Maintainer: Pierre Killy <myFirstName dot myLastNAme at gmail dot com>

pkgname=termshot
pkgver="1.0"
pkgrel=1
pkgdesc="Turns a cli command's output into a screenshot including colors and interactive text"
arch=('any')
url="https://github.com/pierrekilly/shell-utils"
license=('MIT')
groups=('pk-shell-utils')
depends=('phantomjs' 'imagemagick' 'ptyget' 'aha')
source=(
	"https://raw.githubusercontent.com/pierrekilly/shell-utils/v1.0/termshot/termshot"
	"https://raw.githubusercontent.com/pierrekilly/shell-utils/v1.0/LICENSE"
)
sha512sums=(
	'932850afee383da0b5dfcf247ec97d2d00f5b80e2f6ef4dca4a4cf5b89590b3d577e63826833f4b83129343ca9f532c27e887a753788abbb547613a57e3546b9'
	'd5b15c6b6ecc1e496b487ce982ff767c2c1ca0dba73e2f64e5bfff4873332ac99efbe34f0bebac676de8a300fdef7b2029e6ea6e66671b9d31ad28a3c37baaf0'
)

package(){
	install -D termshot "${pkgdir}/usr/bin/termshot"
	install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

