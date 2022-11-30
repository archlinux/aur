# Maintainer: svr3408 svr3408@gmail.com

pkgname="keepass-plugin-keeautoexec"
pkgver=2.5
pkgrel=1
pkgdesc="A KeePass plugin allows to automatically open additional databases when opening a database."
arch=("any")
url="http://keepass.info/plugins.html#keeautoexec"
license=("GPLv2")
depends=("keepass")
source=("http://keepass.info/extensions/v2/keeautoexec/KeeAutoExec-$pkgver.zip")
md5sums=('f7a276a5f66097793c64d2ae5f929a4a')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/keepass/plugins"
  install -m644 KeeAutoExec.plgx "${pkgdir}"/usr/share/keepass/plugins/
}

# vim:set ts=2 sw=2 et:
