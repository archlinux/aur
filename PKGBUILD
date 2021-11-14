# Maintainer Fallen-Angle <fallen-angle@qq.com>

pkgname=electerm-deb
pkgver=1.17.15
pkgrel=1
pkgdesc="Terminal/ssh/sftp client"
arch=('x86_64')
url="https://github.com/electerm/electerm"
license=('custom')
source=("https://github.com/electerm/electerm/releases/download/v1.17.16/electerm-1.17.16-linux-amd64.deb")
sha512sums=('e2e58f3800081d31ab299e8e245114829e205d4d52ed5c98ebe1abc427a3be2dbc2fb7c7c141b5f9fe83b4d9a104a6da0724ebaa8b47549eb37ae379e0987506')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/electerm/electerm "$pkgdir/usr/bin/electerm"
}
