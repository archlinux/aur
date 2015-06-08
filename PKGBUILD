pkgname='sprunge'
pkgver='0.1.2'
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
source=('sprunge')
sha256sums=(
    '7c65273804d26a24c1dcda83a559315b9f501013d3d77d7d140f882f05eb2b33'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

