# Maintainer: Mohammad Mahdi <me@mahdium.ir>
pkgname=tbdel
pkgver=2
pkgrel=1
pkgdesc="A simple command-line tool for managing a list of files and directories marked for deletion. User can add, remove, list, and execute the deletion of these entries."
url="https://git.mahdium.ir/mahdium/TBDel"
license=('AGPL3')
arch=('x86_64')
provides=("tbdel=$pkgver")

source_x86_64=("https://git.mahdium.ir/mahdium/TBDel/releases/download/v${pkgver}/tbdel-v${pkgver}-linux-64.tar.xz")
sha256sums_x86_64=(17543e29c5c0a86bfaa0769dd1c67df6cf218e0f4cbea634c8f7acf5a0d66981)

package() {
    cd "$srcdir"
    install -D tbdel-v${pkgver}-linux-64 "$pkgdir/usr/bin/tbdel"
}
