# Maintainer: Bob Mottram <bob@freedombone.net>
pkgname=fin
pkgver=1.51
pkgrel=1
epoch=
pkgdesc="The command line personal finances manager"
arch=('i686' 'x86_64')
url="https://github.com/bashrc/fin"
license=('GPL3')
groups=()
depends=('sqlite' 'gnuplot')
makedepends=('sqlite')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://freedombone.net/arch/fin/$pkgname-$pkgver.tar.gz" "https://freedombone.net/arch/fin/$pkgname-$pkgver.tar.gz.asc")
noextract=()
sha512sums=('a7333e160617c4340d2af4ff12402d87483e6213b0ca510f8750bd7958d95bf544fac45cb7c16ec56eaba8a0cb8eff86e2e7a48f0593d32ede37c112d2dcf73b'
            'SKIP')
validpgpkeys=()

build() {
    make
}

package() {
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
