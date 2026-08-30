# Maintainer: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=nirimod-git-bin
pkgver=r66.d871327
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

source=("https://github.com/eusouobn/nirimod-bin-releases/releases/download/vr66.d871327/nirimod-full-${pkgver}-any.tar.gz")
sha256sums=('8f7a7bd53fe19b5ee307fedccc73fb19cd1060fe393681dbf608288d1fb70fd1')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
