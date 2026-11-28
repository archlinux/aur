# Maintainer: Fred Mitchell <fred at atomlogik dot de>

pkgname=slit-scan-bin
_pkgname=slit-scan
pkgver=0.2.3
pkgrel=1
pkgdesc="Streaming tunnels of light from images, videos and a camera (binary release)"
arch=('x86_64')
url="https://github.com/flajann2/slit-scan-cpp"
license=('MIT')
# The same shared libraries the source package links against: this is a
# distro binary, not a self-contained one.
depends=('gtkmm-4.0' 'opencv' 'yaml-cpp' 'libzip' 'ffmpeg' 'freetype2'
         'glibmm-2.68' 'libsigc++-3.0' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-$pkgrel-$CARCH.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$pkgrel-$CARCH.tar.zst")
sha256sums=('5c46245561d14e0d2bf5ef2165e383a2c2c1e4e44e7df462cac8ca34e4de3085')

package() {
  cp -a usr "$pkgdir/usr"
}
