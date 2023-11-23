# Maintainer: icecamphor <camphor@skiff.com>

pkgname='biodiff-bin'
pkgver=1.1.0
pkgrel=1
pkgdesc="Hex diff viewer using alignment algorithms from biology"
arch=('x86_64')
url="https://github.com/8051Enthusiast/biodiff"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('biodiff' 'git-biodiff')
conflicts=('biodiff')
changelog=ChangeLog
source=('https://github.com/8051Enthusiast/biodiff/releases/download/v1.1.0/biodiff-linux-1.1.0.zip')
md5sums=('827ff2469fbe282a15cb9b82686adbe4')
sha256sums=('73377d86c52de66034f0aabfa725af5173340d3a7ccbdd4f872cc3d0d64988ae')


package() {
	install -Dm755 ./biodiff "$pkgdir/usr/bin/biodiff"
	install -Dm755 ./git-biodiff "$pkgdir/usr/bin/git-biodiff"
}
