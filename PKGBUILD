# Maintainer: Paul Bell <linux at dpb dot org dot uk>
# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

_pkgname="ClamAV-Scan"
_tarball="${_pkgname}.spacefm-plugin.tar.gz"
pkgname=spacefm-plugin-clamav
pkgver=1.01
pkgrel=1
pkgdesc="Scan selected files/folders in SpaceFM using ClamAV, the open source (GPL) antivirus engine."
arch=(any)
url="https://github.com/IgnorantGuru/spacefm/wiki/plugins"
license=('GPL3')
depends=('clamav' 'spacefm')
source=("https://www.dpb.org.uk/spacefm-plugins/${_tarball}")
sha256sums=("1ea4f158b35eb80e8a5c0e2e2d9b8517ebced6e0ec89fe0b49869d5b94910d1f")

package() {
  local destdir="${pkgdir}/usr/share/spacefm/plugins/${_pkgname}"
  install -dm755 "${destdir}"
  tar -xf "${_tarball}" -C "${destdir}"
}
