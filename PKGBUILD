# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=pridefetch
pkgver=1.1.0
pkgrel=2
pkgdesc="Neofetch clone written in Python with the ability to display pride flags"
arch=('any')
url="https://github.com/Spyhoodle/pridefetch"
source=(pridefetch)
depends=('python3' 'python-distro')
conflicts=('pridefetch-git')
sha512sums=('84ecbb5faab2633ee2e598971121b91441da262691a454fa00b29a249c1b1219a6a1aa12d4a0feafe30d8423c008209c2483654ad71e368722822e7c420d4dd5')

package() {
	install -Dm755 pridefetch "$pkgdir"/usr/bin/pridefetch
}
