# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-samim
pkgver=1.0.2
pkgrel=1
pkgdesc="A beautiful Persian font based on ttf-vazir."
arch=('any')
url="https://rastikerdar.github.io/samim-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/samim-font/releases/download/v$pkgver/samim-font-v$pkgver.zip")
install=$pkgname.install
md5sums=('8c68e9dbdb1a6845cb472bc3da119a55')

package() {  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Samim*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./{Farsi*,Without-Latin}/Samim*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
