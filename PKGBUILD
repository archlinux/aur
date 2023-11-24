# Maintainer: Xtr126 <crawleymsh@gmail.com>

pkgname="android-x86-installer-tauri-bin"
pkgver="0.1.4"
pkgrel=1
pkgdesc="Android x86 Installer"
arch=("x86_64")
license=("APACHE")
url="https://github.com/Xtr126/Android-x86-installer"

depends=(
    'webkit2gtk'
    'libarchive'
)

source=(
	"https://github.com/Xtr126/Android-x86-installer/releases/download/app-v${pkgver}/android-x86-installer_${pkgver}_amd64.deb"
)

sha256sums=('5379aae71bb2bd6a9d81eb6ac19188965ff5e3a8fa8d271807aa7c6e54cfd295')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

