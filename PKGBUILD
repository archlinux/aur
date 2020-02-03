# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-sound-theme-bin'
pkgver='5.0.0'
pkgrel=6
_timestamp=1580314631
_commit=b8a8a51
pkgdesc='System76 Pop Sound Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-sound-theme')
provides=('pop-sound-theme')

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-sound-theme_${pkgver}~${_timestamp}~20.04~${_commit}_all.deb")
sha256sums=('91e9ebc6e8e77acbe3e7605a738e8c050de4e0f428d619af118d99ded028f009')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
