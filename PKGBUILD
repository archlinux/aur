# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=kpscript
pkgver=2.32
pkgrel=1
pkgdesc="KeePass scripting utility"
arch=('any')
url="http://keepass.info/plugins.html#kpscript"
license=('GPL')
depends=('keepass')
source=("http://keepass.info/extensions/v2/kpscript/KPScript-${pkgver}.zip"
        "kpscript")
md5sums=('7e86d60e40e9cfff2551e36fae579ff7'
         '49aaf670eb8642bc274b73a6756ba04d')

package() {
  cd "${srcdir}"
  install -D -m644 KPScript.exe "${pkgdir}/usr/share/keepass/KPScript.exe"
  install -D -m755 kpscript "${pkgdir}/usr/bin/kpscript"
}

# vim:set ts=2 sw=2 et:
