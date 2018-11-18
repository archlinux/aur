# Maintainer: zephy <echo "emVwaHlAYWlybWFpbC5jYwo=" | base64 -d>
pkgname=xnufont
pkgver=1.0
pkgrel=1
pkgdesc='XNU kernel font port to linux console'
arch=(any)
url="https://github.com/vladkorotnev/$pkgname"
license=(custom:APSL)
source=("$url/releases/download/$pkgver/Lat15-XNU8x16.psf")
md5sums=('SKIP')

package() {
  cd "$srcdir"
  _consolefonts="$pkgdir/usr/share/kbd/consolefonts"
  tar -czvhf Lat15-XNU8x16.psf.gz Lat15-XNU8x16.psf
  install -Dm644 Lat15-XNU8x16.psf.gz "$_consolefonts/Lat15-XNU8x16.psf.gz"
}