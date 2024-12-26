pkgname=readest
pkgver=0.8.6
pkgrel=1
pkgdesc="Description of your app"
arch=('x86_64' 'aarch64')
url="https://github.com/readest/readest"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/readest/readest/releases/download/v$pkgver/Readest_"$pkgver"_amd64.deb")
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
sha256sums_x86_64=('fe2f8aac397749d05730600c99d10cf44b13c641084ac0f3c88bbea37537cdfd')
