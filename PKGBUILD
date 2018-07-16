# Maintainer: Roshless <aur@roshless.com>
_appname_=etc-update
pkgname=${_appname_}-nogithub
pkgdesc="CLI to interactively merge .pacnew in /etc. I don't trust gentoo's github."
pkgver=20180717
pkgrel=1
arch=('any')
url="https://wiki.gentoo.org/wiki/Handbook:X86/Portage/Tools#etc-update"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=("${_appname_}")
conflicts=("${_appname_}")
source=("etc-update"
	"etc-update.conf")
md5sums=('1de63bd8e07fa78779eecf864b6021e4'
         'ca8d58262382a7ead33b69469f661f5e')

package() {
  install -Dm 0755 "${_appname_}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm 0644 "${_appname_}.conf" "$pkgdir/etc/${pkgname}.conf"
}

