# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=sshcommand
pkgver=0.7.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('any')
url='https://github.com/dokku/sshcommand'
license=('mit')

source=("https://github.com/dokku/sshcommand/archive/v$pkgver.tar.gz")
sha256sums=('929b7ee96613c8050550b75690f4a9434a2dd78660f6deacfed4ba3143768bdd')

package(){
  cd sshcommand-$pkgver

  install -Dm 755 sshcommand "$pkgdir"/usr/bin/sshcommand
}
