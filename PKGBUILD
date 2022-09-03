# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=ambiant-mate-icon-themes
pkgver=22.04.0
pkgrel=1
pkgdesc="Ambiant-MATE and Radiant-MATE family of themes"
arch=('any')
url="https://github.com/lah7/Ambiant-MATE"
license=('GPL3')
groups=()
depends=('gtk-engine-murrine')
optdepends=('ambiant-mate-themes')
source=("https://launchpad.net/~lah7/+archive/ubuntu/ambiant-mate/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('3c3b0075f6dc5373e5c6a1125018b39ad43b509feebd7ca86dd466cc992cb233')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
