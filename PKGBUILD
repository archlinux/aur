# Maintainer: somepaulo <fino@duck.com>
# Packager: somepaulo <fino@duck.com>
# Contributor: Panda Jim <ubuntuhandbook1@gmail.com>
# Contributor: Otto Meier <otto@kesselgulasch.org>
# Contributor: Bernd Zeimetz <bzed@debian.org>

pkgname=gimp-plugin-registry
pkgver=9.20180625
pkgrel=4
_debrel=1ubu18.04~ppa
_debrepo=https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/gimp/+files
pkgdesc="Repository of optional extensions for GIMP"
arch=('x86_64')
url="https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/gimp"
license=('GPL')
depends=('gimp' 'bash-completion' 'desktop-file-utils' 'fftw' 'gcc-libs>=4.9' 'gdk-pixbuf2>=2.22.0' 'glew>=1.10.0' 'glib2>=2.37.3' 'glibc>=2.14' 'glu' 'gtk2>=2.14.0' 'gtkglext' 'hicolor-icon-theme' 'lapack' 'lcms2>=2.7' 'libgl' 'liblqr>=0.4.0' 'libtiff>=4.0.3' 'xdg-utils' 'python2-gimp')
optdepends=('adobe-icc: ICC profiles from Adobe')
provides=('gimp-dbp' 'gimp-elsamuko-scripts' 'gimp-fix-ca' 'gimp-plugin-lqr' 'gimp-plugin-resynthesizer' 'gimp-plugin-resynthesizer-git' 'gimp-plugin-saveforweb' 'gimp-plugin-separate+' 'gimp-script-antique-border' 'gimp-script-che-guevara' 'gimp-script-color-tint' 'gimp-script-cyanotype' 'gimp-script-difference-layers' 'gimp-script-erosion-sharpen' 'gimp-script-error-level-analysis' 'gimp-script-escape-lines' 'gimp-script-film-grain' 'gimp-script-first-photo-border' 'gimp-script-glass-displacement' 'gimp-script-lomo' 'gimp-script-movie-300' 'gimp-script-national-geographic' 'gimp-script-obama-hope' 'gimp-script-photochrom' 'gimp-script-rainy-landscape' 'gimp-script-sprocket-hole' 'gimp-script-sunny-landscape' 'gimp-script-technicolor-2-color' 'gimp-script-technicolor-3-color' 'gimp-script-vintage-look' 'gimp-script-white-balance-puzzle')
conflicts=('gimp-dbp' 'gimp-elsamuko-scripts' 'gimp-fix-ca' 'gimp-plugin-lqr' 'gimp-plugin-resynthesizer' 'gimp-plugin-resynthesizer-git' 'gimp-plugin-saveforweb' 'gimp-plugin-separate+' 'gimp-script-antique-border' 'gimp-script-che-guevara' 'gimp-script-color-tint' 'gimp-script-cyanotype' 'gimp-script-difference-layers' 'gimp-script-erosion-sharpen' 'gimp-script-error-level-analysis' 'gimp-script-escape-lines' 'gimp-script-film-grain' 'gimp-script-first-photo-border' 'gimp-script-glass-displacement' 'gimp-script-lomo' 'gimp-script-movie-300' 'gimp-script-national-geographic' 'gimp-script-obama-hope' 'gimp-script-photochrom' 'gimp-script-rainy-landscape' 'gimp-script-sprocket-hole' 'gimp-script-sunny-landscape' 'gimp-script-technicolor-2-color' 'gimp-script-technicolor-3-color' 'gimp-script-vintage-look' 'gimp-script-white-balance-puzzle')

install=${pkgname}.install

sha256sums=('6686a6ef7340db8ad402f1c80e0d44a67a695642462674bae8673ab6cc225497')

source=("${_debrepo}/${pkgname}_${pkgver}-${_debrel}_amd64.deb")

package() {
#      msg2 "Installing "$pkgname"..."
      tar xvf data.tar.xz -C "${pkgdir}"/
}
