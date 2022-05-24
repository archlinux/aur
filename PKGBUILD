# Maintainer: p4ck3t0 <aur@p4ck3t0.de>

pkgname=kns
pkgver=1.0
pkgrel=0
pkgdesc="kns is a very small shellscript that utilizes fzf to switch between Kubernetes namespaces blazing fast."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/blendle/kns'
license=('ISC')
provides=('kns')
depends=('fzf')
sha256sums=('1c5a786767cf7d4313f805e17efaf83ad40d1e6a9ac5ce82ca648c7887a36056')

source=('https://raw.githubusercontent.com/blendle/kns/master/bin/kns')

package() {
  install -Dm 755 "${srcdir}/kns" "${pkgdir}/usr/bin/kns"
}
