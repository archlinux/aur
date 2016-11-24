# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-vazir-code
pkgver=1.0.2
pkgrel=1
pkgdesc="A beautiful monospace Persian font based on ttf-vazir and Inconsolata fonts."
arch=('any')
url="https://rastikerdar.github.io/vazir-code-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/vazir-code-font/releases/download/v$pkgver/vazir-code-font-v$pkgver.zip")
install=$pkgname.install
md5sums=('f42563cc53c703029017b5e9c9d9a09f')

package() {  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Vazir-Code*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
