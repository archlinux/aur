# Maintainer: gwydd <gwydd12@proton.me>
# Contributor: Seth Galasso <seth.galasso@gmail.com>
pkgname=flix
pkgver='0.75.3'
pkgrel=1
pkgdesc='Next-generation reliable, safe, concise, and functional-first programming language.'
arch=('any')
url='https://flix.dev'
license=('Apache')
depends=('java-runtime>=11')
source=("https://github.com/flix/flix/releases/download/v$pkgver/flix.jar"
        "run.sh")
sha256sums=('bf123cdb6494d6e0cbff6399bf185314d332bbe97bfd776e4abc03a5d39dd954'
            'a51177acf0372c1c45110136341662617a2e2313c78a7fe8eaf9df22cdb17aa5')
noextract=('flix.jar')

package() {
    install -Dm644 flix.jar -t "$pkgdir/usr/share/java/$pkgname/"
    install -Dm755 run.sh "$pkgdir/usr/bin/$pkgname"
}
