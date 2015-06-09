# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=everpad
pkgver=2.15.8
pkgrel=1
pkgdesc="Evernote client with Unity integration"
arch=(i686 x86_64)
url="https://github.com/nvbn/everpad/"
license=(GPL)
depends=(python2-beautifulsoup3 python2-dbus python2-keyring python2-magic
         python2-oauth2 python2-pyside python2-pysqlite python2-regex
         shiboken python2-sqlalchemy python2-unity-singlet sni-qt)
makedepends=(python2-distribute python2-webpy)
# Also python2-html2text
source=("https://launchpad.net/~nvbn-rm/+archive/ppa/+files/everpad_${pkgver}.orig.tar.xz")
sha512sums=('2c356ac0f5741fe762aad71715cb97d7d69e6e1ddacb1333cd69f8b8c2521404c6fa131b2f72f772a1ac26e26fb8bda83c0648221e7018eabf2670087159e145')

package() {
  cd everpad

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
