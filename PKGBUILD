#Maintainer: shahriar Ghasempour
pkgname=tasky
pkgver=0.6
pkgrel=1
pkgdesc="Tasky is a command line TODO list app currently in beta version"
arch=('any')
url="https://github.com/shahriaarrr/Tasky"
license=('GPL3')
makedepends=()
conflicts=()
provides=("${pkgname}")
options=(!strip !emptydirs)
install=tasky.install
source=("https://github.com/shahriaarrr/Tasky/releases/download/V0.6/tasky.zip")
sha256sums=('SKIP')
validpgpkeys=('53024A9A018E141CE97E1ADFA8CF00618E0F7C0A')

package() {
    install -dm755 "${pkgdir}"
    cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/"
}