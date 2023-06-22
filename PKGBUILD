# Maintainer: Xtr126 <crawleymsh@gmail.com>

pkgname="android-x86-installer-tauri-bin"
pkgver="0.1.3"
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

sha256sums=('4055716491eeb4876cf843748cf1a0db382b4fb3444c01dd4cd674d44cf00657')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

