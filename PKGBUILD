#Maintainer: AlpixTM aka Lukas N. <contact@alpix.eu>
pkgname=transfersh
pkgver=0.3
pkgrel=1
pkgdesc="unofficial command-line client for https://github.com/dutchcoders/transfer.sh (https://transfer.sh) Share a file easy with >transfersh filepath<"
arch=('any')
url="https://github.com/AlpixTM/transfersh"
license=('AGPL')
groups=()
depends=('python' 'python-requests')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/AlpixTM/transfersh/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

package() {
  cd "$pkgname-$pkgver"
install -D -m 755 "${srcdir}/transfersh-0.3/transfersh" "${pkgdir}/usr/bin/transfersh"
install -D -m 755 "${srcdir}/transfersh-0.3/README.md" "${pkgdir}/usr/share/$pkgname/README.md"
install -D -m 644 "${srcdir}/transfersh-0.3/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
