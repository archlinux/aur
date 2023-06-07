# Maintainer: Xtr126 <crawleymsh@gmail.com>

pkgname="android-x86-installer-tauri-bin"
pkgver="0.1.2"
pkgrel=1
pkgdesc="Android x86 Installer"
arch=("x86_64")
license=("custom")
url="https://github.com/Xtr126/Android-x86-installer"

depends=(
    'webkit2gtk'
    'libarchive'
)

source=(
	"https://github.com/Xtr126/Android-x86-installer/releases/download/app-v${pkgver}/android-x86-installer_${pkgver}_amd64.deb"
)

sha256sums=('c06716f3d617c78d482c1003b113afb5fb2f619ceb3f654030e8b9012a32b592')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

