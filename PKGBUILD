# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://github.com/hobarrera/totp-cli"
license=('MIT')
depends=("ruby-rotp" "ruby-cmdparse" "xclip" "pass")
source=("https://github.com/hobarrera/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2e2321fdb2fdcc18f2ad8b16d4f9da6d')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" PREFIX=usr install
}
