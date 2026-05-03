# Maintainer: Huff Mullen <huffmakesthings@gmail.com>
# Binary release from GitHub; pkgver follows upstream tag (no leading v).

pkgname=tyrannus
pkgver=0.1.2.2
pkgrel=1
pkgdesc="Terminal word processor (Ratatui)"
arch=('x86_64')
url="https://github.com/huffs-projects/tyrannus"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')

_gh_release_tag='0.1.2.2'
source=("https://github.com/huffs-projects/tyrannus/releases/download/${_gh_release_tag}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz")

sha256sums=('a118a43459cb894229dca6fdb160a5550372ff0ced6ca0e8507321d83567e419')

package() {
  tar -xzf "${srcdir}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/tyrannus" "${pkgdir}/usr/bin/tyrannus"
}
