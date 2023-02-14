# Maintainer: J0w03L <j0w03l at email dot com>
pkgname=shell-mommy-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Mommy is here for you on the command line ~ <3"
arch=("any")
url="https://github.com/sudofox/shell-mommy"
license=("unknown")
makedepends=("git")
install=.INSTALL
source=("$pkgname::git+https://github.com/sudofox/shell-mommy.git"
        .INSTALL)
sha256sums=("SKIP"
            "205d7dce822e5e725aa919b54ffad53ae93466133b5b10aad5ba0ab88ee698eb")
b2sums=("SKIP"
        "052fc2752e7e9507a8e861624f8fc487b51f4ec88327b2ca3b1daf451b0915b9278ad8079b2acc092a7798b47be8f770064fcc158eaf5fce9607ec5862567571")
prepare() {
    cp "$HOME/.bashrc" "$HOME/.bashrc.bak"
}
package() {
    cd "$pkgname"
    sudo mkdir -p "/usr/share/shell-mommy"
    sudo cp "shell-mommy.sh" "/usr/share/shell-mommy/shell-mommy.sh"
}
