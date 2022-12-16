# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
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
pkgver=10.0.22621.963
pkgrel=1
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
Nirmala.ttf    NirmalaB.ttf                                 # Nirmala UI
NirmalaS.ttf                                                # Nirmala UI Semilight
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

sha256sums=('baa251526d6862712a58e613ef451d8a2b60482142ec6aab1d47fb8e23e21a7c'
            '8df7a2c69fc4044835814899534e5fee6e72f78285b5a6dcb19531142b51d742'
            '090b89742910172c69e1fd3b1814ad4e482a1c712b87d24e96b377beaac3a6d1'
            '94d0872622e6d592f01440b58dac8f5d7e010509bd76bb71cbed71fc5f4dc173'
            '10df702864b1f89cb29ba0d6b97c04228338d16807e13e8d8c74b91aba5e5f23'
            '6147a218696424127035e25c4be335c73a7d69b052b714d05806b3c17898b49f'
            'df2c69a18a462e5cbc97d04a033f3bd7cd0abfe818381641f8c2dee7b7c43dbd'
            '5e8b2eb430f543eb304f08f44f5eb02ccbc39ffdc95400aae96f5dcd2aea73d8'
            '21390a7e84b61224916e810fd00344ad9ad4f1d9115151a551845a4387d20b10'
            'b699a59faad65272ee48a4d118d6bc743d4cc4ba338cb1c6347deec58aa1e1a0'
            '744d3ec1b277e3652ba8f8d45c89f83c99b7ecf3eb2dfa27306d7be56d3ee030'
            '67ac784ac390f6c48119e76f9e34589f9a86b8974f561a6159545b858ab4cd41'
            '84e70ccc1664482f4a960442c7a166c91a1b2cf98ff88c33cb73f79403f66d7b'
            '6685c657a7e292083e28f19bbf1a1e90509ce3e1130dbc4ed1c62ba3f9140543'
            '6905f0ac846d1ec4326cd14a46cb7379204940aa293b098ee4c1a69723bbd165'
            'fa90f376ad37f308a819b341c8185f788d30a1012829278592eab45a41818d1a'
            '9f02f6bf076197ed2a1335fe59a3bdf88e7ad4a849bf68037a528f37cce36791'
            '5346840fa85a1969699dc97635e838cd2c42dad7f8a4999d7368eb888fceb04b'
            'fc68cb42582e1207bcc397df7b60870a74ae068b17d7bd79f2e9f63af89796b4'
            '1614c0d3a6751eb46b2c52f09ae23dd61f769beda83058269cb0653c049eae43'
            '0e14f663fa34460fe9a07bb32d0017a180a4a0c8457d279fbfc5d8452753b477'
            'e8b17bc645c098bbc5167acfe13f0e3c63f0f417d539aab171db7eea3c40eab2'
            'a7da3ef195158acd8432226a21f2940f1806a9c8d079f18d0a9ab475f50f9659'
            '56567bc71e89fd173674c78f02b474123a02561b246526a22600c3a29b2fdc65'
            '65aece2928246837317e093a11c6df5cbfc67035f1e045c9771f7c408be1faea'
            'c691699eaf218e702b2d77c1f62d2c080be6248f1c11018b0b2556834a9cecb1'
            'c6e6ce8119fdd47ec6a5449a08e2d2ad7f41ea03143aae193068ed9fa58eaebc'
            '8fa803e5abc7fff0c78c62cd22d07c705f3273c53312380c36ff484246ed3c1b'
            '81e2a95d3c49468029c07e58f71a5f0ca4cfcb617eaf6bd77576fb03aa430bb2'
            '1df27cbcc8a9fb7f843bc24e257b78e8ff93de70e8c1ad2caab8379e7d6a1eab'
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
            '93c3ff526c19d03496c01c6a1bfd1031f97af021a13e859a89dfc717a0b6b6ec'
            '716c08d704f154870bd9fb78b185d0b644912301dfa9c9e6daf45bdb4832a299'
            '5861588608d3a3775d921a7e4acb8362b21630c6b63718bc68adb7137ce53beb'
            '8fdb188252a2db0f020c89831bddb61cadfe290c3616fe534479b4d3b10d09c1'
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
            'b41c5227ddfca092a57603067ae59933473b1a63d54c9cc90b174e5741088853'
            'e47d594e2e2bc31b28f87b6f66483d32f925843ceb002f919c7a403aca48813d'
            '8e14668bbae03f78ed668dbe3261218881960dcd9fb80ad6c1d1dfb4226a57c3'
            '99f0af2d1941707fecda23da38bafbed5144a73a3720d773c05b9d4c445920ed'
            'd0e722b91ffd5391cc2e7d6e976f274d5aee9fe0b8d0fedfffe093763e695cde'
            'a2efc8b8e51fbd031a7142a1ade8866fa904c0c349511abc579ee53f8a926f31'
            '3fb53de6c75d56369af4016d27a3a1551af71a2a287358e7e44e6f6c5e0badc2'
            '91046862e08fbade0bdd648e81c4efbe6a963947f8b6e32b64a28fe39073c468'
            '3cced0162ddb9e5f1e63ee1b36fd6e581c090318dce1a0af01b77f5ea9952c80'
            'b24aa49a4bcb99a0ffc60cad77f00941e4b121153d8b0a519c03719d9be6004e'
            '6cd482205e1390b32a2b6327e1e5039424e346172c187074eac12006bc51935e'
            '74f2b3d0c20cf7380eb121a09fd7cdfdc1ccdd12a00db83caec0feb48b4db9f7'
            'd105038ae445a7ab3e7c037eae9c6a436f71f603136f353e8338cfca40e6ca18'
            '821ee79ea06ea1ce24964baf760d740086e8e1e6b88528978307cf1729cfaf1d'
            '79872dff519fde7a0c7cc8ed4f454a5fd7fd7628c527dc74473056a32a9eeb38'
            'fe28fdf790453728a07233877c0a708477319fa798363ae4a1657d04fd173416'
            'd3366c28fc5d73644465fe08bc2d8571710955238e525dec4c9d6b5d22fb92fa'
            '483bb4800d30031ae1970dbd44a64f2f476a9fcba326bd0a216dac6e0b92e333'
            '254ad309e8f6b49cf0379a565adaf85a78994b4420b98a94119f45449d7b70ab'
            'e17738f092c8b02f4443867a7dfcdde66fb4cd6f6b10de8e40b2f3192f8a5835'
            '33212faa85fad61785cd6917172378b798bc9f5d4c47c121437354f47980aa6f'
            '4e3cec7d1995b6d74102c0b4669e4507ac35cbf9a9830a93ac14c6e40dfe36a9'
            'fec0897934d26625b17bb3e4ffb3a7b0b6a138f6e61d5eff7535417cfbbc7884'
            'b381730d47408ced8f104b62c9042a6abbbd08501a37f14b76858760a6cf176c'
            '60cd474595d07bbdfa9d87de1a1e24c876e218d117c4a3098e0ac937157a1b9d'
            'd2f8326a354456d93e78b0537c58793e7072c3617af7d9ee187f10d6d595f510'
            '27ca1ab4bd5ad3b0404ee6a9a03b143408dbd7e5a4c9e4b2054639c03fc0f682'
            'be1f89db95982d7ee568de72219457f7330260c4b742707ef3c5b5438a453840'
            'd8d27dc02f26f9f4c30a2b86d93e99492eef702a107af42f4df8a4e049c4e1dc'
            '55be3490211845a51960c129be1d793782765383b2dfcc969228d4ab5ae8fe64'
            'bbf1192965e5266fbf23370416337d2861fc1e8bd349def93f2994ba67382fc3'
            'f936530a7ede296580f897c47e7a3fa48a9483166080ce05105673a1339cbf0c'
            'a05f9206c44ba5795690f03fc767f5e5209bf913e23cf61f45d2ed84c3a424e5'
            '43a890795ad133d73568d169a35924f40416be8a6950a1a03263052ec8e95b8a'
            '56735cfcb1d3feac66d5d9bb446c8598e522dc03c54923943899217c227bdfab'
            'f3a1bbc53e7c3c21262f033c4d73a55a990952cbd4644ea42cb9f0c4c4640e40'
            '914ae3beb26a5948dbf67d87a7f86f10abe9407d420fa6a448f974e41d0f3727'
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
            '27c9b8e4cc7c5cbd846d1fa978b7713938e8ae766875962c70c3986b004bbc85'
            '9d0437d151ddd907d72ba9ba348d670575a86e4f5cbf018de18645f2353140e5'
            '14afc5b98fc53165a2f760fcff11f6ed55ab80f20ae46a2a4a08b7af2b9044d5'
            '95392428a804b937919526fec91bab64200664f7f22f777211da6bb244988f56'
            '0086c19e81d293a542e7d75564c645fb58070cc850aefebf8fa1c397858e510c'
            'a541834fb9cdde9bd6d2c3ff1565cb0bb5ccf7a15e4e9daf2cb58d9b1cf282aa'
            'a7217a2e590c86141bddadc74a2bcdff2efe210db48469a77a749e0446d91ea9'
            'df8d94382f73e6d2197b60653c3d55c28ab5cf127a82e65b8af4ed1b52fdc412'
            'fdec3a7efacd57913d3c14111837908ccbabea5b0b44ec62527eb73acf743afb'
            'de0b632015447f28c2db41c8e07c745cedb05ead5dbc2e73f19da14d2e5f2151'
            'cfc2acbf9ae0205a0a258e564bdbf5466a4e49a95281a1d2e72690f149ec837b'
            '538949482d964e9f353a3a8d860bb3eda93b46b830f3b677e4f53eb2ff3a6e7d'
            '03e4e45bb8ebb6d055a5584166cc26712bf7e746ea29cb6e548341361d31dc85'
            'f5151d081f6afea4c26464e0cd5e695f57a99209cfeea2f483c3108684660eb6'
            '1878842d8dbdf8489794af0bace95a956db270dfa506ddcaabf94fa827b769ac'
            '80aef1c25135b945e9de7d09e6445c386405eb2e0ea7032d4cd00a2fe3eef0ae'
            '707585b9acfc1507d9bd943bb5435f75768274b1a12b1f71de76ad78be4d7e7b'
            '37598a7b023c80f3e56c44ed91e01936a96b3e81c888bee82f85113da39f9468'
            'b4329b395966137485b324d0c15817e99f0167d559d81a01e90d8761d52261b9'
            '70f53470e5467d6b0dc2af2f58cdf2622629be2a131652615d9ef8c00a410fec'
            'e0b00c65dbf786eadb4345f62e456d7462b960a5b15c9e07fa5c8809481b9a5f'
            '78709a285aef168b5c2d8073dce837359997a14244d6ed904883717d60eed3b9'
            '796dc7e97b357f9c2ad10044d01a86d3fb49cf80e3693011eb055c466c995de0'
            '16d0c83e99ca3cd56a85966c4ff2c5f0c0f8a5a7140a7594b2ec3e404c8e96a0'
            '2e2fabd71aa30f0d7039b879ee58441a791e095a6656064eb9d4a84a071e5e8f'
            '346c3d9c8c827faa22c0d7951a9d6e2dcbb1ceb9501ee4533ddf8026ddc21735'
            '6e1908cad924fdf59196c7dc84d069880bdb3c3d1b7c7d9750cfcd5a22de6a4e'
            'e4b3b9d058750fb80899c24f68e35beda606ca92694eff0e9f7f91eec7a846aa'
            '06e1a30f687ab7d39f533447b21e84d51e0cecdaa6bfa060c87136b168811bdc'
            '2db3f3100589c5795f7917ebc25779d23b69dd19047a963190d9357a5e0dc34c'
            '0b50839f0e13f9e1607b46568aa953fc1491eb3f867f2737e6a4ff9eb3696aa9'
            '73293967f4bb2ceb68a40d642d7dbe410ea55abb1410ba94c02d9d88e4d055bf'
            'd3b01af9bfc265ee4057b76c897243ed42f14d62a78b7306084e54dba37a548e'
            '814fc6cc5407d2137022a1ff8587cfa43d5a2736b2ab5378ea49ceb5c072de37'
            '6406c765cfb81bf302d767cb2383a5a51e26e50d7239ed22233dbae689ae1f05'
            '9090931d496a272ab9f1382480332e6029e636a9191fe21d158adbf148acf0df'
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
