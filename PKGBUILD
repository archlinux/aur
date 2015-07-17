pkgname=polkit-use-wheel-group
pkgver=1.0
pkgrel=1
pkgdesc="sudo for policykit by using wheel group"
url="http://no.website/this/is/made/by.me"
license=('GPL')
arch=('any')
depends=('polkit')
source=("51-use-wheel.conf")
sha512sums=("430907f47c5fba36e229999d73594a4c6c1f9875d7d2d339ff4040b7b0376983c7ca74534e875eb6d6f5e16028dd5f9461dee486bd02fd5b943a2c3005465f28")

package() {
  install -D -m 644 ${srcdir}/51-use-wheel.conf ${pkgdir}/etc/polkit-1/localauthority.conf.d/51-use-wheel.conf
}
