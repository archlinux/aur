# Maintainer: Denis Meiswinkel <denis.meiswinkel@gmail.com>

pkgname=spacefm-dropbox-plugin
pkgver=0.0.9
pkgrel=3
pkgdesc="Several dropbox options like \"puburl to clipboard\" or start and stop the daemon."
arch=(any)
url="https://github.com/IgnorantGuru/spacefm/wiki/plugins"
license=("GPL")
depends=("dropbox" "spacefm")
optdepends=("dropbox-cli")
source=(https://github.com/downloads/hasufell/spacefm-plugins/Drobox.spacefm-plugin-0.0.9.tar.gz)
sha256sums=("14a11e357cb2eff8c041986aba1d220a3537a6102c0b2eb46fad14a3ecb389b2")

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}/usr/share/spacefm/plugins/Dropbox"
  cd "${pkgdir}/usr/share/spacefm/plugins/Dropbox"
  tar -xf "${srcdir}/Drobox.spacefm-plugin-0.0.9.tar.gz"
  chmod -R 755 cstm_*
  chmod 644 cstm_31cfaa37/icon
}

# vim:set ts=2 sw=2 et:
