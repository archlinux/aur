_app_id_variant() {
  local app_id="${1}"
  local disc="${2}"
  echo "${app_id}${disc}"
}

_title_variant() {
  local title="${1}"
  local variant="${2}"
  echo "${title}: ${variant}"
}

_pkgbase=resident-evil-2
pkgbase=biohazard-2
_app_id="com.capcom.ResidentEvil2"
app_id="com.capcom.Biohazard2"
_title="Resident Evil 2"
title="Biohazard 2"

pkgname=("${pkgbase}"
	 "${pkgbase}"{"-leon","-claire"}{,"-jp"}
         "${_pkgbase}"
         "${_pkgbase}"{"-leon","-claire"}{,"-de","-en","-es","-fr","-uk","-it"})

declare -gA _uuid_leon;
_uuid_leon=(["en"]="SLUS-00421"
            ["es"]="SLES-00976"
            ["uk"]="SLES-00972"
            ["de"]="SLES-00974"
            ["fr"]="SLES-00973"
            ["it"]="SLES-00975"
            ["jp"]="SLPS-01222"
            ["fallback"]="SLPS-01222")


declare -gA _uuid_claire;
_uuid_claire=(["en"]="SLUS-00592"
              ["es"]="SLES-10976"
              ["uk"]="SLES-10972"
              ["de"]="SLES-10974"
              ["fr"]="SLES-10973"
              ["it"]="SLES-10975"
              ["jp"]="SLPS-01223"
              ["fallback"]="SLPS-01223")

pkgver=1.0
pkgrel=1
pkgdesc="1998 survival horror video game developed and published by Capcom for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/Resident_Evil_2"
depends=('binmerge' 'duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
_archive="https://archive.org/download"

source=("${_uuid_leon["uk"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Europe%29%20%28Disc%201%29.zip"
  "${_uuid_leon["jp"]}.7z::${_archive}/sonyplaystationasiantscj20151103/Biohazard%202%20%28Japan%29%20%28Disc%201%29.7z"
  "${_uuid_leon["it"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Italy%29%20%28Disc%201%29.zip"
  "${_uuid_leon["fr"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28France%29%20%28Disc%201%29.zip"
  "${_uuid_leon["de"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Germany%29%20%28Disc%201%29.zip"
  "${_uuid_leon["es"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Spain%29%20%28Disc%201%29.zip"
  "${_uuid_leon["en"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28USA%29%20%28Disc%201%29.zip"
  
  "${_uuid_claire["uk"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Europe%29%20%28Disc%202%29.zip"
  "${_uuid_claire["jp"]}.7z::${_archive}/sonyplaystationasiantscj20151103/Biohazard%202%20%28Japan%29%20%28Disc%202%29.7z"
  "${_uuid_claire["it"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Italy%29%20%28Disc%202%29.zip"
  "${_uuid_claire["fr"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28France%29%20%28Disc%201%29.zip"
  "${_uuid_claire["de"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Germany%29%20%28Disc%202%29.zip"
  "${_uuid_claire["es"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28Spain%29%20%28Disc%202%29.zip"
  "${_uuid_claire["en"]}.zip::${_archive}/redump.psx.p3/Resident%20Evil%202%20%28USA%29%20%28Disc%202%29.zip"
  "psx-template.desktop"
  "launcher"
  "$(_app_id_variant "${_app_id}" Leon).png::https://psxdatacenter.com/images/covers/P/R/SLES-00972.jpg"
  "$(_app_id_variant "${_app_id}" Claire).png::https://psxdatacenter.com/images/covers/P/R/SLES-00972.jpg"
  "$(_app_id_variant "${app_id}" Leon).png::https://static.wikia.nocookie.net/residentevil/images/d/db/Bio2_PS.jpg"
  "$(_app_id_variant "${app_id}" Claire).png::https://static.wikia.nocookie.net/residentevil/images/d/db/Bio2_PS.jpg")
sha256sums=("daf3be1faa68b77fc032c0b49d0c4ea4e1f0cf90b80a838e36830fe4b7233a85"
	    "0c2e77bb28fcb116c06ca0194380131c3c4b2463204364e8eba9f0df9b919b02"
	    "438667bb49f4ca9eb8a4db4e1661b8d0052c8b742c9bd0e38a09327899c41d0b"
	    "2630f5529ab20a344b5475208b90ae4ebddeea56bf6f5c99c70ed1bca6f93b42"
	    "b3eea852a6a67867bb5c6f804a1c99e2ed62c4e29410811cb804f81299df8867"
	    "c5fdbf615af04046439bc19620b4785c0d78bdd0e12fab863ea185ee5d2d7a63"
	    "9c5811af028ad115010175055b919940e3d8b8a92df18dc2239ceb1eb4210092"
	    "c636dbdbbf245256734415b0127855928ed81de4d513b9056c939f131618e577"
	    "4f57406bc8e0fd292922cdc9fd9c09d0e7233a57273fa14b403501e0777ba175"
	    "d5d9eea997e1ca67ecf1db21e2eb3bfff09c1575cfb274ef18b6643d67c213b9"
	    "2630f5529ab20a344b5475208b90ae4ebddeea56bf6f5c99c70ed1bca6f93b42"
	    "39320d93f27d28bf4e0cfa48ff0356660970267301877de9a6f8c42f7f13904d"
	    "c5fdbf615af04046439bc19620b4785c0d78bdd0e12fab863ea185ee5d2d7a63"
	    "cc4448bb521e11a9b77257caaa57fb5e24cc94c792f9d78140ca9c5d1b9ad5e7"
	    "9c3d7e7559a4e648ae6487a2a6a6327ce0f96eedd3cea90ce512cf923edddb0e"
	    "fe0e3c2200f053556a3ea2c6876557486d0516de4a779661dc2e5ff551e0bf3f"
            "128708b486714cef34ec9d600f382d5200ca27ff84a2cf3f48a1c84fd3370cef"
            "128708b486714cef34ec9d600f382d5200ca27ff84a2cf3f48a1c84fd3370cef"
            "0ba0656513456cd6c05106e9608fce278f3c43a9ef76daa8c735e33c29fcfefb"
            "0ba0656513456cd6c05106e9608fce278f3c43a9ef76daa8c735e33c29fcfefb")

_desktop_file() {
  local _app_id="${1}"
  local _title="${2}"
  local _pkgbase="${3}"
  local _pkgdesc="${4}"
  local _icon="${5}"

  cp psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgbase%/${_pkgbase}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${_pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%icon%/${_icon}/g" "${_app_id}.desktop"
}

_launcher() {
  local _pkgbase="${1}"
  local _app_id="${2}"
  cp launcher "${_pkgbase}"
  sed -i "s/%app_id%/${_app_id}/g" "${_pkgbase}"
  sed -i "s/%pkgbase%/${_pkgbase}/g" "${_pkgbase}"
}

_normalize() {
  local _bin="${1}"
  local _cue="${2}"
  local _uuid="${3}"
  mv "${_bin} (Track 1).bin" "${_uuid} (Track 1).bin"
  mv "${_bin} (Track 2).bin" "${_uuid} (Track 2).bin"
  cp "${_cue}.cue" "${_uuid}.cue"
  sed -i -e "s/${_bin}/${_uuid}.bin/g" "${_uuid}.cue"
}

_prepare() {
  local _app_id="${1}"
  local _title="${2}"
  local _pkgbase="${3}"
  local _pkgdesc="${4}"
  local _icon="${5}"
  local _uuid="${6}"
  _desktop_file "${_app_id}" "${_title}" "${_pkgbase}" "${_pkgdesc}" "${_app_id}"
  _launcher "${_pkgbase}" "${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > any
}

_prepare_variant() {
  local app_id=${1}
  local variant="${2}"
  local fallback="${3}"
  local title="${4}"
  app_id="$(_app_id_variant "${app_id}" "${variant}")"
  title="$(_title_variant "${title}" "${variant}")"
  _prepare "${app_id}" "${title}" "${pkgbase}" "${pkgdesc}" "${app_id}" "${fallback}"
}

_package_common() {
  local _app_id="${1}" 
  local _pkgbase="${2}"
  install -Dm644 any "${pkgdir}/usr/games/${_app_id}/any"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

_package(){
  local _uuid="${1}"
  local _lang="${2}"
  local _rom="${3}"
  local _app_id="${4}"
  local _game="${pkgdir}/usr/games/${_app_id}"
  _normalize "${_rom}" "${_rom}" "${_uuid}"
  install -Dm644 "${_uuid} (Track 1).bin" "${_game}/${_uuid} (Track 1).bin"
  install -Dm644 "${_uuid} (Track 2).bin" "${_game}/${_uuid} (Track 2).bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm644 "${_uuid}.sbi" "${_game}/${_uuid}.sbi" || true
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${_game}/${_lang}"
}

package_biohazard-2() {
  depends+=("${pkgbase}-leon"
            "${pkgbase}-claire")
}

package_resident-evil-2() {
  depends+=("${_pkgbase}-leon"
            "${_pkgbase}-claire")
}

package_biohazard-2-leon() {
  #local uuid="SLPS-01222"
  local uuid="${_uuid_leon["fallback"]}"
  _prepare_variant "${app_id}" "Leon" "${uuid}" "${title}"
  _package_common "$(_app_id_variant "${app_id}" "Leon")" "${pkgbase}"
}

package_biohazard-2-claire() {
  local uuid="${_uuid_claire["fallback"]}"
  _prepare_variant "${app_id}" "Claire" "${uuid}" "${title}"
  _package_common "$(_app_id_variant "${app_id}" "Claire")" "${pkgbase}"
}

package_resident-evil-2-leon() {
  local uuid="${_uuid_leon["fallback"]}"
  _prepare_variant "${_app_id}" "Leon" "${uuid}" "${title}"
  _package_common "$(_app_id_variant "${app_id}" "Leon")" "${pkgbase}"
}

package_resident-evil-2-claire() {
  local uuid="${_uuid_claire["fallback"]}"
  _prepare_variant "${app_id}" "Claire" "${uuid}" "${title}"
  _package_common "$(_app_id_variant "${app_id}" "Claire")" "${pkgbase}"
}

package_biohazard-2-leon-jp() {
  depends+=("${pkgbase}-leon")
  local _lang="jp"
  local _uuid="${_uuid_leon[$_lang]}"
  local app_id="$(_app_id_variant "${app_id}" "Leon")"
  _package "${_uuid}" "${_lang}" "${title} (Japan) (Disc 1)" "${app_id}"
}

package_biohazard-2-claire-jp() {
  depends+=("${pkgbase}-claire")
  local _lang="jp"
  local _uuid="${_uuid_claire[$_lang]}"
  local app_id="$(_app_id_variant "${app_id}" "Claire")"
  _package "${_uuid}" "${_lang}" "${title} (Japan) (Disc 2)" "${app_id}"
}

package_resident-evil-2-leon-en() {
  depends+=("${_pkgbase}-leon")
  local _lang="en"
  local _uuid="${_uuid_leon[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Leon")"
  _package "${_uuid}" "${_lang}" "${_title} (USA) (Disc 1)" "${_app_id}"
}

package_resident-evil-2-claire-en() {
  depends+=("${_pkgbase}-claire")
  local _lang="en"
  local _uuid="${_uuid_claire[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Claire")"
  _package "${_uuid}" "${_lang}" "${_title} (USA) (Disc 2)"  "${_app_id}"
}

package_resident-evil-2-leon-es() {
  depends+=("${_pkgbase}-leon")
  local _lang="es"
  local _uuid="${_uuid_leon[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Leon")"
  _package "${_uuid}" "${_lang}" "${_title} (Spain) (Disc 1)" "${_app_id}"
}

package_resident-evil-2-claire-es() {
  depends+=("${_pkgbase}-claire")
  local _lang="es"
  local _uuid="${_uuid_claire[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Claire")"
  _package "${_uuid}" "${_lang}" "${_title} (Spain) (Disc 2)" "${_app_id}"
}

package_resident-evil-2-leon-de() {
  depends+=("${_pkgbase}-leon")
  local _lang="de"
  local _uuid="${_uuid_leon[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Leon")"
  _package "${_uuid}" "${_lang}" "${_title} (Germany) (Disc 1)" "${_app_id}"
}

package_resident-evil-2-claire-de() {
  depends+=("${_pkgbase}-claire")
  local _lang="de"
  local _uuid="${_uuid_claire[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Claire")"
  _package "${_uuid}" "${_lang}" "${_title} (Germany) (Disc 2)" "${_app_id}"
}

package_resident-evil-2-leon-fr() {
  depends+=("${_pkgbase}-leon")
  local _lang="fr"
  local _uuid="${_uuid_leon[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Leon")"
  _package "${_uuid}" "${_lang}" "${_title} (France) (Disc 1)" "${_app_id}"
}

package_resident-evil-2-claire-fr() {
  depends+=("${_pkgbase}-claire")
  local _lang="fr"
  local _uuid="${_uuid_claire[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Claire")"
  _package "${_uuid}" "${_lang}" "${_title} (France) (Disc 2)" "${_app_id}"
}

package_resident-evil-2-leon-it() {
  depends+=("${_pkgbase}-leon")
  local _lang="it"
  local _uuid="${_uuid_leon[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Leon")"
  _package "${_uuid}" "${_lang}" "${_title} (Italy) (Disc 1)" "${_app_id}"
}

package_resident-evil-2-claire-it() {
  depends+=("${_pkgbase}-claire")
  local _lang="it"
  local _uuid="${_uuid_claire[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Claire")"
  _package "${_uuid}" "${_lang}" "${_title} (Italy) (Disc 2)" "${_app_id}"
}

package_resident-evil-2-leon-uk() {
  depends+=("${_pkgbase}-leon")
  local _lang="uk"
  local _uuid="${_uuid_leon[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Leon")"
  _package "${_uuid}" "${_lang}" "${_title} (Europe) (Disc 1)" "${_app_id}"
}

package_resident-evil-2-claire-uk() {
  depends+=("${_pkgbase}-claire")
  local _lang="uk"
  local _uuid="${_uuid_claire[$_lang]}"
  local _app_id="$(_app_id_variant "${_app_id}" "Claire")"
  _package "${_uuid}" "${_lang}" "${_title} (Europe) (Disc 2)" "${_app_id}"
}
