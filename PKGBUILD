# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.0.1
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq')
source=("$pkgname")
sha512sums=('6a95e39ce48707ca6b678cf0a4daba0402db897db7922064ecf07a85d49249eb207716fa2c6c5cdadb1acd6462f2e0d6aeddaa9450c15550705007fd8c3b3360')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
}

#vim: syntax=sh
