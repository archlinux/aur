# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
pkgver=1.0
pkgrel=2
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://github.com/hobarrera/totp-cli"
license=('MIT')
depends=("ruby-rotp" "xclip" "pass")
source=("https://github.com/hobarrera/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('a561feb1b11588cc670ceb1de237c881')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" PREFIX=usr install
}
