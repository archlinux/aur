# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com
# Contributor: Ashik Salahudeen ashik at inflo dot ws

pkgname=otf-manjari
pkgver=2.200
pkgrel=1
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
license=("OFL")
url="https://smc.org.in/fonts"
source=(
"https://releases.smc.org.in/fonts/manjari/Version$pkgver/manjari-Version$pkgver.zip"
"https://releases.smc.org.in/fonts/manjari/Version$pkgver/OFL.txt"
"67-smc-manjari.conf"
)
sha256sums=('21fafa55a014e8e64608050850f9ad1696a22a9ebdf8c776b6a24bd436852264'
            '98e21c8ab60aec8ca7e3a21cd323fb7ae9807b6d37961bbd65cd1389fa502ea1'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')
package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/manjari" *.otf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}
