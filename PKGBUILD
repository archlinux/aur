# Maintainer: stag-enterprises < x [at] stag [dot] lol >

pkgname=intellishell-bin
pkgver=1.0.3
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
sha256sums_x86_64=('31bdc013fcb4b3a9c09764cb2c51bc11248f4b10c2b5ed13af705904f4eca576')
sha256sums_aarch64=('2ae857cf21a9f66ba6022c93670f6b4b38b5ce472476c7328e6b41aac21adb38')
sha512sums=('42073f5052cc154642821ca7b36a85303e8f0c933cea928aa19d622838d5c0f40a8e1612569dc4f12919cee94e878eb02c72d81df65970c0ad443b319c473aaa'
            '2c5222e4fdf929273f5973a7b2522cc690bbe6b19b7bb06ab5b43c29d0cc22d9de5468afa373f6579788e5c348f365275bcf8deebb2067aa344d9d4cd0ac820a')
sha512sums_x86_64=('f752c11863927733fae67d7549dc0f65c3e91aca2f7fb000df6ba3ffa6b4fef0c65bd65729075d1c7ee0deffd825ea89cb4595d95398994e68385b8b7031609b')
sha512sums_aarch64=('d1269589e029ab88026ed379aae1186a9b510c563e76a95e9a82e225702f219711c12a1713ae022257608b2bd398a14acd2c0a734de4785e3b10304155dfad13')
b2sums=('f6ae98100aa002992f466eddaeeef69d3a745156e7b05f2bb4b005095faed0a0d49116005963c3fd67945bef53c1d8a35daf57e64ab2e882e295c2b35e9836f5'
        'e49d73385dcb5cda12a1a621a5508ddb2cb646cff5486d17a952e8186f25299be9d49c23f1947fc0c5c88096fdb0bcb9ec1394fbad3757320f80e906ce7edf35')
b2sums_x86_64=('175f5da1c7cca68dc62683f975dd9f1175e38ec6cfad7424fdcfb8d7a5aff48400ae550bdafd1db73282a733c0e4a128c2774b5627cf3bc0114f3fb5b0b4867e')
b2sums_aarch64=('985738a6d8a01a77c5ace3f8fc48e012122fea48f6f0542fe09c61da5d6fa9f2c5eafcfaa29bd4cae9df3eec33d9b2c9e90afc647c2458b07bb56f54cb9fd6f2')

package() {
     cd "$srcdir"
     install -Dm755 intelli-shell "$pkgdir/usr/bin/intelli-shell"
     install -Dm644 README.md     "$pkgdir/usr/share/doc/intellishell/README.md"
     install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/intellishell/LICENSE"
}
