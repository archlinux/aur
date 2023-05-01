# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=benny-hill
pkgver=0.0.2
pkgrel=2
pkgdesc="Play the Benny Hill theme while running another command"
arch=('any')
url="https://github.com/Tyilo/albert-extensions"
license=('GPL')
depends=('bash' 'sox' 'libmad' 'lame' 'twolame')
source=(
"benny-hill"
"https://github.com/mafintosh/benny-hill/blob/master/theme.mp3?raw=true"
)
sha256sums=('a9f598e606215f5cc4c775e6115bfe8419f2a8ace0525445c1c6d52cd47167ff'
            'b8e9774023ebe20e27bfb7ae139cbe994f05690f7c8ec9835ff5f0d94ec45fc7')

package() {
	install -D "${srcdir}/theme.mp3?raw=true" "${pkgdir}/opt/benny-hill/benny-hill.mp3"
	install -D "${srcdir}/benny-hill" "${pkgdir}/usr/bin/benny-hill"
}
