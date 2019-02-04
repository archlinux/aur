# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=monodevelop-stable-bin
_pkgname=monodevelop
pkgver=7.8.0.1471
pkgrel=2
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
source=(https://github.com/TechtonicSoftware/archlinux-monodevelop-stable-bin/archive/$pkgver.tar.gz)
sha256sums=('7b5f25141d5a483b3ab33fbe8832e9d8adbf58d74107da765aa17b2bf3c4f833')

package() {
    cp -R "$srcdir/archlinux-$pkgname-$pkgver/usr" "$pkgdir";
}
