# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-fnmt
pkgver=20230424
pkgrel=1
pkgdesc='Spanish Fabrica Nacional de Moneda y Timbre (FNMT) y Real Casa de la Moneda (RCM) certificates'
arch=('any')
url='https://www.sede.fnmt.gob.es'
license=('unknown')
depends=('ca-certificates-utils')
source=("AC_RAIZ_FNMT-RCM_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM_SHA256.cer"

        "AC_FNMT_Usuarios_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_FNMT_Usuarios.cer"
        "AC_Representacion_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Representacion.cer"
        "AC_Administracion_Publica_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Administracion_Publica_SHA256.cer"
        "AC_Componentes_Informaticos_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Componentes_Informaticos_SHA256.cer"
        "AC_Sector_Publico_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Sector_Publico.cer"
        "AC_Unidades_Sellado_Tiempo_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Unidades_Sellado_Tiempo.cer"

        "AC_RAIZ_FNMT-RCM-Servidores_Seguros_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Raiz_FNMT-RCM-SS.cer"
        "AC_Servidores_Seguros_Tipo1_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Servidores_Seguros_Tipo1.cer"
        "AC_Servidores_Seguros_Tipo2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/AC_Servidores_Seguros_Tipo2.cer"

        "OSCP_AC_RAIZ_FNMT-RCM_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_ACRAIZ_FNMTRCM"

        "OCSP_AC_FNMT_Usuarios_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_FNMT_Usuarios"
        "OCSP_AC_Representacion_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Representacion"
        "OCSP_AC_Administracion_Publica_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AP"
        "OCSP_AC_Componentes_Informaticos_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_Componentes_Informaticos"
        "OSCP_AC_Sector_Publico_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_SP"
        "OSCP_AC_Unidades_Sellado_Tiempo_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_AC_QETS"

        "OSCP_AC_Servidores_Seguros_Tipo1_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_SS_Tipo1.cer"
        "OSCP_AC_Servidores_Seguros_Tipo2_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532302/OCSP_SS_Tipo2.cer"

        "qets_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/qets"
        "qtsa_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/qtsa"
        "tsa_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10532275/tsa"

#         "FNMTClase2CA_${pkgver}.cer::https://www.sede.fnmt.gob.es/documents/10445900/10526749/FNMTClase2CA.cer"
        )
sha256sums=('ebc5570c29018c4d67b1aa127baf12f703b4611ebc17b7dab5573894179b93fa'
            '601293ca20b09a03295d196256c6953ff9eba811db8e3ce140413c1bffe9a869'
            '8fd16a179944d5d1d420af09405eda7abf2a9c742883e8c2f89e0d90afaf754b'
            '830ff205ae69485059c3fb2376a7f2f9ee1c2a61de259dd09d0bb6ad69f88832'
            'f038421f07f20d63a20d3691e5a178ab8459ebe570c1647b7690554ef23876ab'
            '8265756dd5cd8a37ee61e40351288e4b16a89dd248c1ec4eba25aaf161abf498'
            '9ce630b35f8ae2c6419e734ad9d2fa30476dd9e7394b1e93b27f83f776a024ea'
            '554153b13d2cf9ddb753bfbe1a4e0ae08d0aa4187058fe60a2b862b2e4b87bcb'
            '1edb6bd91274882db795bfc514f8aabe10ad955cbccfd3fd5a5b5febb2ce5b68'
            '9ff23cb9387b9e0083bd5aa1954eeddf792890aa8e67cd4d38dd28af4a439ad8'
            '1f56cc4f17f95c4e94eb296198f194a1a3a0475f811f576b48392a137ceb20f8'
            'c5b1a5c9adb621c4e74a4c2ee0ecbd157e7126a2e1617fd1b2d146168579e51b'
            '9f98f0a61fcaf7b1492d6a83410847c24087be57b071ecfa2bd9ea1e16dbef27'
            '4c7d254f258cb71db48d17f6134e7e8d8b47a5f886bd85f397bd47a2750297f2'
            '68a96899b20f59b4d4d226f6822a077eb9dfd5c910f1ac7f4ef8d375b6545665'
            '6f28518d8937db284b607db86401ede4b8083c5e32f86de9896b6c15c288a843'
            '3e4cabf6a91d42e82c23655441597ed02ec57352bc98f8508865eeb51d21eb34'
            '1efc21b5fe473e8f1ad65941b6d4c0813d97e8c74228c04b6dacaf92a178e057'
            '52ec2a3ac73ca92a035ab2801e62493d44ca1909cbc93edfd6960f08a903cfda'
            'b03f7cc682d2f0a7c1d195692cc0de4c35ad017294955d35f6eb743fe78595f3'
            '5d93e19f26bcdcc9744f3f342a7d09b3d4d11f3e2dfd4c6079821625878be10a'
            'baf597d97d16bc697f8eb2a1e20ce68c08ad11024f9b1f5264271c1525eeb500'

#             '62b9267266212832a8e22dab933d91c7011274acf71703f9cc97833751a6e94f'
            )

package() {
  install -Dm644 "AC_RAIZ_FNMT-RCM_${pkgver}.cer"                    "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_FNMT-RCM.cer"

  install -Dm644 "AC_FNMT_Usuarios_${pkgver}.cer"                    "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_FNMT_Usuarios.cer"
  install -Dm644 "AC_Representacion_${pkgver}.cer"                   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Representacion.cer"
  install -Dm644 "AC_Administracion_Publica_${pkgver}.cer"           "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Administracion_Publica.cer"
  install -Dm644 "AC_Componentes_Informaticos_${pkgver}.cer"         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Componentes_Informaticos.cer"
  install -Dm644 "AC_Sector_Publico_${pkgver}.cer"                   "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Sector_Publico.cer"
  install -Dm644 "AC_Unidades_Sellado_Tiempo_${pkgver}.cer"          "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Unidades_Sellado_Tiempo.cer"

  install -Dm644 "AC_RAIZ_FNMT-RCM-Servidores_Seguros_${pkgver}.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_FNMT-RCM-Servidores_Seguros.cer"
  install -Dm644 "AC_Servidores_Seguros_Tipo1_${pkgver}.cer"         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Servidores_Seguros_Tipo1.cer"
  install -Dm644 "AC_Servidores_Seguros_Tipo2_${pkgver}.cer"         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_Servidores_Seguros_Tipo2.cer"

  install -Dm644 "OSCP_AC_RAIZ_FNMT-RCM_${pkgver}.cer"               "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OSCP_AC_RAIZ_FNMT-RCM.cer"

  install -Dm644 "OCSP_AC_FNMT_Usuarios_${pkgver}.cer"               "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AC_FNMT_Usuarios.cer"
  install -Dm644 "OCSP_AC_Representacion_${pkgver}.cer"              "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AC_Representacion.cer"
  install -Dm644 "OCSP_AC_Administracion_Publica_${pkgver}.cer"      "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AC_Administracion_Publica.cer"
  install -Dm644 "OCSP_AC_Componentes_Informaticos_${pkgver}.cer"    "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_AC_Componentes_Informaticos.cer"
  install -Dm644 "OSCP_AC_Sector_Publico_${pkgver}.cer"              "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OSCP_AC_Sector_Publico.cer"
  install -Dm644 "OSCP_AC_Unidades_Sellado_Tiempo_${pkgver}.cer"     "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OSCP_AC_Unidades_Sellado_Tiempo.cer"

  install -Dm644 "OSCP_AC_Servidores_Seguros_Tipo1_${pkgver}.cer"    "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OSCP_AC_Servidores_Seguros_Tipo1.cer"
  install -Dm644 "OSCP_AC_Servidores_Seguros_Tipo2_${pkgver}.cer"    "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OSCP_AC_Servidores_Seguros_Tipo2.cer"

  install -Dm644 "qets_${pkgver}.cer"                                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/qets.cer"
  install -Dm644 "qtsa_${pkgver}.cer"                                "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/qtsa.cer"
  install -Dm644 "tsa_${pkgver}.cer"                                 "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/tsa.cer"

#   install -Dm644 "FNMTClase2CA_${pkgver}.cer"                       "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/FNMTClase2CA.cer"
}
