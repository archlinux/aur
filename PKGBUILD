# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15composer-runit
pkgver=20211101
pkgrel=1
pkgdesc="g15composer init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15composer"
license=('GPL2')
depends=('g15composer' 'g15daemon-runit')
_filename='g15composer.run'
source=("https://gitlab.com/menelkir/g15composer/-/raw/master/contrib/init/g15composer.run")
sha512sums=('0d92a2d25b15de0fd2a2238574e419d48ba25cb661961d7bea68cfede81770f0b5b3882487ba324238290d222269243e3a1d6b18478b2a7eee242fea60f06340')

package() {
   install -Dm755 "$srcdir/g15composer.run" "$pkgdir/etc/runit/sv/g15composer/run"
}

