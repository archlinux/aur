# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Bartosz Chmura <chmurli@gmail.com>

pkgname=ttf-chromeos-fonts
_pkgname=croscorefonts
pkgver=1.31.0
pkgrel=1
pkgdesc="Chrome OS true type fonts: Arimo, Tinos and Cousine"
arch=('any')
url="http://code.google.com/p/chromium-os/issues/detail?id=5287"
license=('apache')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-google-webfonts')
install=$pkgname.install
source=("http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/$_pkgname-$pkgver.tar.bz2")
sha256sums=('672c3487883ec1ef83d9254240d4327b014212abc823d06d15816095867315e1')


package() {
  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$_pkgname-$pkgver/"*.ttf "$pkgdir/usr/share/fonts/TTF"
}
