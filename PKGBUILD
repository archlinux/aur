# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.2.0
pkgrel=2
_pkgrealrel=1
pkgdesc="Easy to use screenshot sharing application."
arch=('i686' 'x86_64')
url="http://screencloud.net"
license=('GPL2')
depends=('quazip' 'libqxt' 'python2')
optdepends=('python2-crypto: required for SFTP support')
options=('strip' 'docs' 'libtool' 'staticlibs' 'emptydirs' 'zipman' 'purge' '!upx' '!debug')
install=screencloud.install
source_x86_64=(${pkgname}-${pkgver}-${_pkgrealrel}-64.pkg.tar.xz::http://download.opensuse.org/repositories/home:/olav-st/Arch_Extra/x86_64/${pkgname}-${pkgver}-${_pkgrealrel}-x86_64.pkg.tar.xz)
# Skips validation because package updated, but version not changed. See the comments.
sha256sums_x86_64=('SKIP')
source_i686=(${pkgname}-${pkgver}-${_pkgrealrel}-32.pkg.tar.xz::http://download.opensuse.org/repositories/home:/olav-st/Arch_Extra/i686/${pkgname}-${pkgver}-${_pkgrealrel}-i686.pkg.tar.xz)
# Skips validation because package updated, but version not changed. See the comments.
sha256sums_i686=('SKIP')

package() {
    cp -R "$srcdir/opt" "$pkgdir"
    cp -R "$srcdir/usr" "$pkgdir"
}
