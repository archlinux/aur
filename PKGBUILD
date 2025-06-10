# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.1.2
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell')
source=("$pkgname" "multi-capo-shell")
sha512sums=('a864fcc5e1d662813d40119a364b210660ba81309c056cc5bdc8cbdb0599d298211ed5cee09c4eeb7425016d493f097d03ece3f24a1527c0bc5e05c34eefb4e2'
            '9b9c662482b0db71e609857df7fb2e30c6448b0ef2142ccdd7a018bac4e37695ad8d85cc0bbe3c60230047873701485764e8df5c3db996f8866b19d372c92651')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/multi-capo-shell
}

#vim: syntax=sh
