# Maintainer: x70b1

pkgname=pam_exec-gpg
pkgver=20220601
pkgrel=1
pkgcommit=6d52187
pkgdesc="Unlock GnuPG keys keys on login using PAM."
arch=(any)
url="https://github.com/x70b1/pam_exec-gpg"
license=("The Unlicense")
makedepends=("git")
depends=("pam")
source=("${pkgname}::git+${url}.git#commit=${pkgcommit}")
noextract=()
sha256sums=('SKIP')

package() {
    cd ${pkgname}
    install -Dm755 pam_exec-gpg "${pkgdir}"/usr/bin/pam_exec-gpg
}
