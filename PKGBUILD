# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_binary_name='com.github.manexim.home'
_pkgname="${_binary_name##*.}"
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=1
_pkg_hash='64ee7c' # <-- NB: update on new version
pkgdesc='Control your smart home gadgets'
arch=('x86_64')
url='https://github.com/manexim/home'
_pool_url='http://packages.elementary.io/appcenter/pool/main'
license=('GPL3')
depends=('granite')
provides=("${_pkgname}")
source=("${_pool_url}/${_binary_name::1}/${_binary_name}/${_binary_name}${pkgver}-${_pkg_hash}.deb")
sha256sums=('fae55770e6f4b3c40a613262644e9d137963887227def39866a498c029cc6412')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
}

# vim: ts=2 sw=2 et:
