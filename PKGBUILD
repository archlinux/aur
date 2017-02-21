# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=1.4.0
pkgrel=1
pkgdesc="pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket, etc.)"
arch=(any)
url="https://bugwarrior.readthedocs.io/en/latest/getting.html"
license=('GPL3')
depends=('python2')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ralphbean/bugwarrior/archive/$pkgver.tar.gz")

package() {
  cd $srcdir/$pkgname-$pkgver

  python2 setup.py install --root=$pkgdir --optimize=1
}

md5sums=('c022adbe7355466fc23f1f2575384445')
