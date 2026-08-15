# Maintainer: ilonachan < n a g a t o _ i l o n a at p r o t o n dot m e >

pkgname=appimagelauncher-beta-bin
_pkgname=appimagelauncher
pkgver=3.0.0_beta_3
_pkgver_details=3.0.0-beta-2-gha287.96cb937
pkgrel=1
pkgdesc="Helper app that 'makes your Linux desktop AppImage ready™.'"
arch=('x86_64')
license=('MIT')
url="https://github.com/TheAssassin/AppImageLauncher"
provides=("${_pkgname%}")
conflicts=("${_pkgname%}")
depends=('cairo' 'desktop-file-utils' 'hicolor-icon-theme' 'libappimage' 'libbsd' 'libxpm' 'qt5-base' 'shared-mime-info')

source=("https://github.com/TheAssassin/AppImageLauncher/releases/download/v${pkgver//_/-}/appimagelauncher_${_pkgver_details}_amd64.deb")
sha256sums=('4117552105968a8011955d065b5fd55f547a2ed21dac1fe0a046ee9b60220c36')

package() {
  cd "$srcdir/"
  tar xaf data.tar.xz -C $pkgdir
  cd $pkgdir/usr/share/applications
}
