pkgname='sprunge'
release='0.3'
pkgver="${release}.0"
pkgrel=2
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
optdepends=('xclip: default --clip-command')
source=("${url}/archive/${release}.tar.gz")
sha256sums=(
    'd806968a85def53a22b9674ffddb0c4a2b1f42b01cdd83a53d68b79caa6e81ff'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

