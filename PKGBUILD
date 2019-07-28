# Maintainer: Ron S <rzedsips@hot.ee>
pkgname="rons-bashrc-local"
pkgver=0.1
pkgrel=3
pkgdesc="Ron's personal bash.bashrc.local"
arch=('any')
url='http://aur.archlinux.org/packages/rons-bashrc-local/'
license=('GPL')
depends=('yay')
source=("bash.bashrc.local")
sha256sums=('e84b105d71fd2298acadfb8ca6a02a054c87ff9e0d1ea491c8722729767cd7af')

package()
{
    install -D -m644 ${srcdir}/bash.bashrc.local ${pkgdir}/etc/bash.bashrc.local
}

install=rons-bashrc-local.install
