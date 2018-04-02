# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=pirsf
pkgver=80.00
pkgrel=1
pkgdesc='The Protein Information Resource (PIR) is an integrated public bioinformatics resource to support genomic, proteomic and systems biology research and scientific studies.'
arch=('any')
license=('GPL')
#ftp://ftp.pir.georgetown.edu/databases/pirsf/pirsfinfo.dat
url='ftp://ftp.pir.georgetown.edu'
depends=('hmmer')
makedepends=('bash')
provides=()
path="/databases/pirsf"
source=(
        "$url$path/pirsfinfo.dat"
	"$url$path/pirsfinfo.readme"
        )
sha512sums=(
'6e47f39a5341e4791217d368d969847966d15b8c378242029c0bd28217198725c9906842b859e9312c6e897d6eac3346564fff1184e7572989bfbc721f56f299'
'd89640e59902a3c0e409c0d14039b0eff2f1e5b6713f50802381a34415d4b420429d9ca66cf8ae15caa1fad269ae4c08f9d8cb9bd7b08a615bd80683df446a98'
)

package() {
  mkdir -p  "$pkgdir/opt/$pkgname/"
  cp -t "$pkgdir/opt/$pkgname/" pirsfinfo.dat pirsfinfo.readme
}
