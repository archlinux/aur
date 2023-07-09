# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=ambiant-mate-icon-themes
pkgver=22.04.2
pkgrel=1
pkgdesc="Ambiant-MATE and Radiant-MATE family of themes"
arch=('any')
url="https://github.com/lah7/Ambiant-MATE"
license=('GPL3')
groups=()
depends=('gtk-engine-murrine')
optdepends=('ambiant-mate-themes')
source=("https://launchpad.net/~lah7/+archive/ubuntu/ambiant-mate/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('e02983eb521849040ecb2216a38af2131faa561f93bf85afcc7c0fb811af1276')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
