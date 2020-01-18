# Maintainer: mmh <aur@with-h.at>

pkgname="git-store-meta"
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple file metadata storing and applying for git"
arch=(any)
url="https://github.com/danny0838/git-store-meta"
license=('MIT')
depends=('acl' 'coreutils' 'git>=1.7.2' 'perl>=5.8')
source=("https://github.com/danny0838/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5c26cc299cdd0c55cb92a88f07568e00ddb15d4bf72653583becd4ea4db7298c')

package() {
	cd "$pkgname-$pkgver"
	install -D git-store-meta.pl "${pkgdir}/usr/bin/git-store-meta"
}
