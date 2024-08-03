# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Fabian Bornschein <fabiscafe at mailbox dot org>

pkgbase=intel-one-mono-fonts
pkgname=({otf,ttf,woff,woff2}-intel-one-mono)
pkgver=1.4.0
pkgrel=1
pkgdesc="Expressive monospaced font family that’s built with clarity, legibility, and the needs of developers in mind"
url="https://github.com/intel/intel-one-mono"
arch=(any)
license=(custom:OFL)
makedepends=(git)
_commit=99e2d6ca170744c62bfb5f52547435f23720abe1  # tags/V1.4.0
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')

package_otf-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/OTF -m644 otf/*.otf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 otf/OFL.txt
}

package_ttf-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 ttf/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ttf/OFL.txt
}

package_woff-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/WOFF -m644 woff/*.woff
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 woff/OFL.txt
}

package_woff2-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/WOFF2 -m644 woff2/*.woff2
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 woff2/OFL.txt
}
