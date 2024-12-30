# Maintainer: dandenkijin <denkijin at proton dot me>
pkgname=yt-x
pkgver=0.4.0
pkgrel=2
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
source=(https://raw.githubusercontent.com/Benexl/$pkgname/refs/tags/$pkgver/$pkgname)
noextract=()
b2sums=('3b856e8209992ee3c895101ef04e94d3c33bfd60c4cae60461428713b5d2148b9ad4fa21c9b48634388a45aa1e25e78b013e96db29f75facbdb1869c995ed79a')

package() {
  cd "$srcdir/"
  install -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
