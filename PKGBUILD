# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=totp-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Cli application to generate OTP tokens for two-factor authentication."
arch=(any)
url="https://github.com/hobarrera/totp-cli"
license=('MIT')
depends=("ruby-rotp" "ruby-cmdparse" "xclip" "pass")
source=("https://github.com/hobarrera/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('cbfeffa74a9b9eaa04bbb9524afe0ad5')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" PREFIX=usr install
}
