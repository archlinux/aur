# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-gandom
pkgver=0.4.4
pkgrel=1
pkgdesc="A beautiful Persian font based on ttf-samim."
arch=('any')
url="https://rastikerdar.github.io/gandom-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/gandom-font/releases/download/v$pkgver/gandom-font-v$pkgver.zip")
install=$pkgname.install
md5sums=('ef14a30dbd73a697211df2fcc0172d2c')

package() {
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Gandom.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./{Farsi*,Without-Latin}/Gandom-*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
