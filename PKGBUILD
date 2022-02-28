_uuid="SCUS-94900"
_app_id="com.naughtydog.CrashBandicootPrototypeJuly"
pkgname=crash-bandicoot-prototype-july
pkgver=1.0
pkgrel=1
pkgdesc="A prototype of Crash Bandicoot for the PlayStation (July 1996)."
arch=('any')
url="https://hiddenpalace.org/Crash_Bandicoot_(Jul_15,_1996_prototype)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.7z::https://archive.org/download/CrashBandicootJul151996prototype/Crash%20Bandicoot%20%28Jul%2015%2C%201996%20prototype%29.7z"
	"${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("224910f62dc2ac7077dade613a740807ae6afe993e2971b76d2f4c2129528e6a"
	    "5a03b7e2fde27ac84d40cfedbd32f9ca2249da866a3050b4c199448bda3775a2"
	    "dd03ddeb7071abd890721a97ef3e8ac23188c3939efa36fc2e4ecd15af78e4de")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  local _name="PSX - Crash 07-22-96"
  install -Dm755 "${_name}.img" "${_game}/${_uuid}.img"
  install -Dm755 "${_name}.sub" "${_game}/${_uuid}.sub"
  install -Dm755 "${_name}.ccd" "${_game}/${_uuid}.ccd"
  install -Dm755 "${_name}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
