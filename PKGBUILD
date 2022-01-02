pkgname='sprunge'
release='0.7'
pkgver="${release}.0"
pkgrel=2
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python' 'python-requests')
conflicts=("${pkgname}-git")
optdepends=(
    'xclip: default Xorg clipboard functionality'
    'wl-clipboard: default Wayland clipboard functionality'
)
source=("${url}/archive/refs/tags/${release}.tar.gz")
sha256sums=(
    '3c2186a63824e19bdf04fc4d9cc8790eb316d79278b909e7ae947f8c79a37c9d'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

