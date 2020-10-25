# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-sound-theme-bin'
pkgver='5.3.0'
pkgrel=1
_timestamp=1603307552
_commit=a5e0cc9
pkgdesc='System76 Pop Sound Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-sound-theme')
provides=('pop-sound-theme')

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-sound-theme_${pkgver}~${_timestamp}~20.10~${_commit}_all.deb")
sha256sums=('0406d076c2e50f3abaed02c5d80e9018edb6eafbdb5e912c239c201c983f4298')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
