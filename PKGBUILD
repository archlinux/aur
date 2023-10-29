# Maintainer: Julian Pollinger <julian@pollinger.dev>
_pkgname=muse-sounds-manager
pkgname="$_pkgname-bin"
pkgver=1.1.0.587
pkgrel=1
pkgdesc="Manage MuseScore Libraries"
arch=('x86_64')
url='https://www.musehub.com/'
provides=("$_pkgname=$pkgver")
replaces=('muse-hub')
conflicts=('muse-hub')
depends=('aarch64-linux-gnu-gcc')
makedepends=('tar')
install="$_pkgname.install"
source=('https://muse-cdn.com/Muse_Sounds_Manager_Beta.deb')
sha256sums=('c3364022399ed5cbfcfa330b88a4fb91442f09bf9486cbce9cb0d5e2108bde1c')
options=('!strip')

package(){
  # Extract package data
  tar -xJ -f data.tar.xz -C "$pkgdir"

  # Create necessary directories
#   mkdir -p "${pkgdir}/tmp/muse-hub"
#   mkdir -p "${pkgdir}/tmp/muse-sounds-manager"  
}