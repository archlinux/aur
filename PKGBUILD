# Maintainer: Ali Mahmoud <aur.c3rt@gmail.com>
pkgname=geforcenow-native
pkgver=1.0.0  # bump manually on major releases
pkgrel=2
pkgdesc="NVIDIA GeForce NOW official beta Linux client (Flatpak)"
install=gfn.install
arch=('any')
url="https://www.nvidia.com/en-us/geforce-now/"
license=('custom:NVIDIA')
depends=('flatpak')
source=("geforcenow.flatpakrepo::https://international.download.nvidia.com/GFNLinux/flatpak/geforcenow.flatpakrepo")
sha256sums=('b1ce93879331a150281247b5239e7f8ab04a46929a78637f9528d58350779dbc')

package() {
  # No actual files to install; post-install script handles Flatpak setup
  install -Dm644 "${srcdir}/geforcenow.flatpakrepo" \
    "${pkgdir}/usr/share/flatpak/remotes/geforcenow.flatpakrepo"
}
