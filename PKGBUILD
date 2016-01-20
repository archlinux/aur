# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=devpkgcheck
pkgver=1.0
pkgrel=1
pkgdesc="Tool that builds and tests pkgbuilds with vcs sources from the AUR"
arch=('any')
url="https://gitlab.com/silentboatman/devpkgcheck"
license=('GPL3')
depends=('namcap')
backup=('etc/devpkgcheck.conf')
source=("https://gitlab.com/silentboatman/${pkgname}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('b7a04dd68de6385a6361dc40642dbd36fafbf8003a9df6cefe297cef24d88469')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"*

  install -D "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${pkgname}.conf" -t "${pkgdir}/etc"
}

# vim:set ts=2 sw=2 et:
