pkgname=awall
pkgver=1.2.4
pkgrel=1
pkgdesc='Alpine Wall iptables based firewall'
arch=('any')
url='http://git.alpinelinux.org/cgit/awall/'
license=('GPL2')
depends=('lua>=5.2' 'lua-filesystem' 'lua-alt-getopt' 'lua-stringy' 'lua-signal' 'lua-pc' 'xtables-addons' 'iptables' 'dnsutils')
source=(http://dev.alpinelinux.org/archive/awall/$pkgname-$pkgver.tar.xz)
noextract=()

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make ROOT_DIR="$pkgdir/" install
    mkdir -p "$pkgdir/var/run/awall"
}

md5sums=('69aeb3aabd8e73662a0d5e89c9f3de0c')
