# Maintainer: Luke Arms <luke@arms.to>

pkgname=asciicast2gif
pkgver=0.2.1
pkgrel=1
pkgdesc="Generate GIF animations from asciicasts (asciinema recordings)"
arch=('any')
license=('MIT')
url="https://github.com/asciinema/asciicast2gif"
depends=('nodejs' 'gifsicle')
makedepends=('npm')

package() {
    npm install -g --prefix "$pkgdir/usr" "$pkgname@$pkgver"
}
