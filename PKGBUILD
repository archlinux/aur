_uuid="SCES-00344"
_app_id="com.naughtydog.CrashBandicoot"
pkgname=crash-bandicoot
pkgver=1.0
pkgrel=1
pkgdesc="PlayStation game."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Bandicoot_(video_game)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.zip/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.bin"
	"${_uuid}.cue"
        "com.naughtydog.CrashBandicoot.desktop"
        "com.naughtydog.CrashBandicoot.png")
sha256sums=("a086b6fdd8d908393ff8a7e29be1e7add7cc0a495a221f526c6aa0e784329a54"
	    "24ef65cee46ca7274da45d9a2cb7ecd67d9e64f6fb76c05f3c60dec15abaa5ec"
	    "55950c9236778ebfb025b8da8cffde657f92db65ea2327a1f5d7889b5281e86f"
	    "4ebcdd92dd26fd86a70d2a9ee94126b0aa0a522bfc49992509c2a4f928d3971b")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm755 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm755 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
