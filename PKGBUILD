# Maintainer: Sam Ezeh <sam@ezeh.uk>
# Contributor: Seth Galasso <seth.galasso@gmail.com>
pkgname=flix
pkgver='0.35.0'
pkgrel=1
pkgdesc='Next-generation reliable, safe, concise, and functional-first programming language.'
arch=('any')
url='https://flix.dev'
license=('Apache')
depends=('java-runtime>=11')
source=("https://github.com/flix/flix/releases/download/v$pkgver/flix.jar"
        "run.sh")
sha256sums=('1c084d360f1ffae0b640a62a92e8092321fb55a90d03adf54b6fd4136bc6fb93'
            'a51177acf0372c1c45110136341662617a2e2313c78a7fe8eaf9df22cdb17aa5')
noextract=('flix.jar')

package() {
    install -Dm644 flix.jar -t "$pkgdir/usr/share/java/$pkgname/"
    install -Dm755 run.sh "$pkgdir/usr/bin/$pkgname"
}
