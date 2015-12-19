# Maintainer: AJ <hckr@eml.cc>
pkgname=gpu-switch
pkgver=static.test.r9.gffe82d6
pkgrel=1
pkgdesc="gpu-switch is an application to switch between the integrated and dedicated GPU of dual-GPU MacBook Pro models for the next reboot."
arch=('x86_64')
url="https://github.com/0xbb/gpu-switch"
makedepends=('git')
provides=('gpu-switch')
source=(${pkgname}::"git+https://github.com/0xbb/${pkgname}.git"
	    'gpu-switch.install')
md5sums=('SKIP'
         '341e2d51d8cdc82469c609b952ceb92b')
install='gpu-switch.install'


package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "gpu-switch" "${pkgdir}/usr/bin/gpu-switch"
}

