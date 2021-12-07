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
pkgver=10.0.22000.348
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

sha256sums=('c9b76220a5be42ead4733611e417cd65c5fd8aeaa33eb56576ac378a37d130a1'
            '766f06ac8761f82f25d032a220e89438f6064591af9915061f20b949efdedf69'
            '79a5742b865cf06891d4ae43e42cac0e5169c7b7b06b5b3c24ef8e0966d27b62'
            'e432c1b3568bd207e30e3d52d41e6431ea53a679eb52dd79b1a36aa6a4f3b994'
            '10df702864b1f89cb29ba0d6b97c04228338d16807e13e8d8c74b91aba5e5f23'
            'bff1ca87ea35e376691498c618556411f0ee71784b32aa351e6e8f9e8bd609dd'
            '198e8dac512206f27c9bdbfeb3d5b3e55a33de9dcf58d801823ef8c5ef5a76dc'
            '4d5c56c07c41315022cd5a24966ade3983ceebce8bc81524e56e4632dd3f242f'
            '5c85b9adedde710e754b3163005291eca16cd0ccccc7c8d7ff526070e8980202'
            '95b49ebc8244b88ef49372833e8964dad6a3d7fa53e948609c5c73d5a1439912'
            '67374b8f4735eabfc7f173f28dc1789d7dbd4e2919532d173f6d697211cc3263'
            'a49f79197a091a82c45779b3cca7bc2cc7b471cf1447b55378c565c4f06844a5'
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
            'cd8c89ecdebdec50a72f19f3794476ce66194bf9556f68ca741cb86100708793'
            '97226e81f19eff8c8fb191745748bab920472c005d3ec4e23d9a50a12c471d92'
            '2ca2cfde263fa420e8d39420f075ee9ac80bc0794272c53ac4571a88f8a075a6'
            'b7397adf2dcc24ca790348a3c26deb2122b45e5728fd25fc588de4cf5a75b469'
            '712f43bb6497345529595cca23db7326efcc7a8f427e2567b1f60a0b0e65c243'
            'e47d594e2e2bc31b28f87b6f66483d32f925843ceb002f919c7a403aca48813d'
            '8e14668bbae03f78ed668dbe3261218881960dcd9fb80ad6c1d1dfb4226a57c3'
            '99f0af2d1941707fecda23da38bafbed5144a73a3720d773c05b9d4c445920ed'
            'd0e722b91ffd5391cc2e7d6e976f274d5aee9fe0b8d0fedfffe093763e695cde'
            'a2efc8b8e51fbd031a7142a1ade8866fa904c0c349511abc579ee53f8a926f31'
            '82f5dc0e0cb9f41efad49e5423c76768ae0fc96e062a0893b6c729b863033013'
            '91046862e08fbade0bdd648e81c4efbe6a963947f8b6e32b64a28fe39073c468'
            '3cced0162ddb9e5f1e63ee1b36fd6e581c090318dce1a0af01b77f5ea9952c80'
            'd0dfad2f6bbe7ff7c0f96a0c80a28bd4f4624f900573a61abd9d29406d3775d7'
            '91283e8af7f9eca8b14b498b484b35d49c3bd3144ab7e25aa4934297138ea28b'
            'ba32a222b23d727267cf1aba4e5296fe84ce99b9d910915103fc085d7931bc88'
            '1b242874a2f57529060e770ba313e027a99d40b3c36e1c7e8b2dece16ad6ed88'
            '9adf7d619c593ee38c96af06bb15b4bd893e4087bcc1a0b7becee8f4ae15bb1c'
            '45e7504e9bbd70ead482ebbddbeec04b2bea9f490b994658a95146cdf0733449'
            '1a2231bbd4fad4a3ac8c0b8a93af0bce58324a8b3605df16038a9e660a0c072a'
            '7726b24daa0c1f47e528d8df78b98717bdb4425bcf37e50330945e32c6d17d7c'
            '38a85c09ee4fc558e7739ebdd1a15a06e2846ebb787cf73b1b6476a3a5b22000'
            '9f84a0a9193fe1d6335967f46606997a208adde053d006b21c03f9375ec5d416'
            'e17738f092c8b02f4443867a7dfcdde66fb4cd6f6b10de8e40b2f3192f8a5835'
            '33212faa85fad61785cd6917172378b798bc9f5d4c47c121437354f47980aa6f'
            'edd76b88c44432ba1818992259c31d45abd28fbcfbb3eeebad3f6af27636213c'
            '9cd6a9b0093476f7a717dcaf19813fcea7565afe1bffd6ad8bc0f0b1cdb38003'
            '9853283466bd43993b9813215281fb9c7090cbd8e9b5453f6d0d040622e117e2'
            '9959977d9fcf8ebc5fe48f6ee418f05378132b47d21bd5dcc798ad7cff274006'
            'd2f8326a354456d93e78b0537c58793e7072c3617af7d9ee187f10d6d595f510'
            '3c1f1ab287ba9e520fb39f0bd3a8d6b00c2d24d35ef0664a77974646d7aeb7bd'
            'be1f89db95982d7ee568de72219457f7330260c4b742707ef3c5b5438a453840'
            'd8d27dc02f26f9f4c30a2b86d93e99492eef702a107af42f4df8a4e049c4e1dc'
            'c7a5df780936c04804287e32c1b77e78b9b0e46b8d2723a85bda987eec8de024'
            'bbf1192965e5266fbf23370416337d2861fc1e8bd349def93f2994ba67382fc3'
            'b890858df485549d20fcb0a2c519dffe9c5c155d16b55e0b9252d6e66db555e5'
            '68f92341975acc275c7d4a2ec52a1569b70e992b521c42b30f29149806421674'
            '30785cb0787fd4e74bbde696341c650b0d83bada16a6736d7913af129e01d560'
            '399d33cf8ffee6406c4cff05f76034fd92bd56030685f364c1e1f0e3d9e8d13f'
            '06e8fdc2e44a0e3ae429995a5c36c2087956e069b4884aeebff7d872d973ba87'
            'df02eb0e8644b8ebecf1e6c7ba2807871dd291ffa7000cd09916338e92bf53a8'
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
            '42a6dc5e235f3112b19619d6286e4c4a06795b6bd3aefd8351e1e58ba756dbda'
            '87d6272ad8a740c13435ea1c74c2b6f6997b3e2ce607565b53d8ebc5848fc318'
            '7780a3af82a7ef7bb7e5d7637606eabfa965f35ce17561ac875e2b3ab36562b2'
            'fd39e43791718f92bcae9e6459196eb25bb426becb880ef8df5380fd5cd3d11a'
            'fc41c2fce2d9edd8156c67999f0d1ca48c44e9716f55c868f28f298bafc77557'
            '796dc7e97b357f9c2ad10044d01a86d3fb49cf80e3693011eb055c466c995de0'
            '16d0c83e99ca3cd56a85966c4ff2c5f0c0f8a5a7140a7594b2ec3e404c8e96a0'
            '2e2fabd71aa30f0d7039b879ee58441a791e095a6656064eb9d4a84a071e5e8f'
            '346c3d9c8c827faa22c0d7951a9d6e2dcbb1ceb9501ee4533ddf8026ddc21735'
            '6e1908cad924fdf59196c7dc84d069880bdb3c3d1b7c7d9750cfcd5a22de6a4e'
            'e4b3b9d058750fb80899c24f68e35beda606ca92694eff0e9f7f91eec7a846aa'
            '06e1a30f687ab7d39f533447b21e84d51e0cecdaa6bfa060c87136b168811bdc'
            '2db3f3100589c5795f7917ebc25779d23b69dd19047a963190d9357a5e0dc34c'
            '0b50839f0e13f9e1607b46568aa953fc1491eb3f867f2737e6a4ff9eb3696aa9'
            '920f472051f70e33887909a4f2c91541a2b3afa7a4faf577acf350020cd29d46'
            'd3b01af9bfc265ee4057b76c897243ed42f14d62a78b7306084e54dba37a548e'
            '814fc6cc5407d2137022a1ff8587cfa43d5a2736b2ab5378ea49ceb5c072de37'
            '6406c765cfb81bf302d767cb2383a5a51e26e50d7239ed22233dbae689ae1f05'
            '9090931d496a272ab9f1382480332e6029e636a9191fe21d158adbf148acf0df'
            'ef2c245c5b895e4cb4fd67b1842141921ff17e5812d8daca7f1f7f760e848552'
            '21b256efb2eaaf7bbbf99865bcda5a3e04bb78d9740929d0d6e37d4cc50ae7b0'
            '5dfd7a4c708caeefae42cdb9540946de042beeb8c069dfde0dbc14c2fa0705ae'
            'SKIP')

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win11() {
    pkgdesc='Microsoft Windows 11 TrueType fonts'
    provides+=(ttf-tahoma ttf-ms-fonts)
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
