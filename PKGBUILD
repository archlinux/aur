# Maintainer: bluemeda <affif[dot]bluemeda[at]gmail[dot]com>
pkgname=gdrive-bin
_pkgname=gdrive
pkgver=2.0.1
pkgrel=1
pkgdesc="Command line utility for uploading and downloading single files to your Google Drive"
arch=('x86_64' 'i686')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
provides=('gdrive')
conflicts=('gdrive' 'gdrive-git')
source_i686=("https://docs.google.com/uc?id=0B3X9GlR6EmbnbndOUW50ZVllZ3M&export=download")
source_x86_64=("https://docs.google.com/uc?id=0B3X9GlR6EmbnWksyTEtCM0VfaFE&export=download")
sha1sums_i686=('0968993e4a70a594e0f315034640fd811977e4f1')
sha1sums_x86_64=('c636778c4a2c76e47ac731c142f4219a19c30263')


package_x86_64() {
    cd "$srcdir/"
    
    install -dm755 "$pkgdir/usr/bin"

    install -Dm755 "$srcdir/uc?id=0B3X9GlR6EmbnWksyTEtCM0VfaFE&export=download" "$pkgdir/usr/bin/$_pkgname"

}

package_i686() {
    cd "$srcdir/"
    
    install -dm755 "$pkgdir/usr/bin"

    install -Dm755 "$srcdir/uc?id=0B3X9GlR6EmbnbndOUW50ZVllZ3M&export=download" "$pkgdir/usr/bin/$_pkgname"

}

# vim:sw=4:ts=4:et
