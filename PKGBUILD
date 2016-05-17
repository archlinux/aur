# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>

pkgname=rack
pkgver=1.2.0
pkgrel=1
pkgdesc="Command-line interface to manage Rackspace Cloud resources"
arch=('x86_64')
url="https://developer.rackspace.com/docs/rack-cli/"
license=('Apache')
conflicts=('rack-git')
source=("https://ec4a542dbf90c03b9f75-b342aba65414ad802720b41e8159cf45.ssl.cf5.rackcdn.com/${pkgver%.0}/Linux/amd64/${pkgname}"
        "https://raw.githubusercontent.com/rackspace/rack/master/setup/commandcompletion_bash.sh")
sha256sums=('0328c0ff0a8f1cdd8221e1167a4578f318ef3c8e2cb2efbb42abf13fe98dc562'
            'a5cc968f34f77f4eaaa34771d6bd242b27fd2a6ff86938ba763efc645e5e305f')

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "commandcompletion_bash.sh" "$pkgdir/etc/bash_completion.d/rack"
}
