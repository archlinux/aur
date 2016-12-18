pkgname=windows10-downloader
pkgver=1.0
pkgrel=2
pkgdesc="Windows 10 downloader"
arch=('any')
url=""
license=('GPL')
groups=()
depends=('python3' 'python-yaml' 'python-requests' 'wget')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('windows10-get-download-link.py' 'windows10-download.sh')
noextract=()
md5sums=('17301792daff69c353bd8d787d9602ee' 'bb94ccaa16913605f40a1d877ee61d31')

package() {
	install -D windows10-get-download-link.py $pkgdir/usr/bin/windows10-get-download-link
	install -D windows10-download.sh $pkgdir/usr/bin/windows10-download
}
