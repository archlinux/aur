# Maintainer teuto.net <aur@teuto.net>

pkgname=k9s-capi
pkgver=1.0.0
pkgrel=3
pkgdesc="A k9s plugin which provides basic flux commands."
license=(APACHE)
arch=(any)
depends=(k9s clusterctl)
source=(capi-restart-resources.yaml)
sha512sums=('cd50953d3f07eced313b0a8767bf4006834b215250d94ed64678263717a9b0093e24a1dcbab13d9d93d875e74845a7a59df0d4cc67788c48c30e8e0480869a43')

package() {
  install -D -m 0755 -t $pkgdir/usr/share/k9s/plugins $srcdir/capi-restart-resources.yaml
}

#vim: syntax=sh
