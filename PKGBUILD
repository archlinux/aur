pkgname=dnsmasq-openrc
pkgver=20210101
pkgrel=2
pkgdesc="OpenRC dnsmasq init script"
arch=('any')
license=('GPL2')
depends=('openrc' 'dnsmasq')
backup=('etc/conf.d/dnsmasq')
source=("dnsmasq.confd"
        "dnsmasq.initd")
sha256sums=('400d3cd953ff5f93c04713be8e75fd984b65ee569a55b0dfaeb01734100099d6'
            '7212daaad94d487b554ea73a4963cd5c936adff128d8649335f5293b0d5a6b5d')

package() {
	install -Dm755 "$srcdir/dnsmasq.initd" "$pkgdir/etc/openrc/init.d/dnsmasq"
	install -Dm644 "$srcdir/dnsmasq.confd" "$pkgdir/etc/openrc/conf.d/dnsmasq"
}
