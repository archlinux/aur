# Maintainer: Huff Mullen <huffmakesthings@gmail.com>
# Binary release from GitHub; pkgver follows upstream tag (no leading v).

pkgname=tyrannus
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal word processor (Ratatui)"
arch=('x86_64')
url="https://github.com/huffs-projects/tyrannus"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')

_gh_release_tag='0.1.0'
source=("https://github.com/huffs-projects/tyrannus/releases/download/${_gh_release_tag}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz")

sha256sums=('750bab72b22b0ea87cc45ab3be5a47f8650c65d108b8857357ad74022fb270a8')

package() {
  tar -xzf "${srcdir}/tyrannus-${_gh_release_tag}-linux-x86_64.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/tyrannus" "${pkgdir}/usr/bin/tyrannus"
}
