# Maintainer: S1LV3R <me@s1lv3r.codes>
pkgname=symlink-ping6-ping
pkgver=0.1.0
pkgrel=1
pkgdesc='Simply creates a symlink for ping6 that points to ping'
source=()
arch=(any)

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "ping" "${pkgdir}/usr/bin/ping6"
}
