# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com
# Contributor: Ashik Salahudeen ashik at inflo dot ws

pkgname=otf-manjari
pkgver=1.920
pkgrel=2
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
license=("OFL")
url="https://releases.smc.org.in/fonts/manjari"
source=(
"$url/Version$pkgver/manjari-Version$pkgver.zip"
"$url/Version$pkgver/LICENSE.txt"
"67-smc-manjari.conf"
)
sha256sums=('492c42d53e9a5f194a88bcbfef13d5893ee6311f691c6044221e78a3c0acfd92'
            '3ff5ecb5ffbfe008bcc1e2861f2124aabd5571ad1ae9badc245a4e383727ccd2'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/manjari" *.otf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}
