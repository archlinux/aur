# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-vazir
pkgver=5.1.1
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
arch=('any')
url="https://rastikerdar.github.io/vazir-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/vazir-font/releases/download/v$pkgver/vazir-font-v$pkgver.zip")
install=$pkgname.install
md5sums=('9d91938ce5ff0ea7224260605cd43440')

package() {  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Vazir*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./{Farsi*,Without-Latin}/Vazir*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
