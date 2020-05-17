# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>
_watch=('https://api.github.com/repos/gentoo/portage/commits?path=bin/etc-update' '\"sha\":\"(\w+)\"')

pkgname='etc-update'
pkgdesc="CLI to interactively merge .pacnew configuration files"
pkgver=2.3.99
pkgrel=1
arch=('any')
url="https://wiki.gentoo.org/wiki/Handbook:X86/Portage/Tools#etc-update"
license=('GPL')
depends=('bash')
makedepends=('git')
optdepends=('dialog: for the menu mode (not automode)')
backup=("etc/etc-update.conf")
source=("https://github.com/gentoo/portage/archive/portage-${pkgver}.tar.gz")
sha256sums=('fc5dcc37033d876360c8427d1b6afbdb29786a675d6741909fb341da54568a1d')

package() {
  install -Dm 0755 -t "${pkgdir}/usr/bin" "portage-portage-${pkgver}/bin/${pkgname}"
  install -Dm 0644 -t "${pkgdir}/etc" "portage-portage-${pkgver}/cnf/${pkgname}.conf"
}
