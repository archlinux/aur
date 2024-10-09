# Maintainer: claymorwan <claymorw@gmail.com>

_sourceName="kde_controlcentre"

pkgname=plasma6-kde_controlcentre
pkgver=0.1.0
pkgrel=1
pkgdesc="A beautiful control centre widget for KDE Plasma directly inspired by the MacOS control centre. Made by Prayag2"
arch=("any")
url="https://github.com/Prayag2/kde_controlcentre"
source=("git+${url}")
sha256sums=("SKIP")
license=("GPL-3.0-only")
depends=("plasma-nm" "kdeplasma-addons" "plasma-pa" "qt6-5compat")
makedepends=("git" "kpackage5")

package() {
    cd "${_sourceName}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    kpackagetool5 -i package
}