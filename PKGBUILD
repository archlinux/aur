# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=ambiant-mate-gtk-themes
pkgver=22.04.0
pkgrel=1
pkgdesc="Ambiant-MATE and Radiant-MATE family of themes"
arch=('any')
url="https://github.com/lah7/Ambiant-MATE"
license=('GPL3')
groups=()
depends=('gtk-engine-murrine')
optdepends=('ambiant-mate-icon-themes')
source=("https://launchpad.net/~lah7/+archive/ubuntu/ambiant-mate/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('4df13dc7492f8ea5ca7b5084a7e175da8219833c5fbe1bfcdf3c9f3fde9c2080')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
