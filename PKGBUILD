pkgname='sprunge'
pkgver='0.1.3'
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
source=('sprunge')
sha256sums=(
    '5a9ff1ff05fca02df5b88dcb052bee1afca7ffa8290845ec94c1b8b61cad4ecf'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

