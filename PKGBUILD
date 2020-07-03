# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ver='v3_04'
_rel='23699'
pkgname='arcconf'
pkgver=3.04_23699
pkgrel=1
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64')
url='https://storage.microsemi.com/en-us/support'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_ver}_${_rel}.zip")
sha256sums=('09e6eb803e0901370725da7ebb10ab598095696b4507773de61cd88786518115')

pkgver() {
  _ver=`echo ${_ver} | sed -e 's:v::' -e 's/_/./g'`
  echo -e "${_ver}_${_rel}"
}

package() {
  install -Dm755 "${srcdir}/linux_x64/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
