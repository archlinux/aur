# Maintainer: Nissar Chababy <funilrys at outlook dot com>

_npmname=asciicast2gif
_npmver=0.2.0
pkgname=nodejs-asciicast2gif
pkgver=0.2.0
pkgrel=2
pkgdesc="Generate GIF animations from asciicasts (asciinema recordings)"
arch=(any)
url="https://github.com/asciinema/asciicast2gif"
license=(MIT)
depends=('nodejs' 'npm' 'gifsicle')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2265003593b7c601d589040b27ef5570de22f692)

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}