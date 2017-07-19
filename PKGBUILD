# Maintainer: johnjq <dev [at] johnjq (dot) com>

pkgname=git-annex-remote-pcloud-git
pkgver=0
pkgrel=3
pkgdesc="A git-annex special remote using pCloud"
arch=("any")
url="https://github.com/tochev/git-annex-remote-pcloud"
license=("MIT")
depends=("python" "python-requests" "python-pcloudapi-git")
optdepends=("git-annex" "git-annex-git")
source=("git+https://github.com/tochev/git-annex-remote-pcloud")
sha512sums=("SKIP")

#pkgver() {
    #cd "git-annex-remote-pcloud"
    #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

package() {
    cd "$srcdir/git-annex-remote-pcloud"
    install -m 755 -D "git-annex-remote-pcloud" "${pkgdir}/usr/bin/git-annex-remote-pcloud"
}
