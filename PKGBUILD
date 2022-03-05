_uuid="SLES-01587"
_app_id="com.easports.FIFA99"
pkgname=fifa-99
pkgver=1.0
pkgrel=1
pkgdesc="Football simulation videogame for the PlayStation console."
arch=('any')
url="https://en.wikipedia.org/wiki/FIFA_99"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/FIFA%2099%20%28Italy%29.zip/FIFA%2099%20%28Italy%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/FIFA%2099%20%28Italy%29.zip/FIFA%2099%20%28Italy%29.cue"
        "${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("8c718bfeb4c179a97e7277f60344702a6881ff8542260056cd570caeab1721b4"
	    "d90d104740d4dbdef23b4de55e5847dc7d38512a6b10391ef330cd91dc323880"
	    "96fcc1cfcaf5add8d943516989dee334dc7bd1db91f3c6f2a95b5340965728a9"
	    "74a94ec526b9287f73144253920d94d4fc38cda6344b18180123c57c5b5f0085")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
