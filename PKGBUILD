# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-shabnam
pkgver=1.0.2
pkgrel=1
pkgdesc="A beautiful Persian font based on ttf-vazir."
arch=('any')
url="https://rastikerdar.github.io/shabnam-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/shabnam-font/releases/download/v$pkgver/shabnam-font-v$pkgver.zip")
install=$pkgname.install
md5sums=('1a38d4fb4380dfed7a9b20bb9330b364')

package() {  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Shabnam*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./{Farsi*,Without-Latin}/Shabnam*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
