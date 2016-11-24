# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-sahel
pkgver=1.0.0_alpha6
pkgrel=1
pkgdesc="A beautiful Persian font."
arch=('any')
url="https://rastikerdar.github.io/sahel-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/sahel-font/releases/download/v${pkgver//_/-}/sahel-font-v${pkgver//_/-}.zip")
install=$pkgname.install
md5sums=('c760041995f30522fecb2223de5b7662')

package() {  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Sahel*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./{Farsi*,Without-Latin}/Sahel*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE  
}
