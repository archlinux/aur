# Maintainer: Matthew Gamble

pkgname=chkcrontab
pkgver=1.6
pkgrel=1
pkgdesc="A tool for checking system crontab files (/etc/crontab and /etc/cron.d normally) for errors and common mistakes."
arch=('any')
url='http://code.google.com/p/chkcrontab/'
license=('Apache')
depends=('python')
source=("https://github.com/lyda/chkcrontab/archive/v$pkgver.tar.gz")
sha256sums=("be7436d5ece4ad6390365f6edf0f1dc59dfd655a9de3b4699884343ceb150f2e")

package() {
    cd "chkcrontab-$pkgver"
    python setup.py install --root="$pkgdir"
}
