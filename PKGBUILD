# Maintainer: stag-enterprises < x [at] stag [dot] lol >

pkgname=intellishell-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Smart bookmark manager for shells"
arch=("x86_64" "aarch64")
url="https://github.com/lasantosr/intelli-shell"
license=("Apache-2.0")
provides=("intellishell")
conflicts=() # NOTE update if intellishell package is created
changelog="CHANGELOG"
install="intelli-shell.install"
source=("LICENSE::https://raw.githubusercontent.com/lasantosr/intelli-shell/refs/tags/v${pkgver}/LICENSE",
        "README.md::https://raw.githubusercontent.com/lasantosr/intelli-shell/refs/tags/v${pkgver}/README.md")
source_x86_64=("https://github.com/lasantosr/intelli-shell/releases/download/v${pkgver}/intelli-shell-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/lasantosr/intelli-shell/releases/download/v${pkgver}/intelli-shell-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('304aa1063d2502e840a2d85c59b8c3860bcf0173d53f279e9b0492ea5a34d312'
            '2485718e1f9a78ba7f4ca6b833dcea58967ade622fbe6e452d8503d9c8a2d50a')
sha256sums_x86_64=('b4ee83e29d86dbdf83a13dcb9abd546e4eae48c55efede8f3253a2edef2c475d')
sha256sums_aarch64=('7051e9a4d4f12295e21c862e2ecd7eec64bdf5273526a569e1f722bb338aabf7')
sha512sums=('42073f5052cc154642821ca7b36a85303e8f0c933cea928aa19d622838d5c0f40a8e1612569dc4f12919cee94e878eb02c72d81df65970c0ad443b319c473aaa'
            '2c5222e4fdf929273f5973a7b2522cc690bbe6b19b7bb06ab5b43c29d0cc22d9de5468afa373f6579788e5c348f365275bcf8deebb2067aa344d9d4cd0ac820a')
sha512sums_x86_64=('53a21837850ca70fc08e64f0fb1afff1c2ed278234edffc6ab9f966b2462cd735ee9b5330b8dfe90932560650fff57aa5f72d7fb71dcae9b96486a9997cab7e6')
sha512sums_aarch64=('20482063188902bfe0796d69f427b9d8011e46af2e18716dcea18a2e7520d3a520457cd57f9f5b91ec637360a6526dcfcf33f7a9e599fe8a601c4e1caea44c17')
b2sums=('f6ae98100aa002992f466eddaeeef69d3a745156e7b05f2bb4b005095faed0a0d49116005963c3fd67945bef53c1d8a35daf57e64ab2e882e295c2b35e9836f5'
        'e49d73385dcb5cda12a1a621a5508ddb2cb646cff5486d17a952e8186f25299be9d49c23f1947fc0c5c88096fdb0bcb9ec1394fbad3757320f80e906ce7edf35')
b2sums_x86_64=('df6c848b33634212a7e86e7be3e7d8873ddd683a9c91ab0883c28336562ac733426ca50499d682a58118f0102d49829ef4eefbfcb27f4e39dddfe971f867b3d1')
b2sums_aarch64=('9fc05878d33c98e726686096bb89ff2dc1ebc7d1c9190a8f05d6c3c1378b7cf808b40a0ab9830a5e103e440898bdaa4903392efb166c44ccc100a9d7a90b399d')

package() {
     cd "$srcdir"
     install -Dm755 intelli-shell "$pkgdir/usr/bin/intelli-shell"
     install -Dm644 README.md     "$pkgdir/usr/share/doc/intellishell/README.md"
     install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/intellishell/LICENSE"
}
