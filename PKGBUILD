pkgname="nextcloud-cli"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Hello world in your terminal!"
sha512sums=("SKIP")
arch=("x86_64")
depends=("go>=1.19.2")
license=("MIT")
source=("ncli.go")

package() {
  echo "Installing Nextcloud-CLI"
  mkdir -p "${pkgdir}/usr/bin"
  go build -o bin/ncli ncli.go
  cp "${srcdir}/bin/ncli" "${pkgdir}/usr/bin/ncli"
  chmod +x "${pkgdir}/usr/bin/ncli"
}