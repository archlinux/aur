# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='xidel'
pkgname="${_pkgname}-bin"
pkgver=0.9.8
pkgrel=1
pkgdesc='Command line tool to process HTML/XML/JSON locally or from online sources'
arch=('x86_64')
url='http://videlibri.sourceforge.net/xidel.html'
_url_source='https://sourceforge.net/projects/videlibri'
license=('GPL3')
optdepends=('openssl: https connections')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${_url_source}/files/${_pkgname^}/${_pkgname^} ${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb/download")
sha256sums=('f6a6e29b77547d5ae38383440bd653b3eaf9eeb470def14cc48154a4f6925f69')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/"{'doc','lintian'}
}

# vim: ts=2 sw=2 et:
