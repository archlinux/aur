pkgname=arch-files
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux Files GUI"
arch=('any')
url="https://archlinux.org"
license=('custom')
makedepends=('pyinstaller' 'python' 'tk')
source=("https://github.com/SergeyDash/arch-files/releases/download/1.0.0/arch-files-1.0-1-any.pkg.tar.zst")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"

  # Install the built binary to the package directory
  sudo pacman -U "${srcdir}/arch-files-1.0-1-any.pkg.tar.zst"
}
