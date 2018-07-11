# Maintainer: csicar
pkgname=gtm-bin
_pkgname=gtm
pkgver=v1.3.5
pkgrel=1
pkgdesc="Simple, seamless, lightweight time tracking for Git"
arch=('x86_64')
url="https://github.com/git-time-metric/gtm"
license=('MIT')
provides=('gtm')
conflicts=('gtm')
source=("https://github.com/git-time-metric/$_pkgname/releases/download/$pkgver/$_pkgname.$pkgver.linux.tar.gz")
sha256sums=('7b43e4d3a3020929e1e1ba8af78c61e02dfb7a8a0af558fbd27746a9ecb50743')

package() {
	install -Dm755 gtm ${pkgdir}/usr/bin/gtm
}
