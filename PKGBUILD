# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Maintainer: Doug Newgard <dnewgard at outlook dot com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: reflexing <reflexing@reflexing.ru>

# Instructions were copied from ttf-ms-win10 and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed and up-to-date Windows 11
# system or the most recent install medium.
#
# On the installed Windows 11 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# How to acquire fonts from Windows 11 install medium:
#
#    You can freely download retail Windows 11 from:
#
#       https://www.microsoft.com/en-us/software-download/windows11
#
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    You can extract WIM using wimextract ('wimlib' package) or 7z ('p7zip').
#
#    Put the following script together with previously extracted
#    'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir, copy these to the package root.
#
# You need all files listed in the _ttf_ms_win11[_*] arrays.Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgbase=ttf-ms-win11
pkgname=($pkgbase{,-japanese,-korean,-sea,-thai,-zh_cn,-zh_tw,-other})
pkgver=10.0.26200.9168
pkgrel=2
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
provides=(ttf-font)
conflicts=(ttf-vista-fonts)

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
micross.ttf                                                 # Microsoft Sans Serifc
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype
SansSerifCollection.ttf                                     # Sans Serif Collection
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
SimsunExtG.ttf                                              # SimSun-ExtG
simhei.ttf                                                  # SimHei
simfang.ttf                                                 # FangSong
simkai.ttf                                                  # KaiTi
Deng.ttf       Dengb.ttf                                    # DengXian
Dengl.ttf                                                   # DengXian Light
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

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(${_ttf_ms_win11[@]/#/file://}
        ${_ttf_ms_win11_japanese[@]/#/file://}
        ${_ttf_ms_win11_korean[@]/#/file://}
        ${_ttf_ms_win11_sea[@]/#/file://}
        ${_ttf_ms_win11_thai[@]/#/file://}
        ${_ttf_ms_win11_zh_cn[@]/#/file://}
        ${_ttf_ms_win11_zh_tw[@]/#/file://}
        ${_ttf_ms_win11_other[@]/#/file://}
        file://license.rtf)

sha256sums=('b3658eadae55e682b5f69eb64c439c1ecc8f196c0bb8d4756d145d13bc86476a'
            'e8f4e3baf6cc35fed6fcce3a540e8b39e8f6cda1d22a28f2ec8f526fef7a43f5'
            '86b32db9a06f9694e2a3760c42e5117bcdc5cc1255bb5186ca8ce0305e22f288'
            '267a411525980d648f10a7222a6ff1ebe4d4feeefbf9b3100cae2b5cfab5594a'
            '10df702864b1f89cb29ba0d6b97c04228338d16807e13e8d8c74b91aba5e5f23'
            'eaad201da94cb323401fdb8cc760650803ddf8fd704cb9fa56317e6c69bc6fd6'
            '57e93ff143572bcc092c1f56202d43ddc07bb119aa104c6d7af163470fb551f6'
            '0a8296747536ead27d5f48f67e911cc3b207742b3f704e66995251d12fd422e5'
            '7f150e9eabe5db3e1b0f9469dca5c96176bc2fbb306dc9d48b7029dc69c52763'
            '760539bfedbe24e7853ca8a621d9cb1f3de52036c116e81aae36b33c4ab60a7c'
            '2db491080305b349588b9851fb6fe960eee04cd7c1097784a987287d782f0a54'
            '64ca9b15ca79927c3c4c69094bb41f78e5f0d79e9501d9d381a8794b220eead1'
            '84e70ccc1664482f4a960442c7a166c91a1b2cf98ff88c33cb73f79403f66d7b'
            '6685c657a7e292083e28f19bbf1a1e90509ce3e1130dbc4ed1c62ba3f9140543'
            '6905f0ac846d1ec4326cd14a46cb7379204940aa293b098ee4c1a69723bbd165'
            'fa90f376ad37f308a819b341c8185f788d30a1012829278592eab45a41818d1a'
            '002c1e3378d02ed7dbdb3df1c94d433413a56f3f2f3aa8315a57720ee851dc45'
            'ec0dce5170aaaf2cf485d4ba39d86fbba1dd1c76d9140cbf75a6b84b50fb20de'
            'c165dbbc35bbf1fefae865c3e6b02404c8d182074fe04e78e221bab7d35ce3f8'
            'a873581d9f0886441bd45c5e425a734e86e063ef583b9cf8081b1aa03b871f1c'
            'c35742957794a81b6c73aa43d2f19e3d3d0c45a6dafbc2efcddd04ad6b3aeac8'
            'ff22b2841bc0aa0664b50c9215e8440f1da4f74bedd27ab33865f63f433b2681'
            'fc7fbc3fb456a363f1f719b0ec62ae093c78124bb6da046006ae7e217a6b8575'
            '128fdcfdfdd358e1624c15dd1f84a4d0689e59afcdefb81f8105efb2253b9c00'
            '872cdefea79e25ff1a8a814109593c23ed66ba46f5bb843815d49e1ab4e0be3c'
            '36eb300a76582b7d39f3d34834ce1255f0b9b2830fb2e81485c4b85a5ff7f03b'
            'cf00b507b3286870cc5064ebd0633c303f70b491a4af25eec2d32df413db0179'
            '7e8de70c92a891722bd3fbd623db005caab2bfe267e5dab5be46b95a44e0c7f1'
            '0b5b0484cf69ae973bd39380069f141271a4c9299b8885fa2d13f42aadbefef9'
            '9bc225ec52aa8f4b88b98bb735b1908bd72c9e31a12139fafcc1bd6c86bed3b4'
            '495577bf8ef74deab6ecc2e7acf63cd966184148f9bc2044a1068cd58501577e'
            'b6c66a1858370fe575629e19d53c05350738bf5105e18ceac07fe9efc9cd008d'
            '2314a03c53506fa79525bc479ea4be9c036d1ebd86a1ffb5837ca5b43ff51f07'
            '9311aadcbd919746f50d222fa0215fb44266d6993221c14a196f0725fdae464f'
            'a183b77b655df66793639af7874828fb50f748dc4af57ae40f758156f7f34634'
            'fa008372f8a94945d0daef9daf0bfb9e3fba3a25fd17f2607d47ac6861bd0303'
            '9be778c9ed418770f6b5a02064d9c0b47a8fdea1137618f0bec9ac4072430a45'
            '588f090ae3a6d31370457312683d14ee3a5bfbdaaa0a070b7c80225b55b23e78'
            '0e36ddf90102e476c6739ca4c8cc18ba8309d880c12558981d2e4d42de78fc00'
            'a031500bccd32b5d6e819699b774fc679c696ed4965b643d51a94eb398475550'
            'e4a66a0259718d0c8f4b6e14319b4803ced45afbddf3abba8b8c3e2006856206'
            '11e629cef937cd08f942aa1bd994a71302dbe2819c72c6d4c183a623acbb421a'
            'd82eeeb458f661d867f916d691fc6d3c53f8735fe4d5b04b54a5757321ee03e0'
            '2d61f452de49b57d9ef14ce8896bc1cd2ed8285c2e9fb2e73e78a4b23f91d308'
            'bac844bd41f847cf138737026d41c983387a1065535c32e78aa22c48708b52ad'
            'df59f9ea915957b22a389d68580bf40dc5bd05822cc65b5fdcc188c706a694e7'
            'ddd852f9e43a5e81af62a3f6654324ba7553d7d66101ab848abc1bd2d626ac4b'
            '38dffcaf1fac89492f7c56c600a14daf36ae42f7c21985cd4134ae113124a58f'
            '72a6cd94fab6c179392075d3fb361e269cdddfad41bb7ab385fa22a37e49a900'
            'd3e4bad27651d120ac8f2cea42cf4b4f077264fb243f66b3caffcfd35465f49b'
            '3f9e512f82eaf6f1b7869b82013fb79f6eaf1a41e75a0e7b96f31f35b1022ae4'
            'd8bbdb72e3f930157824b2e59677d3a912d4512c14a948e6656a2e3fb0c935ad'
            'c8ab96bc49ec1dc36936b5973fc143ca222c1a33ab27b87071a3bbc44d34ca9a'
            '97226e81f19eff8c8fb191745748bab920472c005d3ec4e23d9a50a12c471d92'
            '2ca2cfde263fa420e8d39420f075ee9ac80bc0794272c53ac4571a88f8a075a6'
            'b7397adf2dcc24ca790348a3c26deb2122b45e5728fd25fc588de4cf5a75b469'
            '89b42a12ea0379133fb2f4a1d1bd53058fb61e2343c1d509452d5761acc85b7a'
            'e47d594e2e2bc31b28f87b6f66483d32f925843ceb002f919c7a403aca48813d'
            '8e14668bbae03f78ed668dbe3261218881960dcd9fb80ad6c1d1dfb4226a57c3'
            '99f0af2d1941707fecda23da38bafbed5144a73a3720d773c05b9d4c445920ed'
            'd0e722b91ffd5391cc2e7d6e976f274d5aee9fe0b8d0fedfffe093763e695cde'
            'eb78c210d380fce7d3822b3a5ccfa808f1eb0390de6237f5460970679f393ce0'
            'a2efc8b8e51fbd031a7142a1ade8866fa904c0c349511abc579ee53f8a926f31'
            '8e8be40f1b949a9e5a99ed71f024ebf82167dc5f3c01e1bc7557c6b096a2c82f'
            '91046862e08fbade0bdd648e81c4efbe6a963947f8b6e32b64a28fe39073c468'
            '3cced0162ddb9e5f1e63ee1b36fd6e581c090318dce1a0af01b77f5ea9952c80'
            'b24aa49a4bcb99a0ffc60cad77f00941e4b121153d8b0a519c03719d9be6004e'
            '6cd482205e1390b32a2b6327e1e5039424e346172c187074eac12006bc51935e'
            '8134dbcd09e7b123c9a7f229d49cffbcb01352cc72ea5e1076b65d0dca9f73cd'
            'aeb9e4a6ec5cc59f4d72df8189032d7dbb28f45161cf1552174818b5465dac4e'
            'be525b9a6d307d73c23908cd269be9be754210a9d93c0c1eaaa126d2a174290a'
            'c886161fa6d102090ff992519b6fdc73057a0e838e9d40b27e187e9e61300a92'
            '866557576dfc772395301b581eccef4c0daf1dbb75f9667f26784b260bce7da1'
            '3cb01ed58922781a62af14e738cd96023957f60d8d6733920a8808614f477dd8'
            '3432de66f335c7e3058154f7cbb13ef051195653a544b49b1992267e558b33ef'
            '4dc2db1870047663878da07fa5f8217e518ef875c8ad33287fcbad6aba5a7e73'
            'be191c94a0c7172870c3c87a136bd5aa67cdca7bc091de89242fb64ecb0f8fae'
            '51d300301197dfb0621a8d8b275274d408dd15a7edda4cc4a8f7666504d582cd'
            'f07cbd7886f4a1a5255a1bdf4ca5ea29db3be3357414003a92bec5d1c3165578'
            'a162ceeaf701b55d11c542daf1c39c52bfaf686496505bff2eb75ca24814c136'
            '2d9b22d71f72de2823fee5d9c8bc1b0fc32b2577c4c27b9ec6abdbb8df0e1731'
            '454295546b78810c95ffd7fc9d57890ed15a03b7cfd0d7e3485786400152b740'
            'a4a35dcc62cd30e1a6c97b695ecef83e59d2b149e3af834f6a49f11851d56b37'
            '27ca1ab4bd5ad3b0404ee6a9a03b143408dbd7e5a4c9e4b2054639c03fc0f682'
            '9f71aabf76ccc757d25e18801d6a37e45cacc8b74c8b42a19e9f36ca99eef594'
            '74d4b98aabe85e16cb2fa6583c93f9f17642234d030a38462c36d1bcdde65928'
            'ac278d932d59558a76817e98051b1dae53867aa81ad83e5198b1b4c4b8066a08'
            'bbf1192965e5266fbf23370416337d2861fc1e8bd349def93f2994ba67382fc3'
            '9af03d4ad44a3b413d92f7de48b94aa7cc8a1471a75d498406eae837f62ee1d1'
            'b16ed1a15e0cabea8d41d9f8899c253cd61ac466af5e3980d02bd0cf311c2267'
            '931c5de5c70401d9324d5014c123802b4fb753000360ceb2f56c589403cd58c5'
            '54fbe2c70af7c85a97bed0573227e3ccc4b2486012e3ca2a40c6bc77065846f5'
            'e7f7a88b65188328aea58670f955022e23c712f55679524729da1e4e03c49d88'
            '3a29d114cb5229e8dbda5bef6c69be4a210a13b7277de4d66e9fc86963226f6c'
            'fe3e8bdd64c1c9f3b9cf5189d06510c80d72cec28e03d04bffc560f77eec58d1'
            'dfcc306777a594d2815368547dd897e2ac82aff8073e55d9e682569939e49b81'
            '9c9dc0cd0fd6b1a06e8f406d04bb15a88aaf20328d3e166c12d6bc7994b781d2'
            '87942234ab0cc4400088648bef8d1f7afc4c44e676c7ed6b32ca31462c18307d'
            '6a8481fe107ee547893c018b13dba291c2020bec3de5da6525d9ac09f6bc2105'
            'f3245f5f38f61bd1ceefb0f1338a5b88a21e6220832c2f43a38bbc7e1547c36f'
            '14f2ebcdaa1b77e5993a8533662e4bd3ebfe2c5771b6daafd8ccb39b2ad588b9'
            'd71f81c83ec63eaa32d36d5df7be1d9e71d3ea9150f47cebda2924923cbbf18a'
            '67461fabd8329d0d8ad62689cac642b34fac81c754ff9077ad211160ec62282d'
            '9bcd6064e3b52fa30a347edd6e82506e2ec8b1602930b423c629a82c10468a5b'
            '4bde3e6392b96910fb59094c6c1a4dbfae18fee78d0bf13dc30616837c4f95db'
            'cd24b5617c1e26572b0a7fe7e558f7121ca42c36f7b50e8d9216ac222a1c0a93'
            'd923a57f781f06198167da4f58287be7ac64a954a47aff4295e078a42b4b68b2'
            'cb2021bbfe40b21ec564848b8d702125661594e1b4f1eb2e77fd8a98b485cf19'
            '0acf409fc61e1560ea0384f8c72bf87c6fa7282077420657979680ee21dad2a4'
            '7a183cf1c6c56b9609fcc16eda8b5229fbc11758a21e669ec00343239b02192f'
            'e8cbc0b2afcc14fb45dfb6086d5102c0b23a96e7b6e708f3122acde1b86c9082'
            'c0ca810a242c4482594182db40f0f9d35a3d51bb2eeac750e6e867b2110eb00e'
            'df8d94382f73e6d2197b60653c3d55c28ab5cf127a82e65b8af4ed1b52fdc412'
            'fdec3a7efacd57913d3c14111837908ccbabea5b0b44ec62527eb73acf743afb'
            'de0b632015447f28c2db41c8e07c745cedb05ead5dbc2e73f19da14d2e5f2151'
            'cfc2acbf9ae0205a0a258e564bdbf5466a4e49a95281a1d2e72690f149ec837b'
            '538949482d964e9f353a3a8d860bb3eda93b46b830f3b677e4f53eb2ff3a6e7d'
            '03e4e45bb8ebb6d055a5584166cc26712bf7e746ea29cb6e548341361d31dc85'
            'f5151d081f6afea4c26464e0cd5e695f57a99209cfeea2f483c3108684660eb6'
            '1878842d8dbdf8489794af0bace95a956db270dfa506ddcaabf94fa827b769ac'
            '80aef1c25135b945e9de7d09e6445c386405eb2e0ea7032d4cd00a2fe3eef0ae'
            'bf15e713f2ae14f85201ad31752054b0d88adb64634d9a1f5a7bc032f981ff89'
            'f9b362b1e0e09880cdf71852e3cc6dd6f7babb3fb6c12019f39af2135c6233cc'
            'a96d49aa45e2800f49734578e5f5c1eaeb142e60a1fe1a4cc4d885170be5dcfe'
            'ad02cdfc06e144ac45f318e8e5a64cbe04c7479d4beb91d25f5a319a466b1767'
            'ca9a670f12d0e47c20441012a22f78ab17c1b126818e0e887ef7db6ecf5e76b4'
            '15f58cff987dce2ca1e7740ca6001b8e4e2589ea80898fdedca26d2726979f7e'
            'f7a9d979c27baad75ebcd41ea45113919576c2e56af9ffd483dd9d0ef9272a25'
            '1526ac24375f51f6eb73bc2d3f8072dbe4a80a3a65217677c9d9a84f67dab2ab'
            '2a476ca00b5fbbbc12a4c5335634722b11a495ed87429284325701f1e36b596a'
            '9cadcd0ab3d549446b51001d9896773d87ad012d93d842532f321eca514bffd8'
            '9b1959db3b3abeb7efdaec26edf7dfe871a6039de8d614af7248575207be629e'
            'fb8fd25dd5ffb09951f54d2038b7a44405659dcf7db059f502a34d62e4d689ee'
            '95b3e69321f4e55f6ecf36b29d1e31a0c1205acfde0117df6472a17494c3cbd2'
            'e051009b42b454352a90ae0c9b8adb58bbdbcd168768750b35bc3357510de141'
            '236df24be867e527bdf810d00eb5c38f18244e776238a9f5ca937363267a9169'
            '3ae7cf364a29b9da69eff7333decb88e577c262c5847df2510e37695e25a8395'
            'd79c55e68b1131eea0cc1c47be4f572d964f28c682e143db2ad09c1e4cb07a3f'
            '4508821b3dffe01f0ef5e5326a3e60df705a44633858811f67b6982dce3f6ee6'
            '7e9bdf90bb5d3fe1b5975fc8ae31944b8fa674122261f92c28d4ec0b9c482fa1'
            '1fd5fc7046e0eea753988ee06d1a5a731df68475614e2174fbba9b4800f392ac'
            '7d55cd4801102131d991630cea74534dcf73a9fabf4a33e54fe05dfb4f5aa790'
            '15f1162a68b5859f246d89ea62aed711b1994817c72e78e3df5d205c89c5c6e8'
            '8f8afdb3ec7047118f6dc51b29d395e697ee6770d0afd0cd407457e2ad6e93cb'
            '1dcd304f0ba642dbc3c3f3ccb70c24e9fad7ada2e2d5d0061c7cacab86e8df92'
            'a7bc75937950d0f217f79313631d81f5b92459c414a4099d6ea3c0c0262a716b'
            '0ec2bdbfc2ba99d9fb05b6f7c511e7ab8b7c055e2d644570ad777455d6e9796d'
            'c96226cba7f50e94b534a5f8ade6a54f48a03be7c73360524eda5cbce4de34b6'
            '5dfd7a4c708caeefae42cdb9540946de042beeb8c069dfde0dbc14c2fa0705ae'
            'SKIP')

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win11() {
    pkgdesc='Microsoft Windows 11 TrueType fonts'
    provides+=(emoji-font ttf-tahoma ttf-ms-fonts)
    conflicts+=(ttf-tahoma ttf-ms-fonts)
    _package ${_ttf_ms_win11[@]}
}

package_ttf-ms-win11-japanese() {
    pkgdesc='Microsoft Windows 11 Japanese TrueType fonts'
    _package ${_ttf_ms_win11_japanese[@]}
}

package_ttf-ms-win11-korean() {
    pkgdesc='Microsoft Windows 11 Korean TrueType fonts'
    _package ${_ttf_ms_win11_korean[@]}
}

package_ttf-ms-win11-sea() {
    pkgdesc='Microsoft Windows 11 Southeast Asian TrueType fonts'
    _package ${_ttf_ms_win11_sea[@]}
}

package_ttf-ms-win11-thai() {
    pkgdesc='Microsoft Windows 11 Thai TrueType fonts'
    _package ${_ttf_ms_win11_thai[@]}
}

package_ttf-ms-win11-zh_cn() {
    pkgdesc='Microsoft Windows 11 Simplified Chinese TrueType fonts'
    _package ${_ttf_ms_win11_zh_cn[@]}
}

package_ttf-ms-win11-zh_tw() {
    pkgdesc='Microsoft Windows 11 Traditional Chinese TrueType fonts'
    _package ${_ttf_ms_win11_zh_tw[@]}
}

package_ttf-ms-win11-other() {
    pkgdesc='Microsoft Windows 11 Other TrueType fonts'
    _package ${_ttf_ms_win11_other[@]}
}

# vim: ts=4 sw=4 et
