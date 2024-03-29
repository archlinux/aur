# Maintainer: Asher Winstead asher@mrashcreates.xyz
pkgname=optimizemyarch
pkgver=1.0.4
pkgrel=1
pkgdesc="A script to optimize and maintain Arch Linux installations"
arch=('any')
url="https://github.com/MrAshCreates/optimizemyarch"
license=('GNU')
depends=('bash')
source=("optimizemyarch.sh" "init.sh" "dependencies.sh" "options.sh" "optimizations.sh")
sha256sums=('b3392c2d80bc9ba4e539f1911404509ac7b59cff9f307e0c461c716dd9828ae8'
            '7b4bacf70fe2d772231b0225a79cac5c6775324cc951a0708b9ecc72ea3389b8'
            '9c10be88b92149c5b0834d82d522fce8e271f40414571ebc278e3782af7f3344'
            '67c49a970d2d1709e0ba1042a535482250b89bbf94484aba437117a756db8be9'
            '90cf09c0fc358afc55670770c48fb489de2a08215f74181e27449b728cd46f37')

package() {
    install -Dm755 optimizemyarch.sh "$pkgdir/usr/bin/oma"
    install -Dm755 init.sh "$pkgdir/usr/share/oma/init.sh"
    install -Dm755 dependencies.sh "$pkgdir/usr/share/oma/dependencies.sh"
    install -Dm755 options.sh "$pkgdir/usr/share/oma/options.sh"
    install -Dm755 optimizations.sh "$pkgdir/usr/share/oma/optimizations.sh"
}
