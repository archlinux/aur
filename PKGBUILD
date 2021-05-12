# Maintainer: weiliang1503 <weiliang1503@163.com>
pkgname=burpsuite-cnpatch
pkgver=1.0.1
pkgrel=1
pkgdesc="Chinese patch for burpsuite community version"
arch=('any')
url="UNKNOWN"
license=('GPL')
groups=()
depends=('burpsuite')
makedepends=('git')
install=burpsuite-cnpatch.install
source=('https://github.com/weiliang1503/burpsuite-cnpak/releases/download/1.0/BurpSuiteCn.jar'
        'burp-cn.hook'
        'burpsuite-cnpatch.install')
md5sums=('df282917e650c4c2cd1f49e262e6f30f'
         '56436d4f91f49a1930a00d0c517e187a'
         '62d9b205ec48d5bb0003a9fd3d084f97')
noextract=('BurpSuiteCn.jar')

package() {
  
  cd ${srcdir}
  
  install -Dm644 BurpSuiteCn.jar -t ${pkgdir}/usr/share/burpsuite/

  install -Dm644 burp-cn.hook -t ${pkgdir}/usr/share/libalpm/hooks/
  
}

# vim:set ts=2 sw=2 et:
