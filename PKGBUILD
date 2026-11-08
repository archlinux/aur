pkgname=prizrak-box-bin
pkgver=2.0.0_rc02
pkgrel=1
pkgdesc="A Simple Mihomo GUI (prebuilt Rust + Slint build)"
arch=('aarch64' 'x86_64')
url="https://github.com/legiz-ru/Prizrak-Box"
license=('GPL-3.0-only')
provides=('prizrak-box')
conflicts=('prizrak-box')
depends=('gtk3' 'libayatana-appindicator' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'polkit' 'xdg-utils')
options=('!strip' '!debug')
install=prizrak-box.install
source_aarch64=("prizrak-box-2.0.0_rc02-aarch64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc02/linux-arm64-aur.tar.zst")
source_x86_64=("prizrak-box-2.0.0_rc02-x86_64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc02/linux-amd64-aur.tar.zst")
sha256sums_aarch64=('c62cd064f306579f0ca7aae16799eef28a8ed9ed1a8e403e92ca7f97a4a6bcd2')
sha256sums_x86_64=('31c6837af95b450a0645088cb6ce002a95d33d0a42fae26881d20cbd83e9974d')

# The source is the release's pacman package: makepkg unpacks it into
# $srcdir, and its usr/ tree is the whole package.
package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
