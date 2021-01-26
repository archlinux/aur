# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=dirbuster-wordlists
pkgver=2.3
pkgrel=1
pkgdesc="Dirbuster's default directories wordlists"
arch=('any')
url='https://github.com/3ndG4me/KaliLists/tree/master/dirbuster'
license=('CC BY-SA 3.0')
source=(
    'https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-lowercase-2.3-small.txt'
    'https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-lowercase-2.3-medium.txt'
    'https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-2.3-small.txt'
    'https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-2.3-medium.txt'
    )
sha256sums=(
    '57d97413d133a4c22d7e463b3347f8c12f45e36d8eba81aea3b7944e3411aa4c'
    'f48f0d560c5494c04a145b3240c8c227a6d3b43a96081c21e3f49098e147519b'
    '0153f0943064efd0de1be5ba1ded239e900db77936a3de397255e8e76a796a56'
    '54c4dd1a34b29bfb6dc3bf3cb6dda2f1a8d6a6823ea92c01c723f9ae21c742c5'
    )

package() {
    mkdir -p "$pkgdir/usr/share/dict"

    install -Dm644 directory-list-lowercase-2.3-small.txt "$pkgdir/usr/share/dict/"
    install -Dm644 directory-list-lowercase-2.3-medium.txt "$pkgdir/usr/share/dict/"
    install -Dm644 directory-list-2.3-small.txt "$pkgdir/usr/share/dict/"
    install -Dm644 directory-list-2.3-medium.txt "$pkgdir/usr/share/dict/"
}

