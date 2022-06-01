# Maintainer: x70b1

pkgname=pam_exec-ssh
pkgver=20220601
pkgrel=1
pkgcommit=311b153
pkgdesc="Unlock SSH keys on login using PAM."
arch=(any)
url="https://github.com/x70b1/pam_exec-ssh"
license=("The Unlicense")
makedepends=("git")
depends=("pam" "expect")
source=("${pkgname}::git+${url}.git#commit=${pkgcommit}")
noextract=()
sha256sums=('SKIP')

package() {
    cd ${pkgname}
    install -Dm755 pam_exec-ssh "${pkgdir}"/usr/bin/pam_exec-ssh
}
