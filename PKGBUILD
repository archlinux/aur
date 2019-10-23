# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=monodevelop-stable-bin
_pkgname=monodevelop
pkgver=7.8.3.2
pkgrel=2
pkgdesc="An IDE primarily designed for C# and other .NET languages"
arch=('x86_64' 'i686')
url="http://www.monodevelop.com"
license=('GPL')
depends=('mono' 'mono-addins>=0.6.2' 'gtk-sharp-2' 'libssh2' 'curl' 'msbuild-stable')
makedepends=('rsync' 'cmake' 'git' 'nuget' 'openssl-1.0' 'xterm')
replaces=('monodevelop-debugger-gdb')
provides=('monodevelop' 'monodevelop-debugger-gdb')
conflicts=('monodevelop')
options=(!makeflags)
optdepends=('xsp: To run ASP.NET pages directly from monodevelop')
source=(https://github.com/TechtonicSoftware/archlinux-monodevelop-stable-bin/archive/$pkgver.tar.gz)
sha256sums=('34a2bda34c14070b7568861b5c67c4d7c77994fbc7ab9007e8dc377d59e06094')

package() {
    cp -R "$srcdir/archlinux-$pkgname-$pkgver/usr" "$pkgdir";
}
