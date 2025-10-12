# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=phoenixd-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="phoenixd is the server equivalent of the popular phoenix wallet for mobile"
arch=('x86_64')
url="https://github.com/ACINQ/phoenixd/"
license=('Apache-2.0')
_source="phoenixd-$pkgver-linux-x64"
source=("https://github.com/ACINQ/phoenixd/releases/download/v$pkgver/$_source.zip")
sha512sums=('b846f516484381967d99ec464675f07a3273ca0c613d8999499fd95e31c04f9f777828d043a3a68fc58b653bc104d35e35c707f25b44a4753516620fbbf57cd8')

package() {
    cd "$_source"
    install -Dm755 "phoenixd" "$pkgdir/usr/bin/phoenixd"
    install -Dm755 "phoenix-cli" "$pkgdir/usr/bin/phoenix-cli"
}
