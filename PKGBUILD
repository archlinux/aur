# Maintainer: liberodark

pkgname=stacer-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/oguzhaninan/Stacer"
license=('MIT')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
source_x86_64=("https://github.com/oguzhaninan/Stacer/releases/download/v${pkgver}/stacer_${pkgver}_amd64.deb")
source=($pkgname.desktop)
sha512sums=('94db30c966fac736d42a5b02283ea23798877848c510bd181aed5f44e0eba3f54776716a8a51bd3be15d34d5138135ec101009fa98446546b83f7652ea87916c')
sha512sums_x86_64=('b28c09cdc388c25db8aa145ac0a6ea7aae31ef9647af8068201cceff58a87d5cb2b86b8bbd382acc8dca6e3b6483a9ba6239123a4eedf68b28c507fb867c3a46')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

