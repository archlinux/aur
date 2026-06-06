# Maintainer: nardholio <nardholio@gmail.com>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Doug Newgard <dnewgard at outlook dot com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: reflexing <reflexing@reflexing.ru>

#
# BUILD INSTRUCTIONS:
# ------------------------------------
# 1. make sure to install the mount-windows polkit file
#       sudo mount-windows install-polkit
#
# 2. Run:
#       makepkg -si
#
# The PKGBUILD will automatically:
#   • Mount your local Windows C: drive 
#   • Copy every font listed below from C:\Windows\Fonts
#   • Copy license.rtf
#   • Unmount when finished


pkgbase=ttf-ms-win11-auto-local
pkgname=($pkgbase{,-japanese,-korean,-sea,-thai,-zh_cn,-zh_tw,-other})
pkgver=10.0.26200.8457
pkgrel=1
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
provides=(ttf-font ttf-ms-win11)
conflicts=(ttf-vista-fonts)
makedepends=(mount-windows)

_ttf_ms_win11=(
########################################################################################
# Normal         Bold          Italic        Bold+Italic    # Full name                #
########################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial
ariblk.ttf                                                  # Arial Black
bahnschrift.ttf                                             # Bahnschrift
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri
calibril.ttf                  calibrili.ttf                 # Calibri Light
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara
Candaral.ttf                  Candarali.ttf                 # Candara Light
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas
constan.ttf    constanb.ttf   constani.ttf   constanz.ttf   # Constantia
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel
corbell.ttf                   corbelli.ttf                  # Corbel Light
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New
framd.ttf                     framdit.ttf                   # Franklin Gothic Medium
Gabriola.ttf                                                # Gabriola
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia
#holomdl2.ttf                                               # HoloLens MDL2 Assets
impact.ttf                                                  # Impact
Inkfree.ttf                                                 # Ink Free
l_10646.ttf                                                 # Lucida Sans Unicode
lucon.ttf                                                   # Lucida Console
marlett.ttf                                                 # Marlett
micross.ttf                                                 # Microsoft Sans Serif
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype
segmdl2.ttf                                                 # Segoe MDL2 Assets
SegoeIcons.ttf                                              # Segoe Fluent Icons
segoepr.ttf    segoeprb.ttf                                 # Segoe Print
segoesc.ttf    segoescb.ttf                                 # Segoe Script
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black
seguiemj.ttf                                                # Segoe UI Emoji
seguihis.ttf                                                # Segoe UI Historic
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold
seguisym.ttf                                                # Segoe UI Symbol
SegUIVar.ttf                                                # Segoe UI Variable
SitkaVF.ttf                   SitkaVF-Italic.ttf            # Sitka
sylfaen.ttf                                                 # Sylfaen
symbol.ttf                                                  # Symbol
tahoma.ttf     tahomabd.ttf                                 # Tahoma
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS
verdana.ttf    verdanab.ttf   verdanai.ttf   verdanaz.ttf   # Verdana
webdings.ttf                                                # Webdings
wingding.ttf                                                # Wingdings
)

_ttf_ms_win11_japanese=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msgothic.ttc                                                # MS Gothic
YuGothR.ttc   YuGothB.ttc                                   # Yu Gothic
YuGothM.ttc                                                 # Yu Gothic Medium
YuGothL.ttc                                                 # Yu Gothic Light
)

_ttf_ms_win11_korean=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic
malgunsl.ttf                                                # Malgun Gothic Semilight
)

_ttf_ms_win11_sea=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
javatext.ttf                                                # Javanese Text
himalaya.ttf                                                # Microsoft Himalaya
ntailu.ttf     ntailub.ttf                                  # Microsoft New Tai Lue
phagspa.ttf    phagspab.ttf                                 # Microsoft PhagsPa
taile.ttf      taileb.ttf                                   # Microsoft Tai Le
msyi.ttf                                                    # Microsoft Yi Baiti
monbaiti.ttf                                                # Mongolian Baiti
mmrtext.ttf    mmrtextb.ttf                                 # Myanmar Text
Nirmala.ttc                                                 # Nirmala UI
)

_ttf_ms_win11_thai=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
LeelawUI.ttf   LeelaUIb.ttf                                 # Leelawadee UI
LeelUIsl.ttf                                                # Leelawadee UI Semilight
)

_ttf_ms_win11_zh_cn=( # Chinese (Simplified)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
simsun.ttc                                                  # NSimSun
simsunb.ttf                                                 # SimSun-ExtB
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei
msyhl.ttc                                                   # Microsoft YaHei Light
)

_ttf_ms_win11_zh_tw=( # Chinese (Traditional)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei
msjhl.ttc                                                   # Microsoft JhengHei Light
mingliub.ttc                                                # MingLiU_HKSCS-ExtB
)

_ttf_ms_win11_other=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima
gadugi.ttf     gadugib.ttf                                  # Gadugi
mvboli.ttf                                                  # MV Boli
)

source=("license.rtf")
sha256sums=('6b5d4b32236a921bacdefe19852ec0699ca2eacd72d4e57f50a2de06ede21c8e')

# sha256sums for the copied font files
_font_sha256sums=(
    '5f9f2d8104ad5e69e1be8107224063dc8c36f9e24680b2f9be324244c0b424a1'  # arial.ttf
    '3680a1bbffab914f36b27d5fd97b193de5bccfab882c41b41b5f8f99457b4820'  # arialbd.ttf
    'c30c71d614e143c0d4e42aaf04d9a1f50f90b365a2654eb3f2c6598e5655af08'  # ariali.ttf
    '77a0b63c5f73eb85923f10359e68b8fc768487ae88ad902a1ea21276954e205b'  # arialbi.ttf
    '10df702864b1f89cb29ba0d6b97c04228338d16807e13e8d8c74b91aba5e5f23'  # ariblk.ttf
    'eaad201da94cb323401fdb8cc760650803ddf8fd704cb9fa56317e6c69bc6fd6'  # bahnschrift.ttf
    '57e93ff143572bcc092c1f56202d43ddc07bb119aa104c6d7af163470fb551f6'  # calibri.ttf
    '0a8296747536ead27d5f48f67e911cc3b207742b3f704e66995251d12fd422e5'  # calibrib.ttf
    '7f150e9eabe5db3e1b0f9469dca5c96176bc2fbb306dc9d48b7029dc69c52763'  # calibrii.ttf
    '760539bfedbe24e7853ca8a621d9cb1f3de52036c116e81aae36b33c4ab60a7c'  # calibriz.ttf
    '2db491080305b349588b9851fb6fe960eee04cd7c1097784a987287d782f0a54'  # calibril.ttf
    '64ca9b15ca79927c3c4c69094bb41f78e5f0d79e9501d9d381a8794b220eead1'  # calibrili.ttf
    '84e70ccc1664482f4a960442c7a166c91a1b2cf98ff88c33cb73f79403f66d7b'  # cambria.ttc
    '6685c657a7e292083e28f19bbf1a1e90509ce3e1130dbc4ed1c62ba3f9140543'  # cambriab.ttf
    '6905f0ac846d1ec4326cd14a46cb7379204940aa293b098ee4c1a69723bbd165'  # cambriai.ttf
    'fa90f376ad37f308a819b341c8185f788d30a1012829278592eab45a41818d1a'  # cambriaz.ttf
    '002c1e3378d02ed7dbdb3df1c94d433413a56f3f2f3aa8315a57720ee851dc45'  # Candara.ttf
    'ec0dce5170aaaf2cf485d4ba39d86fbba1dd1c76d9140cbf75a6b84b50fb20de'  # Candarab.ttf
    'c165dbbc35bbf1fefae865c3e6b02404c8d182074fe04e78e221bab7d35ce3f8'  # Candarai.ttf
    'a873581d9f0886441bd45c5e425a734e86e063ef583b9cf8081b1aa03b871f1c'  # Candaraz.ttf
    'c35742957794a81b6c73aa43d2f19e3d3d0c45a6dafbc2efcddd04ad6b3aeac8'  # Candaral.ttf
    'ff22b2841bc0aa0664b50c9215e8440f1da4f74bedd27ab33865f63f433b2681'  # Candarali.ttf
    'fc7fbc3fb456a363f1f719b0ec62ae093c78124bb6da046006ae7e217a6b8575'  # comic.ttf
    '128fdcfdfdd358e1624c15dd1f84a4d0689e59afcdefb81f8105efb2253b9c00'  # comicbd.ttf
    '872cdefea79e25ff1a8a814109593c23ed66ba46f5bb843815d49e1ab4e0be3c'  # comici.ttf
    '36eb300a76582b7d39f3d34834ce1255f0b9b2830fb2e81485c4b85a5ff7f03b'  # comicz.ttf
    'cf00b507b3286870cc5064ebd0633c303f70b491a4af25eec2d32df413db0179'  # consola.ttf
    '7e8de70c92a891722bd3fbd623db005caab2bfe267e5dab5be46b95a44e0c7f1'  # consolab.ttf
    '0b5b0484cf69ae973bd39380069f141271a4c9299b8885fa2d13f42aadbefef9'  # consolai.ttf
    '9bc225ec52aa8f4b88b98bb735b1908bd72c9e31a12139fafcc1bd6c86bed3b4'  # consolaz.ttf
    '495577bf8ef74deab6ecc2e7acf63cd966184148f9bc2044a1068cd58501577e'  # constan.ttf
    'b6c66a1858370fe575629e19d53c05350738bf5105e18ceac07fe9efc9cd008d'  # constanb.ttf
    '2314a03c53506fa79525bc479ea4be9c036d1ebd86a1ffb5837ca5b43ff51f07'  # constani.ttf
    '9311aadcbd919746f50d222fa0215fb44266d6993221c14a196f0725fdae464f'  # constanz.ttf
    'a183b77b655df66793639af7874828fb50f748dc4af57ae40f758156f7f34634'  # corbel.ttf
    'fa008372f8a94945d0daef9daf0bfb9e3fba3a25fd17f2607d47ac6861bd0303'  # corbelb.ttf
    '9be778c9ed418770f6b5a02064d9c0b47a8fdea1137618f0bec9ac4072430a45'  # corbeli.ttf
    '588f090ae3a6d31370457312683d14ee3a5bfbdaaa0a070b7c80225b55b23e78'  # corbelz.ttf
    '0e36ddf90102e476c6739ca4c8cc18ba8309d880c12558981d2e4d42de78fc00'  # corbell.ttf
    'a031500bccd32b5d6e819699b774fc679c696ed4965b643d51a94eb398475550'  # corbelli.ttf
    'e4a66a0259718d0c8f4b6e14319b4803ced45afbddf3abba8b8c3e2006856206'  # cour.ttf
    '11e629cef937cd08f942aa1bd994a71302dbe2819c72c6d4c183a623acbb421a'  # courbd.ttf
    'd82eeeb458f661d867f916d691fc6d3c53f8735fe4d5b04b54a5757321ee03e0'  # couri.ttf
    '2d61f452de49b57d9ef14ce8896bc1cd2ed8285c2e9fb2e73e78a4b23f91d308'  # courbi.ttf
    'bac844bd41f847cf138737026d41c983387a1065535c32e78aa22c48708b52ad'  # framd.ttf
    'df59f9ea915957b22a389d68580bf40dc5bd05822cc65b5fdcc188c706a694e7'  # framdit.ttf
    'ddd852f9e43a5e81af62a3f6654324ba7553d7d66101ab848abc1bd2d626ac4b'  # Gabriola.ttf
    '38dffcaf1fac89492f7c56c600a14daf36ae42f7c21985cd4134ae113124a58f'  # georgia.ttf
    '72a6cd94fab6c179392075d3fb361e269cdddfad41bb7ab385fa22a37e49a900'  # georgiab.ttf
    'd3e4bad27651d120ac8f2cea42cf4b4f077264fb243f66b3caffcfd35465f49b'  # georgiai.ttf
    '3f9e512f82eaf6f1b7869b82013fb79f6eaf1a41e75a0e7b96f31f35b1022ae4'  # georgiaz.ttf
    'd8bbdb72e3f930157824b2e59677d3a912d4512c14a948e6656a2e3fb0c935ad'  # impact.ttf
    'c8ab96bc49ec1dc36936b5973fc143ca222c1a33ab27b87071a3bbc44d34ca9a'  # Inkfree.ttf
    '97226e81f19eff8c8fb191745748bab920472c005d3ec4e23d9a50a12c471d92'  # l_10646.ttf
    '2ca2cfde263fa420e8d39420f075ee9ac80bc0794272c53ac4571a88f8a075a6'  # lucon.ttf
    'b7397adf2dcc24ca790348a3c26deb2122b45e5728fd25fc588de4cf5a75b469'  # marlett.ttf
    '89b42a12ea0379133fb2f4a1d1bd53058fb61e2343c1d509452d5761acc85b7a'  # micross.ttf
    'e47d594e2e2bc31b28f87b6f66483d32f925843ceb002f919c7a403aca48813d'  # pala.ttf
    '8e14668bbae03f78ed668dbe3261218881960dcd9fb80ad6c1d1dfb4226a57c3'  # palab.ttf
    '99f0af2d1941707fecda23da38bafbed5144a73a3720d773c05b9d4c445920ed'  # palai.ttf
    'd0e722b91ffd5391cc2e7d6e976f274d5aee9fe0b8d0fedfffe093763e695cde'  # palabi.ttf
    'a2efc8b8e51fbd031a7142a1ade8866fa904c0c349511abc579ee53f8a926f31'  # segmdl2.ttf
    '9252396fd902fd1a95775ec81f52c5818ee24f8a1297127bfbcca2787c1b03e4'  # SegoeIcons.ttf
    '91046862e08fbade0bdd648e81c4efbe6a963947f8b6e32b64a28fe39073c468'  # segoepr.ttf
    '3cced0162ddb9e5f1e63ee1b36fd6e581c090318dce1a0af01b77f5ea9952c80'  # segoeprb.ttf
    'b24aa49a4bcb99a0ffc60cad77f00941e4b121153d8b0a519c03719d9be6004e'  # segoesc.ttf
    '6cd482205e1390b32a2b6327e1e5039424e346172c187074eac12006bc51935e'  # segoescb.ttf
    '8134dbcd09e7b123c9a7f229d49cffbcb01352cc72ea5e1076b65d0dca9f73cd'  # segoeui.ttf
    'aeb9e4a6ec5cc59f4d72df8189032d7dbb28f45161cf1552174818b5465dac4e'  # segoeuib.ttf
    'be525b9a6d307d73c23908cd269be9be754210a9d93c0c1eaaa126d2a174290a'  # segoeuii.ttf
    'c886161fa6d102090ff992519b6fdc73057a0e838e9d40b27e187e9e61300a92'  # segoeuiz.ttf
    '866557576dfc772395301b581eccef4c0daf1dbb75f9667f26784b260bce7da1'  # segoeuil.ttf
    '3cb01ed58922781a62af14e738cd96023957f60d8d6733920a8808614f477dd8'  # seguili.ttf
    '3432de66f335c7e3058154f7cbb13ef051195653a544b49b1992267e558b33ef'  # segoeuisl.ttf
    '4dc2db1870047663878da07fa5f8217e518ef875c8ad33287fcbad6aba5a7e73'  # seguisli.ttf
    'be191c94a0c7172870c3c87a136bd5aa67cdca7bc091de89242fb64ecb0f8fae'  # seguibl.ttf
    '51d300301197dfb0621a8d8b275274d408dd15a7edda4cc4a8f7666504d582cd'  # seguibli.ttf
    'f07cbd7886f4a1a5255a1bdf4ca5ea29db3be3357414003a92bec5d1c3165578'  # seguiemj.ttf
    'a162ceeaf701b55d11c542daf1c39c52bfaf686496505bff2eb75ca24814c136'  # seguihis.ttf
    '2d9b22d71f72de2823fee5d9c8bc1b0fc32b2577c4c27b9ec6abdbb8df0e1731'  # seguisb.ttf
    '454295546b78810c95ffd7fc9d57890ed15a03b7cfd0d7e3485786400152b740'  # seguisbi.ttf
    'a4a35dcc62cd30e1a6c97b695ecef83e59d2b149e3af834f6a49f11851d56b37'  # seguisym.ttf
    '27ca1ab4bd5ad3b0404ee6a9a03b143408dbd7e5a4c9e4b2054639c03fc0f682'  # SegUIVar.ttf
    '9f71aabf76ccc757d25e18801d6a37e45cacc8b74c8b42a19e9f36ca99eef594'  # SitkaVF.ttf
    '74d4b98aabe85e16cb2fa6583c93f9f17642234d030a38462c36d1bcdde65928'  # SitkaVF-Italic.ttf
    'ac278d932d59558a76817e98051b1dae53867aa81ad83e5198b1b4c4b8066a08'  # sylfaen.ttf
    'bbf1192965e5266fbf23370416337d2861fc1e8bd349def93f2994ba67382fc3'  # symbol.ttf
    '9af03d4ad44a3b413d92f7de48b94aa7cc8a1471a75d498406eae837f62ee1d1'  # tahoma.ttf
    'b16ed1a15e0cabea8d41d9f8899c253cd61ac466af5e3980d02bd0cf311c2267'  # tahomabd.ttf
    'fbb57cdb0079137adc0e478913ca134dfee02aa2ef443738ec5e839bf97a1f7f'  # times.ttf
    'e94ff9111656f17bd81e9f822f1e234edcd370bcbacfdebf998b8938f525ac77'  # timesbd.ttf
    'c2c134968be4259aaa78845d3aca5e91c4a0bd10d98e4d2e48ac3c12f3c63b89'  # timesi.ttf
    '8d2c8d8d25d9fc529d08558c42effa771617914a455603881e212a26e2f2ddcd'  # timesbi.ttf
    'fe3e8bdd64c1c9f3b9cf5189d06510c80d72cec28e03d04bffc560f77eec58d1'  # trebuc.ttf
    'dfcc306777a594d2815368547dd897e2ac82aff8073e55d9e682569939e49b81'  # trebucbd.ttf
    '9c9dc0cd0fd6b1a06e8f406d04bb15a88aaf20328d3e166c12d6bc7994b781d2'  # trebucit.ttf
    '87942234ab0cc4400088648bef8d1f7afc4c44e676c7ed6b32ca31462c18307d'  # trebucbi.ttf
    '6a8481fe107ee547893c018b13dba291c2020bec3de5da6525d9ac09f6bc2105'  # verdana.ttf
    'f3245f5f38f61bd1ceefb0f1338a5b88a21e6220832c2f43a38bbc7e1547c36f'  # verdanab.ttf
    '14f2ebcdaa1b77e5993a8533662e4bd3ebfe2c5771b6daafd8ccb39b2ad588b9'  # verdanai.ttf
    'd71f81c83ec63eaa32d36d5df7be1d9e71d3ea9150f47cebda2924923cbbf18a'  # verdanaz.ttf
    '67461fabd8329d0d8ad62689cac642b34fac81c754ff9077ad211160ec62282d'  # webdings.ttf
    '9bcd6064e3b52fa30a347edd6e82506e2ec8b1602930b423c629a82c10468a5b'  # wingding.ttf
    '4bde3e6392b96910fb59094c6c1a4dbfae18fee78d0bf13dc30616837c4f95db'  # msgothic.ttc
    'cd24b5617c1e26572b0a7fe7e558f7121ca42c36f7b50e8d9216ac222a1c0a93'  # YuGothR.ttc
    'd923a57f781f06198167da4f58287be7ac64a954a47aff4295e078a42b4b68b2'  # YuGothB.ttc
    'cb2021bbfe40b21ec564848b8d702125661594e1b4f1eb2e77fd8a98b485cf19'  # YuGothM.ttc
    '0acf409fc61e1560ea0384f8c72bf87c6fa7282077420657979680ee21dad2a4'  # YuGothL.ttc
    '7a183cf1c6c56b9609fcc16eda8b5229fbc11758a21e669ec00343239b02192f'  # malgun.ttf
    'e8cbc0b2afcc14fb45dfb6086d5102c0b23a96e7b6e708f3122acde1b86c9082'  # malgunbd.ttf
    'c0ca810a242c4482594182db40f0f9d35a3d51bb2eeac750e6e867b2110eb00e'  # malgunsl.ttf
    'df8d94382f73e6d2197b60653c3d55c28ab5cf127a82e65b8af4ed1b52fdc412'  # javatext.ttf
    'fdec3a7efacd57913d3c14111837908ccbabea5b0b44ec62527eb73acf743afb'  # himalaya.ttf
    'de0b632015447f28c2db41c8e07c745cedb05ead5dbc2e73f19da14d2e5f2151'  # ntailu.ttf
    'cfc2acbf9ae0205a0a258e564bdbf5466a4e49a95281a1d2e72690f149ec837b'  # ntailub.ttf
    '538949482d964e9f353a3a8d860bb3eda93b46b830f3b677e4f53eb2ff3a6e7d'  # phagspa.ttf
    '03e4e45bb8ebb6d055a5584166cc26712bf7e746ea29cb6e548341361d31dc85'  # phagspab.ttf
    'f5151d081f6afea4c26464e0cd5e695f57a99209cfeea2f483c3108684660eb6'  # taile.ttf
    '1878842d8dbdf8489794af0bace95a956db270dfa506ddcaabf94fa827b769ac'  # taileb.ttf
    '80aef1c25135b945e9de7d09e6445c386405eb2e0ea7032d4cd00a2fe3eef0ae'  # msyi.ttf
    '707585b9acfc1507d9bd943bb5435f75768274b1a12b1f71de76ad78be4d7e7b'  # monbaiti.ttf
    '433a8e78745aa843b2cddff0e386c3a9fc34150cb8281e3d68df68e0beb52224'  # mmrtext.ttf
    'f98b40961e5f8182e3dd9e62cf23cdc7c7b96cf6b0cb4ec05b73c6ab9aaf178a'  # mmrtextb.ttf
    'ad02cdfc06e144ac45f318e8e5a64cbe04c7479d4beb91d25f5a319a466b1767'  # Nirmala.ttc
    'ca9a670f12d0e47c20441012a22f78ab17c1b126818e0e887ef7db6ecf5e76b4'  # LeelawUI.ttf
    '15f58cff987dce2ca1e7740ca6001b8e4e2589ea80898fdedca26d2726979f7e'  # LeelaUIb.ttf
    'f7a9d979c27baad75ebcd41ea45113919576c2e56af9ffd483dd9d0ef9272a25'  # LeelUIsl.ttf
    '1526ac24375f51f6eb73bc2d3f8072dbe4a80a3a65217677c9d9a84f67dab2ab'  # simsun.ttc
    '2a476ca00b5fbbbc12a4c5335634722b11a495ed87429284325701f1e36b596a'  # simsunb.ttf
    'd79c55e68b1131eea0cc1c47be4f572d964f28c682e143db2ad09c1e4cb07a3f'  # msyh.ttc
    '4508821b3dffe01f0ef5e5326a3e60df705a44633858811f67b6982dce3f6ee6'  # msyhbd.ttc
    '7e9bdf90bb5d3fe1b5975fc8ae31944b8fa674122261f92c28d4ec0b9c482fa1'  # msyhl.ttc
    '1fd5fc7046e0eea753988ee06d1a5a731df68475614e2174fbba9b4800f392ac'  # msjh.ttc
    '7d55cd4801102131d991630cea74534dcf73a9fabf4a33e54fe05dfb4f5aa790'  # msjhbd.ttc
    '15f1162a68b5859f246d89ea62aed711b1994817c72e78e3df5d205c89c5c6e8'  # msjhl.ttc
    '8f8afdb3ec7047118f6dc51b29d395e697ee6770d0afd0cd407457e2ad6e93cb'  # mingliub.ttc
    '1dcd304f0ba642dbc3c3f3ccb70c24e9fad7ada2e2d5d0061c7cacab86e8df92'  # ebrima.ttf
    'a7bc75937950d0f217f79313631d81f5b92459c414a4099d6ea3c0c0262a716b'  # ebrimabd.ttf
    '0ec2bdbfc2ba99d9fb05b6f7c511e7ab8b7c055e2d644570ad777455d6e9796d'  # gadugi.ttf
    'c96226cba7f50e94b534a5f8ade6a54f48a03be7c73360524eda5cbce4de34b6'  # gadugib.ttf
    '5dfd7a4c708caeefae42cdb9540946de042beeb8c069dfde0dbc14c2fa0705ae'  # mvboli.ttf
)

prepare() {
    cd "$srcdir"

    echo "Automatic Windows font extraction..."
    if [[ ! -f "/usr/share/polkit-1/rules.d/49-mount-windows.rules" ]]; then
        error "mount-windows polkit rules not installed."
        exit 1
    fi

    mount-windows mount || {
        error "Failed to mount Windows partition"
        exit 1
    }

    local winfonts="/run/windows/Windows/Fonts"

    echo "Copying fonts from local Windows installation..."
    local all_fonts=("${_ttf_ms_win11[@]}" "${_ttf_ms_win11_japanese[@]}" \
                     "${_ttf_ms_win11_korean[@]}" "${_ttf_ms_win11_sea[@]}" \
                     "${_ttf_ms_win11_thai[@]}" "${_ttf_ms_win11_zh_cn[@]}" \
                     "${_ttf_ms_win11_zh_tw[@]}" "${_ttf_ms_win11_other[@]}")

    for font in "${all_fonts[@]}"; do
        if [[ -f "$winfonts/$font" ]]; then
            cp -v "$winfonts/$font" ./
        else
            warning "Font not found (skipping): $font"
        fi
    done

    # Verify font checksums

    echo "Verifying sha256sums of copied font files..."
    local mismatches=0
    local i
    for i in "${!all_fonts[@]}"; do
        local font="${all_fonts[i]}"

        if [[ -f "$font" ]]; then
            # File was copied → check its checksum if we have one
            if [[ $i -lt ${#_font_sha256sums[@]} && "${_font_sha256sums[i]}" != "SKIP" ]]; then
                if ! echo "${_font_sha256sums[i]} $font" | sha256sum -c --status; then
                    actual=$(sha256sum "$font" | cut -d' ' -f1)
                    warning "Checksum MISMATCH for: $font"
                    warning "  expected: ${_font_sha256sums[i]}"
                    warning "  actual:   $actual"
                    mismatches=$((mismatches + 1))
                fi
            fi
        else
            # File was missing → skip this checksum entry
            if [[ $i -lt ${#_font_sha256sums[@]} && "${_font_sha256sums[i]}" != "SKIP" ]]; then
                warning "Cannot verify (file missing): $font"
                mismatches=$((mismatches + 1))
            fi
        fi
    done

    if (( mismatches > 0 )); then
        warning "Found $mismatches checksum mismatch(es). Build will continue anyway.\nIf you want to correct this, update your Windows 11 partition to the latest build and try again."
    else
        echo "All available font checksums verified successfully."
    fi

    mount-windows umount
}

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win11-auto-local() {
    pkgdesc='Microsoft Windows 11 TrueType fonts. Copies from local dual boot.'
    provides+=(emoji-font ttf-tahoma ttf-ms-fonts)
    conflicts+=(ttf-tahoma ttf-ms-fonts)
    _package ${_ttf_ms_win11[@]}
}

package_ttf-ms-win11-auto-local-japanese() {
    pkgdesc='Microsoft Windows 11 Japanese TrueType fonts'
    _package ${_ttf_ms_win11_japanese[@]}
}

package_ttf-ms-win11-auto-local-korean() {
    pkgdesc='Microsoft Windows 11 Korean TrueType fonts'
    _package ${_ttf_ms_win11_korean[@]}
}

package_ttf-ms-win11-auto-local-sea() {
    pkgdesc='Microsoft Windows 11 Southeast Asian TrueType fonts'
    _package ${_ttf_ms_win11_sea[@]}
}

package_ttf-ms-win11-auto-local-thai() {
    pkgdesc='Microsoft Windows 11 Thai TrueType fonts'
    _package ${_ttf_ms_win11_thai[@]}
}

package_ttf-ms-win11-auto-local-zh_cn() {
    pkgdesc='Microsoft Windows 11 Simplified Chinese TrueType fonts'
    _package ${_ttf_ms_win11_zh_cn[@]}
}

package_ttf-ms-win11-auto-local-zh_tw() {
    pkgdesc='Microsoft Windows 11 Traditional Chinese TrueType fonts'
    _package ${_ttf_ms_win11_zh_tw[@]}
}

package_ttf-ms-win11-auto-local-other() {
    pkgdesc='Microsoft Windows 11 Other TrueType fonts'
    _package ${_ttf_ms_win11_other[@]}
}

# vim: ts=4 sw=4 et
