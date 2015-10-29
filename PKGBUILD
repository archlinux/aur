# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2
pkgver=0.2.10
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python')
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://docs.backblaze.com/public/b2_src_code_bundles/b2")
sha256sums=('752de33bd599a2ca15ad77b3ab47a565c0b3ba4427b6a206582c9bdfe96d973c')

package() {
    install -D ${srcdir}/b2 ${pkgdir}/usr/bin/b2
}

