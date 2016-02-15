# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=plugn
pkgver=0.2.1
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/sshcommand'
license=('bsd')

source=("https://github.com/dokku/plugn/releases/download/v${pkgver}/plugn_${pkgver}_linux_x86_64.tgz")
sha256sums=('d0a7227d2f13d3f15ace01a371bb389cfdbb7b21657b0b5b23eddf42baedc530')

package(){
  install -Dm 755 plugn "$pkgdir"/usr/bin/plugn
}
