_uuid="SCES-00967"
_app_id="com.naughtydog.CrashBandicoot2"
pkgname=crash-bandicoot-2
pkgver=1.0
pkgrel=1
pkgdesc="PlayStation game."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Bandicoot_2:_Cortex_Strikes_Back"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.cue"
        "${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("9499b6ad8f0cfdb99ee8ae40bc98776f56fdaa91d01e55448f62aaa2c0df7853"
	    "6a4bf93ea6b904303254faa946d877cd705893c17458acb2549606dae586fd98"
	    "c86c504da065221580a4751abf67da5d5be16bee8daea27806103cc21b91d329"
	    "410cf854f85ff43c4720ef5cf01a32d92dddd96890abbbd94193adb83fa78785")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm755 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm755 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
