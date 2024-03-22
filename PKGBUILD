# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=phoenixd-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="phoenixd is the server equivalent of the popular phoenix wallet for mobile"
arch=('x86_64')
url="https://github.com/ACINQ/phoenixd/"
license=('Apache-2.0')
_source="phoenix-$pkgver-linux-x64"
source=("https://github.com/ACINQ/phoenixd/releases/download/v$pkgver/$_source.zip")
sha512sums=('f97c2454e9ec895ba65eb1e51e1d8a5c1ae73305e17abe7782382c5522f38090666819935fa46dcbe73d3e282c8769cd7741fb81448aca31ce60e49317d1106a')

package() {
    cd "$_source"
    install -Dm755 "phoenixd" "$pkgdir/usr/bin/phoenixd"
    install -Dm755 "phoenix-cli" "$pkgdir/usr/bin/phoenix-cli"
}
