# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-vazir-code
pkgver=1.0.3
pkgrel=1
pkgdesc="A beautiful monospace Persian font based on ttf-vazir and Inconsolata fonts."
arch=('any')
url="https://rastikerdar.github.io/vazir-code-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/vazir-code-font/releases/download/v$pkgver/vazir-code-font-v$pkgver.zip")
md5sums=('f49285bffe61e437108ea986f4929eae')

package() {  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./Vazir-Code*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE    
}
