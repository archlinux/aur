# Maintainer: Fuad Saud <fuadfsaud@gmail.com>
pkgname=i3lockr-bin
pkgver=1.1.0_docfix
pkgrel=1
epoch=
pkgdesc='Distort a screenshot and run i3lock.'
arch=('x86_64')
url="https://github.com/owenthewizard/i3lockr"
license=('APACHE' 'MIT')
groups=()
depends=('i3lock>=2.12')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::https://github.com/owenthewizard/i3lockr/releases/download/v${pkgver//_/-}/i3lockr"
        "LICENSE-MIT.md")

sha256sums=('086f33891af6268f1282ce6d41db2b910e3bc744b5c802033630306544b337dd'
            'f69e4704af94bb7dc2462898e6484065d148d31a325f01e0da3652f7a501340e')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/i3lockr"
  install -Dm644 LICENSE-MIT.md "${pkgdir}/usr/share/licenses/i3lockr-bin/LICENSE"
}
