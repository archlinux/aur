# Maintainer: Nils Christopher Brause <nilschrbrause@googlemail.com>
pkgname=waylandpp
pkgver=0.1.3
pkgrel=1
pkgdesc='Wayland C++ bindings'
arch=('i686' 'x86_64' 'armv5' 'armv6' 'armv7' 'armv8')
url='https://github.com/NilsBrause/waylandpp'
licanse=('MIT' 'GPL3')
depends=(wayland)
conflicts=(waylandpp-git)
makedepends=(scons)
source=("https://github.com/NilsBrause/waylandpp/archive/$pkgver.zip")
md5sums=("d44b19ebe2233939ce2cebf9908e942a")

build()
{
    cd $pkgname-$pkgver
    ROOT="$pkgdir" PREFIX="/usr" scons
}

package()
{
    cd $pkgname-$pkgver
    ROOT="$pkgdir" PREFIX="/usr" scons install
}

# Local Variables:
# mode: shell-script
# End:
