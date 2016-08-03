# Quick tip:
# When developing this package
# Use `PKGEXT=".pkg.tar" makepkg` to build
# That way you don't have to wait for ~150MB to compress down to ~40MB.

# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=moeditor-bin
pkgver=0.1.0_beta
pkgrel=1
epoch=
pkgdesc="All-purpose markdown editor based on Electrum"
arch=('x86_64')
url="https://github.com/Moeditor/Moeditor"
license=('GPL3')
groups=()
depends=('gtk2' 'libxss' 'libxtst' 'alsa-lib' 'nss' 'gconf')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# first one changes the _ to -, second one removes the -beta entirely.
source=("https://github.com/Moeditor/Moeditor/releases/download/v${pkgver//_/-}/moeditor_${pkgver//_beta/}-1_amd64.deb")
noextract=()
md5sums=('8bb8ca46d63d61ada501a24a951a1c29')
sha512sums=('bf691d4a089271b677b1873046675954cd843d00288de0b6926039ab481341141e0d63e3b198c7f60587740b3718d030d8822b4630c0dea1aab0b5f6861fee38')
validpgpkeys=()

package() {
  bsdtar xf data.tar.xz
  mv usr "$pkgdir"
}
