# Maintainer: Sebastiaan Tammer <sebastiaantammer at gmail dot com>
# Contributor: David Birks <david at birks dot dev>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=kubeseal-bin
pkgver=0.18.0
pkgrel=1
pkgdesc='A tool for one-way encrypted secrets in Kubernetes'
arch=('x86_64')
url='https://github.com/bitnami-labs/sealed-secrets'
license=('Apache')
provides=('kubeseal')
conflicts=('kubeseal')
source=("$pkgname-$pkgver::https://github.com/bitnami-labs/sealed-secrets/releases/download/v$pkgver/kubeseal-$pkgver-linux-amd64.tar.gz")
sha256sums=('51f3180d0e61d6b51b95f3c99f31d77f4417eb4945a03884afa55c20ce01c19a')

package() {
  install -Dm 755 "$srcdir"/kubeseal "$pkgdir"/usr/bin/kubeseal
  install -Dm 644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/kubeseal/LICENSE
}

