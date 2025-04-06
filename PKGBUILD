# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-fnmt
pkgver=20250406
pkgrel=1
pkgdesc='Spanish Fabrica Nacional de Moneda y Timbre (FNMT) y Real Casa de la Moneda (RCM) certificates'
arch=('any')
url='https://www.sede.fnmt.gob.es'
license=('unknown')
depends=(
  'ca-certificates-mozilla'
  'ca-certificates-utils'
)
source=(
  "AC_Raiz_FNMT-RCM_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM_SHA256.cer"

  "AC_FNMT_Usuarios_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_FNMT_Usuarios.cer"
  "AC_Representacion_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Representacion.cer"
  "AC_Componentes_Informaticos_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Componentes_Informaticos_SHA256.cer"
  "AC_Sector_Publico_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Sector_Publico.cer"
  "AC_Unidades_Sellado_Tiempo_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Unidades_Sellado_Tiempo.cer"
  "AC_RAIZ_FNMT-RCM-Servidores_Seguros_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM-SS.cer"
  "AC_Servidores_Seguros_Tipo1_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Servidores_Seguros_Tipo1.cer"
  "AC_Servidores_Seguros_Tipo2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Servidores_Seguros_Tipo2.cer"

  "AC_Raiz_FNMT-RCM_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM_G2.cer"
  "AC_Consulares_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Consulares_G2.cer"
  "AC_Representacion_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Representacion_G2.cer"
  "AC_Sector_Publico_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Sector_Publico_G2.cer"
  "AC_Usuarios_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Usuarios_G2.cer"
  "AC_Entidades_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Entidades_G2.cer"

  "AC_Raiz_FNMT_RCM_TSA_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_RAIZ_FNMT_RCM_TSA.cer"
  "AC_TSA_FNMT_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_TSA_FNMT.cer"
  "AC_TSA_Clientes.cer_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_TSA_CLIENTES.cer"

  "OCSP_AC_Raiz_FNMT-RCM_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_ACRAIZ_FNMTRCM"
  "OCSP_AC_FNMT_Usuarios_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_FNMT_Usuarios"
  "OCSP_AC_Representacion_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Representacion"
  "OCSP_AC_Componentes_Informaticos_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Componentes_Informaticos"
  "OCSP_AC_Sector_Publico_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_SP"
  "OCSP_AC_Unidades_Sellado_Tiempo_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_QETS"
  "OCSP_AC_Servidores_Seguros_Tipo1_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_SS_Tipo1.cer"
  "OCSP_AC_Servidores_Seguros_Tipo2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_SS_Tipo2.cer"

  "OCSP_AC_Raiz_FNMT-RCM_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_RAIZ_FNMTRCM_G2.cer"
  "OCSP_AC_Consulares_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Consulares_G2.cer"
  "OCSP_AC_Representacion_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Representacion_G2.cer"
  "OCSP_AC_Sector_Publico_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Sector_Publico_G2.cer"
  "OCSP_AC_Usuarios_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Usuarios_G2.cer"
  "OCSP_AC_Entidades_G2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Entidades_G2.cer"

  "OCSP_AC_Raiz_TSA_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_RAIZ_TSA.cer"
  "OCSP_AC_TSA_FNMT.cer_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_TSA_FNMT.cer"
  "OCSP_AC_TSA_Clientes_FNMT.cer_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_TSA_CLIENTES_FNMT.cer"

  "qets_2025_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/qets_2025"
  "qets_2023_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/qtsa"
  "qets_2020_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/qets"

  # caducados(?)
#   "AC_Administracion_Publica_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Administracion_Publica_SHA256.cer"
#   "OCSP_AC_Administracion_Publica_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AP"
#   "tsa_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/tsa"

#   "FNMTClase2CA_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/FNMTClase2CA.cer"
)
sha256sums=(
  'ebc5570c29018c4d67b1aa127baf12f703b4611ebc17b7dab5573894179b93fa'
  '601293ca20b09a03295d196256c6953ff9eba811db8e3ce140413c1bffe9a869'
  '8fd16a179944d5d1d420af09405eda7abf2a9c742883e8c2f89e0d90afaf754b'
  'f038421f07f20d63a20d3691e5a178ab8459ebe570c1647b7690554ef23876ab'
  '8265756dd5cd8a37ee61e40351288e4b16a89dd248c1ec4eba25aaf161abf498'
  '9ce630b35f8ae2c6419e734ad9d2fa30476dd9e7394b1e93b27f83f776a024ea'
  '554153b13d2cf9ddb753bfbe1a4e0ae08d0aa4187058fe60a2b862b2e4b87bcb'
  '1edb6bd91274882db795bfc514f8aabe10ad955cbccfd3fd5a5b5febb2ce5b68'
  '9ff23cb9387b9e0083bd5aa1954eeddf792890aa8e67cd4d38dd28af4a439ad8'
  'bd3ce843879319a907a12a4eb14fae854b083904e6dc0867f7180525ca2299be'
  'f8b9dc6b0b92211c3021e672352ea0fa957a5deea12cd8b8c1861a132902c715'
  '388f69ca22ca68fc3af5d7186dc6cb48b4dbbbfa61c9e2c9c21ac78ca93ce34c'
  '28d5c5ec8d25162e246f682e0c347155643a3227f4ef02690dbebea3d84ba469'
  '7c61dba038d08cb9e432a6d9c160cfc7ce94d2662959aed720e5bd959f9a820d'
  'c048661c0cdc0d2c8abb11576aaa3eabd786dd47e3ed8d593d580535e65c2695'
  '9569948ca121d3c7a1d07bd1dd7e1d48ea7a5b1ee3e7e9557c06c3b8b28c023e'
  '8a3e67f591fe555229a4128dced9d01eb5d4bec340c56751f1bef978a0fd01ad'
  '8e6af1e1377adf7ef19a89796d2c3dd72ac09d86448a47c92c2ff91ec3d0259e'
  '62e0bb8a663a26a3920f8b542d483e1122058bf2d83bf3f89ef21dcbc5030d9d'
  '5320d7a5dfc8023cedb0c233363a318eb1daa3d35d02b5d986dca2b5b98393b3'
  '9dd74806fd1e3ed1cf65cf04764f034e7e04bf23c753f2aff3c749cd45227f11'
  'e40f1d8891bbe0243306e70f4c0d34199f788958be1e40261b3ab4b957382c29'
  '988a86178185162999bb6f0ade55c3ff0047b58ba0088f0e308e194456cf22d2'
  'b1ae56dfacbb14838b9208567a8952ef977ea5ae61609dc4dd1140f4ac8b60e3'
  'f91deaa0faef3bd9d2c9764ab9b14d17ce69427f785a1bf76d38222660976619'
  '10f54909204a9ec23e9e9317739a521499018ed5316fdae6a7367ac00d5a5660'
  'ccb1e75be9a1faf78025725638600dc6cab8c45d41bfb2a6a886f377cfa363b9'
  '0f48fb35b8de154ed74eaef44ec16cd395870957045d248a62e1243cb427c9d0'
  'b4b21d6f74ad67dec6f02908e5a0eb44c636eb7c8f73aadc505f9fd6d003d256'
  'e04c172af6170fc916e667ac78efaba6d4b884409f55bf157b9136b7e4321aca'
  '8d7291c31835741d73620da0b48aca72e92ad3c829eae6cc51da635c759fa0e8'
  'ed7219419e6d78bc5f1f78b9c3c4e7b3cf882858083dcff423682582d2560fea'
  'bff203fe0de518969f5bfbdea8561b6e0964f59d9d8d68bf0d894a2dafa66e19'
  'da615497659049dc3f0a3a80923041ec8fd66ed746a151accdb1d6dfa029fe94'
  '1997914d65b978781212e60fa4f1fbdf356ec95d5d35aba1eeffcaa9b432a8cc'
  '1b4ec00eb3a0c43b69f37795552c1e9c7552dde70ff129f411d651c53c54e16c'
  'fcfd3df490b9a21b3fad582011a2e6d039561796ac5d850d01b65ac5dda4a3e9'
  'b03f7cc682d2f0a7c1d195692cc0de4c35ad017294955d35f6eb743fe78595f3'

#   '830ff205ae69485059c3fb2376a7f2f9ee1c2a61de259dd09d0bb6ad69f88832'
#   '4c7d254f258cb71db48d17f6134e7e8d8b47a5f886bd85f397bd47a2750297f2'
#   'baf597d97d16bc697f8eb2a1e20ce68c08ad11024f9b1f5264271c1525eeb500

#   '62b9267266212832a8e22dab933d91c7011274acf71703f9cc97833751a6e94f'
)

package() {
  for _i in "${srcdir}/"*.cer; do
    install -Dm644 "${_i}" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/$(basename ${_i})"
  done
}
