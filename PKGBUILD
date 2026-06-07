# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: dandenkijin <denkijin at proton dot me>

pkgname=yt-x
pkgver=0.8.6
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
b2sums=('9ee98a7610c6652da3fa80b11d5756e308f7d50a706736ee79cce5cd5bb01e7fd8c91d870fbd6e739f7dcc6e9ade88705c3aa017572bdeec418b78d677cc4271')

package() {
  cd "$srcdir/"

  install -D "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
