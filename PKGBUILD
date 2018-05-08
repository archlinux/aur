# Contributor: somepaulo <burafino@gmail.com>
# Maintainer: Otto Meier <otto@kesselgulasch.org>
# Original-Maintainer: Bernd Zeimetz <bzed@debian.org>

pkgname=gimp-plugin-registry
pkgver=7.20170217
pkgrel=1
debrel=0a9~ppa
debrepo=https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp/+files
pkgdesc="Repository of optional extensions for GIMP"
arch=('x86_64')
url="https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp"
license=('GPL')
depends=('bash-completion' 'desktop-file-utils' 'fftw' 'gcc-libs>=4.9' 'gdk-pixbuf2>=2.22.0' 'glew>=1.10.0' 'glib2>=2.37.3' 'glibc>=2.14' 'glu' 'gtk2>=2.14.0' 'gtkglext' 'hicolor-icon-theme' 'lapack' 'lcms2>=2.7' 'libgl' 'liblqr>=0.4.0' 'libtiff>=4.0.3' 'xdg-utils')
optdepends=('gimp>=2.6' 'gimp-git' 'adobe-icc: ICC profiles from Adobe')
provides=('gimp-dbp' 'gimp-elsamuko-plugins' 'gimp-fix-ca' 'gimp-plugin-fblur' 'gimp-plugin-lqr' 'gimp-plugin-normalmap' 'gimp-plugin-layerfx' 'gimp-plugin-resynthesizer' 'gimp-plugin-resynthesizer-git' 'gimp-refocus' 'gimp-script-antique-border' 'gimp-script-che-guevara' 'gimp-script-color-tint' 'gimp-script-cyanotype' 'gimp-script-difference-layers' 'gimp-script-erosion-sharpen' 'gimp-script-error-level-analysis' 'gimp-script-escape-lines' 'gimp-script-grain' 'gimp-script-photo-border' 'gimp-script-glass-displacement' 'gimp-script-lomo' 'gimp-script-movie-300' 'gimp-script-national-geographic' 'gimp-script-obama-hope' 'gimp-script-photochrom' 'gimp-script-rainy-landscape' 'gimp-script-sprocket-hole' 'gimp-script-sunny-landscape' 'gimp-script-technicolor-2-color' 'gimp-script-technicolor-3-color' 'gimp-script-vintage-look' 'gimp-script-white-balance-puzzle')
conflicts=('gimp-dbp' 'gimp-elsamuko-plugins' 'gimp-fix-ca' 'gimp-plugin-fblur' 'gimp-plugin-lqr' 'gimp-plugin-normalmap' 'gimp-plugin-layerfx' 'gimp-plugin-resynthesizer' 'gimp-plugin-resynthesizer-git' 'gimp-refocus' 'gimp-script-antique-border' 'gimp-script-che-guevara' 'gimp-script-color-tint' 'gimp-script-cyanotype' 'gimp-script-difference-layers' 'gimp-script-erosion-sharpen' 'gimp-script-error-level-analysis' 'gimp-script-escape-lines' 'gimp-script-grain' 'gimp-script-photo-border' 'gimp-script-glass-displacement' 'gimp-script-lomo' 'gimp-script-movie-300' 'gimp-script-national-geographic' 'gimp-script-obama-hope' 'gimp-script-photochrom' 'gimp-script-rainy-landscape' 'gimp-script-sprocket-hole' 'gimp-script-sunny-landscape' 'gimp-script-technicolor-2-color' 'gimp-script-technicolor-3-color' 'gimp-script-vintage-look' 'gimp-script-white-balance-puzzle')

install=${pkgname}.install

sha256sums=('0a6f814e3d30f1338fcd6446cd26bb713500b360399fa68af83127a5a8777138')

source=("${debrepo}/${pkgname}_${pkgver}-${debrel}_amd64.deb")

package() {
      msg2 "Installing "$pkgname"..."
      tar xvf data.tar.xz -C "${pkgdir}"/
}
