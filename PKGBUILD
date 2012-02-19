# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=opera-i18n
pkgver=11.61
_pkgver=1161
pkgrel=1
_languages=af,az,be,bg,bn,cs,da,de,el,en,en-GB,es-ES,es-LA,et,fi,fr,fr-CA,fy,gd,hi,hr,hu,id,it,ja,ka,ko,lt,mk,ms,me,nb,nl,nn,pa,pl,pt,pt-BR,ro,ru,sk,sr,sv,sw,ta,te,th,tl,tr,uk,uz,vi,zh-tw,zh-cn,zu
pkgdesc="Language packs for Opera"
arch=('any')
license=('custom:opera')
url="http://www.opera.com/"
depends=("opera")
eval source=("http://www.opera.com/download/lng/${_pkgver}/ouw${_pkgver}_{${_languages}}.lng")

build() {
  cd "${srcdir}"
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
    install -D -m 644 ouw${_pkgver}_${lang}.lng "${pkgdir}/usr/share/opera/locale/${lang}/ouw${_pkgver}_${lang}.lng"
  done
}

sha256sums=('69d05d2bf183cad090eeaea158bf75c0943ca8bb751e4589d7c3c54da66418c3'
            '8910ad1b6d586bdd04b74ead72de27a59b8a99188d952b17965f7db0f0f68a68'
            'bd5b5b59c51f7da57f5a5e1aa5f46dc4db83acdf9ae80f4e3208a5ecf3d250a1'
            '0f3815715f49cf471121e6757b0ab316e3b2c7f134f74aac8b01c7325d9c4d9e'
            'be89376bdc69bd25614544df465e8e3e2461b8a2d0b042c0f3012123871468d6'
            '5edbca35e483303bc606e4da86f773a0ffe0a29366ffae9048c02eb60c1f0e27'
            '7da665be12f0e17a593254fcc170046fe209495b52d1bb6063957b1f81a668e3'
            'd461f77b5e02e237ac5c745fec20549ed933133958bb4e229f270fd33dc30fff'
            'ad29961b42092517c4ea271b420c561c9d80d84edcd080f615726398bdffa8bd'
            '1d8aa6b38ed7e97deb08c2043ee7e0e2fb82ac2a62519dd85fa04d62ce04c517'
            'b5616dc084be004ad366893b2a8efc8d94094d743aa5617e38040239cb52295e'
            'cc9bb64828162edb1f885ff493f1fc892698f1256f26c48c113264e33cb683b2'
            '72a900214f9e2954cbb6ab3ef98720112a4a437e9df4cd7162e88ca0430cbb79'
            '457e0027b39f7ee184e18d1ab718fa5d2379b0dd3734ac653c0d71eb4f8a1c7f'
            'cc5316b05a4b6b503ad96f5f80248ab7bfc0d55d19a3ad0f82419ae8b6026368'
            '5d53f565df405f5ea6b2f6fc1b810dffc9e746bd8cdb6406fd864235c76ca062'
            '6907446ef302cd0c72e4a289434bf0c2d5588f3c92be856f75c11135e95cda4b'
            '5a28d36361225e4d6c9e12384d2a52daaa8f090b6612b22411a4499394ce89a2'
            '740045f5bd03ba795bd8c10f91195a5f3c8d85bda148423ffe5f3beabb555a26'
            '2cf408e6abd7bc2b10d31a9c03290c76cb813bb41638a716cfa1e5263296dd0d'
            '39b98e7bb1b3fb4d8c753dfafc7e0a582ffa605eef76985d585abb8701a91d34'
            'ef4b1eba00efa81a37c890021520cb12fe6ce29a78306b3630d200bbf3a6e64e'
            '7ac66449ea4aee73213d03c7f66882cd26c8237fca6913801f2232b3640fe5cc'
            '0e90a6e6de30abfd6c31632ade3049b7e60cd92078bcfc3aa1bdb48f79db7473'
            'af6e487d6fea8e17b5cd1736f66c338d4b1d2214af43aa361f6d3e7d9568d97e'
            '26fb3735e2c772acadb64e149db5a47b9ff49d30b5466f6e2ade6eee1b4c08b5'
            'b3c97d6e88973aed7970d99a534a01557c03acf6c901a95a830e1050d3d14ee5'
            '8b8c33755ad7f4c6fb18bace32c9b4ed1ca36c04253af03f52fb494b2fb8da1e'
            'fd94e2013f154e74e39938bfe14806f2a77b5141ec1dc8e70575f1d8726d5105'
            '2102e643e8bd3fd8e1651f679611acd95319c723c61d801d895a4fdb53047d23'
            '381b4e93ede90f181e92b0324c6ea48c1aa8bf1b8be3cc923aa207b6f91b4803'
            '2ebfddeb6221789c0896b98f380ac9ad835a28451f848aa74a901b5643999d0c'
            'cd6651e3cf7af0ad5b1a4f5be4de29500c6aecf3f0637fbb8f3652e29955a8fe'
            'bf547adcaf87c04db8f8361cc7383eacbba9cc45b7ae848564c77fc70a01d5fc'
            'c82000ff7afc5e8dd8fbfaa7f2af3971f3bc775d090a9e37294c1584d1b60d17'
            'c88138862838906ecf3e11a561a993408df8fd31fa50c936d54c677d5210649f'
            'd7f9549987d08238123b75fd307ba5abbf4f7c319e96a6101e2506f0d0d13248'
            'e631e074deec23f676bd8ab23d2592e05445347766c9cd8cbe3c05c3b0b7d71e'
            'd9e22cb1da4c79d3ba7052caf178fb7b3680ae6a26aef87af8b2861a2d37eec9'
            '7381c3a5437c260600a8d012673f214cdcecd21cf516e06131dd9fcb55b95dc1'
            '6a885efabbad8482ccb85d7999b4eca68330bc8003c10cee66d378fccb1453a2'
            '1d9a10e6716c61cc3fbbb2f36c6981170b353292064318f1ec77679136422dd7'
            '20ae4b6d3478d9a656f398aa7d9778154b5d9b6d098d8f5f93a40c809fd0f2bd'
            'f789af487e3d2add323d643e0db2593c381746745f973c24de034d59673257b2'
            '3a8c88a858f04bbbbc77af9ebb9a83446033f9d1f7df13397b7556ea3b783a87'
            '091d5a993d428589755e280bfdd111406917cdc6f6ae914c24fa95097a03af9c'
            '7405f507c0cae8e84eefdc119053c66fb6f6cef4b6084c387deb3b2e2b99b54f'
            '0a9a3be4340c127a55caeaeac3ed645eca5037cf12721a695636ef2c84425aaa'
            '1598bdfbb7201d0cfd5d78a4cfe58df161ae71e26c1c4abe0862489278e394b6'
            '1b641cf6bbc50169aba26643292e4e50206d27d34f74b8087e16aef69a8f876e'
            '414bb5f0f1fb3d8f0d138fbbdb7a1f5b3fa243cf84b04dd1b7f9ad1407da9a4c'
            '9b71b4e24f3371c25f65de1bab496872fdc8fd0032a223ac3f5be538d4e12e97'
            '17b15da61807716904a3a9ce5bed1a5241312899fe8e2711568b59e7ad815d47'
            'f9091a709cecd61dbe7f2fc0cbabefe872a2249467902cfa234999445de26a0b'
            '1d90461ac87cab8c5d844424abf48bc248f6e9a9a65458becd0f81b773955625')
