# Maintainer: Huff Mullen <huffmakesthings@gmail.com>
# Binary release from GitHub; pkgver follows upstream tag (no leading v).

pkgname=tyrannus
pkgver=0.1.2.1
pkgrel=1
pkgdesc="Terminal word processor (Ratatui)"
arch=('x86_64')
url="https://github.com/huffs-projects/tyrannus"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')

_gh_release_tag='0.1.2.1'
source=("https://github.com/huffs-projects/tyrannus/releases/download/${_gh_release_tag}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz")

sha256sums=('f19dcd52e15192639fa4ac7e2d7ce7ce49f8d2c78994d0adbdf45f47383c7110')

package() {
  tar -xzf "${srcdir}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/tyrannus" "${pkgdir}/usr/bin/tyrannus"
}
