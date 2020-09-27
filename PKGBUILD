# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_binary_name='com.github.jeremyvaartjes.ping'
_pkgname="${_binary_name##*.}"
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
_pkg_hash='e80a97' # <-- NB: update on new version
pkgdesc='Test your API against some data'
arch=('x86_64')
url='https://github.com/jeremyvaartjes/ping'
_pool_url='http://packages.elementary.io/appcenter/pool/main'
license=('GPL3')
depends=('granite' 'gtksourceview3')
source=("${_pool_url}/${_binary_name::1}/${_binary_name}/${_binary_name}${pkgver}-${_pkg_hash}.deb")
sha256sums=('d85e4f9021b34eba7c18b633f2defe309e94631abb67f1bb5a1a2adef7ea20d9')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
}

# vim: ts=2 sw=2 et:
