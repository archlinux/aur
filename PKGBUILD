# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=spacefm-plugin-clamav
pkgver=1
pkgrel=1
pkgdesc="Scan the selected files/folders with ClamAV using spacefm, the open source (GPL) antivirus engine."
arch=(any)
url="https://github.com/IgnorantGuru/spacefm/wiki/plugins"
license=('GPL')
depends=('clamav' 'spacefm')
source=(http://www.dpb.org.uk/spacefm-plugins/ClamAV-Scan.spacefm-plugin.tar.xz)

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}/usr/share/spacefm/plugins/ClamAV-Scan"
  cd "${pkgdir}/usr/share/spacefm/plugins/ClamAV-Scan"
  tar -xf "${srcdir}/ClamAV-Scan.spacefm-plugin.tar.xz"
}

# vim:set ts=2 sw=2 et:
md5sums=('7620b03caab31ec5dac936c58bffc020')
