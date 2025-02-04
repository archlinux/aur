# Maintainer: Mohammad Mahdi <me@mahdium.ir
pkgname=tbdel
pkgver=1
pkgrel=1
pkgdesc="A simple command-line tool for managing a list of files and directories marked for deletion. User can add, remove, list, and execute the deletion of these entries."
url="https://git.mahdium.ir/mahdium/TBDel"
license=('AGPL3')
arch=('x86_64')
provides=("tbdel=$pkgver")

source_x86_64=("https://git.mahdium.ir/mahdium/TBDel/releases/download/v${pkgver}/tbdel-v${pkgver}-linux-64.tar.xz")
sha256sums_x86_64=(cd97e1778f200f77eb6ab728c6647d92b0ca0a9c1b8e9f01c63cc58418bf2081)

package() {
    cd "$srcdir"
    install -D tbdel-v${pkgver}-linux-64 "$pkgdir/usr/bin/tbdel"
}
