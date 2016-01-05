# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=codelite-bin
_pkgname=codelite
pkgver=9.0
pkgrel=7
pkgdesc="Cross platform IDE for the C/C++ programming languages"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('clang' 'desktop-file-utils' 'wxgtk' 'curl' 'webkitgtk2' 'libssh' 'xterm' 'python2' 'libedit' 'ncurses' 'valgrind' 'libmariadbclient' 'lldb')
pkgdesc="Open-source, cross platform IDE for the C/C++ programming languages"

makedepends=('tar' 'xz')
optdepends=('graphviz: callgraph visualization')
install=codelite.install
replaces=('codelite' 'codelite-svn')
provides=('codelite')

source=("http://download.opensuse.org/repositories/home:/zeph33:/archlinux/Arch_Extra/${CARCH}/${_pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz")
md5sums=('SKIP')
#if [[ $CARCH == i686 ]]; then
#	md5sums=('59c43aad31c590720c39d6543eaace58')
#else
#	md5sums=('6b7bb53b436ed5de26564934c279bf89')
#fi

build() {
   cd $srcdir/
}

package() {
	find "${srcdir}/usr" -type d -exec chmod 755 '{}' \;
  cp -r "${srcdir}/usr" "${pkgdir}"
}
