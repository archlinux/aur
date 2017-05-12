# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=dt-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="DNS tool that displays information about your domain"
arch=('i686' 'x86_64')
url="https://github.com/42wim/dt"
license=('Apache')
source_i686=("https://github.com/42wim/dt/releases/download/v${pkgver}/dt-linux32")
source_x86_64=("https://github.com/42wim/dt/releases/download/v${pkgver}/dt-linux64")
sha512sums_i686=('e064ec633da682d24b60fb63111a88546b08ce2a9c504f89198476815dcf98b53f56a5c4fabcf1e5988108156fb7df11d7cb6aa514d78a90d6bfc1fa84f5a8c0')
sha512sums_x86_64=('d198d0c362d0f39d0b9e23235976ea8480a450136bc58fc242e4e3b96069c57124cf6397173a668ac6b235f61cc9cf693c6a6792daf9153c5809cee22f2d3dc9')

package() {
  install -Dm 755 dt-linux* "$pkgdir/usr/bin/dt"
}
