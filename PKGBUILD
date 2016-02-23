# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=anitya
pkgver=0.8.0
pkgrel=1
pkgdesc='A release monitoring project that regulary checks if a project has made a new release'
arch=(any)
license=(GPLv2)
url='https://release-monitoring.org'
depends=(python2 python2-sqlalchemy python2-openid python2-flask-openid python2-flask python2-wtforms python2-flask-wtf python2-docutils python2-markupsafe python2-bunch python2-fedmsg python2-dateutils python2-straight.plugin python2-requests)
# pip is out-of-date
source=(anitya-$pkgver.zip::https://github.com/fedora-infra/anitya/archive/$pkgver.zip)
sha1sums=('f49f7bc163658a2d82ec7017bd31361a8424733d')

package() {
  cd anitya-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
