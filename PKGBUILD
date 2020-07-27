# Maintainer: Roshless <pkg@roshless.com>

pkgname=nnrss-uwsgi
pkgver=2
pkgrel=1
pkgdesc='uWSGI configuration for nnrss'
url='https://git.roshless.me/~roshless/nnrss'
arch=('any')
license=('GPL')
depends=('nnrss' 'uwsgi' 'uwsgi-plugin-python')
source=("nnrss.ini")

package() {
  install -Dm644 nnrss.ini "$pkgdir/etc/uwsgi/nnrss.ini"
}

md5sums=('d95cddcc135bd0ea4edc2a0de6d75974')
