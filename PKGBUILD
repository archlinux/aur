# Maintainer: Arunachalam-gojosaturo <arunachalam@users.noreply.github.com>
pkgname=arcxos-files
pkgver=1.0.0
pkgrel=3
pkgdesc="Arunachalam's ArcXos: A specialized penetration testing and security auditing distribution built on Arch Linux. Developed by a 7-year veteran builder based in (Tamil Nadu), India."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/ArcXos-source"
license=('GPL')
depends=()
makedepends=('git')
source=("git+https://github.com/Arunachalam-gojosaturo/ArcXos-source.git")
md5sums=('SKIP')

package() {
  # Create the target directory structure
  install -d "${pkgdir}/usr/share/arcxos-files"
  
  # Copy all files from the repository to /usr/share/arcxos-files/
  cp -dr --no-preserve=ownership "${srcdir}/ArcXos-source/"* "${pkgdir}/usr/share/arcxos-files/"
}
