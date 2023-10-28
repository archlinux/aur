# Maintainer: Noah Witt <noah@noah-witt.com>
pkgname=generate-openpgpkey-hu 
pkgver=0.0.1
pkgrel=1
pkgdesc='A tool to generate Web Key Directory keys'
arch=(x86_64)
url='https://gitlab.com/Martin_/generate-openpgpkey-hu-3'
license=(GPL)
depends=('python-gnupg' 'python')
sha256sums=(f62ca110e43005158e880c03fed0a3e72d5ef8ac2af39507b46aa100b1945074)

source=(https://gitlab.com/Martin_/generate-openpgpkey-hu-3/-/raw/e42d329edf1df7aa58f71c24a584990a89a14236/generate-openpgpkey-hu-3)


package() {
    mkdir -p $pkgdir/usr/bin
    install -m755 generate-openpgpkey-hu-3 $pkgdir/usr/bin/
}