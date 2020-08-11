# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>

pkgname=xubuntu-community-artwork
pkgver=20.04.0
pkgrel=2
pkgdesc='Xubuntu community wallpapers'
arch=('any')
url='https://launchpad.net/xubuntu-community-artwork'
license=('custom')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/x/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('2a40074fae8754babc4e7c7e141ad2163f1f40cdf0e5ac6b267f432658d09dd1')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/backgrounds/xfce" "${pkgname}/usr/share/xfce4/backdrops/"*.{jpg,png}
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}/README"
  install -Dm644 "${pkgname}/debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
