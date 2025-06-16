# Maintainer: Parker Young <parker at parker8283 dot net>

# BUILD INSTRUCTIONS:
# -------------------
# Please note, that usage of Microsoft fonts outside of running MS Office is
# prohibited by the EULA (although in certain countries the EULA is invalid).
# Please consult the license before using these fonts.
#
# You can acquire these fonts from an installed and up-to-date copy of Office.
# The fonts are located in:
#      C:\Program Files\Microsoft Office\root\vfs\Fonts\private
# and the license file is located in:
#      C:\Program Files\Microsoft Office\root\Office16\1033\client2024_eula.txt
# If you need to update your copy of Office, you can do so with the following
# Windows command:
#     "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user
# Give it time to open a pop-up window and do the update.
#
# You need all the files listed in the _fonts array. Place them in the same
# directory as this PKGBUILD file, then run makepkg.

# NOTES:
# ------
# * Some fonts were excluded from this package to avoid colliding with fonts
#   provided by the ttf-ms-win* packages. They are noted in the _fonts array
#   below with the note "dupe with ttf-ms-win*". If you do not have those
#   packages installed and want those fonts, simply uncomment the lines below
#   and rebuild the package.
# * Some other fonts were exluced for being "oddballs"/dingbat fonts, thus
#   having less perceived value. They are noted in the _fonts array below with
#   the note "excluded". If you wish to include them anyway, simply uncomment
#   the lines below and rebuild the package.
# * The optdepends below list only the ttf-ms-win11 versions of the packages
#   that provide the duplicated fonts. In theory though, any ttf-ms-win*
#   package will provide those fonts. I just didn't want a crazy-long list.

pkgname=ttf-ms-office365
pkgver=16.0.18925.20050
pkgrel=1
pkgdesc='Microsoft (Office) 365 TrueType fonts'
arch=(any)
url='https://learn.microsoft.com/en-us/typography/?PID=164'
license=('LicenseRef-ms-office-2024')
optdepends=('ttf-ms-win11: Calibri Light, Gabriola, Segoe UI Semilight'
            'ttf-ms-win11-sea: Nirmala UI'
            'ttf-ms-win11-zh_cn: Microsoft YaHei'
            'ttf-ms-win11-zh_tw: Microsoft JhengHei'
            'ttf-ms-win11-other: Gadugi')

_fonts=(
###################################################################################################
# Regular      Bold           Italic         Bold+Italic    # Family Name                         #
###################################################################################################
AGENCYR.TTF    AGENCYB.TTF                                  # Agency FB
ALGER.TTF                                                   # Algerian
ARIALN.TTF     ARIALNB.TTF    ARIALNI.TTF    ARIALNBI.TTF   # Arial Narrow
ARLRDBD.TTF                                                 # Arial Rounded MT Bold
BASKVILL.TTF                                                # Baskerville Old Face
BAUHS93.TTF                                                 # Bauhaus 93
BELL.TTF       BELLB.TTF      BELLI.TTF                     # Bell MT
BRLNSR.TTF     BRLNSB.TTF                                   # Berlin Sans FB
               BRLNSDB.TTF                                  # Berlin Sans FB Demi
BERNHC.TTF                                                  # Bernard MT Condensed
ITCBLKAD.TTF                                                # Blackadder ITC
BOD_R.TTF      BOD_B.TTF      BOD_I.TTF      BOD_BI.TTF     # Bodoni MT
BOD_BLAR.TTF                  BOD_BLAI.TTF                  # Bodoni MT Black
BOD_CR.TTF     BOD_CB.TTF     BOD_CI.TTF     BOD_CBI.TTF    # Bodoni MT Condensed
BOD_PSTC.TTF                                                # Bodoni MT Poster Compressed
BKANT.TTF      ANTQUAB.TTF    ANTQUAI.TTF    ANTQUABI.TTF   # Book Antiqua
BOOKOS.TTF     BOOKOSB.TTF    BOOKOSI.TTF    BOOKOSBI.TTF   # Bookman Old Style
#BSSYM7.TTF                                                 # Bookshelf Symbol 7 (excluded)
BRADHITC.TTF                                                # Bradley Hand ITC
BRITANIC.TTF                                                # Britannic Bold
BROADW.TTF                                                  # Broadway
                              BRUSHSCI.TTF                  # Brush Script MT
#CalibriL.ttf                 CalibriLI.ttf                 # Calibri Light (dupe with ttf-ms-win*)
CALIFR.TTF     CALIFB.TTF     CALIFI.TTF                    # Californian FB
CALIST.TTF     CALISTB.TTF    CALISTI.TTF    CALISTBI.TTF   # Calisto MT
CASTELAR.TTF                                                # Castellar
CENTAUR.TTF                                                 # Centaur
CENTURY.TTF                                                 # Century
GOTHIC.TTF     GOTHICB.TTF    GOTHICI.TTF    GOTHICBI.TTF   # Century Gothic
CENSCBK.TTF    SCHLBKB.TTF    SCHLBKI.TTF    SCHLBKBI.TTF   # Century Schoolbook
CHILLER.TTF                                                 # Chiller
COLONNA.TTF                                                 # Colonna MT
COOPBL.TTF                                                  # Cooper Black
COPRGTL.TTF    COPRGTB.TTF                                  # Copperplate Gothic
CURLZ___.TTF                                                # Curlz MT
DUBAI-REGULAR.TTF DUBAI-BOLD.TTF DUBAI-LIGHT.TTF DUBAI-MEDIUM.TTF # Dubai
ITCEDSCR.TTF                                                # Edwardian Script ITC
ELEPHNT.TTF                   ELEPHNTI.TTF                  # Elephant
ENGR.TTF                                                    # Engravers MT
ERASMD.TTF     ERASBD.TTF     ERASLGHT.TTF   ERASDEMI.TTF   # Eras ITC
FELIXTI.TTF                                                 # Felix Titling
FTLTLT.TTF                                                  # Footlight MT Light
FORTE.TTF                                                   # Forte
FRABK.TTF                     FRABKIT.TTF                   # Franklin Gothic Book
FRADM.TTF                     FRADMIT.TTF    FRADMCN.TTF    # Franklin Gothic Demi
FRAHV.TTF                     FRAHVIT.TTF                   # Franklin Gothic Heavy
FRAMDCN.TTF                                                 # Franklin Gothic Medium Cond
FREESCPT.TTF                                                # Freestyle Script
FRSCRIPT.TTF                                                # French Script MT
#GABRIOLA.TTF                                               # Gabriola (dupe with ttf-ms-win*)
#GADUGI.TTF    GADUGIB.TTF                                  # Gadugi (dupe with ttf-ms-win*)
GARA.TTF       GARABD.TTF     GARAIT.TTF                    # Garamond
GIGI.TTF                                                    # Gigi
GIL_____.TTF   GILB____.TTF   GILI____.TTF   GILBI___.TTF   # Gill Sans MT
GILC____.TTF   GLSNECB.TTF                                  # Gill Sans MT Condensed
GILSANUB.TTF                                 GILLUBCD.TTF   # Gill Sans Ultra Bold
GLECB.TTF                                                   # Gloucester MT Extra Condensed
GOUDOS.TTF     GOUDOSB.TTF    GOUDOSI.TTF                   # Goudy Old Style
GOUDYSTO.TTF                                                # Goudy Stout
HATTEN.TTF                                                  # Haettenschweiler
HARLOWSI.TTF                                                # Harlow Solid Italic
HARNGTON.TTF                                                # Harrington
HTOWERT.TTF                   HTOWERTI.TTF                  # High Tower Text
IMPRISHA.TTF                                                # Imprint MT Shadow
INFROMAN.TTF                                                # Informal Roman
JOKERMAN.TTF                                                # Jokerman
JUICE___.TTF                                                # Juice ITC
ITCKRIST.TTF                                                # Kristen ITC
KUNSTLER.TTF                                                # Kunstler Script
LEELAWAD.TTF   LEELAWDB.TTF                                 # Leelawadee
LBRITE.TTF     LBRITED.TTF    LBRITEI.TTF    LBRITEDI.TTF   # Lucida Bright
                              LCALLIG.TTF                   # Lucida Calligraphy
LFAX.TTF       LFAXD.TTF      LFAXI.TTF      LFAXDI.TTF     # Lucida Fax
                              LHANDW.TTF                    # Lucida Handwriting
LSANS.TTF      LSANSD.TTF     LSANSI.TTF     LSANSDI.TTF    # Lucida Sans
LTYPE.TTF      LTYPEB.TTF     LTYPEO.TTF     LTYPEBO.TTF    # Lucida Sans Typewriter
               MAGNETOB.TTF                                 # Magneto
MAIAN.TTF                                                   # Maiandra GD
MATURASC.TTF                                                # Matura MT Script Capitals
#MSJH.TTC      MSJHBD.TTC                                   # Microsoft JhengHei (dupe with ttf-ms-win*)
MSUIGHUR.TTF   MSUIGHUB.TTF                                 # Microsoft Uighur
#MSYH.TTC      MSYHBD.TTC                                   # Microsoft YaHei (dupe with ttf-ms-win*)
MISTRAL.TTF                                                 # Mistral
MOD20.TTF                                                   # Modern No. 20
MTCORSVA.TTF                                                # Monotype Corsiva
#OUTLOOK.TTF                                                # MS Outlook (excluded)
REFSAN.TTF                                                  # MS Reference Sans Serif
#REFSPCL.TTF                                                # MS Reference Specialty (excluded)
#MTEXTRA.TTF                                                # MT Extra (excluded)
NIAGENG.TTF                                                 # Niagara Engraved
NIAGSOL.TTF                                                 # Niagara Solid
#NIRMALA.TTF   NIRMALAB.TTF                                 # Nirmala UI (dupe with ttf-ms-win*)
OCRAEXT.TTF                                                 # OCR A Extended
OLDENGL.TTF                                                 # Old English Text MT
ONYX.TTF                                                    # Onyx
PALSCRI.TTF                                                 # Palace Script MT
PAPYRUS.TTF                                                 # Papyrus
PARCHM.TTF                                                  # Parchment
PER_____.TTF   PERB____.TTF   PERI____.TTF   PERBI___.TTF   # Perpetua
PERTILI.TTF    PERTIBD.TTF                                  # Perpetua Titling MT
PLAYBILL.TTF                                                # Playbill
POORICH.TTF                                                 # Poor Richard
PRISTINA.TTF                                                # Pristina
RAGE.TTF                                                    # Rage Italic
RAVIE.TTF                                                   # Ravie
ROCK.TTF       ROCKB.TTF      ROCKI.TTF      ROCKBI.TTF     # Rockwell
ROCC____.TTF   ROCCB___.TTF                                 # Rockwell Condensed
ROCKEB.TTF                                                  # Rockwell Extra Bold
SCRIPTBL.TTF                                                # Script MT Bold
#SEGOEUISL.TTF                                              # Segoe UI Semilight (dupe with ttf-ms-win*)
SHOWG.TTF                                                   # Showcard Gothic
SNAP____.TTF                                                # Snap ITC
STENCIL.TTF                                                 # Stencil
TEMPSITC.TTF                                                # Tempus Sans ITC
TCM_____.TTF   TCB_____.TTF   TCMI____.TTF   TCBI____.TTF   # Tw Cen MT
TCCM____.TTF   TCCB____.TTF                  TCCEB.TTF      # Tw Cen MT Condensed
VINERITC.TTF                                                # Viner Hand ITC
                              VIVALDII.TTF                  # Vivaldi
VLADIMIR.TTF                                                # Vladimir Script
LATINWD.TTF                                                 # Wide Latin
WINGDNG2.TTF                                                # Wingdings 2
WINGDNG3.TTF                                                # Wingdings 3
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(${_fonts[@]/#/file://}
        file://client2024_eula.txt)

sha256sums=('d672eb87a3787bdaf8f75df50f9ade864e2d5c9cdec5b07ce6de9d7d39433ea2'
            '4fde694cc486b55266f7561c685fbd9153ea0003f0c0c39fc744b132051d40c5'
            'd0b3b7cd48a047cdb7fa610d060807be44fca80f05ce4bf7557c4800f908e48a'
            'cad552553cf2a75afca01955751aaa115e2a64fd6c6eea42e1fbd236630b7e0a'
            '6c4a4b643461def5411e0217b74a625dcf2fb681252ef5da1db0af4eae80aa7e'
            'faf73aa7ce40b77ad19c09507a2263fe3f3ce9fa5642e8a1cd54fb3c9f52d599'
            '161b859efd20c69ddebb23012a49f4f2030d56a0c1b9bcfd4df753217ce3e358'
            'd9352e7d73711f006a27f44e71808a74fec109e2342e680e054c4458569f0a94'
            '529c972a6d5c1992c76e908255f655f98989b74b146058c90555af6d925a1715'
            '8afb4da281e19745d582814bdc66006bd56f43eb2fd0d2f88d854771472420b3'
            '986a5b8bb70238e3c896e3113ef581df26204131f72d59fc12d2deef7ef89e4c'
            'dcc8d42eebbab6822f736a7b99e1c9d6ee6861b247a19049bb33e5955d991dde'
            '17b6e7689e333fea42b19d817427cecf95b86a340bb0af5babba3ab25e6a1b40'
            '0b6044c72e67aaae9c2ae3c8b4bb06d066fdbc02779c68e3883984acbbe24cb8'
            'ad7d00c413fe11ec423ff5e2b63da7d403049ab3babf13d0b2ab34a43f4d4a55'
            '4c50d832f4e1401e226566159735dae932dd224d795ac57772061096117e4147'
            '8715897a451aa9e37353b6cce5f5f3d853ecbe97de87756838704eff47c8ce86'
            '2934319d3c6ba08a4477a3dc4f08695d4b926fc81a316f7a278e780ab5c9609d'
            '17b06990413ab318b9e9f2c05d3816059f56d7a678f4712849a3318a9e5e7c7a'
            '051b0031db491fa893feddd485b917b24a9d12f15a1e99e782c2420da0a3ffb5'
            '960458b4c0851b8b9f1d047fe50f7fa01ddfbecaec692521d262660882e9596a'
            '9729e2ae73b15871db606a18a48b8674ce2bae35d76a511d3510c4a9db2385ef'
            '63261985fc00d6db2dda4f22da039c70f3c4c90aa0f087fc1b7a8c9856f2b551'
            '29854f6597ca7b46db601c7a2eb28c13e31ee0541c7a5a499581fdee8da1b1d5'
            '0f1f746f293e547f8189783c49aee22a8b839698f7493b5915cc5b432c65d843'
            'f307de012e77219a25ef59ada33820a3e33f6865c911acdd97440c15058713fd'
            '37194e3c2d5b000443d23dc324b1367cbe2be40f28c2a6c693e6051210432ca3'
            '24fd78549262987502d83ea0bce5b47a3a0ac85c3941921b241a73fca08dd012'
            'd0efcbb58042808781f33898dc0fbe5342da22d813415a4dcb394872b1d19afa'
            'c019f155a0004760f32079c22c29ef0ddd223d0c2c79e2487122e66d38a53b32'
            '134a9f8ecf618660305d7d34b6905375c1d5d7838ea15cdb2789ba94317f4117'
            '6b00590bd7a52a94e9e90e35a28c1d2fa03f83f458d2f2dfbced70a9c1ea0c80'
            'bc546e3e96f8cdd9e6cf02eb5c8ac5551ef20ef4639ff701c338ea281f56fbd0'
            '8f2df7dbc1f2b790f6e6fdd24dbb6c2a96b6e554ba2031c3ab0fe34d322a1b3e'
            'ec95c7380ab7f92ebc75bba6c56a80646fcb450ef6cccc631852a8b97be75c55'
            'ec990c65df2ba6ead654bcb69f7f88bb76910b029f2edf663710cae3fde5f7dd'
            '2de5e34daf966be8e165bd5604ac0714a7946ea2a0a08f86ff04e687ed54d8d7'
            '1f7ad9e753a88da096121bd831a7df72868ac48b8edefc8c96c7a73303f1575d'
            '1aa27a3e349a8c8daf466e0f89e94b0dc5b9cbe82e0d7a77e04d3dd6e1588e3d'
            'a252b1e5d460f1e0e4781146186393e5b217ab379db237c7bcb8d7c353943edc'
            'b77d119749b51c7ae5242dd093360d5b1c94117469e578cfdd2de03fdc55eda5'
            'a779c135081030298594ea50fcdf59bcf5cd341008137931e2fd0e68d4ca65d6'
            '9e23cba751cdd44dd7466e019b38d29360cee1aca62bd4b75dfc5cca93ea4b7a'
            '56b5168f5b847ce0f3280076d6c0ed026681ce3c5141629f5d8eba92dd1fcccc'
            'f976b470e19fde1971824107182927472cf67a08acc42f8e2f23951312863a8c'
            '1b3949401e310a5967a4c108bb9be49e28e69f73095ad088f783035e8f22d28f'
            'c7f699a3f94e57187ed36f1acebfe3e0460615ba368d14ed0aab45272844c1d5'
            '9b9e45f016b013d92c3caf1985db22f85e39c8b1f208636f9ac21f9c135239ce'
            '5d5db8ae79e77adca68e52454088f3a456f363acc9f577cc6dd08b18fa996bda'
            '1d9fec6f9b2b72203ea56a4c7e3b40499984829ff99ae8ae53340fd8d5f07fcb'
            '21be61ff5289c2125dbb48e2a739fd4dd98c3e58b37abfc22cc0412dd8376d95'
            '3a9cbb5d75b2a2b0d22dc94571608e4e9dc7b88e825374985880c5722c1c9e5f'
            '90cb613b492874a560c0ff18a3402b1d24fb7e846dff11295d5c4644d6c75e83'
            '6cf57be6f9d0bd60bd5dc6eee7c11e87e5b19df210156495a524b974185b9fb9'
            '2dc5949d57d2e172601fb6f5093c1fbf15a463e29ed47c4c8ff2434baf1c2b19'
            '8209f9295b20a9c3d0f7e5163d7ef9946353e653c40f25e7ef9f905856ec246a'
            'a13c13a72c0aafc2be6baf52fd28b1745af6f0fd5fbd365499c7298f4ee416a1'
            '73ff30499a0c673440e6df6e134e0731e586112ab99a0553f7c4dbb28f84366a'
            '8decca6df27be6bb2bd15801dd9cde62502bf4fb20efd835038861455ffe763b'
            '64327ea7bccc5583396d6796cbc535d27c0389906a36312e5811d9ec535c6a03'
            '7da22b3012c6071b7756f6d077ada0cbef49d66dccb7667ab74c97b3748675d5'
            '0518e37fd63c8b97d63a6ce678eaca254f0677ab94d420e99860772ecf348636'
            '607520e814ebd77845cfb7824d0afd47ffff9ea4f335c8f2db356d3c6396a99d'
            'f354b9e48583dd9cb2a60dcd79eaa787722396d768aac0608d2ac0751d35bc3c'
            'caf7d153d2860f395f846db58032173c3f76b57f9368ec08382f728742cf5a5d'
            '7a0be62452c4a73b8f86f3b6c1b0915074c47fa40bb658255b3d0b1cdf6d2f2f'
            'b4ce691c229dd0ad05d945354dee37ec2f75e031a0c7ada786baec55b88ae230'
            'bd55d928275881a6ed2576c6b031d161c52f7e6f07ec396a75f00a00e6f6b51b'
            'd460cc9f99a343531a93ae4d6dcac016dd3befe64eaef54fa9b7c4980da951bc'
            '60c4f425563b12a6c0223d5c65212fffb42f4b3d84789084aae44c42f3416865'
            '327ee1da1a144b1bd7970a8715daf00159ee1d0a9a81aeb33dcbf02631ed56e7'
            'f9ff23ecb4dd03c511e5462d0b3563b733d4a924579d41c1df8fcb68d647d2d9'
            '944dd47cc65586f54d83ed55d654c82b179111b2651e6e1d575c2f4bda55085c'
            '856137000a507908e4c289410917db83d19da88f6050af71675211ba68e9e0b3'
            '88d1a747cec854b6efd25a2721f250c5623f61a818a6ea5e219408485fc9a3bb'
            'd432c14b62c70f4777f9db5901063b76d8db88b27aca46a5fb5b4a4c552c5c3a'
            '9633185651dbec620c26f03e96e8d604a743c93d85e2b51e2f57c795a86cd642'
            '662ac854d07237d7d6a2e1c0efba28c6166002ae8cbe0df0f58c43f65b21c54d'
            '4feeeac17a284f6f45fc66bd28da141e6bd904f291290c1214d25d06e7c542bd'
            '7407f0814d04a4cc45127933df1d6ffab5c90e5e888d33a7279cd82c36426b30'
            '9ad3d0e5ef31c4a9a98cb0e169e4e625286aa34c712add3e001c0100138730d4'
            '2fc6ff3c5253dca997c68d592e8cfa066b516a782d4b2747acf297c6523f9306'
            'cfd1bb2c9b0e8b624952288acf9bdadaa64e52bc846e4720e2f0653359e5b8c5'
            '478e980ecfb423400516403cf49587f5b2e6a6dfc2c41cffcc51c109adc24ee7'
            '4ab0f4d87991cbda91a625369e2804c4fb88969cdb1e4bd83b6bf37d07cf9cfd'
            'd1a3a6e5937c5923d4138c1f622145f577ae2f97c7f2d0e899ecec4d0412b839'
            'ac70b60f163536b2c0e2e2752262a6f8d1db6af43da73d5caab855d369f1da13'
            '1861e0824e53ca60a04ea1bc7bdb159131448fec711ed079ebccbf645dd345d1'
            '2e131823861483b966f87ca23063ba6f3c0cecf9ac5d785d71ed1710dab477d5'
            'ddeda8f737249e8a2ac17f3e0757525e20631375cbb8b78d99b1462a146cef47'
            '6204f2ace1a6c196b95b079f10ded04af8f431ce8eb2cf3945acc89b594c3728'
            '76487d4b739ffea6d64f86d0e6a19a8d0031dc67ba2fa2518bbc1818351543ff'
            '9cda64dabb9b2aef5a810fe7ed231ca34c4cf42ae5a108c368ab6a21af2c4ccf'
            'cf70b1cf7b70913c7f2288f037fe376e159d9e35f0619a2b412e88d7f3f5ce3a'
            'f6664b244192ab4cf3a58bb6a653700d1f345d03bb8879888bcea1b6f8f3f97c'
            'c95e47d509eada17f78d730010a5bbb69f60a940c17df6e4e7354c62262c1ab8'
            '5b81f2b18d3b19baa4cf151cd6eb6c49f8e0e58194fd0a02995cccdec803448e'
            'e79f9c1768515a1844bd889092ecebf5c40f301e4415ad1238a8e2f09ce8543e'
            '3216f7d3a15d3107a457b93b5537784108c3237b3fb2d16494d8ecee0a22cbd4'
            'f44727cfdef37b028ea00283fee7ffa09b821ce2bbbfa28d518ec48976468ea5'
            'a74b5e4489bb98a96ff5f727bf33dd922703d0f3069f4ce95aa2c5d7f92d2253'
            '9c96a89a866bcc0b36d1d80f61ebb6ba9251cf9708e0060ac94546be57dbd881'
            '962ebe317bfba70511c4f04ceb3a7160def7e3ce8cfcb035fddce7ef202ff9b4'
            '380e2cd97160e14042cea52ff785ca92d966e29f873cf2b93e1746f3a582ec74'
            'f3cd0e13e4a0ed77522b1ab29061da6658f449d1d89b56751cdcdeed86da47e2'
            '71d2d85781689de6326a229aeba2d143a5b3e8a4f0fc93b75af197fb63bf05bd'
            'ab475061e2479350a315bf3f72d65ae9acc37bebef4cf8df979f8f6ced659216'
            '40e898e471fa4de3ca09a6dfed961d00d6395af20fe6cf1c6b83c795bea04543'
            'a9488a827468a58c7ba78abc284a949a27f7ef4bcb921674b354d926d1c216c0'
            'f482f5760773767d798c64f470c08c140588e7b07510094497e7a89c3f2f319d'
            'd5ed7dbd872ae77e6e30cada5287dbaa1ba755f962d0672c5ed14bea08f08422'
            '8f7699a0fd02de79d565fbd5205be070b777b790f028c1fd7e6090e34ed81bda'
            '9db1f3315d5c18572381f3880bd2c171fa1f49a1cd6e5f5f8d97cc1317911f06'
            'ee066d11d2933638a5d00c242a24f2c9b8bd68bd3ddb3b334123f8efcd539f03'
            'd0d2d8efdbf07df506c87f9cadcd5052a6e446c99570177b1f98555661c6937c'
            'efef0fa6138c648f9b5694f11d3372cf2733ae6126c91dbc7b2327c00546a699'
            'a298c30e23beb222a016afa24d4d8f389f30ac3b8be6763f9f94199c3b11ff0a'
            '8a9783e50f3bf892d958b7e61990d6ccaee65daaa0ffc246d3e1bd4fb0104b41'
            '11e1960d6aca5d6de0fcbeda530dbb3dea8837d810596c54235b07a9fbe43f9e'
            '436bb96f8bbb151e7634fcea07794044a8565b013e505245322dafa13e6c3efd'
            '736eb3bdc990636d283384cf6428b03a6632ae16e81dc72cd28aecd0cdadb017'
            '8012eb0ec90ab1b7a40eec8987927d5764055e332bdb19ab5eeb3c1cf67987c8'
            'd347d9ae8a42c63ed7dc15bba992d00ee9e606e0ac499a8022757c275855f612'
            'b2d15815ce8f722e22885e67562a66f512f6412399d9400ac01fecd718d54839'
            '5c7e6c59e09c38c4e280504741bcfc051c95a9c931b3c92c03b7f2733f580622'
            '25b23e0e8ba977da78fd0f6c13b76e561756010a73cb5a8187dd817496e25fec'
            '1a8dd16d0d1456923c5d3824943771e63eb67e6b8660e5c1c479674fbbba163d'
            '27899b1624a2c13245cbfd28666090e3fe9ca17ecba4cd6e19a615892f6c6db5'
            'fd16af41073406530c7633bbf6976c1aecac1f4bc9d1882135cf58ec9b31dd07'
            'c5ab997a1c3e49cb0d34fa5a3f2c39934d39f2657dca224fcb3b480768676501'
            'eb3f949ba0f1368698e69396259e667d9fb913ebfde3c742d493aae5dd57141e'
            '76160ce9cd774532131cf4902b810a2d02c94f225da238ff8c04e25875eb66c5'
            'ca117345d190cda8ad6c7a41af1d6d43c475d0fdc99c97b8d325986309597f7a'
            'eb2d865bdadbdd19dacd2aa6f1a0d4e93263b3dac13de536106286e809abc238'
            'b700d1bc51a11c77ca7b119b0677a9cd4dc1e61fe43a7130bc2044cd7dc9b116'
            '993b8ad78909d2b9d67ea0001112cac238fb65c6b31f6729fdb0b86c24e2b8ab'
            '980e0ce5a0f4c407e90c72a16da2a259b7fc2a0ea48d1faf048028b2735fa941'
            '187f363e9c2e328409938b4413027fe8f0c55423913ba66ea66d3f0d7fd5c74e'
            '455964b4a07af53205ed705e0f40778ff203f2c9e7c72a8bf2c4d7a3a834e895'
            '8cd40ac425585ee56a4a98f19a1f646828cec1e9565b4a0bfab1d4ce9d7a81c3'
            'e334bf287bdf4211fe5958c4926c8ad4ddd3f44f5fdcb2d9dcfa1394186d8132'
            '1da9b5ace583a0a52e85280264d84917630ff6d600caea9a1b99cbd7e8b7c07f'
            '8ab5de475b91361575858e67ce5a55f22a60fc9dc54d4025dfe3504d805cbd22'
            'a03a3a71113d44d7bfb98e9720264f72a05ba112e191fb78eb08d11a3f41e500'
            'cd7c7867a456ceae560d825cbec1d95b3de8cb62b00ce513db6afc293f243218'
            'a6f6dacb871be365ad93fe1aab09332f768cd2aa35fdfca8e0053a38f5a2662b'
            '26d345f357d8213475eff6459ccf2dbc9d707e2f8c0445540f3bb183f717c0f0'
            'ece195c4b0d53ce4ebaed656341708180abfebdddadf219fb014a31e70410bde'
            'ee5f2638432efa7ea6273625ae2fe5dfa3d393ad0b51f8f5fb0f3d3c5ae65f6f'
            '2b058a75ff9336c703e48b618ef759906dc9e37712e27698f74aa3ec0b949346'
            '1d9d8d06aec3de7b9abbcdac2381f457d9d606b54f05e9b0e0187bf8565a1104'
            'baba81b90b5102d1e1807aed3a4f38ed8f3d0e45c2b12b27152d8101c4de21fb'
            '13093d9642d540cb5efad5cad52ad703e11c0e1f5308bc23ff2cfd7737e7516c'
            '895fdea742cdccd53e8ce847a7d2d9c3ddbd7ebdbe0444e88246f0f9e4e2526d'
            '5b4a73788f013c252eb5877a7974e5836eeffc1189dd7319a219080fcc908f80'
            'f8202c3426b5c54b192969351f15ea35288de44e811e9514d923898214b94184'
            '8eb139cdeff99c8297c95bf857d94def798116d02fdcf72cefb88d43fe7a33d4'
            '2f52ec437a22912ec82c06afdde46c6b1c7593b44025c4627901d353a965b161'
            'f8346184d59314a919926dcfb60da96421781ab19c2e04c2f76f0f82ace8cee4'
            '5b90d215f586c91cbaceee9e96d8840431e6b4713909dd47ab70084a067d0b10'
            '1024c55e896123dad43b1a15f0c86640556b01e9348eb797e6d7c5a889178d6b'
            '673e9f49ace279c73711dd778037b5d435790be236c9e5892609794b0bb4377f'
            '1a98bbb22c3097e418a263ca80b63ac1264e8cbd03d5f0a7143bc598297a387b'
            '4bd22f9cfa8255c17ef5734964bdcea39f0614c1975f9d495576a0110f5bf177'
            '4e06cfa893f7e1e656709ac2cc240cf17cc82da9fb8df1afbf689940e47c0cfd'
            '7019d811b304287be2223f1667e0989f862951cbba660bde13a86bb103d97b80'
            '0c61e5ce8296a55761cdb9d350d4c990be4cda8890cc70f2abdedfc357f96d00'
            'fc9fd442d2dcd719c88d42121d69f5dd9dda02cc1c8afa025d261ec28795468f'
            '70af64a5bc061505e7a1cb1cd691811768a7cc84e53d48fcb526deb53f8c7a57'
            'c8a0f6976209cc198bc47ee287fd872fd86690f4d2893057e7ee92dd1235fb5f'
            '967465e783b62ce5fdfb10183753ddfa0ba6396036340fd3cc67f85187d57689'
            'bda7c484b491bb10914d668300c6560621de1b091784010f2d4d239020b6e5be'
            '6c52077681d5d1831b9e8f6621deb82de960418d24fe39d8cdc88778fbb19e30'
            'ebd9ca7dc28fee37c942b4084f377711ba571da5fd7154125abf8f81c9628ce6'
            '80cd2486979c2c18f9dd59277c0fd800959afa1ce23820dcf7bce31f208647af'
            'b9e8a921cc54334132052f880fc1b8b236cb6f41b1cfa4618ea399014e6cea4d'
            '5d53b38fa8ff33d15676cdcd78b261681bfda861c449b4f7ddfd7574a5c11e18'
            '1b20b818be881cf16e711daf7e3c44be66a93b581bcd7b580a4423f18595fb35'
            '10df71cef84ae0d7031d7ffa072b185343365be0e59bec4ac231e7c77811584b'
            '64df8ce11b656bdda3e35275b83dec7c40fc8a0a73d8a921918fb99b538f62d0'
            '3ffa539609563836dc5546f473f6e7a3b7e4c9f7ba5876522925a980ab87fd7f'
            '4fee7243ffb931f65713de0537a145f6aa1e7302c8398fea68c4864d41e7fd98'
            '73655bc3a86553ea1d76df8c8eed0e8d0daebc797aba885cde99833ffe9545dd'
            'b068cd471c07907a772b6f39a415d33d6328d32d1ea0032be9a717cb4b80b254'
            '9e8a6af516706030b8536b2ea6535664cd9bea916fb15304556d8139a6945ff9'
            '2bbb4cafa0c5767155971e7bc578483478351a36e55d035450e50b468422a962'
            '13cc1cc1ed4b8192f1840291863551afa3d950f01110a8fc3127dca744740a1b'
            'ede635464683ba465c949d7dd6894f9dff49a76229618cb0b73e0c85b93e4169'
            'd64b9e6668069915ae217548b010be1b52be99bc923e88e148a83619b0102868'
            'fa671b6fddedd57f158ab90b6aa6a7c33db6f41ab620db72b7ad1e57c38bda5f'
            'ac9ee085920a3d8b076d5e0c61dc9df42c4bac28d1fc968344f9ceddb3972f69'
            'SKIP')

package() {
    install -Dm644 ${_fonts[@]} -t "$pkgdir/usr/share/fonts/$pkgname"
    install -Dm644 client2024_eula.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
