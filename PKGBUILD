_uuid="SCPS-10088"
_app_id="jp.co.mkitchen.BokuNoNatsuyasumi"
pkgname=boku-no-natsuyasumi-summer-holiday-20th-century
pkgver=1.0
pkgrel=1
pkgdesc="PlayStation game."
arch=('any')
url="https://en.wikipedia.org/wiki/Boku_no_Natsuyasumi"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Boku%20no%20Natsuyasumi%20-%20Summer%20Holiday%2020th%20Century%20%28Japan%29.zip/Boku%20no%20Natsuyasumi%20-%20Summer%20Holiday%2020th%20Century%20%28Japan%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/Boku%20no%20Natsuyasumi%20-%20Summer%20Holiday%2020th%20Century%20%28Japan%29.zip/Boku%20no%20Natsuyasumi%20-%20Summer%20Holiday%2020th%20Century%20%28Japan%29.cue"
        "${_app_id}.desktop"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/0/05/Boku_no_Natsuyasumi_Cover.jpg")
sha256sums=("7c3c0a3b7e4dde160b5ee975013b441f089e9f462622342cd02f3298edbc3142"
	    "ce17f3c7c995e96ed785c3122c1632b9d940746d0be5ec48f3380252a1eaee75"
	    "b4b2e9933b490c050649f9e6bc4b4496f2fee185281139d1d634d2be2432bf30"
	    "cb703bc136160d53b22aa9abe3ff49321e939587c3541d88b2e8d58e1081feec")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm755 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm755 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
