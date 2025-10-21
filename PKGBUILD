#Maintainer: Masoud and Chat GPT

pkgname=access_pkg
pkgver=0.0.1
pkgrel=1
pkgdesc="Check file and folder permission "
arch=('x86_64')
url=" https://github.com/MasoudAmiriBatmanghlnj/access.sh"
license=('MIT')
depends=('bash')
source=("https://github.com/MasoudAmiriBatmanghlnj/access.sh/blob/main/access.sh")
sha512sums=('2eb9ed495dff2e2399d042bceaf0961cb4110f5819ceb4e8421d2909b1acaff9f961acf07e16a614d0052e53b1c86be6812856ea35584e49bbffec62e78b77b0')
#build(){''}

package() {
    install -Dm755 "$srcdir/access_pkg.sh" "$pkgdir/usr/bin/access"
}
