# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=ambiant-mate-gtk-themes
pkgver=22.04.2
pkgrel=1
pkgdesc="Ambiant-MATE and Radiant-MATE family of themes"
arch=('any')
url="https://github.com/lah7/Ambiant-MATE"
license=('GPL3')
groups=('ambiant-mate-themes')
depends=('gtk-engine-murrine')
optdepends=('ambiant-mate-icon-themes')
source=("https://launchpad.net/~lah7/+archive/ubuntu/ambiant-mate/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('0c377407820e7bf8bc14a3bee013ac5f3dd1f0fd16c784cd989d09d36c44049a')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
