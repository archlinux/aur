# Maintainer: benabel <dev.abel at free.fr>

pkgname=quarto-cli-bin-pre-release
pkgver=1.2.237
pkgrel=1
pkgdesc="An open-source scientific and technical publishing system built on Pandoc  (binary pre-release from official repo)"
arch=('x86_64')
license=('GPL')
url="http://quarto.org/"
depends=('bash')
makedepends=('jq')
provides=("quarto")
options=(!strip)
source=(https://github.com/quarto-dev/quarto-cli/releases/download/v${pkgver}/quarto-${pkgver}-linux-amd64.deb)

package() {
    tar xf data.tar.gz -C "${pkgdir}"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s /opt/quarto/bin/quarto "${pkgdir}/usr/bin"
}

sha256sums=('0cdb85657e7cb0579c3dc25c243c04d2700e5359820dec76869d7f6141a4beec')

