# Maintainer: Carlos Sanchez <research@sanchezcarlosjr.com>
pkgname=slc-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Precompiled TAOS II event simulator for astronomical occultation events"
arch=('x86_64')
url="https://github.com/sanchezcarlosjr/occultation_light_curves"
license=('MIT')
depends=('fftw' 'gsl' 'hdf5')
source_x86_64=("https://github.com/sanchezcarlosjr/occultation_light_curve_simulator/releases/download/v2.4.0/slc")
sha256sums_x86_64=('691cea6d486111fff0f0b2947971e40ffa36510bc2adfe1e14ec056fe650dd07')

package() {
  install -Dm755 "slc" "${pkgdir}/usr/bin/slc"
}
