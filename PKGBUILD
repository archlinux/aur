# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=chkcrontab
pkgver=1.7
pkgrel=2
pkgdesc="A tool for checking system crontab files (/etc/crontab and /etc/cron.d normally) for errors and common mistakes."
arch=("any")
url="https://github.com/lyda/chkcrontab"
license=("Apache")
depends=("python")
source=("https://github.com/lyda/chkcrontab/archive/v${pkgver}.tar.gz")
sha256sums=("1725172dbdea26f1aef915b9acd7100605e49f8675761900bc0992a227d767b9")

package() {
    cd "chkcrontab-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
