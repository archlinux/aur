# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: agvares <omen13@bk.ru>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=codelite-bin
pkgver=17.0
pkgrel=1
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=(x86_64)
url="https://www.codelite.org/"
license=(GPL2)
depends=(webkit2gtk gtk3 gcc-libs
        libtiff5
        )
optdepends=( 'graphviz: callgraph visualization'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
             'php: php IDE capabilities'
             'nodejs: for Node.js IDE'
            )
provides=(codelite)
conflicts=(codelite)
source_x86_64=("https://repos.codelite.org/ubuntu/pool/universe/c/codelite/codelite_${pkgver}-1unofficial.jammy_amd64.deb")
sha256sums_x86_64=('245b7e9be74f56e43ce04add4db72c9af253a396d7c14a0996cf468741e50fd0')

package() {
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

}
