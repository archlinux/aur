# Maintainer: AcidHub <contact@acidhub.click>

pkgname=bash-pipes
pkgver=1.2
pkgrel=2
pkgdesc='Pipes screensaver for bash'
arch=('any')
url='http://acidhub.github.io/pipes.sh'
license=('GPL')
depends=('bash')
source=("https://github.com/Acidhub/pipes.sh/archive/v$pkgver.tar.gz")
sha512sums=('88e2457f5072c4d13e9afc44964e75b84b0bcee3d80cd439e9ca733ca0d2108fbd998bbd73c5333679b42a6681b68e0193c7ff707070163de93e527994fe0d96')

package() {
    cd pipes.sh-$pkgver
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
