# Maintainer: dandenkijin <denkijin at proton dot me>
pkgname=yt-x
pkgver=0.4.5
pkgrel=1
pkgdesc="Browse youtube from your terminal"
arch=(any)
url="https://github.com/Benexl/yt-x"
license=('GPL')
depends=(
  jq
  curl
  yt-dlp
  fzf
  mpv
  ffmpeg
)
makedepends=(git)
optdepends=(
  gum
  chafa
  icat
  imgcat
)
provides=(yt-x)
source=($pkgname-$pkgver::https://raw.githubusercontent.com/Benexl/$pkgname/refs/tags/v$pkgver/$pkgname)
noextract=()
b2sums=('819a3e7ddcf450bbc9f38b8bc5808445f347423877bbc2ce008f3028a2d85bb741d4e9b60fc7885edbb52dab33a04c24c69beb01441e8f7ae1a4dfceeb37578e')

package() {
  cd "$srcdir/"
  install -D "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
