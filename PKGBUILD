# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='certbot-dns-vultr'
pkgver='20190506'
_commit='5acb7e2b6d66f21decb3a37ed0d7ec808eefe844'
pkgrel='3'
pkgdesc='Cerbot hooks for Vultr DNS'
arch=('any')
url="https://github.com/oefd/$pkgname"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3' 'certbot')
source=("https://raw.githubusercontent.com/oefd/$pkgname/$_commit/vultr-hook.py")
sha256sums=('43c495691b0eb56d11f1d63beb6ecd5d24c8b7c4919af1282db1d3269c551e0f')

package() {
	install -Dm755 "$srcdir/vultr-hook.py" "$pkgdir/usr/bin/$pkgname"
}
