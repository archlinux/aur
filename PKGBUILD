# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.0.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq')
source=("$pkgname")
sha512sums=('485c93e3a25f2b216ecc37141c3c766a3f905c98dae730d1afa8a8fae639d8d5532fbb7ef1955d96809a61dcea38930f95599b82bbcf24405cbcc3a6254d4760')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
}

#vim: syntax=sh
