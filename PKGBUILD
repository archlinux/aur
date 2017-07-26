pkgname='hastebin'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Upload data to hastebin.com via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('any')
depends=('python' 'python-requests')
source=('hastebin')
sha256sums=(
	'b2ac5a7a8fab997e0b9454fcd54eaf8d3fc2a937bcca8bd2605d2bdd6a04a789'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

