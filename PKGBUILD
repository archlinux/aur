# Maintainer: Gergan Penkov < gergan at gmail dot email >

_name="tilt"
pkgname="$_name-bin"
pkgver=0.11.0
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.build/'
license=('Apache')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_name}.${pkgver}.linux.x86_64.tar.gz")
sha512sums=('1613b7da74c511ae08c98c1e4f881a5f922c34039cf9cd42b76ee712693bf83c6cb7ff46e64363912141127d560569d439d645d52b787ae8e5c907c2df2ba23b')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/tilt"
}
