# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies-no-sync
pkgver=20240914
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox without Firefox Sync"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=('policies.json')
sha512sums=('52f664d98855d5f2f4e2d43046f00d9163a9ce8a1384dc297f7a52cbb04de2c4c1de44b20305420c085c3bbf6bc1acdbdf03ff0e8f5ce67492c7a9f1c1632b21')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}