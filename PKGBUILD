# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=flipclock
pkgver=2.3.5
pkgrel=1
pkgdesc="A flip clock screensaver supported by SDL2."
arch=(any)
url="https://github.com/AlynxZhou/flipclock"
license=('GPL')
depends=('sdl2' 'sdl2_ttf')
source=("https://github.com/AlynxZhou/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6af64663bf311d1131335038ecb2f1e518cc0afeeed82f42bd873935bf824ca8073a7b8d36dfd9053c43ef38fb2c829ee8ca4745b3c7fbdb185457d9aa1d69a2')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
