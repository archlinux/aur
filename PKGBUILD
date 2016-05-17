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
sha256sums=('a5d1e54f84362831b5b13322dae70e990e2dd1abcd47c35630222f2c7fa57a40'
            'a5cc968f34f77f4eaaa34771d6bd242b27fd2a6ff86938ba763efc645e5e305f')

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "commandcompletion_bash.sh" "$pkgdir/etc/bash_completion.d/rack"
}
