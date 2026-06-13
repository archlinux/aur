# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-cli-bin
pkgver=2.7.0
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
    "0480b10757d94b52efd1a6bdf819f6a3d2ee48da9c06aa7ae0b2bc8e6c4eaa6c"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporterCLI" "$pkgdir/usr/bin/beatmapexporter-cli"
}
