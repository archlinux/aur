# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com
# Contributor: Ashik Salahudeen ashik at inflo dot ws

pkgname=otf-manjari
pkgver=2.000
pkgrel=1
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
license=("OFL")
url="https://releases.smc.org.in/fonts/manjari"
source=(
"$url/Version$pkgver/manjari-Version$pkgver.zip"
"$url/Version$pkgver/OFL.txt"
"67-smc-manjari.conf"
)
sha256sums=('cb0d60a6d8a20d7da8c9bb7689a27924b068f0b21bd1af61bc85a2b4969b9c6f'
            '3ff5ecb5ffbfe008bcc1e2861f2124aabd5571ad1ae9badc245a4e383727ccd2'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/manjari" *.otf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}
