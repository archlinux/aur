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

sha256sums=('d691ddef1f8e165eb09da1d95c99e819503c37a858132ce90c9409d6177c2347')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

