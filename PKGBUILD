# Maintainer: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=nirimod-git-bin
pkgver=r92.7a449c8
pkgrel=1
pkgdesc="A visual, interactive configuration interface for the niri Wayland compositor (versão binária pré-compilada)"
arch=('any')
url="https://github.com/srinivasr/nirimod"
license=('MIT')
depends=(
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
  'python-cairo'
  'hicolor-icon-theme'
  'niri'
)
provides=('nirimod')
conflicts=('nirimod' 'nirimod-git')
options=(!debug)

source=("https://github.com/eusouobn/nirimod-bin-releases/releases/download/vr92.7a449c8/nirimod-full-${pkgver}-any.tar.gz")
sha256sums=('934ccf531a2dbc91761da05394524adbcb3a398a65c97bc4eb9850a5639da3ba')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
