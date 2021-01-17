# Author: Artemii Sudakov <finziyr@yandex.ru>

pkgname="archpxe"
pkgver="1.0"
pkgrel="2"
pkgdesc='Quick setup of PXE server to load Arch Linux using an ethernet cable'
arch=('any')
url="https://github.com/BiteDasher/archpxe"
license=('MIT')
depends=('bash' 'coreutils' 'grep' 'dnsmasq' 'darkhttpd')
optdepends=("curl: ISO download")
source=("${pkgname}::git+https://github.com/BiteDasher/archpxe.git")
sha512sums=("SKIP")
package() {
	install -Dm755 "$srcdir/$pkgname/archpxe" "$pkgdir/usr/bin/archpxe"
}
