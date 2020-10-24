# Maintainer: Aleksey Kurnosov <akkurnosov@gmail.com>

pkgname=pyapplier
pkgver=0.0.4
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc=".scrobbler.log (Rockbox offline last.fm scrobling format) submiter"
url="https://github.com/ultraelephant/pyapplier"
license=('GPL')
source=("git+https://github.com/ultraelephant/pyapplier#tag=${pkgver}")
md5sums=('SKIP')
makedepends=('git')
depends=('python' 'python-pylast' 'python-setuptools' 'python-pyaml')

package() {
        install -Dm755 "${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
