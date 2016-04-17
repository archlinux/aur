# Maintainer: bluemeda <affif[dot]bluemeda[at]gmail[dot]com>
pkgname=gdrive-bin
_pkgname=gdrive
pkgver=2.1.0
pkgrel=1
pkgdesc="Command line utility for uploading and downloading single files to your Google Drive"
arch=('x86_64' 'i686')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
provides=('gdrive')
conflicts=('gdrive' 'gdrive-git')
source_i686=("$_pkgname::https://docs.google.com/uc?id=0B3X9GlR6EmbnLV92dHBpTkFhTEU&export=download")
source_x86_64=("$_pkgname::https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download")
sha1sums_i686=('de9f49565fc62552fe862f08f84694ab4653adc2')
sha1sums_x86_64=('4fd8391b300cac45963e53da44dcfe68da08d843')


package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

}


# vim:sw=4:ts=4:et
