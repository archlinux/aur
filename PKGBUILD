# Maintainer: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
 
pkgname=sandfox
pkgver=20131018
pkgrel=1
pkgdesc="Runs Firefox and other apps in a sandbox with limited access to the filesystem"
arch=(any)
license=('GPL3')
url="http://igurublog.wordpress.com/downloads/script-$pkgname/"
depends=('inotify-tools')
makedepends=('git')
source=('git://github.com/IgnorantGuru/sandfox.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --always | sed 's|-|.|g'
}
 
package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
