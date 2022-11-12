# Maintainer : Ivan Podmazov <ivanpzv [eight] at gmail com>

pkgname=usage-logging
pkgdesc="Create daily log files with hour x minute rectangle diagram of device on/off status"

pkgver=1
pkgrel=1

arch=('any')
license=('Unlicense')
depends=(cron)

source=('another-minute.sh')
md5sums=('7a365ee024107614b65e2317c018977c')

install=usage-logging.install

package ()
{
    install -Dm 744 another-minute.sh "$pkgdir/usr/bin/usage-logging/another-minute.sh"
}

