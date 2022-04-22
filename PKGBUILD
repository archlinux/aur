# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgbase=ubuntu-backgrounds
pkgname=(
  ubuntu-backgrounds-bionic
  ubuntu-backgrounds-focal
  ubuntu-backgrounds-groovy
  ubuntu-backgrounds-jammy
  ubuntu-backgrounds-trusty
  ubuntu-backgrounds-xenial
)
pkgver=0.1.0
pkgrel=1
pkgdesc="All backgrounds of Ubuntu"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers"

_pkgver=22.04.4
source=("${url}/ubuntu-wallpapers_${_pkgver}.orig.tar.gz")
sha256sums=('83a9469e84c908d29f9fb2484029575a2d05548f9d984dca556740b622c5dd1e')

package_ubuntu-backgrounds-bionic() {
  _pkgname=${pkgname/${pkgbase}-/}

  # encode to uft8
  mv ${srcdir}/ubuntu-wallpapers-${_pkgver}/Cathédrale_Marie-Rheine-du-Monde_by_Thierry_Pon.jpg ${srcdir}/ubuntu-wallpapers-${_pkgver}/Cathedrale_Marie-Rheine-du-Monde_by_Thierry_Pon.jpg

  wallpapers=(
    "Cathedrale_Marie-Rheine-du-Monde_by_Thierry_Pon.jpg"
    "Crocus_Wallpaper_by_Roy_Tanck.jpg"
    "Definitive_Light_Zen_Orange_by_Pierre_Cante.jpg"
    "El_Haouaria_by_Nusi_Nusi.jpg"
    "Halifax_Sunset_by_Vlad_Drobinin.jpg"
    "Manhattan_Sunset_by_Giacomo_Ferroni.jpg"
    "On_top_of_the_Rubihorn_by_Matthias_Niess.jpg"
    "Raindrops_On_The_Table_by_Alex_Fazit.jpg"
    "Ross_Jones_Rockpool_(Sydney)_by_Chris_Carignan.jpg"
    "Spices_in_Athens_by_Makis_Chourdakis.jpg"
    "This_Is_Bionic_Beaver_by_Pierre_Cante.jpg"
    "Wall_with_door_on_Gozo_by_Matthias_Niess.jpg"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_ubuntu-backgrounds-focal() {
  _pkgname=${pkgname/${pkgbase}-/}

  wallpapers=(
    "brad-huchteman-stone-mountain.jpg"
    "joshua-coleman-something-yellow.jpg"
    "matt-mcnulty-nyc-2nd-ave.jpg"
    "ryan-stone-skykomish-river.jpg"
    "hardy_wallpaper_uhd.png"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_ubuntu-backgrounds-groovy() {
  _pkgname=${pkgname/${pkgbase}-/}

  # encode to utf8
  mv "${srcdir}/ubuntu-wallpapers-${_pkgver}/Abstract_Painting_Photo_by_Pierre_Châtel-Innocenti.jpg" "${srcdir}/ubuntu-wallpapers-${_pkgver}/Abstract_Painting_Photo_by_Pierre_Chatel-Innocenti.jpg"

  wallpapers=(
    "Abstract_Painting_Photo_by_Pierre_Chatel-Innocenti.jpg"
    "Camera_Film_by_Markus_Spiske.jpg"
    "Colored_Pencils_by_Jess_Bailey.jpg"
    "Landscape_Photography_Of_Mountains_by_Simon_Berger.jpg"
    "Silver_Back_Gorilla_by_Mike_Arney.jpg"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_ubuntu-backgrounds-jammy() {
  _pkgname=${pkgname/${pkgbase}-/}

  wallpapers=(
    "Blue_flower_by_Elena_Stravoravdi.jpg"
    "canvas_by_roytanck.jpg"
    "Cherry_Tree_in_Lakones_by_elenastravoravdi.jpg"
    "DSC2943_by_kcpru.jpg"
    "jj_dark_by_Hiking93.jpg"
    "jj_light_by_Hiking93.jpg"
    "Mirror_by_Uday_Nakade.jpg"
    "Optical_Fibers_in_Dark_by_Elena_Stravoravdi.jpg"
    "ubuntu2_by_arman1992.jpg"
    "ubuntu_by_arman1992.jpg"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_ubuntu-backgrounds-trusty() {
  _pkgname=${pkgname/${pkgbase}-/}

  wallpapers=(
    "Backyard_Mushrooms_by_Kurt_Zitzelman.jpg"
    "Beach_by_Renato_Giordanelli.jpg"
    "Berries_by_Tom_Kijas.jpg"
    "Foggy_Forest_by_Jake_Stewart.jpg"
    "Forever_by_Shady_S.jpg"
    "Ibanez_Infinity_by_Jaco_Kok.jpg"
    "Jelly_Fish_by_RaDu_GaLaN.jpg"
    "Mono_Lake_by_Angela_Henderson.jpg"
    "Partitura_by_Vincijun.jpg"
    "Reflections_by_Trenton_Fox.jpg"
    "Sea_Fury_by_Ian_Worrall.jpg"
    "Water_web_by_Tom_Kijas.jpg"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_ubuntu-backgrounds-xenial() {
  _pkgname=${pkgname/${pkgbase}-/}

  # encode to uft8
  mv ${srcdir}/ubuntu-wallpapers-${_pkgver}/Cielo_estrellado_by_Eduardo_Diez_Viñuela.jpg ${srcdir}/ubuntu-wallpapers-${_pkgver}/Cielo_estrellado_by_Eduardo_Diez_Vinuela.jpg
  mv ${srcdir}/ubuntu-wallpapers-${_pkgver}/The_Land_of_Edonias_by_Γιωργος_Αργυροπουλος.jpg ${srcdir}/ubuntu-wallpapers-${_pkgver}/The_Land_of_Edonias.jpg

  wallpapers=(
    "160218-deux-two_by_Pierre_Cante.jpg"
    "Black_hole_by_Marek_Koteluk.jpg"
    "Cielo_estrellado_by_Eduardo_Diez_Vinuela.jpg"
    "clock_by_Bernhard_Hanakam.jpg"
    "Dans_ma_bulle_by_Christophe_Weibel.jpg"
    "Flora_by_Marek_Koteluk.jpg"
    "Icy_Grass_by_Raymond_Lavoie.jpg"
    "Night_lights_by_Alberto_Salvia_Novella.jpg"
    "passion_flower_by_Irene_Gr.jpg"
    "Spring_by_Peter_Apas.jpg"
    "TCP118v1_by_Tiziano_Consonni.jpg"
    "The_Land_of_Edonias.jpg"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_wallpaper() {
  _pkgname=${1}
  wallpapers=${2}

  for wallaper in ${wallpapers[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${_pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${_pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/${_pkgname}.xml#/usr/share/gnome-background-properties/${_pkgname}-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${_pkgname}#g" \
    ${srcdir}/ubuntu-wallpapers-${_pkgver}/${_pkgname}-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${_pkgver}/${_pkgname}-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/${_pkgname}-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${_pkgver}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}