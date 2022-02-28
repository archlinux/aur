_uuid="SCES-01420"
_app_id="com.naughtydog.CrashBandicoot3"
pkgname=crash-bandicoot-3
pkgver=1.0
pkgrel=1
pkgdesc="PlayStation game."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Bandicoot:_Warped"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%203%20-%20Warped%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29.zip/Crash%20Bandicoot%203%20-%20Warped%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/Crash%20Bandicoot%203%20-%20Warped%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29.zip/Crash%20Bandicoot%203%20-%20Warped%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29.cue"
        "${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("aef1ed3bdc7abfab1458aac51356dad67f462653ea39b0196de0ff68dbafccf1"
	    "0374b10b80144d4f55e79b747c0df5c7f1cebdaccdbd589de1822a39f25a8e27"
	    "89d92feb511f0bd2e3e2b751e213e445d211d033b9979d673750b26895e16e64"
	    "96f31f67465a333f534b08d792088e93fb99d615644b55f0ebca13958ae90ebe")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm755 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm755 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
