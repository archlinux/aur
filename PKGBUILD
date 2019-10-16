# Maintainer: Erik Dubois <erikdubois@gmail.com>
pkgname=gitfiend
_pkgname=GitFiend
pkgver=0.19.5
pkgrel=2
pkgdesc='A Git client designed for humans'
arch=('x86_64')
license=('ISC')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-atk' 
         'libappindicator-gtk3' 'libsecret')
url="https://gitfiend.com"
options=('!strip')
source=("https://gitfiend.com/resources/${_pkgname}_${pkgver}_amd64.deb")
md5sums=('b742138f63bb3f0615c9229dcb0fe4bf')
package() {
    tar -xvf data.tar.xz -C ${pkgdir}
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/GitFiend/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
