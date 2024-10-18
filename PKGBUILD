# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=phoenixd-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="phoenixd is the server equivalent of the popular phoenix wallet for mobile"
arch=('x86_64')
url="https://github.com/ACINQ/phoenixd/"
license=('Apache-2.0')
_source="phoenix-$pkgver-linux-x64"
source=("https://github.com/ACINQ/phoenixd/releases/download/v$pkgver/$_source.zip")
sha512sums=('059d56176830d41468e426708b16874245f0184464464bde37d0df64aa26fa2c3aa2dff0542ce3d0e2b97113ee5a7fa693a99cbb89d4f2e0a90b8e25878f1b6f')

package() {
    cd "$_source"
    install -Dm755 "phoenixd" "$pkgdir/usr/bin/phoenixd"
    install -Dm755 "phoenix-cli" "$pkgdir/usr/bin/phoenix-cli"
}
