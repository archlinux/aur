# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: agvares <omen13@bk.ru>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=codelite-bin
pkgver=18.2.0
pkgrel=1
_pkgubuntu="ubuntu-noble"
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=(x86_64)
url="https://codelite.org/"
license=(GPL-2.0)
depends=(gcc-libs glibc bash python php openssl fontconfig libtiff zlib libwebp gtk3 wayland expat cairo hunspell pango libglvnd libjpeg-turbo sqlite libxkbcommon hicolor-icon-theme pcre2 libx11 libxtst glib2 libpng libsm libssh gdk-pixbuf2)
optdepends=( 'graphviz: callgraph visualization'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
             'php: php IDE capabilities'
             'nodejs: for Node.js IDE'
            )
provides=(codelite)
conflicts=(codelite)

source_x86_64=("https://downloads.codelite.org/codelite/${pkgver}/CodeLite-${pkgver}-gtk3-${_pkgubuntu}-x86_64.deb")
sha256sums_x86_64=('0dfab01dfad894089e609f027502e7c920beb93609cf49aaee56465d450c9d03')

package() {
    bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
