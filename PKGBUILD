# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-tanha
pkgver=0.3
pkgrel=2
pkgdesc="A beautiful Persian font based on ttf-samim and ttf-vazir."
arch=('any')
url="https://rastikerdar.github.io/tanha-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/tanha-font/archive/master.zip")
install=$pkgname.install
md5sums=('a4672c558161f89a4ae84b1f9fe151eb')

package() {
    cd tanha-font-master  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Tanha.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./persian-digits-overwrite/Tanha*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
