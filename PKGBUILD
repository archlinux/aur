# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=phoenixd-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="phoenixd is the server equivalent of the popular phoenix wallet for mobile"
arch=('x86_64')
url="https://github.com/ACINQ/phoenixd/"
license=('Apache-2.0')
_source="phoenix-$pkgver-linux-x64"
source=("https://github.com/ACINQ/phoenixd/releases/download/v$pkgver/$_source.zip")
sha512sums=('fb1f54e22b8c0a2be81aba5f510dfd45f721842cdd7133370bae5b6928c51e48b83220a6da1fc999cfc5939c475ddc5f98ea630c7a5e2a1a3dcf4abc673af5a5')

package() {
    cd "$_source"
    install -Dm755 "phoenixd" "$pkgdir/usr/bin/phoenixd"
    install -Dm755 "phoenix-cli" "$pkgdir/usr/bin/phoenix-cli"
}
