# Maintainer: novenary <streetwalkermc@gmail.com>

pkgname=longoverdue
pkgver=0.5.4
pkgrel=1
pkgdesc="System service update management made easy"
arch=('any')
url="https://github.com/9ary/$pkgname"
license=('MIT')
depends=('python' 'python-click' 'lsof')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('667cbfef709c93093ed1bef8779584788b3e6739ee2ae0c77569d5f97cd7472c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 longoverdue.hook $pkgdir/usr/share/libalpm/hooks/longoverdue.hook
  install -Dm 755 longoverdue.py $pkgdir/usr/bin/longoverdue
}
