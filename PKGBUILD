# Maintainer: gwydd <gwydd12@proton.me>
# Contributor: Seth Galasso <seth.galasso@gmail.com>
pkgname=flix
pkgver='0.76.0'
pkgrel=1
pkgdesc='Next-generation reliable, safe, concise, and functional-first programming language.'
arch=('any')
url='https://flix.dev'
license=('Apache')
depends=('java-runtime>=11')
source=("https://github.com/flix/flix/releases/download/v$pkgver/flix.jar"
        "run.sh")
sha256sums=('d8d9a3870e199c03ed6364ea9430f56f67bfd38c332c411628a6a7cb88b2b0b4'
            'a51177acf0372c1c45110136341662617a2e2313c78a7fe8eaf9df22cdb17aa5')
noextract=('flix.jar')

package() {
    install -Dm644 flix.jar -t "$pkgdir/usr/share/java/$pkgname/"
    install -Dm755 run.sh "$pkgdir/usr/bin/$pkgname"
}
