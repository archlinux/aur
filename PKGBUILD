# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-cli-bin
pkgver=2.6.1
pkgrel=2
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
    "f4ae8474ceedef675a5f06e1102ca87fe5b13be33052d25b5157e8a5dd3947c9"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporterCLI" "$pkgdir/usr/bin/beatmapexporter-cli"
}
