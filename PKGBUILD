# Maintainer: Francois B Makoto <francois at makotonoblog dot be>
pkgname=wpfind
pkgver=0.1.3
pkgrel=1
pkgdesc="Find wallpapers among other files and directories and copy/move them in specified directories. Very useful to clean your mess :-P"
arch=('any')
url="https://makotonoblog.be/wpfind/"
license=('GPL')
groups=()
depends=('bash' 'detox' 'imagemagick')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shakasan/${pkgname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('aa9329df08255fb4fcc4904cea10fada')

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
