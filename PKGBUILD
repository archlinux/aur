# Maintainer: Meow King <mr.ziqiyang@gmail.com>
_pkgname=emacs-lsp-booster
pkgname=emacs-lsp-booster-git
pkgver=0.1.1 # NOTE
pkgrel=1 # NOTE
pkgdesc="Emacs LSP performance booster "
arch=("x86_64")
url="https://github.com/blahgeek/emacs-lsp-booster"
license=('MIT') # currently no license available, previous it is BSD 3-Clause
makedepends=(
    "libarchive" # bsdtar
)
depends=()
makedepends=('cargo')
conflicts=($_pkgname)
changelog="changelog.txt" # NOTE
source=("git+https://github.com/JakeStanger/ironbar")
sha256sums=('5f4318dbdba14f561b180d4f0bcf0821b9c7cae4b8e10691eb9133833d7473c8')

pkgver() {
    cd "$strdir"
    pwd
    ls
    # cd "$srcdir/$pkgname"

    # printf "%s.%s" \
    #        $(grep AC_INIT configure.ac | \
    #              awk -F',' '{ gsub("[ \\[\\]]","",$2); print $2 }') \
    #        $(git rev-list --count HEAD)
}

# prepare() {
#     bsdtar -xf data.tar.gz
# }

package() {
    # # bin
    # install -Dm755 usr/bin/flying-carpet ${pkgdir}/usr/bin/flying-carpet
    # # icons
    # mkdir -p ${pkgdir}/usr/share/icons/
    # chmod 755 ${pkgdir}/usr/share/icons
    # cp -r usr/share/icons/hicolor ${pkgdir}/usr/share/icons/
    # # desktop file
    # install -Dm644 usr/share/applications/flying-carpet.desktop ${pkgdir}/usr/share/applications/flying-carpet.desktop
    echo 1
}
