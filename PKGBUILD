# Maintainer PKD paulkronlund@gmail.com
pkgname=tex-acl
pkgver=1.0
pkgrel=1
pkgdesc="An package to install the TEX ACL style files"
arch=('any')
url="https://github.com/acl-org/acl-style-files"
license=('MIT')
source=('acl-style-files::git+https://github.com/acl-org/acl-style-files')
makedepends=('git')
package() {
	cd "$srcdir/acl-style-files"
    install -D latex/acl.sty $pkgdir/usr/share/texmf-dist/tex/generic/acl/acl.sty	
}
sha256sums=('SKIP')
