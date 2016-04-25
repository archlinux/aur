# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=anitya
pkgver=0.9.1
pkgrel=1
pkgdesc='A release monitoring project that regulary checks if a project has made a new release'
arch=(any)
license=(GPLv2)
url='https://release-monitoring.org'
depends=(python2 python2-sqlalchemy python2-jinja python2-openid python2-flask-openid python2-flask python2-wtforms python2-flask-wtf python2-docutils python2-markupsafe python2-bunch python2-fedmsg python2-dateutil python2-straight.plugin python2-requests)
# pip is out-of-date
source=(anitya-$pkgver.zip::https://github.com/fedora-infra/anitya/archive/$pkgver.zip)
sha1sums=('e3f4754296561a32073586349cd314e2f409197c')

package() {
  cd anitya-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
