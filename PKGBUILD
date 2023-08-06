# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=quarto-cli-bin-pre-release
pkgver="1.4.298"
pkgrel=1
pkgdesc="An open-source scientific and technical publishing system built on Pandoc  (pre-release binary from official repo)"
arch=('x86_64')
license=('GPL')
url="http://quarto.org/"
depends=('bash')
makedepends=()
conflicts=("quarto-cli" "quarto-cli-bin" "quarto-cli-git")
provides=("quarto")
options=(!strip)
source=(https://github.com/quarto-dev/quarto-cli/releases/download/v${pkgver}/quarto-${pkgver}-linux-amd64.deb)

package() {
    tar xf data.tar.gz -C "${pkgdir}"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s /opt/quarto/bin/quarto "${pkgdir}/usr/bin"
}

sha256sums=('f1872699b6bdfd5848bb33807761e778084ba59b9570f14cd81b63ed1efeb262')

