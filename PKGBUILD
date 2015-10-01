pkgname=file-uri-tools
pkgver=0.0.1
pkgrel=1
pkgdesc="Simple Perl scripts to convert to and from file:// URI"
arch=('any')
url=""
license=('MIT')
groups=()
depends=('perl-uri')
makedepends=()
provides=("${pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("file2uri"
        "uri2file"
       )
noextract=()
md5sums=("SKIP"
         "SKIP"
        )

package() {
    install -m755 -d $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin file2uri uri2file
}

