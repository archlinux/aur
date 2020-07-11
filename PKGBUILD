# Maintainer: Richard Gibert <richard@gibert.ca>
_pkgname=withings-scale-pairing-wizard
pkgname=$_pkgname
pkgver=1.0
pkgrel=0
pkgdesc="Pairing wizard for Withings Scales"
arch=('i686'
      'x86_64')
license=('custom')
url="https://support.withings.com/hc/en-us/articles/115009772968-Installing-my-Wi-Fi-Body-Scale-WBS01-"
provides=(${_pkgname})

source_i686=("${_pkgname}::http://fw.withings.net/pairingwizard_Linux_x86")
md5sums_i686=("21b9067a8a5317827e37b92bf971ee1f")

source_x86_64=("${_pkgname}::http://fw.withings.net/pairingwizard_Linux_x86_64")
md5sums_x86_64=("97064fc63f19f08711382e01fd76b94d")

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -rp "${srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  chmod 750 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
}
