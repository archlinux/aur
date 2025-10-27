# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: agvares <omen13@bk.ru>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=codelite-bin
pkgver=18.1.0
pkgrel=1
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=(x86_64)
url="https://codelite.org/"
license=(GPL-2.0)
depends=(gtk3 gcc-libs webkit2gtk)
optdepends=( 'graphviz: callgraph visualization'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
             'php: php IDE capabilities'
             'nodejs: for Node.js IDE'
            )
provides=(codelite)
conflicts=(codelite)
source_x86_64=("https://repos.codelite.org/ubuntu-18.1/pool/universe/c/codelite/codelite_${pkgver}-1unofficial.noble_amd64.deb")
sha256sums_x86_64=('175b7143857f465909a99310e0273b20d9f78c9b2af7506d2ebd911cb5d10736')

package() {
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/
}
