# Maintainer: LunixGy <->

_basename=numlockontty
pkgname=numlockontty-runit
pkgver=1.0
pkgrel=0
pkgdesc="A script and a runit service to activate the num lock on tty at startup"
arch=('any')
depends=('runit')
conflicts=('systemd-numlockontty')
license=('GPL')
source=("numlockontty" "numlockontty.run")
md5sums=('e56440b68d824591547dcdcb1c628ef8' '9f1facf5233f4e2e3e9e0e144d830a31')

package() {
	install -Dvm755 "$srcdir/${_basename}"		 "$pkgdir/usr/bin/${_basename}"
  	install -Dvm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
