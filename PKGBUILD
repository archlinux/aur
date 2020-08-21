# Maintainer Matthew Croughan <matthew.croughan@foundries.io>

pkgname=fioctl-bin
pkgver=0.10
pkgrel=1
pkgdesc='A simple tool for controlling the Foundries.io REST API'
arch=('x86_64')
url="https://foundries.io"
license=('Apache')
provides=("fioctl=$pkgver")
conflicts=("fioctl")
depends=('glibc')
source=("https://github.com/foundriesio/fioctl/releases/download/${pkgver}/fioctl-linux-amd64")
md5sums=("309b329f7d22eb5bc9309acc5d11903a")

package() {
  install -Dm755 "$srcdir/fioctl-linux-amd64" "$pkgdir/usr/bin/fioctl"
}
