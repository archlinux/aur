# Maintainer: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=protonplus-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="A modern compatibility tools manager for Linux (prebuilt)"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'glib2'
  'glibc'
  'gcc-libs'
)
provides=('protonplus')
conflicts=('protonplus' 'protonplus-git')
options=(!debug)

source=("https://github.com/eusouobn/protonplus-bin-releases/releases/download/v${pkgver}/protonplus-full-${pkgver}-x86_64.tar.gz")
sha256sums=('c2e05a9011f715c4afecde8e47075f54c33753f3d2bf37354c6bfc598c1c31e4')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
