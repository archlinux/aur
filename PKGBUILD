# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=sshcommand
pkgver=0.6.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('any')
url='https://github.com/dokku/sshcommand'
license=('mit')

source=("https://github.com/dokku/sshcommand/archive/v$pkgver.tar.gz")
sha256sums=('934b770b838c00016b5f3a3d435668c5a9d448c00a6100ec0d2cbaa0c1ebf90c')

package(){
  cd sshcommand-$pkgver

  install -Dm 755 sshcommand "$pkgdir"/usr/bin/sshcommand
}
