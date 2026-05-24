# Maintainer: c3rt1fiedd <aur.c3rt@gmail.com>
pkgname=geforcenow-native
pkgver=3.0.0  # Bump on major releae (update)
pkgrel=1
pkgdesc="NVIDIA GeForce NOW official beta Linux client (Flatpak)"
install=gfn.install
arch=('any')
url="https://www.nvidia.com/en-us/geforce-now/"
license=('custom:NVIDIA')
depends=('flatpak')
source=("geforcenow.flatpakrepo::https://international.download.nvidia.com/GFNLinux/flatpak/geforcenow.flatpakrepo")
sha256sums=('b1ce93879331a150281247b5239e7f8ab04a46929a78637f9528d58350779dbc')

package() {
  install -Dm644 "${srcdir}/geforcenow.flatpakrepo" \
    "${pkgdir}/usr/share/flatpak/remotes/geforcenow.flatpakrepo"
}
