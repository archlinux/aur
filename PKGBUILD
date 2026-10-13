# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: dandenkijin <denkijin at proton dot me>

pkgname=yt-x
pkgver=0.8.7
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
b2sums=('7934f5fd74d948e28f4416ef2e32cd5b07685145d6a9f748aa7613d3301df907821229b32796ed147ab94841ed848ba5b848170bb969a09c093bca0745e90fc1')

package() {
  cd "$srcdir/"

  install -D "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
