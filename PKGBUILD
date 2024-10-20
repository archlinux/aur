# Maintainer: Xtr126 <k.gunetilleke@gmail.com>

pkgname="android-x86-installer-tauri-bin"
pkgver="0.1.7"
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

sha256sums=('6d9361c1d0007004f743e2a4ac33f22fc6a7e733f7862af8b6caa3b5c0b09048')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

