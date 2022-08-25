# Maintainer: Sebastiaan Tammer <sebastiaantammer at gmail dot com>
# Contributor: David Birks <david at birks dot dev>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=kubeseal-bin
pkgver=0.18.2
pkgrel=1
pkgdesc='A tool for one-way encrypted secrets in Kubernetes'
arch=('x86_64')
url='https://github.com/bitnami-labs/sealed-secrets'
license=('Apache')
provides=('kubeseal')
conflicts=('kubeseal')
source=("$pkgname-$pkgver::https://github.com/bitnami-labs/sealed-secrets/releases/download/v$pkgver/kubeseal-$pkgver-linux-amd64.tar.gz")
sha256sums=('dd09381a65983c3617e00a41cce19ec37f7e4c5c23c9a048bd8812bf057727ca')

package() {
  install -Dm 755 "$srcdir"/kubeseal "$pkgdir"/usr/bin/kubeseal
  install -Dm 644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/kubeseal/LICENSE
}

