pkgname=libevdevc
pkgdesc="Chromium OS libevdev"
pkgver=3.0
pkgrel=1
arch=(x86_64)
url="https://github.com/hugegreenbug/libevdevc"
license=('custom:chromiumos')
depends=('glibc')
options=('!emptydirs' '!strip')

source=('https://apt.galliumos.org/pool/main/libe/libevdevc/libevdevc_3.0_amd64.deb')
md5sums=('1ddbb17b9bc38e61441e85d82a72bcc4')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 "$pkgdir"/usr/share/doc/libevdevc/copyright "$pkgdir"/usr/share/licenses/${pkgname}/LICENCE
}
