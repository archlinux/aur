# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ver='v4_01'
_rel='24763'
pkgname='arcconf'
pkgver=4.01_24763
pkgrel=1
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64')
url='https://storage.microsemi.com/en-us/support'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_ver}_${_rel}.zip")
sha256sums=('aa62c75806cae08f0ac021939c73a86e13f295e818c08df2d894af76d1461a71')

pkgver() {
  _ver=`echo ${_ver} | sed -e 's:v::' -e 's/_/./g'`
  echo -e "${_ver}_${_rel}"
}

package() {
  install -Dm755 "${srcdir}/linux_64/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
