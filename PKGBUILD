# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=monodevelop-stable-bin
_pkgname=monodevelop
pkgver=7.8.0.1471
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
source=(https://github.com/TechtonicSoftware/archlinux-monodevelop-stable-bin/archive/$pkgver.tar.gz)
sha256sums=('a203089952c9ee73cda25ff25f64099a0592d33cc86a91b50d98a9f64dd4d85c')

package() {
    cp -R "$srcdir/archlinux-$pkgname-$pkgver/usr" "$pkgdir";
}
