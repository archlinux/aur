# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-fnmt
pkgver=20251005
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
  '7f1d7cc6d2bcfb635959811b2784e7e7ae58945dd5b2ffd719ae6c8edc966234'
  '3103003e675dbc82720dddd22e1743c2ca5da3804233c126a49ae2bcbae5aa98'
  '41b4ae00421679b02fc21fa13cb01c26a29437716bd893864a7be58921c36e58'
  'e45790a1c59597f6806eb7d53ff08ae4cc430bcc6cbcb451c5233fc83719c568'
  '4e703141498e8d0dd7ab0b92d2050e957eefc279acf856e8c207ab84b5823d29'
  'e0dc59b3ad8d217da56e7261bc13a95fb0e22b978856351c0f74a15eb9750a4e'
  '057cc505a563a237fcfbfe9d8e4417e0aef1228f921cc81990a1e9727becf07b'
  'c58bdd3285d518b3486c9a9e9d26e8af2a1f3d2cfa3896ca341f36d2910caa29'
  'a9e305cd2b5d0377055cdfc24bf9dd74546e78ff05c6cf525956d309655a5682'
  '170b6525b9324d93c2ab5fdd8d02c7498d66dd6db6401d9eb468bf589abbdfa7'
  '27dca17fa8636781f043d2da7d3d3efa398d494a3e40806d8bbc40ad26a9cea5'
  'ea8ae2a9711b5be96340127f72d00937d0ca67d92e3bab257a4b35a158bcfc89'
  '7a26f206c82b90ee47fd5bc5581443c653c917307eb528665eb289149887586b'
  'f27ea0aeb7b39af6ef506519a146da32bf2af5b2b701ff47feb4231012155ca7'
  '4d9a2e0e29342c3d58c26e26425363a36cc67101d3151d94920e67e1fcbc8666'
  '466de7918983b7477c236a642d86975eb736398d62bdaea08d2f91918219acdd'
  'efb3109186629895243c27c85719acfda96655bac87b5096a9b7771890d47d81'
  '1b4ec00eb3a0c43b69f37795552c1e9c7552dde70ff129f411d651c53c54e16c'
  'fcfd3df490b9a21b3fad582011a2e6d039561796ac5d850d01b65ac5dda4a3e9'
  'b03f7cc682d2f0a7c1d195692cc0de4c35ad017294955d35f6eb743fe78595f3'

#   '830ff205ae69485059c3fb2376a7f2f9ee1c2a61de259dd09d0bb6ad69f88832'
#   '4c7d254f258cb71db48d17f6134e7e8d8b47a5f886bd85f397bd47a2750297f2'
#   'baf597d97d16bc697f8eb2a1e20ce68c08ad11024f9b1f5264271c1525eeb500

#   '62b9267266212832a8e22dab933d91c7011274acf71703f9cc97833751a6e94f'
)

package() {
  for _i in "${srcdir}/"*${pkgver}.cer; do
    install -Dm644 "${_i}" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/$(basename ${_i})"
  done
}
