pkgbase="grpc-client-cli"
pkgname="${pkgbase}-bin"
pkgver=1.20.0
pkgrel=1
pkgdesc="generic gRPC command line client"
arch=('x86_64')
url="https://gitlab.com/vadimi/grpc-client-cli/"
license=('MIT')
provides=('grpc-client-cli')
source_x86_64=("https://github.com/vadimi/grpc-client-cli/releases/download/v${pkgver}/grpc-client-cli_linux_x86_64.tar.gz")


sha256sums_x86_64=('79aafa6b2bb4f5dbc88fef568b80616db11ece4885e8bd74a79c0cc307788988')

package() {
  mkdir -p ${pkgdir}/opt/grpc-client-cli
  mkdir -p ${pkgdir}/usr/bin

  mv grpc-client-cli ${pkgdir}/opt/grpc-client-cli
  ln -s "/opt/grpc-client-cli/grpc-client-cli" "${pkgdir}/usr/bin"
  #install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
