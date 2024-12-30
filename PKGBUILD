# Maintainer: dandenkijin <denkijin at proton dot me>
pkgname=yt-x
pkgver=0.4.0
pkgrel=3
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
replaces=(yt-x-git)
provides=(yt-x
  yt-x-git)
source=($pkgname-$pkgver::https://raw.githubusercontent.com/Benexl/$pkgname/refs/tags/v$pkgver/$pkgname)
noextract=()
b2sums=('f62319b412da076da9f029e710084a25d26452128cb598dce4a03c179d6ffbdf4a0dde1efc59f9dbcb2304bb7b3cc4573e6e0038b57a67edf8d04dbcb4666741')

package() {
  cd "$srcdir/"
  install -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
