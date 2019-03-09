# Maintainer: graysky <graysky AT archlinux DOT us>

# Do NOT change the PKGEXT variable since videos do not need to be compressed
PKGEXT='.pkg.tar'
pkgbase=xscreensaver-aerial-videos
pkgname=(xscreensaver-aerial-videos-1080 xscreensaver-aerial-videos-4k)
pkgver=1.09
pkgrel=2
arch=('any')
_url1="http://a1.v2.phobos.apple.com.edgesuite.net/us/r1000/000/Features/atv/AutumnResources/videos"
_url3="http://sylvan.apple.com/Aerials/2x/Videos"
source=(
# china
"$_url3/comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov"
"$_url3/comp_CH_C002_C005_PSNK_v05_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov"
"$_url3/comp_CH_C007_C004_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov"
"$_url1/b2-1.mov"
"$_url1/b5-1.mov"
"$_url1/b6-1.mov"
# china 4k
"$_url3/comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov"
"$_url3/comp_CH_C002_C005_PSNK_v05_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov"
"$_url3/comp_CH_C007_C004_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov"
# dubai
"$_url3/DB_D008_C010_2K_SDR_HEVC.mov"
"$_url3/DB_D001_C001_2K_SDR_HEVC.mov"
"$_url3/DB_D011_C010_2K_SDR_HEVC.mov"
"$_url3/DB_D002_C003_2K_SDR_HEVC.mov"
"$_url3/DB_D001_C005_2K_SDR_HEVC.mov"
"$_url3/DB_D011_C009_2K_SDR_HEVC.mov"
# dubai 4k
"$_url3/DB_D008_C010_4K_SDR_HEVC.mov"
"$_url3/DB_D001_C001_4K_SDR_HEVC.mov"
"$_url3/DB_D011_C010_4K_SDR_HEVC.mov"
"$_url3/DB_D002_C003_4K_SDR_HEVC.mov"
"$_url3/DB_D001_C005_4K_SDR_HEVC.mov"
"$_url3/DB_D011_C009_4K_SDR_HEVC.mov"
# greenland
"$_url3/GL_G004_C010_2K_SDR_HEVC.mov"
"$_url3/GL_G002_C002_2K_SDR_HEVC.mov"
"$_url1/comp_GL_G010_C006_v08_6Mbps.mov"
# greenland 4k
"$_url3/GL_G004_C010_4K_SDR_HEVC.mov"
"$_url3/GL_G002_C002_4K_SDR_HEVC.mov"
# hawaii
"$_url1/b1-1.mov"
"$_url1/b2-2.mov"
"$_url1/b4-1.mov"
"$_url1/b6-2.mov"
"$_url1/b7-1.mov"
"$_url1/b8-1.mov"
# hong kong
"$_url3/HK_B005_C011_2K_SDR_HEVC.mov"
"$_url3/HK_H004_C010_2K_SDR_HEVC.mov"
"$_url3/HK_H004_C013_2K_SDR_HEVC.mov"
"$_url3/HK_H004_C001_2K_SDR_HEVC.mov"
"$_url3/HK_H004_C008_2K_SDR_HEVC.mov"
# hong kong 4k
"$_url3/HK_B005_C011_4K_SDR_HEVC.mov"
"$_url3/HK_H004_C010_4K_SDR_HEVC.mov"
"$_url3/HK_H004_C013_4K_SDR_HEVC.mov"
"$_url3/HK_H004_C001_4K_SDR_HEVC.mov"
"$_url3/HK_H004_C008_4K_SDR_HEVC.mov"
# iss
"$_url3/comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_2K_HEVC.mov"
"$_url3/comp_A103_C002_0205DG_v12_SDR_FINAL_20180706_SDR_2K_HEVC.mov"
"$_url3/comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_4K_HEVC.mov"
"$_url3/comp_A108_C001_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov"
"$_url3/comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov"
"$_url3/comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_2K_HEVC.mov"
"$_url3/comp_A083_C002_1130KZ_v04_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov"
"$_url3/comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_2K_HEVC.mov"
"$_url3/comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_2K_HEVC.mov"
"$_url3/comp_A105_C003_0212CT_FLARE_v10_SDR_PS_FINAL_20180711_SDR_2K_HEVC.mov"
"$_url3/comp_A009_C001_010181A_v09_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov"
"$_url3/comp_A114_C001_0305OT_v10_SDR_FINAL_22062018_SDR_2K_HEVC.mov"
"$_url3/comp_A001_C004_1207W5_v23_SDR_FINAL_20180706_SDR_2K_HEVC.mov"
# iss 4k
"$_url3/comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_4K_HEVC.mov"
"$_url3/comp_A103_C002_0205DG_v12_SDR_FINAL_20180706_SDR_4K_HEVC.mov"
"$_url3/comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_4K_HEVC.mov"
"$_url3/comp_A108_C001_v09_SDR_FINAL_22062018_SDR_4K_HEVC.mov"
"$_url3/comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_4K_HEVC.mov"
"$_url3/comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_4K_HEVC.mov"
"$_url3/comp_A083_C002_1130KZ_v04_SDR_PS_FINAL_20180725_SDR_4K_HEVC.mov"
"$_url3/comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_4K_HEVC.mov"
"$_url3/comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_4K_HEVC.mov"
"$_url3/comp_A105_C003_0212CT_FLARE_v10_SDR_PS_FINAL_20180711_SDR_4K_HEVC.mov"
"$_url3/comp_A009_C001_010181A_v09_SDR_PS_FINAL_20180725_SDR_4K_HEVC.mov"
"$_url3/comp_A114_C001_0305OT_v10_SDR_FINAL_22062018_SDR_4K_HEVC.mov"
"$_url3/comp_A001_C004_1207W5_v23_SDR_FINAL_20180706_SDR_4K_HEVC.mov"
# liwa
"$_url1/b1-2.mov"
# liwa 4k
"$_url3/LW_L001_C006_4K_SDR_HEVC.mov"
# london
"$_url1/b3-1.mov"
"$_url1/b5-2.mov"
"$_url1/b6-3.mov"
# los angeles
"$_url3/LA_A006_C008_2K_SDR_HEVC.mov"
"$_url3/LA_A009_C009_2K_SDR_HEVC.mov"
"$_url3/LA_A008_C004_2K_SDR_HEVC.mov"
"$_url3/comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_2K_HEVC.mov"
"$_url3/LA_A005_C009_2K_SDR_HEVC.mov"
"$_url3/LA_A011_C003_2K_SDR_HEVC.mov"
# los angeles 4k
"$_url3/LA_A006_C008_4K_SDR_HEVC.mov"
"$_url3/LA_A009_C009_4K_SDR_HEVC.mov"
"$_url3/LA_A008_C004_4K_SDR_HEVC.mov"
"$_url3/comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_4K_HEVC.mov"
"$_url3/LA_A005_C009_4K_SDR_HEVC.mov"
"$_url3/LA_A011_C003_4K_SDR_HEVC.mov"
# new york city
"$_url1/b1-3.mov"
"$_url1/b2-3.mov"
"$_url1/b3-2.mov"
"$_url1/b4-2.mov"
"$_url1/b7-2.mov"
# san francisco
"$_url1/b1-4.mov"
"$_url1/b2-4.mov"
"$_url1/b3-3.mov"
"$_url1/b4-3.mov"
"$_url1/b5-3.mov"
"$_url1/b6-4.mov"
"$_url1/b7-3.mov"
"$_url1/b8-2.mov"
"$_url1/b8-3.mov"
"$_url1/b9-2.mov"
"$_url1/b9-3.mov"
"$_url1/b10-3.mov"
)

sha1sums=('5176f23bf434f5c51dacc0696982bcdbbd438ae8'
          '864c7e34fcc9bb5d827989e2a0344e65918e9ab6'
          '780435883d0ebf30bc6376a52ea84b8a2e738232'
          '838c8d16b5f9de7576410d48710c79887dd465c1'
          'f9efd6544ba62a486701d06360e67a1f5dc08cec'
          '966ef45bb6187a42f50de52c91f72472a44689bf'
          'fa778989fda0ce63cee2b8b2f52551c4cfe5bd72'
          '4f8f2dcf6db03854747ddd522679deef272d0021'
          '19af52555cfd1c4c40a6d89121d7a524524b2186'
          'ab5819924a6b0b8b091dbdc6ffeffcdedf020460'
          'd149b9a631f027afd0e092a3c59993823419ce1b'
          'e32fb0dec92599d3f26402a41f7618240007baac'
          'b24815fbf6d67d6f5b4997880836e06f06d98dfa'
          '2cdda9d014afc870cb5376693a618c3709895ebf'
          'b2d5f9405252dd7dd456b8ce38503abb98f1bfd4'
          '75da2ff4020a679a4ba5b030e1042cbe2c702e80'
          '13c17008f5251bc6f9a933ed4b9127f176274f38'
          'a58d51326be04e7beec3cbf9facc175244028d03'
          '24b21b88a20bbe4926f8d44f44900f2bebd949fc'
          '796207d618ce457ef614a67d457d52a9728cc62c'
          '9cff8a72554db83851e0384db849a596a8be3bd4'
          '45dd6e5eb9bd96807b7c130a96f60eb2bbdd881a'
          '665e961d2e380b43ffce8cd331457b3d936d0eda'
          '1ce74e30eb845a1b8af05a44ad5d93df16373c8b'
          '1b9c9b3221e69152207b68aaa7181dc57fdca1fd'
          '5014e34d6ce2212c9e357e494fb5737c3512f0a9'
          '21eaac6e0f0f4d5ca56f4a4b809d550776950852'
          '4b61a0cdcecc262863ab60543bedcd52b122ce03'
          'f0ce70709bbae17b809f9ac8057017b725ff9041'
          '07e3f9cbd66048ef3961fb3066a9a24e2cb25941'
          'a504b71c312df29c27efb37dec0249e17ab4c1d5'
          'cbe07505831b97e5ac40677d547dabbb940299c1'
          '93267b20244a9a3f0e174881a65ac0b40c9fabd7'
          'f5468165f2901cffd04bf7736be8f597696714c2'
          'fb9af66280ad58b252f261f5e950431acf346e64'
          '65d44c65b06401946e2164beb73cd7e1883725d4'
          'e1d55cbf9ce554771237b3ca1be6cc30bc61cebf'
          'df8c74dd18fd39014362a6c9f68097e81cc9c69f'
          'f6f950f1e736c76aaf2a6d1fa7261bfc7149991b'
          'ca1feee732814966071502d8cf7e42a3463cdf0d'
          '10cd36d8b10cda827678bb2d836532e7a41f09ab'
          '2060961ab37379c09421ffd84bc07ffce15bf604'
          'ea78d460fe76ecb8f165c38e65bf9be94a0288f0'
          '752f16e7d0265b016017f3d8a3f2f9501656e8d0'
          'a04b980c999aefd80338814ce64e50bf4b026f5e'
          '6c1f8cc1aebf0738de1d6889bc28f64bfedad0c5'
          'e1164cd174bf8a305917104d61701358e6d0e63a'
          '8ec0c5d6a90a137a68ea10c51a3548352593d47f'
          '5993b75c33138bf41d9983b9b876e6d70f5a0467'
          '7b816db66319b36e4c2aa81ba48b7656fc422c9e'
          '73d3ee12192c902cdda6f633d525cfbeffe6aa1f'
          '65d46c488fb23a740a1f030b9ec8a88bbb85d68e'
          'd13abc86f755dcbebe3c2036f607ce38464457c3'
          '53b1ff1d6e58c6275ed38e75344c4ab046c75116'
          'b4e8abcc16b4c445872213152b9ef9bd6b49b2d1'
          'ddf0ad20b820c5c5c3d5ec6048faf071ecca5fa0'
          '75fc2d15908cb5576851afc02f899e45aaa9112d'
          'a04b980c999aefd80338814ce64e50bf4b026f5e'
          '44fd65e4ca9648b2f9df35393ea13cebb037668c'
          'ee951d8b31a7b20d864bce0fe27ad5fc4b1d1be9'
          'd876ede8acb4e3ced7bb554dfb87f56d2f00ef94'
          '71624622c532e7385d741a8bba07e0758948325d'
          '879ca60216c1e2dda64d4d084227251dfa86da74'
          '940a990b352feec4fd1034c43e7585a3ed80fe66'
          'ed00191f01a2b01f11c78181fa82e2fbc5dcd2b6'
          '94950ad34773deec828b6153e6ba072c19839d8a'
          'd3b90bdaa0c3391fd3dd8c91cf67cbabe5099f89'
          'b59cca9a2a3b93868bd19b6a0d2ac644e07d6653'
          '2aeddc8252072df105686b0305b8a355299287c0'
          '63d8abe2d57ea4350f7f89ccf7bdc83651cdaaa0'
          '3dd2731ee1169047c9f40eeef019ef1af367e5c5'
          '37e5f26ad97789eba95115c27234d1a154ac5886'
          '265370fae2ca422b6d05a6069c3144862d595227'
          '3afdd31afd596f1e9ebe4ad9ada1a346d885289e'
          'f9e4c29d6904c3912cdacf145ce6d7582b54e01f'
          '828bf6c85eee45824b01a180158b2354b60cfbcb'
          '684a9558db744bb01e40876780c5f31a0780d953'
          'dcfff4bc84e650c46f790965d940345d5ab9e92a'
          '0880b83b23f8313d4668f4c194e137bc7dd48124'
          '5c90a386c8469ebdbf444d631b039697da0aa386'
          '7b87594096164c83bb64ea50842c6d6e2eb1f5e2'
          'eb3d1ff675ce731e2863dd1d228deab5d44e7b94'
          '91c49640b751efa9c0207450015ab9f062360d48'
          '0a94afa6656c326a7770a1de81daa2a66e63e9b6'
          '7726dc7a350174ccf064fc3a3a50dd9e868f8b16'
          '9cda0a74d3bfe9dbfd53c86a33f01dcb2cfb9c90'
          'f5b782a1589e7fe42db354c6f8b679165e0bf67f'
          '2c56ce9c116e6ce15ed7fa0dbdc9975a3ce46fc2'
          '496f05c1747e7c25ce6f103fda408ae71fbe7f28'
          'b238dde8545649d0c2d0ce1a65c8da31e603d1cc'
          '5048e77a22abb87d096c56149164d0e553b0324c'
          '43264cb243cdd7b9e2d7c32bcdcdc396e4887841'
          '668ca3d83def0370a43841c98f3656f9cf9a9dc6'
          'e7e7bbc0762694c6b026d8c90ee9ee35e05dd84f'
          '5143747795b86f093ccb4ca60991136305283156'
          '799fa24415292488ff960924191ff2d892d001b4'
          'c66e98384d0b097de7cbc6c9346d76a9cfe40fa2'
          'e9e1615a0df1375d1742a534f5d22b82fc336f7b'
          '40dbf63e91199045e77155cc2d20ee1dae693119'
          'a1a9569428dbf924c2c77e0d6398e607c99bcae9'
          '8cfa5a6152be807ff458174f8420eb0a4a307ec2'
          'c64238c62ed96a92227f69f501b90c493e381901')

package_xscreensaver-aerial-videos-1080() {
  pkgdesc='Apple TV4 HD aerial movies in 1080p'
  # This package is optional as the xscreensaver will stream the videos directly
  # from apple which will save approx 12.1 GB of disk space but know that you
  # will be using bandwidth every time your screensaver comes on which might
  # impact you if your ISP caps your bandwidth
  cd "$srcdir"

  for i in b2-1.mov b5-1.mov b6-1.mov comp_GL_G010_C006_v08_6Mbps.mov b1-1.mov \
  b2-2.mov b4-1.mov b6-2.mov b7-1.mov b8-1.mov b1-2.mov b3-1.mov b5-2.mov \
  b6-3.mov b1-3.mov b2-3.mov b3-2.mov b4-2.mov b7-2.mov b1-4.mov b2-4.mov \
  b3-3.mov b4-3.mov b5-3.mov b6-4.mov b7-3.mov b8-2.mov b8-3.mov b9-2.mov \
  b9-3.mov b10-3.mov; do
    install -Dm644 "$i" "${pkgdir}/opt/ATV4/$i"
  done
}

package_xscreensaver-aerial-videos-4k() {
  pkgdesc='Apple TV4 HD aerial movies in 4k'
  # This package is optional as the xscreensaver will stream the videos directly
  # from apple which will save approx 13.7 GB of disk space but know that you
  # will be using bandwidth every time your screensaver comes on which might
  # impact you if your ISP caps your bandwidth
  cd "$srcdir"

  for i in comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov \
  comp_CH_C002_C005_PSNK_v05_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov \
  comp_CH_C007_C004_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov \
  DB_D008_C010_2K_SDR_HEVC.mov DB_D001_C001_2K_SDR_HEVC.mov \
  DB_D011_C010_2K_SDR_HEVC.mov DB_D002_C003_2K_SDR_HEVC.mov \
  DB_D001_C005_2K_SDR_HEVC.mov DB_D011_C009_2K_SDR_HEVC.mov \
  GL_G004_C010_2K_SDR_HEVC.mov GL_G002_C002_2K_SDR_HEVC.mov \
  HK_B005_C011_2K_SDR_HEVC.mov HK_H004_C010_2K_SDR_HEVC.mov \
  HK_H004_C013_2K_SDR_HEVC.mov HK_H004_C001_2K_SDR_HEVC.mov \
  HK_H004_C008_2K_SDR_HEVC.mov \
  comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_2K_HEVC.mov \
  comp_A103_C002_0205DG_v12_SDR_FINAL_20180706_SDR_2K_HEVC.mov \
  comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_4K_HEVC.mov \
  comp_A108_C001_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov \
  comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov \
  comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_2K_HEVC.mov \
  comp_A083_C002_1130KZ_v04_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov \
  comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_2K_HEVC.mov \
  comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_2K_HEVC.mov \
  comp_A105_C003_0212CT_FLARE_v10_SDR_PS_FINAL_20180711_SDR_2K_HEVC.mov \
  comp_A009_C001_010181A_v09_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov \
  comp_A114_C001_0305OT_v10_SDR_FINAL_22062018_SDR_2K_HEVC.mov \
  comp_A001_C004_1207W5_v23_SDR_FINAL_20180706_SDR_2K_HEVC.mov \
  LA_A006_C008_2K_SDR_HEVC.mov LA_A009_C009_2K_SDR_HEVC.mov LA_A008_C004_2K_SDR_HEVC.mov \
  comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_2K_HEVC.mov LA_A005_C009_2K_SDR_HEVC.mov \
  LA_A011_C003_2K_SDR_HEVC.mov; do
    install -Dm644 "$i" "${pkgdir}/opt/ATV4/$i"
  done
}
