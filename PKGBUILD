# Maintainer: Jesse McClure aka "Trilby" <jesse dot mcclure at umassmed dot edu>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=60.0.3112.90
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url='http://www.widevine.com/'
license=('custom')
options=('!strip')
depends=('qt5-webengine')
source_i686=("https://dl.google.com/widevine-cdm/1.4.8.1008-linux-ia32.zip")
source_x86_64=("https://dl.google.com/widevine-cdm/1.4.8.1008-linux-x64.zip")
sha256sums_i686=('a8e65d5fd65587d1debecf6df855689805ea36b02034042de4d039f0519a1c88')
sha256sums_x86_64=('fe04a5b56eac6674f1eda2c8eb28a0183ec1a66d80f72db618291e33078eb17d')

package() {
  install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/chromium/"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
