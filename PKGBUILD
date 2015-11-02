# Maintainer: vwugd97 <denis dot meiswinkel at gmail dot com>
pkgname=spacefm-dropbox-plugin
pkgver=0.0.9
pkgrel=1
pkgdesc="Several dropbox options like \"puburl to clipboard\" or start and stop the daemon."
arch=(any)
url="https://github.com/IgnorantGuru/spacefm/wiki/plugins"
license=('GPL')
depends=('dropbox' 'spacefm')
optdepends=('dropbox-cli')
source=(https://github.com/downloads/hasufell/spacefm-plugins/Drobox.spacefm-plugin-0.0.9.tar.gz)

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}/usr/share/spacefm/plugins/Dropbox"
  cd "${pkgdir}/usr/share/spacefm/plugins/Dropbox"
  tar -xf "${srcdir}/Drobox.spacefm-plugin-0.0.9.tar.gz"
}

# vim:set ts=2 sw=2 et:
md5sums=('f48d32af51a9310cb2306453c4ffbd8d')
