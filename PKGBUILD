# Contributor: Giusy Margarita <kurmikon at libero dot it>

_pkgbasename=libappindicator
 
pkgname=python2-libappindicator
pkgver=12.10.0
pkgrel=14
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray'
arch=('x86_64')
url='https://launchpad.net/libappindicator'
license=('LGPL2.1' 'LGPL3')
depends=("${_pkgbasename}-gtk2" 'python2')
source=("python2-${_pkgbasename}-${pkgver}-13-x86_64.pkg.tar.xz")
sha512sums=(
    'df5e7ae721439e0c2f7f816e3811d24d8c872ecb639ad4d44cb8228007bec711be23b134f7632117bc1f7f963371ec5a5e77d8c451339eb20c22b9ed326e4169')
    
package() {
    cp -a "usr" "$pkgdir"
}
