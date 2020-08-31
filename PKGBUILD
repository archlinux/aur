# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=otf-manjari
pkgver=1.910
pkgrel=2
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
license=("OFL")
url="https://releases.smc.org.in/fonts/manjari/"
source=(
"$url/Version$pkgver/manjari-Version$pkgver.zip"
"https://gitlab.com/smc/fonts/manjari/-/raw/master/LICENSE.txt"
"67-smc-manjari.conf"
)
sha256sums=('2d0b8bd1d2df01cfa0db8dde27ad0b050f112fbd9d4a453fa6f0f378b833a3e1'
            '3ff5ecb5ffbfe008bcc1e2861f2124aabd5571ad1ae9badc245a4e383727ccd2'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/manjari" *.otf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}
