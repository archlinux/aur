# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-tanha
pkgver=0.4.1
pkgrel=1
pkgdesc="A beautiful Persian font based on ttf-samim and ttf-vazir."
arch=('any')
url="https://rastikerdar.github.io/tanha-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/tanha-font/archive/master.zip")
install=$pkgname.install
md5sums=('feb9a30916494297aeec9069f5c4bfa7')

package() {      
    install -d $pkgdir/usr/share/fonts/$pkgname
    cd tanha-font-master
    cp -a ./dist/Tanha.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
