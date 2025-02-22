# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=sdlk
pkgver=0.0.1
pkgrel=1
pkgdesc="SDL2 Kit (SDL2 Wrapper)"
arch=('x86_64')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf')
url="https://github.com/RickaPrincy/sdlk"
license=('MIT')
source=("sdlk@$pkgver.tar.gz::https://github.com/RickaPrincy/sdlk/releases/download/v0.0.1/sdlk@$pkgver.tar.gz")

sha256sums=("7750ebde2de18f8d4406c2ff2f9dbe761258e99bf3eb9f201249bbc880f8df38")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "sdlk@$pkgver/include" "$pkgdir/usr"
    cp -r "sdlk@$pkgver/lib" "$pkgdir/usr"
}
