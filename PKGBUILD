# Maintainer: Jeremie Simard aka Case-Prudolicce <jeremie.simard.rip@gmail.com>

pkgname='hcli'
pkgver=1.1.0
pkgrel=1
pkgdesc="Habitica CLI; A Command Line Interface for Habitica"
arch=('any')
url="https://github.com/case-prudolicce/hcli"
license=('GPL-3.0-or-later')
depends=('fzf' 'curl' 'jq' 'bc')
makedepends=('git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('cd95ad392c719c14afeae639ace2cd03d2ab862153e2a54076bd3f2a14d6d534')

package() {
	cd "$pkgname"
	install -Dm755 ./hcli "$pkgdir/usr/bin/hcli"
	install -Dm644 ./hcli.1.gz -t "$pkgdir/usr/share/man/man1/"
}
