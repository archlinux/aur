# Maintainer: Your Name <your.email@example.com>
pkgname=ulaa-browser
pkgver=140.0.7339.208
pkgrel=1
pkgdesc="The web browser from Zoho. Ulaa combines minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=('x86_64')
url="https://ulaa.com"
license=('MIT')
depends=(
  'atk'
  'bash-completion'
  'ca-certificates'
  'cairo'
  'curl'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk'
  'gtk4'
  'hicolor-icon-theme'
  'libcups'
  'libcurl-gnutls'
  'libudev'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'ttf-liberation'
  'vulkan-icd-loader'
  'xdg-utils'
)
source=("https://github.com/oceanoflaziness/ulaa-browser/raw/main/ulaa-browser-140.0.7339.208-1-x86_64.pkg.tar.zst")
sha256sums=('86668e12243f7ae1405ad22f7717c11a7370a88868eff1fde071079fdd223087') 

build() {
  echo "No build required, precompiled binaries"
}

package() {
  cp -a usr "$pkgdir/"
  cp -a opt "$pkgdir/"
  cp -a etc "$pkgdir/"
}

