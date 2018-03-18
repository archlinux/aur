# Contributor: ifaigios <ifaigios_at_gmail_dot_com>
# Contributor: Alyssa Hung <deciare@isisiew.org>
# Contributor: Matt Brennan
# Contributor: falconindy
# Contributor: adee
# Contributor: mystilleef

pkgname=zramswap
pkgver=2
pkgrel=1
pkgdesc="Sets up zram-based swap devices on boot"
arch=('any')
url="http://en.wikipedia.org/wiki/ZRam"
license=('GPL')
depends=('bash')
source=("zramctrl"
        "zramswap.service")
md5sums=('70e8a5cc219e3fc3c16350b8fa7afb92'
         'a6c029dc942c85704b0f6ac1ca078a24')

package() {
  install -Dm755 zramctrl $pkgdir/usr/lib/systemd/scripts/zramctrl
  install -Dm644 zramswap.service $pkgdir/usr/lib/systemd/system/zramswap.service
}
