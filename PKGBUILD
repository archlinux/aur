# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=trust-dns-systemd
pkgver=1.0.0
pkgrel=2
pkgdesc="systemd service for trust-dns"
arch=("any")
url="https://aur.archlinux.org/packages/$pkgname"
license=('Apache' 'MIT')
depends=('trust-dns')
source=("named.service")
sha512sums=('ff17dec7c7d73254b561d2e27a161b70fdf806203b94a6a1733f7e37347b696469a38de377462202c93b2c76676ec0150098ad115cfc9117b29a493c911b178b')

conflicts=("trust-dns>=0.22.0-4")

package()
{
	install -Dm 755 "named.service" "$pkgdir/etc/systemd/system/named.service"
}
