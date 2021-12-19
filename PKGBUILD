# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=g-code-ripper
pkgver="0.22"
pkgrel=1
pkgdesc="G-Code Ripper is a g-code reading and manipulation program written in python."
arch=("any")
url="https://scorchworks.com/Gcoderipper/gcoderipper.html"
license=("GPL")
provides=("g-code-ripper")
conflicts=("g-code-ripper" "g-code-ripper-git")
depends=("python")
source=(
    "https://scorchworks.com/Gcoderipper/G-Code_Ripper-${pkgver}_src.zip"
)
sha256sums=('238b653106b1adae5584f1b2c409879418c9d2c4998c65dd90c134b598b43258')

package() {
    install -d ${pkgdir}/usr/bin/
    install -Dm 755 G-Code_Ripper-${pkgver}_src/g-code_ripper.py ${pkgdir}/usr/bin/g-code_ripper.py
}

