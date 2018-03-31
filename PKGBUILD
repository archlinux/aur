# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=blueranger
pkgver=1.0
pkgrel=4
pkgdesc="A simple Bash script which uses Link Quality to locate Bluetooth device radios."
url="http://www.hackfromacave.net/projects/blueranger.html"
arch=('any')
license=('custom')
depends=('bash')
source=("http://www.hackfromacave.net/download/blueranger.sh")
sha512sums=('143e79501cd72442f852a41b6d7e5315806ee0e3c436cdf7a2c683f826d44801be202c503922a2dc7c10a25a798868d05ed8f6adf129845bbd74fc926b980b0a')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 blueranger.sh "$pkgdir/usr/bin/blueranger"
}
