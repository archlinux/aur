# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>

pkgname='xubuntu-community-artwork'
pkgver=20.04.0
pkgrel=2
pkgdesc='Xubuntu community wallpapers'
arch=('any')
url='https://launchpad.net/xubuntu-community-artwork'
_pool_url='http://archive.ubuntu.com/ubuntu/pool/universe'
license=('custom')
# http://archive.ubuntu.com/ubuntu/pool/universe/x/xubuntu-community-artwork/
source=("${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('2a40074fae8754babc4e7c7e141ad2163f1f40cdf0e5ac6b267f432658d09dd1')

package() {
  cd "${pkgname}"
  install -Dvm644 "usr/share/xfce4/backdrops/"*.{'jpg','png'} -t "${pkgdir}/usr/share/backgrounds/xfce"
  install -Dvm644 'README' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
