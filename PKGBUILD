# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_binary_name='com.github.dbhowell.peeq'
_pkgname="${_binary_name##*.}"
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=1
_pkg_hash='02a0c5' # <-- NB: update on new version
pkgdesc='Postgresql Client with programmer utilities'
arch=('x86_64')
url='https://github.com/dbhowell/peeq'
_pool_url='http://packages.elementary.io/appcenter/pool/main'
license=('GPL3')
depends=('granite' 'gtksourceview3' 'postgresql-libs')
provides=("${_pkgname}")
source=("${_pool_url}/${_binary_name::1}/${_binary_name}/${_binary_name}${pkgver}-${_pkg_hash}.deb")
sha256sums=('263e27b1d4e75074220eb29629ea51c8b2b1d3020359c9000eee682cd12fadff')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
}

# vim: ts=2 sw=2 et:
