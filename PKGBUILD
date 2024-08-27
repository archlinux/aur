# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=phoenixd-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="phoenixd is the server equivalent of the popular phoenix wallet for mobile"
arch=('x86_64')
url="https://github.com/ACINQ/phoenixd/"
license=('Apache-2.0')
_source="phoenix-$pkgver-linux-x64"
source=("https://github.com/ACINQ/phoenixd/releases/download/v$pkgver/$_source.zip")
sha512sums=('22d42de1469811d2da13d72913f06daa5e8b22ee022f69c3337896d1c1d247eb8772f0cd11cdd533879b92744ac86c548c52aebc00737265f0a5598cef8a992a')

package() {
    cd "$_source"
    install -Dm755 "phoenixd" "$pkgdir/usr/bin/phoenixd"
    install -Dm755 "phoenix-cli" "$pkgdir/usr/bin/phoenix-cli"
}
