# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=benny-hill
pkgver=0.0.1
pkgrel=1
pkgdesc="Play the Benny Hill theme while running another command"
arch=('any')
url="https://github.com/Tyilo/albert-extensions"
license=('GPL')
depends=('bash' 'sox' 'twolame')
source=(
"benny-hill"
"https://github.com/mafintosh/benny-hill/blob/master/theme.mp3?raw=true"
)
sha256sums=('99c5aa30f43a75dbd81fda811606dd75ea8f081f4d52a794d10b0038ec00dcff'
            'b8e9774023ebe20e27bfb7ae139cbe994f05690f7c8ec9835ff5f0d94ec45fc7')

package() {
	install -D "${srcdir}/theme.mp3?raw=true" "${pkgdir}/opt/benny-hill/benny-hill.mp3"
	install -D "${srcdir}/benny-hill" "${pkgdir}/usr/bin/benny-hill"
}
