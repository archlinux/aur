# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ver='v3_00'
_rel='23488'
pkgname='arcconf'
pkgver=3.00_23488
pkgrel=1
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64')
url='https://storage.microsemi.com/en-us/support'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_ver}_${_rel}.zip")
sha256sums=('8df35e46e3ce73a71e185080e98ec9cf492a93aeb7c20fe0c662e15a7b2b4d26')

pkgver() {
  _ver=`echo ${_ver} | sed -e 's:v::' -e 's/_/./g'`
  echo -e "${_ver}_${_rel}"
}

package() {
  install -Dm755 "${srcdir}/linux_x64/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
