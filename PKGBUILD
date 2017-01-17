# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.3.24
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('aa3ffcef42894f62127d02dc53196fe80943af090af726a065a3c58b1bbce279')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
