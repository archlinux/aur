# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=Nu1LL1nuX
pkgname=nu1ll1nux
pkgver=1.1.r185
pkgrel=1
pkgdesc='ArchLinux install scripts, with riced configs for the Nu1LL1nuX platform.'
arch=(x86_64)
url="https://gitlab.com/qYp/$pkgname"
license=('MIT')
depends=(dialog)
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('ffb47c743db419d45a5dcc6da4f5c0eaf247346619654ee63c6381697c47678d')

pkgver() {
  printf "1.1.r$(git rev-list --count HEAD)"
}

package() {
    install -Dm755 Nu1LL1nuX.sh pre-install.sh -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 Nu1LL1nuX.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
