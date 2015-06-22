pkgname=netctl-eduroam-kth
pkgver=0.1
pkgrel=2
pkgdesc='Example netctl profile for eduroam at KTH'
arch=(any)
url=http://www.lan.kth.se/eduroam/linux/arch_linux_example.html
license=(MIT)
depends=(ca-certificates netctl)
source=(eduroam-kth)
install=install
md5sums=('d7f6aa0caeb8ec37a70fa69b8b3eeafb')
sha256sums=('376175d6433b5e92bce4a7fd78c50b53a2382962ba82537bbadf1b2f6b5ebde4')

package() {
	mkdir -p $pkgdir/etc/netctl/examples/
	cp eduroam-kth $pkgdir/etc/netctl/examples/
}
