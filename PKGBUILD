# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: David Mason <djmason@gmail.com>
# Contributor: Wijnand Modderman-Lenstra <maze@maze.io>

# The latest version can be found like this:
# $ curl -s http://bluejeans.com/downloads | grep 'bjnplugin.*\.deb'

pkgname=bluejeans
pkgver=2.140.46.8
pkgrel=1
pkgdesc="BlueJeans browser plugin"
arch=('x86_64')
url="http://www.bluejeans.com/"
license=('Proprietary')
groups=()
conflicts=(bjnplugin)
depends=()
source=(
    https://swdl.bluejeans.com/skinny/rbjnplugin_${pkgver}-1_amd64.deb
)
sha1sums=('08c8e675e1ddd73c82bbdc29c1560ce217305a30')

package() {
    ar x rbjnplugin_${pkgver}-${pkgrel}_amd64.deb "${pkgdir}"
    tar xf data.tar.gz -C "${pkgdir}"
}
