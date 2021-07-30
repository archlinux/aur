# Maintainer: Christoph Nickel <techrisx@protonmail.com>
pkgname=ideapadmode
pkgver=0.1.1
pkgrel=1.1
pkgdesc="Bash script to controll the battery and cooling of the Lenovo Ideapad 5 on Linux"
arch=('any')
url="https://github.com/chrisinick/ideapad_mode"
license=('MIT')
depends=('acpi_call' 'bash')
makedepends=('git')
source=("git://github.com/chrisinick/ideapad_mode.git")
md5sums=('SKIP')

package() {
	cd "ideapad_mode"
	install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
