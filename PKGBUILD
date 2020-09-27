# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_binary_name='com.github.philip-scott.wallpaperize'
_pkgname="${_binary_name##*.}"
pkgname="${_pkgname}-bin"
pkgver=1.2.8
pkgrel=1
_pkg_hash='fa31b8' # <-- NB: update on new version
pkgdesc='Beautify your oddly-sized wallpapers'
arch=('x86_64')
url='https://github.com/Philip-Scott/wallpaperize'
_pool_url='http://packages.elementary.io/appcenter/pool/main'
license=('GPL3')
depends=('granite')
provides=("${_pkgname}")
source=("${_pool_url}/${_binary_name::1}/${_binary_name}/${_binary_name}${pkgver}-${_pkg_hash}.deb")
sha256sums=('1771b899280be020f6579679964aeb0836afced910de84cad88461001a542f59')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/"{'contractor','doc'}
}

# vim: ts=2 sw=2 et:
