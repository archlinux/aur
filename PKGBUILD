# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ver='v3_01'
_rel='23531'
pkgname='arcconf'
pkgver=3.01_23531
pkgrel=1
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64')
url='https://storage.microsemi.com/en-us/support'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_ver}_${_rel}.zip")
sha256sums=('e936f86a1f6511f7cc4de5781cc6c11e1ad2cba97575c86c2fbf65ce62780b0d')

pkgver() {
  _ver=`echo ${_ver} | sed -e 's:v::' -e 's/_/./g'`
  echo -e "${_ver}_${_rel}"
}

package() {
  install -Dm755 "${srcdir}/linux_x64/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
