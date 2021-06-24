# Maintainer: Leon Mergen <leon@solatis.com>
# Co-Maintainer: Barfin
pkgname=treesheets-bin
pkgver="1.0.2"
pkgrel=1
pkgdesc="TreeSheets free form data organizer"

url="http://strlen.com/treesheets/"
license=("custom: Zlib License")

depends=("glibc" "wxgtk3")
arch=('x86_64')
provides=('treesheets')

# https://packages.ubuntu.com/focal/amd64/treesheets/download
source=("http://mirrors.kernel.org/ubuntu/pool/universe/t/treesheets/treesheets_${pkgver}-1build1_amd64.deb")

sha256sums=('9484be8fce75a75a6f913f446f2eb8bb7e76e8c538f88de29ff5aee90c9ad358')

package() {
    tar -xJvf  data.tar.xz -C "${pkgdir}"
}
