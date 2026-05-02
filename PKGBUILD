# Maintainer: Huff Mullen <huffmakesthings@gmail.com>
# Binary release from GitHub; pkgver follows upstream tag (no leading v).

pkgname=tyrannus
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal word processor (Ratatui)"
arch=('x86_64')
url="https://github.com/huffs-projects/tyrannus"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')

_gh_release_tag='0.1.1'
source=("https://github.com/huffs-projects/tyrannus/releases/download/${_gh_release_tag}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz")

sha256sums=('7a112c32428e558cf686f62a578da458e9117786c750d59521be7e12ecde3387')

package() {
  tar -xzf "${srcdir}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/tyrannus" "${pkgdir}/usr/bin/tyrannus"
}
