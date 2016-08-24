# Maintainer: dreieck

_pkgname=idos-timetable-data-chaps-all
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2016_8_24
pkgrel=1
pkgdesc="Timetable data for the timetable search engines by CHAPS: European railway, Czech/Slovak trains + bus, Czech public transport, some air transport. Note that some timetables need the purchased version of IDOS to run."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatt"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-trains-common"
        )

makedepends=(
  "wget"
)

optdepends=(
            "idos-timetable-tariff: For showing prices."
            "idos-timetable-maps: For displaying routes on maps."
            "idos-timetable-additionalinfo-trains: For (links to) additional information about train composition and stations."
            "idos-timetable-additional-bus: For images of certain bus stations."
            "idos-timetable-additionalinfo-MHD-IDSJMK: For photographs of public transport stops in the IDSJMK region."
            "idos-timetable-additionalinfo-MHD-PID: For photographs of public transport stops in the PID region."
            "idos-timetable-additionalinfo-MHD-ODIS: For links to information about changes, fares, salespoints ... in the ODIS-region."
           )

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-trains=${pkgver}"
  "idos-timetable-data-bus=${pkgver}"
  "idos-timetable-data-MHD=${pkgver}"
  "idos-timetable-data-flights=${pkgver}"
  
  "idos-timetable-data-trains-cz=${pkgver}"
  "idos-timetable-data-trains-europe=${pkgver}"
  "idos-timetable-data-trains-IDOL=${pkgver}"
  "idos-timetable-data-trains-ODIS=${pkgver}"
  "idos-timetable-data-trains-PID=${pkgver}"
  "idos-timetable-data-bus-cz=${pkgver}"
  "idos-timetable-data-bus-cz-history=${pkgver}"
  "idos-timetable-data-bus-sk=${pkgver}"
  "idos-timetable-data-bus-IDOL=${pkgver}"
  "idos-timetable-data-bus-ODIS=${pkgver}"
  "idos-timetable-data-MHD-Adamov=${pkgver}"
  "idos-timetable-data-MHD-As=${pkgver}"
  "idos-timetable-data-MHD-Benesov=${pkgver}"
  "idos-timetable-data-MHD-Beroun=${pkgver}"
  "idos-timetable-data-MHD-Bilina=${pkgver}"
  "idos-timetable-data-MHD-Blansko=${pkgver}"
  "idos-timetable-data-MHD-BrandysNL=${pkgver}"
  "idos-timetable-data-MHD-IDSJMK=${pkgver}"
  "idos-timetable-data-MHD-Bruntal=${pkgver}"
  "idos-timetable-data-MHD-Breclav=${pkgver}"
  "idos-timetable-data-MHD-BystriceNP=${pkgver}"
  "idos-timetable-data-MHD-Caslav=${pkgver}"
  "idos-timetable-data-MHD-CeskaLipa=${pkgver}"
  "idos-timetable-data-MHD-CeskeBudejovice=${pkgver}"
  "idos-timetable-data-MHD-CeskyTesin=${pkgver}"
  "idos-timetable-data-MHD-Dacice=${pkgver}"
  "idos-timetable-data-MHD-Decin=${pkgver}"
  "idos-timetable-data-MHD-Domazlice=${pkgver}"
  "idos-timetable-data-MHD-Duchcov=${pkgver}"
  "idos-timetable-data-MHD-DvurKraloveNL=${pkgver}"
  "idos-timetable-data-MHD-FrydekMystek=${pkgver}"
  "idos-timetable-data-MHD-Havirov=${pkgver}"
  "idos-timetable-data-MHD-HavlickuvBrod=${pkgver}"
  "idos-timetable-data-MHD-Hodonin=${pkgver}"
  "idos-timetable-data-MHD-Horice=${pkgver}"
  "idos-timetable-data-MHD-HradecKralove=${pkgver}"
  "idos-timetable-data-MHD-Hranice=${pkgver}"
  "idos-timetable-data-MHD-Cheb=${pkgver}"
  "idos-timetable-data-MHD-Chomutov=${pkgver}"
  "idos-timetable-data-MHD-Chrudim=${pkgver}"
  "idos-timetable-data-MHD-JabloncecNN=${pkgver}"
  "idos-timetable-data-MHD-Jachymov=${pkgver}"
  "idos-timetable-data-MHD-Jicin=${pkgver}"
  "idos-timetable-data-MHD-Jihlava=${pkgver}"
  "idos-timetable-data-MHD-JindrichuvHradec=${pkgver}"
  "idos-timetable-data-MHD-Kadan=${pkgver}"
  "idos-timetable-data-MHD-KarlovyVary=${pkgver}"
  "idos-timetable-data-MHD-Karvina=${pkgver}"
  "idos-timetable-data-MHD-Kladno=${pkgver}"
  "idos-timetable-data-MHD-KlasterecNO=${pkgver}"
  "idos-timetable-data-MHD-Klatovy=${pkgver}"
  "idos-timetable-data-MHD-Kolin=${pkgver}"
  "idos-timetable-data-MHD-KostelecNO=${pkgver}"
  "idos-timetable-data-MHD-KralupyNV=${pkgver}"
  "idos-timetable-data-MHD-Krnov=${pkgver}"
  "idos-timetable-data-MHD-Kromeriz=${pkgver}"
  "idos-timetable-data-MHD-KutnaHora=${pkgver}"
  "idos-timetable-data-MHD-Kyjov=${pkgver}"
  "idos-timetable-data-MHD-Liberec=${pkgver}"
  "idos-timetable-data-MHD-Litomerice=${pkgver}"
  "idos-timetable-data-MHD-Litomysl=${pkgver}"
  "idos-timetable-data-MHD-Louny=${pkgver}"
  "idos-timetable-data-MHD-Lovosice=${pkgver}"
  "idos-timetable-data-MHD-MarianskeLazne=${pkgver}"
  "idos-timetable-data-MHD-Melnik=${pkgver}"
  "idos-timetable-data-MHD-Milevsko=${pkgver}"
  "idos-timetable-data-MHD-MladaBoleslav=${pkgver}"
  "idos-timetable-data-MHD-MnisekPB=${pkgver}"
  "idos-timetable-data-MHD-Most=${pkgver}"
  "idos-timetable-data-MHD-Nachod=${pkgver}"
  "idos-timetable-data-MHD-Neratovice=${pkgver}"
  "idos-timetable-data-MHD-NoveMestoNM=${pkgver}"
  "idos-timetable-data-MHD-NovyJicin=${pkgver}"
  "idos-timetable-data-MHD-Nymburk=${pkgver}"
  "idos-timetable-data-MHD-Olomouc=${pkgver}"
  "idos-timetable-data-MHD-Opava=${pkgver}"
  "idos-timetable-data-MHD-Orlova=${pkgver}"
  "idos-timetable-data-MHD-ODIS=${pkgver}"
  "idos-timetable-data-MHD-Ostrov=${pkgver}"
  "idos-timetable-data-MHD-Pardubice=${pkgver}"
  "idos-timetable-data-MHD-Pelhrim=${pkgver}"
  "idos-timetable-data-MHD-Pisek=${pkgver}"
  "idos-timetable-data-MHD-Plzen=${pkgver}"
  "idos-timetable-data-MHD-Policka=${pkgver}"
  "idos-timetable-data-MHD-PID=${pkgver}"
  "idos-timetable-data-MHD-Prostej=${pkgver}"
  "idos-timetable-data-MHD-Prelouc=${pkgver}"
  "idos-timetable-data-MHD-Prerov=${pkgver}"
  "idos-timetable-data-MHD-Prestice=${pkgver}"
  "idos-timetable-data-MHD-Pribram=${pkgver}"
  "idos-timetable-data-MHD-Rokycany=${pkgver}"
  "idos-timetable-data-MHD-RoudniceNL=${pkgver}"
  "idos-timetable-data-MHD-RychnovNK=${pkgver}"
  "idos-timetable-data-MHD-Slany=${pkgver}"
  "idos-timetable-data-MHD-Sokolov=${pkgver}"
  "idos-timetable-data-MHD-Strakon=${pkgver}"
  "idos-timetable-data-MHD-Stribro=${pkgver}"
  "idos-timetable-data-MHD-Studenka=${pkgver}"
  "idos-timetable-data-MHD-SpindleruvMlyn=${pkgver}"
  "idos-timetable-data-MHD-Steti=${pkgver}"
  "idos-timetable-data-MHD-Sumperk=${pkgver}"
  "idos-timetable-data-MHD-Tabor=${pkgver}"
  "idos-timetable-data-MHD-Tachov=${pkgver}"
  "idos-timetable-data-MHD-TepliceVC=${pkgver}"
  "idos-timetable-data-MHD-Trutnov=${pkgver}"
  "idos-timetable-data-MHD-Trebic=${pkgver}"
  "idos-timetable-data-MHD-Trinec=${pkgver}"
  "idos-timetable-data-MHD-Turnov=${pkgver}"
  "idos-timetable-data-MHD-TynisteNO=${pkgver}"
  "idos-timetable-data-MHD-UherskeHradiste=${pkgver}"
  "idos-timetable-data-MHD-UstiNL=${pkgver}"
  "idos-timetable-data-MHD-ValasskeMezirici=${pkgver}"
  "idos-timetable-data-MHD-Varnsdorf=${pkgver}"
  "idos-timetable-data-MHD-VelkeMezirici=${pkgver}"
  "idos-timetable-data-MHD-Vimperk=${pkgver}"
  "idos-timetable-data-MHD-Vlasim=${pkgver}"
  "idos-timetable-data-MHD-Vrchlabi=${pkgver}"
  "idos-timetable-data-MHD-Vsetin=${pkgver}"
  "idos-timetable-data-MHD-Vyskov=${pkgver}"
  "idos-timetable-data-MHD-ZabrehNM=${pkgver}"
  "idos-timetable-data-MHD-Zlin=${pkgver}"
  "idos-timetable-data-MHD-Znojmo=${pkgver}"
  "idos-timetable-data-MHD-Zamberk=${pkgver}"
  "idos-timetable-data-MHD-Zatec=${pkgver}"
  "idos-timetable-data-MHD-ZdarNS=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

source=(
  "komplet.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/KOMPLET.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File KOMPLET.ZIP\(.*\)Zip/KOMPLET.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*
  rm -f "${_instdir}/Data1"/[vV][lL][aA][kK].[tT][tT][rR] # This one is provided by idos-timetable-data-trains-common.

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
