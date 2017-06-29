# $Id: PKGBUILD 224117 2017-04-21 12:56:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Aaron Griffin <aaron.archlinux.org>

pkgname=python2-pysqlite-legacy
pkgver=1.0.1
pkgrel=4
pkgdesc='Python DB-API 2.0 interface for the legacy SQLite 2'
arch=('x86_64' 'i686')
url='https://initd.org/tracker/pysqlite'
replaces=('python-pysqlite-legacy')
license=('custom')
depends=('python2' 'sqlite2')
source=("https://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/pysqlite-$pkgver.tar.gz")
sha256sums=('9ceed0af9e94b2f8701d4f36d7e86715d8ca64283e0b311e1816c031c3658f08')

package() {
  cd "$srcdir/pysqlite"

  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
