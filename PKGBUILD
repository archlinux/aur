pkgname="unity-installer-arch"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Install the Unity desktop on Arch"
arch=("x86_64")
depends=("python3" "git" "paru" "libnewt")
source=("unity-installer-arch")
sha512sums=("SKIP")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp unity-installer-arch "${pkgdir}/usr/bin"
  chmod +x "${pkgdir}/usr/bin/unity-installer-arch"
}
