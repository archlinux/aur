# Maintainer: Xtr126 <crawleymsh@gmail.com>

pkgname="android-x86-installer-tauri-bin"
pkgver="0.1.3"
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

sha256sums=('74ccf8097638710eb858ab05751ca3c1f3f844d9faefee5c9b10bd77beb80913')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

