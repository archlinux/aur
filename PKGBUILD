# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

pkgname=cjdnsify
pkgver=1.0
epoch=1
pkgrel=1
pkgdesc='Limit network access of bind-compatible programs to the local cjdns network'
url='https://github.com/prurigro/cjdnsify'
license=('GPL')
depends=('bash' 'cjdns' 'force_bind')
arch=('any')
backup=("etc/default/$pkgname")
source=("https://github.com/prurigro/cjdnsify/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4711b9bfdb17d3afd341c115dea4a6bf5f3095f0c2de51c8e7ac9d9f26900c532ae663b7581519ebfa74fd5ea41981cc8bdc3cabb01f7f25da116f780b911e77')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.conf "$pkgdir/etc/default/$pkgname"
}
