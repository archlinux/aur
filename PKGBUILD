# Maintainer: Seth Galasso <seth.galasso@gmail.com>
pkgname=flix
pkgver='0.33.0'
pkgrel=1
pkgdesc='Next-generation reliable, safe, concise, and functional-first programming language.'
arch=('any')
url='https://flix.dev'
license=('Apache')
depends=('java-runtime>=11')
source=("https://github.com/flix/flix/releases/download/v$pkgver/flix.jar"
        "run.sh")
sha256sums=('3309bcc65863d59b839790b95055d685a7f171ddeda6876bdceac378717e8e55'
            'a51177acf0372c1c45110136341662617a2e2313c78a7fe8eaf9df22cdb17aa5')
noextract=('flix.jar')

package() {
    install -Dm644 flix.jar -t "$pkgdir/usr/share/java/$pkgname/"
    install -Dm755 run.sh "$pkgdir/usr/bin/$pkgname"
}
