# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=texlive-fonts-emerald
pkgver=1.0.0
pkgrel=2
pkgdesc="The emerald fonts for use with LaTeX"
arch=(any)
url="https://www.ctan.org/tex-archive/fonts/emerald/"
license=('GPL')
depends=()
makedepends=(texlive-bin texlive-basic)
install=texlive-fonts-emerald.install
source=(http://mirrors.ctan.org/fonts/emerald.zip)
sha256sums=('12ac7047608ecca3f939c4c86f74ec15517ff298984d6372a4a374b2f2a81264')

package() {
    install -d "$pkgdir"/usr/share/texmf-dist/
    cp -a emerald/* "$pkgdir"/usr/share/texmf-dist/
}
