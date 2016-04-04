# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=sshcommand
pkgver=0.4.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('any')
url='https://github.com/dokku/sshcommand'
license=('mit')

source=("https://github.com/dokku/sshcommand/archive/v$pkgver.tar.gz")
sha256sums=('3e43fb91a35bb5d868b7416cf251f563eb2b393e3571af9226c3e9ca5eeb1232')

package(){
  cd sshcommand-$pkgver

  install -Dm 755 sshcommand "$pkgdir"/usr/bin/sshcommand
}
