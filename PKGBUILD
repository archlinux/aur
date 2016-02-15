# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=sshcommand
pkgver=20160122
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('any')
url='https://github.com/dokku/sshcommand'
license=('mit')

source=('https://raw.githubusercontent.com/dokku/sshcommand/master/sshcommand')
sha256sums=('db08af0b5c70bd242226668777394d79f94c0440d5bc4d4458e0a56501e1b068')

package(){
  install -Dm 755 sshcommand "$pkgdir"/usr/bin/sshcommand
}
