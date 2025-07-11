# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-cli-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="osu!lazer Beatmap Exporter utility - CLI version"
arch=("x86_64")
url="https://github.com/kabiiQ/BeatmapExporter"
license=("MIT")
depends=()
makedepends=("curl")
options=('!strip')
source=(
    "BeatmapExporterCLI::https://github.com/kabiiQ/BeatmapExporter/releases/download/v${pkgver}/linux-BeatmapExporterCLI"
)
noextract=()
sha256sums=(
    "833912e69ca409d160bc459bbb6101bef82a3506e392f75ef702bd9076c103a9"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporterCLI" "$pkgdir/usr/bin/beatmapexporter-cli"
}
