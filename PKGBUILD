# Contributor: somepaulo <burafino@gmail.com>
# Maintainer: Otto Meier <otto@kesselgulasch.org>
# Original-Maintainer: Bernd Zeimetz <bzed@debian.org>

pkgname=gimp-plugin-registry
pkgver=7.20141204
pkgrel=8
debrel=0trusty0~ppa
debrepo=https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp/+files
pkgdesc="Repository of optional extensions for GIMP"
arch=('i686' 'x86_64')
url="https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp"
license=('GPL')
depends=('bash-completion' 'desktop-file-utils' 'fftw' 'gcc-libs>=4.9' 'gdk-pixbuf2>=2.22.0' 'gimp>=2.6' 'glew>=1.10.0' 'glib2>=2.37.3' 'glibc>=2.14' 'glu' 'gtk2>=2.14.0' 'gtkglext' 'hicolor-icon-theme' 'lapack' 'lcms2>=2.7' 'libgl' 'liblqr>=0.4.0' 'libtiff>=4.0.3' 'xdg-utils')
optdepends=('adobe-icc: ICC profiles from Adobe')
provides=('gimp-dbp' 'gimp-fix-ca' 'gimp-plugin-fblur' 'gimp-plugin-lqr' 'gimp-plugin-normalmap' 'gimp-refocus' 'gimp-elsamuko-plugins' 'gimp-plugin-layerfx' 'gimp-plugin-resynthesizer-git' 'gimp-plugin-saveforweb' 'gimp-plugin-wavelet-decompose' 'gimp-plugin-wavelet-denoise' 'gimp-script-antique-border' 'gimp-script-che-guevara' 'gimp-script-color-tint' 'gimp-script-cyanotype' 'gimp-script-difference-layers' 'gimp-script-erosion-sharpen' 'gimp-script-error-level-analysis' 'gimp-script-escape-lines' 'gimp-script-grain' 'gimp-script-photo-border' 'gimp-script-glass-displacement' 'gimp-script-lomo' 'gimp-script-movie-300' 'gimp-script-national-geographic' 'gimp-script-obama-hope' 'gimp-script-photochrom' 'gimp-script-rainy-landscape' 'gimp-script-sprocket-hole' 'gimp-script-sunny-landscape' 'gimp-script-technicolor-2-color' 'gimp-script-technicolor-3-color' 'gimp-script-vintage-look' 'gimp-script-white-balance-puzzle')
conflicts=('gimp-dbp' 'gimp-fix-ca' 'gimp-plugin-fblur' 'gimp-plugin-lqr' 'gimp-plugin-normalmap' 'gimp-refocus' 'gimp-elsamuko-plugins' 'gimp-plugin-layerfx' 'gimp-plugin-resynthesizer-git' 'gimp-plugin-saveforweb' 'gimp-plugin-wavelet-decompose' 'gimp-plugin-wavelet-denoise' 'gimp-script-antique-border' 'gimp-script-che-guevara' 'gimp-script-color-tint' 'gimp-script-cyanotype' 'gimp-script-difference-layers' 'gimp-script-erosion-sharpen' 'gimp-script-error-level-analysis' 'gimp-script-escape-lines' 'gimp-script-grain' 'gimp-script-photo-border' 'gimp-script-glass-displacement' 'gimp-script-lomo' 'gimp-script-movie-300' 'gimp-script-national-geographic' 'gimp-script-obama-hope' 'gimp-script-photochrom' 'gimp-script-rainy-landscape' 'gimp-script-sprocket-hole' 'gimp-script-sunny-landscape' 'gimp-script-technicolor-2-color' 'gimp-script-technicolor-3-color' 'gimp-script-vintage-look' 'gimp-script-white-balance-puzzle')
replaces=('gimp-refocus<0.9.0')

install=${pkgname}.install

 if [ "$CARCH" = "x86_64" ]; then
    _debarch=amd64
    sha256sums=('d3be3e1a9d49850aa4328c9090607b0eaf5b9472342bf1b05f4a0f957dc3b6f0')
else
    _debarch=i386
    sha256sums=('0faf68f804d0aa3b2482633a1ed743602f6c6c12b89212969abdd8004461bfe0')
 fi

source=("${debrepo}/${pkgname}_${pkgver}-${debrel}_${_debarch}.deb")

package() {
      msg2 "Installing "$pkgname"..."
      tar xvf data.tar.xz -C "${pkgdir}"/
}
