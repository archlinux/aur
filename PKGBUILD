# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=monodevelop-stable-bin
_pkgname=monodevelop
pkgver=7.5.0.1244
pkgrel=1
pkgdesc="An IDE primarily designed for C# and other .NET languages"
arch=('x86_64' 'i686')
url="http://www.monodevelop.com"
license=('GPL')
depends=('mono' 'mono-addins>=0.6.2' 'gtk-sharp-2' 'fsharp' 'libssh2' 'curl' 'msbuild-stable')
makedepends=('rsync' 'cmake' 'git' 'nuget' 'openssl-1.0' 'xterm')
replaces=('monodevelop-debugger-gdb')
provides=('monodevelop' 'monodevelop-debugger-gdb')
conflicts=('monodevelop')
options=(!makeflags)
optdepends=('xsp: To run ASP.NET pages directly from monodevelop')
source=(https://github.com/doctorzeus1aonly/archlinux-monodevelop-stable-bin/archive/$pkgver.tar.gz)
sha256sums=('ce4840f6cba12df9cb20c5bdbf576e8a4745e5206b21ce504e3b769dddddac7f')

package() {
    cp -R "$srcdir/archlinux-$pkgname-$pkgver/usr" "$pkgdir";
}
