# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='blanket'
pkgname="${_pkgname}-bin"
pkgver=0.3.1
pkgrel=1
_dist_release='20.10.1' # <-- NB: update on new version
pkgdesc='Improve focus and increase your productivity by listening to different sounds'
arch=('x86_64')
url='https://github.com/rafaelmardojai/blanket'
_pool_url='http://ppa.launchpad.net/apandada1/blanket/ubuntu/pool/main'
license=('GPL3')
depends=('gst-python' 'gtk3' 'libhandy' 'python-gobject')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pool_url}/${pkgname::1}/${_pkgname}/${_pkgname}_${pkgver}-1~ubuntu${_dist_release}_all.deb")
sha256sums=('e3380972b82adc0636cdc6919afbd00e5696e293443682c60d605062c506c6f1')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
}

# vim: ts=2 sw=2 et:
