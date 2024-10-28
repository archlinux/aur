# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.1.1
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname")
sha256sums=('4473fca512fb8bf8f7df4d1b2f76d93a207f69472c98ad3319b7a1f7b3fb6b65')
depends=('glibc' 'gcc-libs' 'gtk4')
conflicts=($_pkgname)
provides=($_pkgname)

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
