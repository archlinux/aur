# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.0.2
pkgrel=0
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq')
source=("$pkgname")
sha512sums=('db8bac0a69c75a1b3d267600aadddce3d5d67c503b9441e0d1bc236da3c3060df7e83d90fe74baa54958916998ae3b6348fdd47a262e4d938cde3ae95fbb06b0')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
}

#vim: syntax=sh
