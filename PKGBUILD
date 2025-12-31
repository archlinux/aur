# Maintainer: Mohammad Mahdi <me@mahdium.ir>
pkgname=tbdel
pkgver=3
pkgrel=1
pkgdesc="A simple command-line tool for managing a list of files and directories marked for deletion. User can add, remove, list, and execute the deletion of these entries."
url="https://git.mahdium.ir/mahdium/TBDel"
license=('AGPL3')
arch=('x86_64')
provides=("tbdel=$pkgver")

source_x86_64=("https://git.mahdium.ir/mahdium/TBDel/releases/download/v${pkgver}/tbdel-v${pkgver}-linux-64.tar.xz")
sha256sums_x86_64=(f3de937bbe41e5c1110bb003b64bf986fb075cf8ee8656eb4c3914bab59f3a9a)

package() {
    cd "$srcdir"
    install -D tbdel-v${pkgver}-linux-64 "$pkgdir/usr/bin/tbdel"
}
