# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=sshcommand
pkgver=0.9.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('any')
url='https://github.com/dokku/sshcommand'
license=('mit')

source=("https://github.com/dokku/sshcommand/archive/v$pkgver.tar.gz")
sha256sums=('0ec533a04248c59e4cd48d69d5c1143ec1ec747f7acd6e8c4728dd4ad062dd2c')

package(){
  install -Dm 755 sshcommand "$pkgdir"/usr/bin/sshcommand
}
