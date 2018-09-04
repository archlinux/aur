# Maintainer: Kyle Avrett <kyle dot avrett at gmail dot com>
pkgname=i3-projects
pkgver=1.1.1
pkgrel=1
pkgdesc="Project creation and management for i3-wm"
arch=("any")
url="https://github.com/zzelman/i3-projects"
license=('GPL3')
depends=('i3-wm' 'python3' 'zenity')
source=("git+https://github.com/zzelman/i3-projects.git#tag=release/1.1.1")
md5sums=("SKIP")

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/i3-projects/i3-projects" "${pkgdir}/usr/bin"
  chmod 755 "${pkgdir}/usr/bin/i3-projects"
}
