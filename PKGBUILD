_uuid="SCUS-94900"
_app_id="com.naughtydog.CrashBandicootE3"
pkgname=crash-bandicoot-e3
pkgver=3.44
pkgrel=1
pkgdesc="E3 demo version."
arch=('any')
url="https://hiddenpalace.org/Crash_Bandicoot_(May_11,_1996_prototype)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.7z::https://files.hiddenpalace.org/c/c8/Crash_Bandicoot_%28May_11%2C_1996_prototype%29.7z"
        "com.naughtydog.CrashBandicootE3.desktop"
        "com.naughtydog.CrashBandicootE3.png")
sha256sums=("3084ce9b2decfe365abf8bd54c4d6d0f2b0257b8b3f2298aff0d3d8e68b08096"
	    "f0d06fbdcd20e0626143da1fbb86226a75e662f78422b57d02ac0d0fc611079b"
	    "70c0b9eb0bcc0e74f8366d1cbcfe39f0c3bc2e05ed1c6d9f777952f9ea5f188a")

package() {
  local _game_path="Crash Bandicoot (May 11, 1996 prototype)/Crash Bandicoot (05-11-1996)"
  local _game_title="Crash Bandicoot (c) 1996 Naughty Dog V3.44"
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm755 "${_game_path}/${_game_title}.ccd" "${_game}/${_uuid}.ccd"
  install -Dm755 "${_game_path}/${_game_title}.img" "${_game}/${_uuid}.img"
  install -Dm755 "${_game_path}/${_game_title}.sub" "${_game}/${_uuid}.sub"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
