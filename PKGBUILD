# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=jottalib-git
pkgver=0.5.1
pkgrel=3
pkgdesc="A library to access files stored at jottacloud.com - Install humanize using pip2"
arch=("any")
url="https://github.com/Fjodor42/jottalib"
license=('GPL3')
depends=('python2'
         'python2-requests'
         'python2-requests-toolbelt'
         'python2-certifi'
         'python2-dateutil'
         'python2-six'
         'python2-lxml'
         'python2-xattr'
         'python2-chardet'
         'python2-clint'
         'python2-fusepy'
         'python2-watchdog')
provides=("jottalib")
conflicts=("jottalib")
source=('git+https://github.com/Fjodor42/jottalib.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir/jottalib"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
#
