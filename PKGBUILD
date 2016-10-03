# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=plugn
pkgver=0.2.2
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('bsd')

source=("https://github.com/dokku/plugn/releases/download/v${pkgver}/plugn_${pkgver}_linux_x86_64.tgz")
sha256sums=('9c83ee9cce126ac405e648d4fef55c1c85cbcb8151b23e48bf3235bde97e89bb')

package(){
  install -Dm 755 plugn "$pkgdir"/usr/bin/plugn
}
