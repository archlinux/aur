# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.1.1
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell')
source=("$pkgname" "multi-capo-shell")
sha512sums=('a864fcc5e1d662813d40119a364b210660ba81309c056cc5bdc8cbdb0599d298211ed5cee09c4eeb7425016d493f097d03ece3f24a1527c0bc5e05c34eefb4e2'
            'a76b113012dbdd86d952f6e6d6d72fd0159e366808597594f04d5f24667e58fffb9bc9722d0addfb6cecd518b5f73d0044beb18962f71bb2c431e1a31e3175d9')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/multi-capo-shell
}

#vim: syntax=sh
