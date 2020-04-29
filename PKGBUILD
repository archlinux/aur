# Maintainer: mmh <aur@with-h.at>

pkgname="git-store-meta"
pkgver=2.1.1
pkgrel=1
pkgdesc="Simple file metadata storing and applying for git"
arch=(any)
url="https://github.com/danny0838/git-store-meta"
license=('MIT')
depends=('acl' 'coreutils' 'git>=1.7.2' 'perl>=5.8')
source=("https://github.com/danny0838/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a3357ae82b8382945ce07823441af67f8591efc2ce019d688ff1184757bbee7f')

package() {
    cd "$pkgname-$pkgver"
    install -D git-store-meta.pl "${pkgdir}/usr/bin/git-store-meta"
}
