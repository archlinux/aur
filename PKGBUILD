# Maintainer: Sven Nobis <aur@sven.to>

pkgname=gardenlogin-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='gardenlogin is kubectl credential plugin for Gardener K8s shoot cluster admin authentication.'
url='https://github.com/gardener/gardenlogin'
license=('Apache-2.0')
arch=('x86_64')
provides=('gardenlogin')
source=("gardenlogin::${url}/releases/download/v${pkgver}/gardenlogin_linux_amd64")
sha256sums=('SKIP')

package() {
    install -Dm 755 "$srcdir/gardenlogin" "$pkgdir/usr/bin/gardenlogin"
    ln -s /usr/bin/gardenlogin "$pkgdir/usr/bin/kubectl-gardenlogin"
}
