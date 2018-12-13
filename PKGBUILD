# Maintainer: Nissar Chababy <funilrys at outlook dot com>

_npmname=asciicast2gif
_npmver=0.2.1
pkgname=nodejs-asciicast2gif
pkgver=0.2.1
pkgrel=1
pkgdesc="Generate GIF animations from asciicasts (asciinema recordings)"
arch=(any)
url="https://github.com/asciinema/asciicast2gif"
license=(MIT)
depends=('nodejs' 'npm' 'gifsicle')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2b0b8c2acde3ecc1b32f4f5321be859ebede82c0)

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}