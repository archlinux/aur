pkgname='sprunge'
release='0.3'
pkgver="${release}.0"
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
optdepends=('xclip: default --clipboard-command.')
source=("https://www.github.com/kevr/sprunge/archive/${release}.tar.gz")
sha256sums=(
    '85844eccc7d1a6e22b11decb613305a68362d373258d0801d0b186cb3d9b60ab'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

