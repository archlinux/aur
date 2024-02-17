# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gcad3d-bin
pkgver=2.60.04
pkgrel=1
pkgdesc="Parametric 3D CAD with viewer, import, export, NC"
arch=(x86_64)
url="https://www.gcad3d.org"
license=(GPL-3.0-or-later)
depends=(at-spi2-core cairo fontconfig freetype2 gdk-pixbuf2 glib2 glu gtk2 gtkglarea harfbuzz libglvnd pango)
optdepends=('xorg-xwayland: run under Wayland')
#conflicts=(${pkgname%-bin}-git ${pkgname%-bin})
options=(!debug)
source=(${url}/download/gCAD3D-${pkgver}-bin-amd64.deb)
b2sums=('502f8501faf4464fa303a03cba90f07c6cb1f4ae4e56e8cdae0cc5b05f6b6aa6b869864942e1b6fb86302438af6fd0f64e9c7a7f1f96ede2ba393ffc2d21f89b')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
}
