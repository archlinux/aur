# Maintainer: fiatjaf <fiatjaf@gmail.com>

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}

pkgname="nak-bin"
pkgver="0.19.12"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('efc18efd67c8995a3446078c6e909d6906b8ee7499150e111db243b94aa15683')
sha256sums=('5a123130410d4940d49f5562dd50c2a2a136160775f7c9827bcf62114c3f03b5')
sha256sums=('d27f748e04aad1e9fef60ab34c613b5d75fa84d7654e6a0f9e6f1ab528872a6f')
sha256sums=('d98c575e2a070d8aad8630b173a22a425484fe1a1c7b94bf71a46b0e7c2cf591')
sha256sums=('279dbcfad4efe53f04112fc4eeb9ebf513f95d3533e56e9280977b29fea60feb')
sha256sums=('986bce992229611e160aedbfd9c3362185eb9c121637a95f58d8098dda78cb09')
