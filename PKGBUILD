# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=plugn
pkgver=0.3.2
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('bsd')

source=("https://github.com/dokku/plugn/releases/download/v${pkgver}/plugn_${pkgver}_linux_x86_64.tgz")
sha256sums=('2b07d5a0272d6f04eaad9ee7bd3953816a3f46d62399bb93b490a935696d567c')

package(){
  install -Dm 755 plugn "$pkgdir"/usr/bin/plugn
}
