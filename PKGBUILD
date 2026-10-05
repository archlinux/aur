# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-cli-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="osu!lazer Beatmap Exporter utility - CLI version"
arch=("x86_64")
url="https://github.com/kabiiQ/BeatmapExporter"
license=("MIT")
depends=()
options=('!strip')
source=(
    "BeatmapExporterCLI::https://github.com/kabiiQ/BeatmapExporter/releases/download/v${pkgver}/linux-BeatmapExporterCLI"
)
noextract=()
sha256sums=(
    "e9280eb2c7c55db24be97ca352b1c0cba10da61d5bcf877d8e7034985e8ab42d"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporterCLI" "$pkgdir/usr/bin/beatmapexporter-cli"
}
