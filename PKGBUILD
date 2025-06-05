# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.1.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell')
source=("$pkgname" "multi-capo-shell")
sha512sums=('db8bac0a69c75a1b3d267600aadddce3d5d67c503b9441e0d1bc236da3c3060df7e83d90fe74baa54958916998ae3b6348fdd47a262e4d938cde3ae95fbb06b0'
            '961468b8c39de3fb8ada37fdf57c50edc7912ed0b287153657e8fe2a6a656b5f26308b120c377d04b590a3d484108ca8070708bb25d3de2087080a09a5b2c57d')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
}

#vim: syntax=sh
