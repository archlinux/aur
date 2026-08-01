# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-manager
pkgver=0.1.13
pkgrel=1
pkgdesc="Agentics Manager daemon - the blind sealed-box relay between Agentics surfaces and the gRPC hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-manager-0.1.13-x86_64::https://repo.agentics.co.za/x86_64/agentics-manager-0.1.13-x86_64"
        "agentics-manager-0.1.13-wasm.sealed::https://repo.agentics.co.za/x86_64/agentics-manager-0.1.13-wasm.sealed")
sha512sums=('6b75d498587645466b53621ebd7bc6d3d68e437ace56f61ec0a5a2475a849efcdd5088051dc8100e2c6052cba1312238084d9bdb6a70e1e4cca815a69dec4252'
            'c6c4747ca03442fe849a8e76aa876b2e78bcb82eec2750a5ef1ac24f3c970c41f3b158cffc1341c6e294d09c5aa327a974e561b73f9c4ddcb18926a74e4f2917')

package() {
  install -Dm755 "$srcdir/agentics-manager-0.1.13-x86_64" "$pkgdir/usr/bin/agentics-managerd"
  install -Dm644 "$srcdir/agentics-manager-0.1.13-wasm.sealed" "$pkgdir/opt/agentics/components/manager/0.1.13/manager-0.1.13-wasm-wasm.sealed"
}
