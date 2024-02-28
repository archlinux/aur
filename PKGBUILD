# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

# NOTE: You must own X-COM: Terror From The Deep on steam
# Download the files using steamcmd (available on the AUR):
#   1. Start steamcmd
#   2. At the Steam> prompt, run:
#                   @sSteamCmdForcePlatformType "windows"
#   3. (optionally) Set the preferred download location with
#                   force_install_dir /path/to/dir
#   4. Log in to your account using:
#                   login your-steam-username
#   5. Download the game files by running:
#                   app_update 7650
#   6. Exit steamcmd:
#                   quit
#
# Then copy and rename the data files to the same directory as this PKGBUILD
# A script (copier.sh) has been provided to make this process easier.
#
#   7. Make the copier.sh script executable:
#                   chmod +x copier.sh
#   8. Run the copier.sh script:
#                   ./copier.sh
#
# Finally, run makepkg.


pkgname=openxcom-tftd-data-steam
pkgver=2
pkgrel=1
pkgdesc="X-COM data files (from steam) for openxcom (Terror From The Deep)"
arch=(any)
url="https://steamcommunity.com/app/7650"
license=('LicenseRef-custom')
depends=('openxcom-git')
provides=('openxcom-tftd-data')
DLAGENTS+=('localfile::/usr/bin/echo "Could not find %u. Use the copier.sh script to copy them into this directory"')
source=(
  "filelist"
  "copier.sh"
  "localfile://ADLIB.CAT"
  "localfile://ALART00.MAP"
  "localfile://ALART00.RMP"
  "localfile://ALART01.MAP"
  "localfile://ALART01.RMP"
  "localfile://ALART02.MAP"
  "localfile://ALART02.RMP"
  "localfile://ALART03.MAP"
  "localfile://ALART03.RMP"
  "localfile://ALART04.MAP"
  "localfile://ALART04.RMP"
  "localfile://ALART05.MAP"
  "localfile://ALART05.RMP"
  "localfile://ALART06.MAP"
  "localfile://ALART06.RMP"
  "localfile://ALART07.MAP"
  "localfile://ALART07.RMP"
  "localfile://ALART08.MAP"
  "localfile://ALART08.RMP"
  "localfile://ALART09.MAP"
  "localfile://ALART09.RMP"
  "localfile://ALART10.MAP"
  "localfile://ALART10.RMP"
  "localfile://ALART11.MAP"
  "localfile://ALART11.RMP"
  "localfile://ALSHIP00.MAP"
  "localfile://ALSHIP00.RMP"
  "localfile://ALSHIP01.MAP"
  "localfile://ALSHIP01.RMP"
  "localfile://ALSHIP02.MAP"
  "localfile://ALSHIP02.RMP"
  "localfile://ALSHIP03.MAP"
  "localfile://ALSHIP03.RMP"
  "localfile://ALSHIP04.MAP"
  "localfile://ALSHIP04.RMP"
  "localfile://ALSHIP05.MAP"
  "localfile://ALSHIP05.RMP"
  "localfile://ALSHIP06.MAP"
  "localfile://ALSHIP06.RMP"
  "localfile://ALSHIP07.MAP"
  "localfile://ALSHIP07.RMP"
  "localfile://ALSHIP08.MAP"
  "localfile://ALSHIP08.RMP"
  "localfile://ALSHIP09.MAP"
  "localfile://ALSHIP09.RMP"
  "localfile://ALSHIP10.MAP"
  "localfile://ALSHIP10.RMP"
  "localfile://ALSHIP11.MAP"
  "localfile://ALSHIP11.RMP"
  "localfile://ALSHIP12.MAP"
  "localfile://ALSHIP12.RMP"
  "localfile://ALSHIP13.MAP"
  "localfile://ALSHIP13.RMP"
  "localfile://ALSHIP14.MAP"
  "localfile://ALSHIP14.RMP"
  "localfile://ALSHIP15.MAP"
  "localfile://ALSHIP15.RMP"
  "localfile://ALSHIP16.MAP"
  "localfile://ALSHIP16.RMP"
  "localfile://ALSHIP17.MAP"
  "localfile://ALSHIP17.RMP"
  "localfile://AQUA.PCK"
  "localfile://AQUA.TAB"
  "localfile://ASUNK.MCD"
  "localfile://ASUNK.PCK"
  "localfile://ASUNK.TAB"
  "localfile://ATLAN00.MAP"
  "localfile://ATLAN00.RMP"
  "localfile://ATLAN01.MAP"
  "localfile://ATLAN01.RMP"
  "localfile://ATLAN02.MAP"
  "localfile://ATLAN02.RMP"
  "localfile://ATLAN03.MAP"
  "localfile://ATLAN03.RMP"
  "localfile://ATLAN04.MAP"
  "localfile://ATLAN04.RMP"
  "localfile://ATLAN05.MAP"
  "localfile://ATLAN05.RMP"
  "localfile://ATLAN06.MAP"
  "localfile://ATLAN06.RMP"
  "localfile://ATLAN07.MAP"
  "localfile://ATLAN07.RMP"
  "localfile://ATLAN08.MAP"
  "localfile://ATLAN08.RMP"
  "localfile://ATLAN09.MAP"
  "localfile://ATLAN09.RMP"
  "localfile://ATLAN10.MAP"
  "localfile://ATLAN10.RMP"
  "localfile://ATLAN11.MAP"
  "localfile://ATLAN11.RMP"
  "localfile://ATLAN12.MAP"
  "localfile://ATLAN12.RMP"
  "localfile://ATLANTIS.MCD"
  "localfile://ATLANTIS.PCK"
  "localfile://ATLANTIS.TAB"
  "localfile://A_BASE00.MAP"
  "localfile://A_BASE00.RMP"
  "localfile://A_BASE01.MAP"
  "localfile://A_BASE01.RMP"
  "localfile://A_BASE02.MAP"
  "localfile://A_BASE02.RMP"
  "localfile://A_BASE03.MAP"
  "localfile://A_BASE03.RMP"
  "localfile://A_BASE04.MAP"
  "localfile://A_BASE04.RMP"
  "localfile://A_BASE05.MAP"
  "localfile://A_BASE05.RMP"
  "localfile://A_BASE06.MAP"
  "localfile://A_BASE06.RMP"
  "localfile://A_BASE07.MAP"
  "localfile://A_BASE07.RMP"
  "localfile://A_BASE08.MAP"
  "localfile://A_BASE08.RMP"
  "localfile://A_BASE09.MAP"
  "localfile://A_BASE09.RMP"
  "localfile://A_BASE10.MAP"
  "localfile://A_BASE10.RMP"
  "localfile://A_BASE11.MAP"
  "localfile://A_BASE11.RMP"
  "localfile://A_BASE12.MAP"
  "localfile://A_BASE12.RMP"
  "localfile://A_BASE13.MAP"
  "localfile://A_BASE13.RMP"
  "localfile://A_BASE14.MAP"
  "localfile://A_BASE14.RMP"
  "localfile://A_BASE15.MAP"
  "localfile://A_BASE15.RMP"
  "localfile://A_BASE18.RMP"
  "localfile://A_BASE20.RMP"
  "localfile://BACK01.SCR"
  "localfile://BACK02.SCR"
  "localfile://BACK03.SCR"
  "localfile://BACK04.SCR"
  "localfile://BACK05.SCR"
  "localfile://BACK06.SCR"
  "localfile://BACK07.SCR"
  "localfile://BACK08.SCR"
  "localfile://BACK12.SCR"
  "localfile://BACK13.SCR"
  "localfile://BACK14.SCR"
  "localfile://BACK15.SCR"
  "localfile://BACK16.SCR"
  "localfile://BACK17.SCR"
  "localfile://BACKG.LBM"
  "localfile://BACKPALS.DAT"
  "localfile://BASEBITS.PCK"
  "localfile://BASEBITS.TAB"
  "localfile://BIGLETS.DAT"
  "localfile://BIGOBS.PCK"
  "localfile://BIGOBS.TAB"
  "localfile://BIODRON.PCK"
  "localfile://BIODRON.TAB"
  "localfile://BLANKS.MCD"
  "localfile://BLANKS.PCK"
  "localfile://BLANKS.TAB"
  "localfile://BREATH-1.PCK"
  "localfile://BREATH-1.TAB"
  "localfile://CALCIN.PCK"
  "localfile://CALCIN.TAB"
  "localfile://CARGO00.MAP"
  "localfile://CARGO00.RMP"
  "localfile://CARGO01.MAP"
  "localfile://CARGO01.RMP"
  "localfile://CARGO02.MAP"
  "localfile://CARGO02.RMP"
  "localfile://CARGO1.MCD"
  "localfile://CARGO1.PCK"
  "localfile://CARGO1.TAB"
  "localfile://CARGO2.MCD"
  "localfile://CARGO2.PCK"
  "localfile://CARGO2.TAB"
  "localfile://CARGO3.MCD"
  "localfile://CARGO3.PCK"
  "localfile://CARGO3.TAB"
  "localfile://CARGO4.PCK"
  "localfile://CARGO4.TAB"
  "localfile://CARGO5.PCK"
  "localfile://CARGO5.TAB"
  "localfile://CDSPEED.DAT"
  "localfile://CIVIL_1.PCK"
  "localfile://CIVIL_1.TAB"
  "localfile://CIVIL_2.PCK"
  "localfile://CIVIL_2.TAB"
  "localfile://CORAL.MCD"
  "localfile://CORAL.PCK"
  "localfile://CORAL.TAB"
  "localfile://CORAL00.MAP"
  "localfile://CORAL00.RMP"
  "localfile://CORAL01.MAP"
  "localfile://CORAL01.RMP"
  "localfile://CORAL02.MAP"
  "localfile://CORAL02.RMP"
  "localfile://CORAL03.MAP"
  "localfile://CORAL03.RMP"
  "localfile://CORAL04.MAP"
  "localfile://CORAL04.RMP"
  "localfile://CORAL05.MAP"
  "localfile://CORAL05.RMP"
  "localfile://CORAL06.MAP"
  "localfile://CORAL06.RMP"
  "localfile://CORAL07.MAP"
  "localfile://CORAL07.RMP"
  "localfile://CORAL08.MAP"
  "localfile://CORAL08.RMP"
  "localfile://CORAL09.MAP"
  "localfile://CORAL09.RMP"
  "localfile://CORAL10.MAP"
  "localfile://CORAL10.RMP"
  "localfile://CORAL11.MAP"
  "localfile://CORAL11.RMP"
  "localfile://CORAL12.MAP"
  "localfile://CORAL12.RMP"
  "localfile://COS.DAT"
  "localfile://CRYPT01.MAP"
  "localfile://CRYPT01.RMP"
  "localfile://CRYPT02.MAP"
  "localfile://CRYPT02.RMP"
  "localfile://CRYPT03.MAP"
  "localfile://CRYPT03.RMP"
  "localfile://CRYPT04.MAP"
  "localfile://CRYPT04.RMP"
  "localfile://CRYPT05.MAP"
  "localfile://CRYPT05.RMP"
  "localfile://CRYPT06.MAP"
  "localfile://CRYPT06.RMP"
  "localfile://CRYPT07.MAP"
  "localfile://CRYPT07.RMP"
  "localfile://CRYPT08.MAP"
  "localfile://CRYPT08.RMP"
  "localfile://CRYPT09.MAP"
  "localfile://CRYPT09.RMP"
  "localfile://CRYPT1.MCD"
  "localfile://CRYPT1.PCK"
  "localfile://CRYPT1.TAB"
  "localfile://CRYPT2.MCD"
  "localfile://CRYPT2.PCK"
  "localfile://CRYPT2.TAB"
  "localfile://CRYPT3.MCD"
  "localfile://CRYPT3.PCK"
  "localfile://CRYPT3.TAB"
  "localfile://CRYPT4.MCD"
  "localfile://CRYPT4.PCK"
  "localfile://CRYPT4.TAB"
  "localfile://CURSOR.PCK"
  "localfile://CURSOR.TAB"
  "localfile://D0.LBM"
  "localfile://D1.LBM"
  "localfile://D2.LBM"
  "localfile://D3.LBM"
  "localfile://DEBRIS.MCD"
  "localfile://DEBRIS.PCK"
  "localfile://DEBRIS.TAB"
  "localfile://DECKC.MCD"
  "localfile://DECKC.PCK"
  "localfile://DECKC.TAB"
  "localfile://DEEPONE.PCK"
  "localfile://DEEPONE.TAB"
  "localfile://DETBLOB.DAT"
  "localfile://DETBORD.BDY"
  "localfile://DETBORD2.BDY"
  "localfile://DRIVERS.CAT"
  "localfile://ENGLISH.DAT"
  "localfile://ENGLISH2.DAT"
  "localfile://ENTRY.MCD"
  "localfile://ENTRY.PCK"
  "localfile://ENTRY.TAB"
  "localfile://ENTRY00.MAP"
  "localfile://ENTRY00.RMP"
  "localfile://ENTRY01.MAP"
  "localfile://ENTRY01.RMP"
  "localfile://ENTRY02.MAP"
  "localfile://ENTRY02.RMP"
  "localfile://ENTRY03.MAP"
  "localfile://ENTRY03.RMP"
  "localfile://ENTRY04.MAP"
  "localfile://ENTRY04.RMP"
  "localfile://ENTRY05.MAP"
  "localfile://ENTRY05.RMP"
  "localfile://ENTRY06.MAP"
  "localfile://ENTRY06.RMP"
  "localfile://ENTRY07.MAP"
  "localfile://ENTRY07.RMP"
  "localfile://ENTRY08.MAP"
  "localfile://ENTRY08.RMP"
  "localfile://FLOOROB.PCK"
  "localfile://FLOOROB.TAB"
  "localfile://FRENCH.DAT"
  "localfile://FRENCH2.DAT"
  "localfile://GAL01.MAP"
  "localfile://GAL01.RMP"
  "localfile://GAL02.MAP"
  "localfile://GAL02.RMP"
  "localfile://GAL03.MAP"
  "localfile://GAL03.RMP"
  "localfile://GAL04.MAP"
  "localfile://GAL04.RMP"
  "localfile://GAL05.MAP"
  "localfile://GAL05.RMP"
  "localfile://GAL06.MAP"
  "localfile://GAL06.RMP"
  "localfile://GAL07.MAP"
  "localfile://GAL07.RMP"
  "localfile://GAL08.MAP"
  "localfile://GAL08.RMP"
  "localfile://GAL09.MAP"
  "localfile://GAL09.RMP"
  "localfile://GAL10.MAP"
  "localfile://GAL10.RMP"
  "localfile://GAL11.MAP"
  "localfile://GAL11.RMP"
  "localfile://GAL12.MAP"
  "localfile://GAL12.RMP"
  "localfile://GAL13.MAP"
  "localfile://GAL13.RMP"
  "localfile://GAL14.MAP"
  "localfile://GAL14.RMP"
  "localfile://GAL15.MAP"
  "localfile://GAL15.RMP"
  "localfile://GAL16.MAP"
  "localfile://GAL16.RMP"
  "localfile://GAMEOVER.IDX"
  "localfile://GAMEOVER.VID"
  "localfile://GAO01.LBM"
  "localfile://GAO02.LBM"
  "localfile://GAO03.LBM"
  "localfile://GAO04.LBM"
  "localfile://GAO05.LBM"
  "localfile://GEOBORD.SCR"
  "localfile://GERMAN.DAT"
  "localfile://GERMAN2.DAT"
  "localfile://GILLMAN.PCK"
  "localfile://GILLMAN.TAB"
  "localfile://GM.CAT"
  "localfile://GRAPH.BDY"
  "localfile://GRAPHS.SPK"
  "localfile://GRUNGE00.MAP"
  "localfile://GRUNGE00.RMP"
  "localfile://GRUNGE01.MAP"
  "localfile://GRUNGE01.RMP"
  "localfile://GRUNGE02.MAP"
  "localfile://GRUNGE02.RMP"
  "localfile://GRUNGE03.MAP"
  "localfile://GRUNGE03.RMP"
  "localfile://GRUNGE04.MAP"
  "localfile://GRUNGE04.RMP"
  "localfile://GRUNGE05.MAP"
  "localfile://GRUNGE05.RMP"
  "localfile://GRUNGE06.MAP"
  "localfile://GRUNGE06.RMP"
  "localfile://GRUNGE07.MAP"
  "localfile://GRUNGE07.RMP"
  "localfile://GRUNGE08.MAP"
  "localfile://GRUNGE08.RMP"
  "localfile://GRUNGE09.MAP"
  "localfile://GRUNGE09.RMP"
  "localfile://GRUNGE1.MCD"
  "localfile://GRUNGE1.PCK"
  "localfile://GRUNGE1.TAB"
  "localfile://GRUNGE10.MAP"
  "localfile://GRUNGE10.RMP"
  "localfile://GRUNGE11.MAP"
  "localfile://GRUNGE11.RMP"
  "localfile://GRUNGE12.MAP"
  "localfile://GRUNGE12.RMP"
  "localfile://GRUNGE13.MAP"
  "localfile://GRUNGE13.RMP"
  "localfile://GRUNGE14.MAP"
  "localfile://GRUNGE14.RMP"
  "localfile://GRUNGE15.MAP"
  "localfile://GRUNGE15.RMP"
  "localfile://GRUNGE16.MAP"
  "localfile://GRUNGE16.RMP"
  "localfile://GRUNGE2.MCD"
  "localfile://GRUNGE2.PCK"
  "localfile://GRUNGE2.TAB"
  "localfile://GRUNGE3.MCD"
  "localfile://GRUNGE3.PCK"
  "localfile://GRUNGE3.TAB"
  "localfile://GRUNGE4.MCD"
  "localfile://GRUNGE4.PCK"
  "localfile://GRUNGE4.TAB"
  "localfile://GRUNGE5.MCD"
  "localfile://GRUNGE5.PCK"
  "localfile://GRUNGE5.TAB"
  "localfile://HALLUCIN.PCK"
  "localfile://HALLUCIN.TAB"
  "localfile://HAMMER.MAP"
  "localfile://HAMMER.MCD"
  "localfile://HAMMER.PCK"
  "localfile://HAMMER.RMP"
  "localfile://HAMMER.TAB"
  "localfile://HAMMER1.MAP"
  "localfile://HAMMER1.RMP"
  "localfile://HAMMER2.MAP"
  "localfile://HAMMER2.RMP"
  "localfile://HANDOB.PCK"
  "localfile://HANDOB.TAB"
  "localfile://HIT.PCK"
  "localfile://HIT.TAB"
  "localfile://ICONS.BDY"
  "localfile://INT00.LBM"
  "localfile://INT01.LBM"
  "localfile://INT02.LBM"
  "localfile://INT03.LBM"
  "localfile://INT04.LBM"
  "localfile://INT05.LBM"
  "localfile://INT06.LBM"
  "localfile://INT07.LBM"
  "localfile://INT08.LBM"
  "localfile://INT09.LBM"
  "localfile://INT10.LBM"
  "localfile://INT11.LBM"
  "localfile://INT12.LBM"
  "localfile://INT13.LBM"
  "localfile://INT14.LBM"
  "localfile://INT15.LBM"
  "localfile://INT16.LBM"
  "localfile://INT17.LBM"
  "localfile://INT18.LBM"
  "localfile://INT19.LBM"
  "localfile://INT20.LBM"
  "localfile://INT21.LBM"
  "localfile://INTERWIN.DAT"
  "localfile://INTICON.PCK"
  "localfile://INTICON.TAB"
  "localfile://INTRO.IDX"
  "localfile://INTRO.VID"
  "localfile://ISLAND00.MAP"
  "localfile://ISLAND00.RMP"
  "localfile://ISLAND01.MAP"
  "localfile://ISLAND01.RMP"
  "localfile://ISLAND02.MAP"
  "localfile://ISLAND02.RMP"
  "localfile://ISLAND03.MAP"
  "localfile://ISLAND03.RMP"
  "localfile://ISLAND04.MAP"
  "localfile://ISLAND04.RMP"
  "localfile://ISLAND05.MAP"
  "localfile://ISLAND05.RMP"
  "localfile://ISLAND06.MAP"
  "localfile://ISLAND06.RMP"
  "localfile://ISLAND07.MAP"
  "localfile://ISLAND07.RMP"
  "localfile://ISLAND08.MAP"
  "localfile://ISLAND08.RMP"
  "localfile://ISLAND09.MAP"
  "localfile://ISLAND09.RMP"
  "localfile://ISLAND1.LBM"
  "localfile://ISLAND1.MCD"
  "localfile://ISLAND1.PCK"
  "localfile://ISLAND1.TAB"
  "localfile://ISLAND10.MAP"
  "localfile://ISLAND10.RMP"
  "localfile://ISLAND11.MAP"
  "localfile://ISLAND11.RMP"
  "localfile://ISLAND12.MAP"
  "localfile://ISLAND12.RMP"
  "localfile://ISLAND13.MAP"
  "localfile://ISLAND13.RMP"
  "localfile://ISLAND14.MAP"
  "localfile://ISLAND14.RMP"
  "localfile://ISLAND2.LBM"
  "localfile://ISLAND2.MCD"
  "localfile://ISLAND2.PCK"
  "localfile://ISLAND2.TAB"
  "localfile://ISLAND3.LBM"
  "localfile://ISLAND3.MCD"
  "localfile://ISLAND3.PCK"
  "localfile://ISLAND3.TAB"
  "localfile://ISLAND4.MCD"
  "localfile://LANG1.DAT"
  "localfile://LANG2.DAT"
  "localfile://LANG3.DAT"
  "localfile://LEVEL01.MAP"
  "localfile://LEVEL01.RMP"
  "localfile://LEVEL02.MAP"
  "localfile://LEVEL02.RMP"
  "localfile://LEVEL03.MAP"
  "localfile://LEVEL03.RMP"
  "localfile://LEVEL04.MAP"
  "localfile://LEVEL04.RMP"
  "localfile://LEVEL05.MAP"
  "localfile://LEVEL05.RMP"
  "localfile://LEVEL06.MAP"
  "localfile://LEVEL06.RMP"
  "localfile://LEVEL07.MAP"
  "localfile://LEVEL07.RMP"
  "localfile://LEVEL08.MAP"
  "localfile://LEVEL08.RMP"
  "localfile://LEVEL09.MAP"
  "localfile://LEVEL09.RMP"
  "localfile://LEVIATH.MAP"
  "localfile://LEVIATH.MCD"
  "localfile://LEVIATH.PCK"
  "localfile://LEVIATH.RMP"
  "localfile://LEVIATH.TAB"
  "localfile://LINERA.MCD"
  "localfile://LINERA.PCK"
  "localfile://LINERA.TAB"
  "localfile://LINERB.MCD"
  "localfile://LINERB.PCK"
  "localfile://LINERB.TAB"
  "localfile://LINERB02.MAP"
  "localfile://LINERB02.RMP"
  "localfile://LINERB03.MAP"
  "localfile://LINERB03.RMP"
  "localfile://LINERC.MCD"
  "localfile://LINERC.PCK"
  "localfile://LINERC.TAB"
  "localfile://LINERD.MCD"
  "localfile://LINERD.PCK"
  "localfile://LINERD.TAB"
  "localfile://LINERT00.MAP"
  "localfile://LINERT00.RMP"
  "localfile://LINERT01.MAP"
  "localfile://LINERT01.RMP"
  "localfile://LINERT02.MAP"
  "localfile://LINERT02.RMP"
  "localfile://LOBSTER.PCK"
  "localfile://LOBSTER.TAB"
  "localfile://ter-LOFTEMPS.DAT"
  "localfile://geo-LOFTEMPS.DAT"
  "localfile://LOGO.IDX"
  "localfile://LOGO.VID"
  "localfile://MAN_0F0.BDY"
  "localfile://MAN_0F1.BDY"
  "localfile://MAN_0F2.BDY"
  "localfile://MAN_0F3.BDY"
  "localfile://MAN_0M0.BDY"
  "localfile://MAN_0M1.BDY"
  "localfile://MAN_0M2.BDY"
  "localfile://MAN_0M3.BDY"
  "localfile://MAN_1F0.BDY"
  "localfile://MAN_1F1.BDY"
  "localfile://MAN_1F2.BDY"
  "localfile://MAN_1F3.BDY"
  "localfile://MAN_1M0.BDY"
  "localfile://MAN_1M1.BDY"
  "localfile://MAN_1M2.BDY"
  "localfile://MAN_1M3.BDY"
  "localfile://MAN_2F0.BDY"
  "localfile://MAN_2F1.BDY"
  "localfile://MAN_2F2.BDY"
  "localfile://MAN_2F3.BDY"
  "localfile://MAN_2M0.BDY"
  "localfile://MAN_2M1.BDY"
  "localfile://MAN_2M2.BDY"
  "localfile://MAN_2M3.BDY"
  "localfile://MAN_3F0.BDY"
  "localfile://MAN_3F1.BDY"
  "localfile://MAN_3F2.BDY"
  "localfile://MAN_3F3.BDY"
  "localfile://MAN_3M0.BDY"
  "localfile://MAN_3M1.BDY"
  "localfile://MAN_3M2.BDY"
  "localfile://MAN_3M3.BDY"
  "localfile://MAPS"
  "localfile://MEDIBITS.DAT"
  "localfile://MEDIBORD.BDY"
  "localfile://MSUNK00.MAP"
  "localfile://MSUNK00.RMP"
  "localfile://MSUNK01.MAP"
  "localfile://MSUNK01.RMP"
  "localfile://MSUNK02.MAP"
  "localfile://MSUNK02.RMP"
  "localfile://MSUNK03.MAP"
  "localfile://MSUNK03.RMP"
  "localfile://MSUNK04.MAP"
  "localfile://MSUNK04.RMP"
  "localfile://MSUNK05.MAP"
  "localfile://MSUNK05.RMP"
  "localfile://MSUNK06.MAP"
  "localfile://MSUNK06.RMP"
  "localfile://MSUNK07.MAP"
  "localfile://MSUNK07.RMP"
  "localfile://MSUNK08.MAP"
  "localfile://MSUNK08.RMP"
  "localfile://MSUNK09.MAP"
  "localfile://MSUNK09.RMP"
  "localfile://MSUNK1.MCD"
  "localfile://MSUNK1.PCK"
  "localfile://MSUNK1.TAB"
  "localfile://MSUNK10.MAP"
  "localfile://MSUNK10.RMP"
  "localfile://MSUNK11.MAP"
  "localfile://MSUNK11.RMP"
  "localfile://MSUNK12.MAP"
  "localfile://MSUNK12.RMP"
  "localfile://MSUNK13.MAP"
  "localfile://MSUNK13.RMP"
  "localfile://MSUNK2.MCD"
  "localfile://MSUNK2.PCK"
  "localfile://MSUNK2.TAB"
  "localfile://MU.MCD"
  "localfile://MU.PCK"
  "localfile://MU.TAB"
  "localfile://MU00.MAP"
  "localfile://MU00.RMP"
  "localfile://MU01.MAP"
  "localfile://MU01.RMP"
  "localfile://MU02.MAP"
  "localfile://MU02.RMP"
  "localfile://MU03.MAP"
  "localfile://MU03.RMP"
  "localfile://MU04.MAP"
  "localfile://MU04.RMP"
  "localfile://MU05.MAP"
  "localfile://MU05.RMP"
  "localfile://MU06.MAP"
  "localfile://MU06.RMP"
  "localfile://MU07.MAP"
  "localfile://MU07.RMP"
  "localfile://MU08.MAP"
  "localfile://MU08.RMP"
  "localfile://MU09.MAP"
  "localfile://MU09.RMP"
  "localfile://MU10.MAP"
  "localfile://MU10.RMP"
  "localfile://MU11.MAP"
  "localfile://MU11.RMP"
  "localfile://MU12.MAP"
  "localfile://MU12.RMP"
  "localfile://MU13.MAP"
  "localfile://MU14.MAP"
  "localfile://MUSIC.COM"
  "localfile://MVOL.DAT"
  "localfile://OBDATA.DAT"
  "localfile://ORGANIC.PCK"
  "localfile://ORGANIC.TAB"
  "localfile://ORGANIC1.MCD"
  "localfile://ORGANIC1.PCK"
  "localfile://ORGANIC1.TAB"
  "localfile://ORGANIC2.MCD"
  "localfile://ORGANIC2.PCK"
  "localfile://ORGANIC2.TAB"
  "localfile://ORGANIC3.MCD"
  "localfile://ORGANIC3.PCK"
  "localfile://ORGANIC3.TAB"
  "localfile://OUT01.LBM"
  "localfile://OUT02.LBM"
  "localfile://OUT03.LBM"
  "localfile://OUT04.LBM"
  "localfile://OUT05.LBM"
  "localfile://OUT06.LBM"
  "localfile://OUT07.LBM"
  "localfile://OUT08.LBM"
  "localfile://OUT09.LBM"
  "localfile://OUT10.LBM"
  "localfile://OUT11.LBM"
  "localfile://OUT12.LBM"
  "localfile://OUTRO.IDX"
  "localfile://OUTRO.VID"
  "localfile://PALETTES.DAT"
  "localfile://PIPES.MCD"
  "localfile://PIPES.PCK"
  "localfile://PIPES.TAB"
  "localfile://PIPES00.MAP"
  "localfile://PIPES00.RMP"
  "localfile://PIPES01.MAP"
  "localfile://PIPES01.RMP"
  "localfile://PIPES02.MAP"
  "localfile://PIPES02.RMP"
  "localfile://PIPES03.MAP"
  "localfile://PIPES03.RMP"
  "localfile://PIPES04.MAP"
  "localfile://PIPES04.RMP"
  "localfile://PIPES05.MAP"
  "localfile://PIPES05.RMP"
  "localfile://PIPES06.MAP"
  "localfile://PIPES06.RMP"
  "localfile://PIPES07.MAP"
  "localfile://PIPES07.RMP"
  "localfile://PIPES08.MAP"
  "localfile://PIPES08.RMP"
  "localfile://PIPES09.MAP"
  "localfile://PIPES09.RMP"
  "localfile://PIPES10.MAP"
  "localfile://PIPES10.RMP"
  "localfile://PIPES11.MAP"
  "localfile://PIPES11.RMP"
  "localfile://PLANE.MAP"
  "localfile://PLANE.MCD"
  "localfile://PLANE.PCK"
  "localfile://PLANE.TAB"
  "localfile://PLANE00.MAP"
  "localfile://PLANE00.RMP"
  "localfile://PLANE01.MAP"
  "localfile://PLANE01.RMP"
  "localfile://PLANE02.MAP"
  "localfile://PLANE02.RMP"
  "localfile://PLANE03.MAP"
  "localfile://PLANE03.RMP"
  "localfile://PLANE04.MAP"
  "localfile://PLANE04.RMP"
  "localfile://PLANE05.MAP"
  "localfile://PLANE05.RMP"
  "localfile://PLANE06.MAP"
  "localfile://PLANE06.RMP"
  "localfile://PLANE07.MAP"
  "localfile://PLANE07.RMP"
  "localfile://PLANE08.MAP"
  "localfile://PLANE08.RMP"
  "localfile://PLANE09.MAP"
  "localfile://PLANE09.RMP"
  "localfile://PLANE10.MAP"
  "localfile://PLANE10.RMP"
  "localfile://PLANE11.MAP"
  "localfile://PLANE11.RMP"
  "localfile://PLANE12.MAP"
  "localfile://PLANE12.RMP"
  "localfile://PLANE13.MAP"
  "localfile://PLANE13.RMP"
  "localfile://PLANE14.MAP"
  "localfile://PLANE14.RMP"
  "localfile://PLANE15.MAP"
  "localfile://PLANE15.RMP"
  "localfile://PLANE16.MAP"
  "localfile://PLANE16.RMP"
  "localfile://PLANE17.MAP"
  "localfile://PLANE17.RMP"
  "localfile://PLANE18.MAP"
  "localfile://PLANE18.RMP"
  "localfile://PLANE19.MAP"
  "localfile://PLANE19.RMP"
  "localfile://PLANE20.MAP"
  "localfile://PLANE20.RMP"
  "localfile://PORT00.MAP"
  "localfile://PORT00.RMP"
  "localfile://PORT01.MAP"
  "localfile://PORT01.MCD"
  "localfile://PORT01.PCK"
  "localfile://PORT01.RMP"
  "localfile://PORT01.TAB"
  "localfile://PORT02.MAP"
  "localfile://PORT02.MCD"
  "localfile://PORT02.PCK"
  "localfile://PORT02.RMP"
  "localfile://PORT02.TAB"
  "localfile://PORT03.MAP"
  "localfile://PORT03.RMP"
  "localfile://PORT04.MAP"
  "localfile://PORT04.RMP"
  "localfile://PORT05.MAP"
  "localfile://PORT05.RMP"
  "localfile://PORT06.MAP"
  "localfile://PORT06.RMP"
  "localfile://PORT07.MAP"
  "localfile://PORT07.RMP"
  "localfile://PORT08.MAP"
  "localfile://PORT08.RMP"
  "localfile://PORT09.MAP"
  "localfile://PORT09.RMP"
  "localfile://PORT1.MCD"
  "localfile://PORT1.PCK"
  "localfile://PORT1.TAB"
  "localfile://PORT10.MAP"
  "localfile://PORT10.RMP"
  "localfile://PORT11.MAP"
  "localfile://PORT11.RMP"
  "localfile://PORT12.MAP"
  "localfile://PORT12.RMP"
  "localfile://PORT13.MAP"
  "localfile://PORT13.RMP"
  "localfile://PORT14.MAP"
  "localfile://PORT14.RMP"
  "localfile://PORT15.MAP"
  "localfile://PORT15.RMP"
  "localfile://PORT16.MAP"
  "localfile://PORT16.RMP"
  "localfile://PORT17.MAP"
  "localfile://PORT17.RMP"
  "localfile://PORT18.MAP"
  "localfile://PORT18.RMP"
  "localfile://PORT19.MAP"
  "localfile://PORT19.RMP"
  "localfile://PORT20.MAP"
  "localfile://PORT20.RMP"
  "localfile://PSYNOM.MCD"
  "localfile://PSYNOM.PCK"
  "localfile://PSYNOM.TAB"
  "localfile://PYRAMID.MCD"
  "localfile://PYRAMID.PCK"
  "localfile://PYRAMID.TAB"
  "localfile://RISE.IDX"
  "localfile://RISE.VID"
  "localfile://ROCKS.MCD"
  "localfile://ROCKS.PCK"
  "localfile://ROCKS.TAB"
  "localfile://ROLAND.CAT"
  "localfile://ROUTES"
  "localfile://SAMPLE.CAT"
  "localfile://SAND.MCD"
  "localfile://SAND.PCK"
  "localfile://SAND.TAB"
  "localfile://SCANBORD.BDY"
  "localfile://ter-SCANG.DAT"
  "localfile://geo-SCANG.DAT"
  "localfile://SEA.MCD"
  "localfile://SEA.PCK"
  "localfile://SEA.TAB"
  "localfile://SEABED00.MAP"
  "localfile://SEABED00.RMP"
  "localfile://SEABED01.MAP"
  "localfile://SEABED01.RMP"
  "localfile://SEABED02.MAP"
  "localfile://SEABED02.RMP"
  "localfile://SEABED03.MAP"
  "localfile://SEABED03.RMP"
  "localfile://SEABED04.MAP"
  "localfile://SEABED04.RMP"
  "localfile://SEABED05.MAP"
  "localfile://SEABED05.RMP"
  "localfile://SEABED06.MAP"
  "localfile://SEABED06.RMP"
  "localfile://SEABED07.MAP"
  "localfile://SEABED07.RMP"
  "localfile://SEABED08.MAP"
  "localfile://SEABED08.RMP"
  "localfile://SEABED09.MAP"
  "localfile://SEABED09.RMP"
  "localfile://SEABED10.MAP"
  "localfile://SEABED10.RMP"
  "localfile://SEABED11.MAP"
  "localfile://SEABED11.RMP"
  "localfile://SEABED12.MAP"
  "localfile://SEABED12.RMP"
  "localfile://SINE.DAT"
  "localfile://SMALLSET.DAT"
  "localfile://SMOKE.PCK"
  "localfile://SMOKE.TAB"
  "localfile://SNDEND.EXE"
  "localfile://SNDSTART.EXE"
  "localfile://SOUND.CFG"
  "localfile://SOUNDRV.COM"
  "localfile://SPANISH.DAT"
  "localfile://SPANISH2.DAT"
  "localfile://SPICONS.DAT"
  "localfile://TAC00.SCR"
  "localfile://TAC01.BDY"
  "localfile://TANK01.PCK"
  "localfile://TANK01.TAB"
  "localfile://TASOTHS.PCK"
  "localfile://TASOTHS.TAB"
  "localfile://TDXCOM_0.PCK"
  "localfile://TDXCOM_0.TAB"
  "localfile://TDXCOM_1.PCK"
  "localfile://TDXCOM_1.TAB"
  "localfile://TDXCOM_2.PCK"
  "localfile://TDXCOM_2.TAB"
  "localfile://TENTAC.PCK"
  "localfile://TENTAC.TAB"
  "localfile://TEXTURE.DAT"
  "localfile://TRISCEN.PCK"
  "localfile://TRISCEN.TAB"
  "localfile://TRITON.MAP"
  "localfile://TRITON.MCD"
  "localfile://TRITON.PCK"
  "localfile://TRITON.RMP"
  "localfile://TRITON.TAB"
  "localfile://TWE01.LBM"
  "localfile://TWE02.LBM"
  "localfile://TWE03.LBM"
  "localfile://TWE04.LBM"
  "localfile://TWE05.LBM"
  "localfile://TWE06.LBM"
  "localfile://UEXT1.MCD"
  "localfile://UEXT1.PCK"
  "localfile://UEXT1.TAB"
  "localfile://UEXT2.MCD"
  "localfile://UEXT2.PCK"
  "localfile://UEXT2.TAB"
  "localfile://UEXT3.MCD"
  "localfile://UEXT3.PCK"
  "localfile://UEXT3.TAB"
  "localfile://UFO01.MAP"
  "localfile://UFO01.RMP"
  "localfile://UFO02.MAP"
  "localfile://UFO02.RMP"
  "localfile://UFO03.MAP"
  "localfile://UFO03.RMP"
  "localfile://UFO04.MAP"
  "localfile://UFO04.RMP"
  "localfile://UFO05.MAP"
  "localfile://UFO05.RMP"
  "localfile://UFO06.MAP"
  "localfile://UFO06.RMP"
  "localfile://UFO07.MAP"
  "localfile://UFO07.RMP"
  "localfile://UFO08.MAP"
  "localfile://UFO08.RMP"
  "localfile://UFOBITS.MCD"
  "localfile://UFOBITS.PCK"
  "localfile://UFOBITS.TAB"
  "localfile://UINT.PCK"
  "localfile://UINT.TAB"
  "localfile://UINT1.MCD"
  "localfile://UINT1.PCK"
  "localfile://UINT1.TAB"
  "localfile://UINT2.MCD"
  "localfile://UINT2.PCK"
  "localfile://UINT2.TAB"
  "localfile://UINT3.MCD"
  "localfile://UINT3.PCK"
  "localfile://UINT3.TAB"
  "localfile://UNIBORD.PCK"
  "localfile://UP001.BDY"
  "localfile://UP002.BDY"
  "localfile://UP003.BDY"
  "localfile://UP004.BDY"
  "localfile://UP005.BDY"
  "localfile://UP006.BDY"
  "localfile://UP007.BDY"
  "localfile://UP008.BDY"
  "localfile://UP009.BDY"
  "localfile://UP010.BDY"
  "localfile://UP011.BDY"
  "localfile://UP012.BDY"
  "localfile://UP013.BDY"
  "localfile://UP014.BDY"
  "localfile://UP015.BDY"
  "localfile://UP016.BDY"
  "localfile://UP017.BDY"
  "localfile://UP018.BDY"
  "localfile://UP019.BDY"
  "localfile://UP020.BDY"
  "localfile://UP021.BDY"
  "localfile://UP022.BDY"
  "localfile://UP023.BDY"
  "localfile://UP024.BDY"
  "localfile://UP025.BDY"
  "localfile://UP026.BDY"
  "localfile://UP027.BDY"
  "localfile://UP028.BDY"
  "localfile://UP029.BDY"
  "localfile://UP030.BDY"
  "localfile://UP031.BDY"
  "localfile://UP032.BDY"
  "localfile://UP033.BDY"
  "localfile://UP034.BDY"
  "localfile://UP035.BDY"
  "localfile://UP036.BDY"
  "localfile://UP037.BDY"
  "localfile://UP038.BDY"
  "localfile://UP039.BDY"
  "localfile://UP040.BDY"
  "localfile://UP041.BDY"
  "localfile://UP042.BDY"
  "localfile://UP043.BDY"
  "localfile://UP044.BDY"
  "localfile://UP045.BDY"
  "localfile://UP046.BDY"
  "localfile://UP047.BDY"
  "localfile://UP048.BDY"
  "localfile://UP049.BDY"
  "localfile://UP050.BDY"
  "localfile://UP051.BDY"
  "localfile://UP052.BDY"
  "localfile://UP053.BDY"
  "localfile://UP054.BDY"
  "localfile://UP055.BDY"
  "localfile://UP056.BDY"
  "localfile://UP057.BDY"
  "localfile://UP058.BDY"
  "localfile://UP059.BDY"
  "localfile://UP060.BDY"
  "localfile://UP061.BDY"
  "localfile://UP062.BDY"
  "localfile://UP063.BDY"
  "localfile://UP064.BDY"
  "localfile://UP065.BDY"
  "localfile://UP066.BDY"
  "localfile://UP067.BDY"
  "localfile://UP068.BDY"
  "localfile://UP069.BDY"
  "localfile://UP070.BDY"
  "localfile://UP071.BDY"
  "localfile://UP072.BDY"
  "localfile://UP073.BDY"
  "localfile://UP074.BDY"
  "localfile://UP075.BDY"
  "localfile://UP076.BDY"
  "localfile://UP077.BDY"
  "localfile://UP078.BDY"
  "localfile://UP079.BDY"
  "localfile://UP080.BDY"
  "localfile://UP081.BDY"
  "localfile://UP082.BDY"
  "localfile://UP083.BDY"
  "localfile://UP084.BDY"
  "localfile://UP085.BDY"
  "localfile://UP086.BDY"
  "localfile://UP087.BDY"
  "localfile://UP088.BDY"
  "localfile://UP089.BDY"
  "localfile://UP090.BDY"
  "localfile://UP091.BDY"
  "localfile://UP092.BDY"
  "localfile://UP093.BDY"
  "localfile://UP094.BDY"
  "localfile://UP095.BDY"
  "localfile://UP096.BDY"
  "localfile://UP097.BDY"
  "localfile://UP098.BDY"
  "localfile://UP099.BDY"
  "localfile://UP100.BDY"
  "localfile://UP101.BDY"
  "localfile://UP102.BDY"
  "localfile://UP103.BDY"
  "localfile://UP104.BDY"
  "localfile://UP105.BDY"
  "localfile://UP106.BDY"
  "localfile://UP107.BDY"
  "localfile://UP108.BDY"
  "localfile://UP109.BDY"
  "localfile://UP110.BDY"
  "localfile://UP111.BDY"
  "localfile://UP112.BDY"
  "localfile://UP_BORD2.SCR"
  "localfile://URBITS.MCD"
  "localfile://URBITS.PCK"
  "localfile://URBITS.TAB"
  "localfile://VECTOR.COM"
  "localfile://VOLC.MCD"
  "localfile://VOLC.PCK"
  "localfile://VOLC.TAB"
  "localfile://VOLC00.MAP"
  "localfile://VOLC00.RMP"
  "localfile://VOLC01.MAP"
  "localfile://VOLC01.RMP"
  "localfile://VOLC02.MAP"
  "localfile://VOLC02.RMP"
  "localfile://VOLC03.MAP"
  "localfile://VOLC03.RMP"
  "localfile://VOLC04.MAP"
  "localfile://VOLC04.RMP"
  "localfile://VOLC05.MAP"
  "localfile://VOLC05.RMP"
  "localfile://VOLC06.MAP"
  "localfile://VOLC06.RMP"
  "localfile://VOLC07.MAP"
  "localfile://VOLC07.RMP"
  "localfile://VOLC08.MAP"
  "localfile://VOLC08.RMP"
  "localfile://VOLC09.MAP"
  "localfile://VOLC09.RMP"
  "localfile://VOLC10.MAP"
  "localfile://VOLC10.RMP"
  "localfile://VOLC11.MAP"
  "localfile://VOLC11.RMP"
  "localfile://WEEDS.MCD"
  "localfile://WEEDS.PCK"
  "localfile://WEEDS.TAB"
  "localfile://WORLD.DAT"
  "localfile://X1.PCK"
  "localfile://X1.TAB"
  "localfile://XARQUID.PCK"
  "localfile://XARQUID.TAB"
  "localfile://XBASE1.MCD"
  "localfile://XBASE2.MCD"
  "localfile://XBASES00.MAP"
  "localfile://XBASES00.RMP"
  "localfile://XBASES01.MAP"
  "localfile://XBASES01.MCD"
  "localfile://XBASES01.PCK"
  "localfile://XBASES01.RMP"
  "localfile://XBASES01.TAB"
  "localfile://XBASES02.MAP"
  "localfile://XBASES02.MCD"
  "localfile://XBASES02.PCK"
  "localfile://XBASES02.RMP"
  "localfile://XBASES02.TAB"
  "localfile://XBASES03.MAP"
  "localfile://XBASES03.MCD"
  "localfile://XBASES03.PCK"
  "localfile://XBASES03.RMP"
  "localfile://XBASES03.TAB"
  "localfile://XBASES04.MAP"
  "localfile://XBASES04.MCD"
  "localfile://XBASES04.PCK"
  "localfile://XBASES04.RMP"
  "localfile://XBASES04.TAB"
  "localfile://XBASES05.MAP"
  "localfile://XBASES05.MCD"
  "localfile://XBASES05.PCK"
  "localfile://XBASES05.RMP"
  "localfile://XBASES05.TAB"
  "localfile://XBASES06.MAP"
  "localfile://XBASES06.RMP"
  "localfile://XBASES07.MAP"
  "localfile://XBASES07.RMP"
  "localfile://XBASES08.MAP"
  "localfile://XBASES08.RMP"
  "localfile://XBASES09.MAP"
  "localfile://XBASES09.RMP"
  "localfile://XBASES10.MAP"
  "localfile://XBASES10.RMP"
  "localfile://XBASES11.MAP"
  "localfile://XBASES11.RMP"
  "localfile://XBASES12.MAP"
  "localfile://XBASES12.RMP"
  "localfile://XBASES13.MAP"
  "localfile://XBASES13.RMP"
  "localfile://XBASES14.MAP"
  "localfile://XBASES14.RMP"
  "localfile://XBASES15.MAP"
  "localfile://XBASES15.RMP"
  "localfile://XBASES16.MAP"
  "localfile://XBASES16.RMP"
  "localfile://XBASES17.MAP"
  "localfile://XBASES17.RMP"
  "localfile://XBASES18.MAP"
  "localfile://XBASES18.RMP"
  "localfile://XBASES19.MAP"
  "localfile://XBASES19.RMP"
  "localfile://XBASES20.MAP"
  "localfile://XBASES20.RMP"
  "localfile://XBITS.MCD"
  "localfile://XBITS.PCK"
  "localfile://XBITS.TAB"
  "localfile://ZOMBIE.PCK"
  "localfile://ZOMBIE.TAB"
  "https://openxcom.org/download/extras/universal-patch-tftd.zip"
)
noextract=(
  "filelist"
  "copier.sh"
  "ADLIB.CAT"
  "ALART00.MAP"
  "ALART00.RMP"
  "ALART01.MAP"
  "ALART01.RMP"
  "ALART02.MAP"
  "ALART02.RMP"
  "ALART03.MAP"
  "ALART03.RMP"
  "ALART04.MAP"
  "ALART04.RMP"
  "ALART05.MAP"
  "ALART05.RMP"
  "ALART06.MAP"
  "ALART06.RMP"
  "ALART07.MAP"
  "ALART07.RMP"
  "ALART08.MAP"
  "ALART08.RMP"
  "ALART09.MAP"
  "ALART09.RMP"
  "ALART10.MAP"
  "ALART10.RMP"
  "ALART11.MAP"
  "ALART11.RMP"
  "ALSHIP00.MAP"
  "ALSHIP00.RMP"
  "ALSHIP01.MAP"
  "ALSHIP01.RMP"
  "ALSHIP02.MAP"
  "ALSHIP02.RMP"
  "ALSHIP03.MAP"
  "ALSHIP03.RMP"
  "ALSHIP04.MAP"
  "ALSHIP04.RMP"
  "ALSHIP05.MAP"
  "ALSHIP05.RMP"
  "ALSHIP06.MAP"
  "ALSHIP06.RMP"
  "ALSHIP07.MAP"
  "ALSHIP07.RMP"
  "ALSHIP08.MAP"
  "ALSHIP08.RMP"
  "ALSHIP09.MAP"
  "ALSHIP09.RMP"
  "ALSHIP10.MAP"
  "ALSHIP10.RMP"
  "ALSHIP11.MAP"
  "ALSHIP11.RMP"
  "ALSHIP12.MAP"
  "ALSHIP12.RMP"
  "ALSHIP13.MAP"
  "ALSHIP13.RMP"
  "ALSHIP14.MAP"
  "ALSHIP14.RMP"
  "ALSHIP15.MAP"
  "ALSHIP15.RMP"
  "ALSHIP16.MAP"
  "ALSHIP16.RMP"
  "ALSHIP17.MAP"
  "ALSHIP17.RMP"
  "AQUA.PCK"
  "AQUA.TAB"
  "ASUNK.MCD"
  "ASUNK.PCK"
  "ASUNK.TAB"
  "ATLAN00.MAP"
  "ATLAN00.RMP"
  "ATLAN01.MAP"
  "ATLAN01.RMP"
  "ATLAN02.MAP"
  "ATLAN02.RMP"
  "ATLAN03.MAP"
  "ATLAN03.RMP"
  "ATLAN04.MAP"
  "ATLAN04.RMP"
  "ATLAN05.MAP"
  "ATLAN05.RMP"
  "ATLAN06.MAP"
  "ATLAN06.RMP"
  "ATLAN07.MAP"
  "ATLAN07.RMP"
  "ATLAN08.MAP"
  "ATLAN08.RMP"
  "ATLAN09.MAP"
  "ATLAN09.RMP"
  "ATLAN10.MAP"
  "ATLAN10.RMP"
  "ATLAN11.MAP"
  "ATLAN11.RMP"
  "ATLAN12.MAP"
  "ATLAN12.RMP"
  "ATLANTIS.MCD"
  "ATLANTIS.PCK"
  "ATLANTIS.TAB"
  "A_BASE00.MAP"
  "A_BASE00.RMP"
  "A_BASE01.MAP"
  "A_BASE01.RMP"
  "A_BASE02.MAP"
  "A_BASE02.RMP"
  "A_BASE03.MAP"
  "A_BASE03.RMP"
  "A_BASE04.MAP"
  "A_BASE04.RMP"
  "A_BASE05.MAP"
  "A_BASE05.RMP"
  "A_BASE06.MAP"
  "A_BASE06.RMP"
  "A_BASE07.MAP"
  "A_BASE07.RMP"
  "A_BASE08.MAP"
  "A_BASE08.RMP"
  "A_BASE09.MAP"
  "A_BASE09.RMP"
  "A_BASE10.MAP"
  "A_BASE10.RMP"
  "A_BASE11.MAP"
  "A_BASE11.RMP"
  "A_BASE12.MAP"
  "A_BASE12.RMP"
  "A_BASE13.MAP"
  "A_BASE13.RMP"
  "A_BASE14.MAP"
  "A_BASE14.RMP"
  "A_BASE15.MAP"
  "A_BASE15.RMP"
  "A_BASE18.RMP"
  "A_BASE20.RMP"
  "BACK01.SCR"
  "BACK02.SCR"
  "BACK03.SCR"
  "BACK04.SCR"
  "BACK05.SCR"
  "BACK06.SCR"
  "BACK07.SCR"
  "BACK08.SCR"
  "BACK12.SCR"
  "BACK13.SCR"
  "BACK14.SCR"
  "BACK15.SCR"
  "BACK16.SCR"
  "BACK17.SCR"
  "BACKG.LBM"
  "BACKPALS.DAT"
  "BASEBITS.PCK"
  "BASEBITS.TAB"
  "BIGLETS.DAT"
  "BIGOBS.PCK"
  "BIGOBS.TAB"
  "BIODRON.PCK"
  "BIODRON.TAB"
  "BLANKS.MCD"
  "BLANKS.PCK"
  "BLANKS.TAB"
  "BREATH-1.PCK"
  "BREATH-1.TAB"
  "CALCIN.PCK"
  "CALCIN.TAB"
  "CARGO00.MAP"
  "CARGO00.RMP"
  "CARGO01.MAP"
  "CARGO01.RMP"
  "CARGO02.MAP"
  "CARGO02.RMP"
  "CARGO1.MCD"
  "CARGO1.PCK"
  "CARGO1.TAB"
  "CARGO2.MCD"
  "CARGO2.PCK"
  "CARGO2.TAB"
  "CARGO3.MCD"
  "CARGO3.PCK"
  "CARGO3.TAB"
  "CARGO4.PCK"
  "CARGO4.TAB"
  "CARGO5.PCK"
  "CARGO5.TAB"
  "CDSPEED.DAT"
  "CIVIL_1.PCK"
  "CIVIL_1.TAB"
  "CIVIL_2.PCK"
  "CIVIL_2.TAB"
  "CORAL.MCD"
  "CORAL.PCK"
  "CORAL.TAB"
  "CORAL00.MAP"
  "CORAL00.RMP"
  "CORAL01.MAP"
  "CORAL01.RMP"
  "CORAL02.MAP"
  "CORAL02.RMP"
  "CORAL03.MAP"
  "CORAL03.RMP"
  "CORAL04.MAP"
  "CORAL04.RMP"
  "CORAL05.MAP"
  "CORAL05.RMP"
  "CORAL06.MAP"
  "CORAL06.RMP"
  "CORAL07.MAP"
  "CORAL07.RMP"
  "CORAL08.MAP"
  "CORAL08.RMP"
  "CORAL09.MAP"
  "CORAL09.RMP"
  "CORAL10.MAP"
  "CORAL10.RMP"
  "CORAL11.MAP"
  "CORAL11.RMP"
  "CORAL12.MAP"
  "CORAL12.RMP"
  "COS.DAT"
  "CRYPT01.MAP"
  "CRYPT01.RMP"
  "CRYPT02.MAP"
  "CRYPT02.RMP"
  "CRYPT03.MAP"
  "CRYPT03.RMP"
  "CRYPT04.MAP"
  "CRYPT04.RMP"
  "CRYPT05.MAP"
  "CRYPT05.RMP"
  "CRYPT06.MAP"
  "CRYPT06.RMP"
  "CRYPT07.MAP"
  "CRYPT07.RMP"
  "CRYPT08.MAP"
  "CRYPT08.RMP"
  "CRYPT09.MAP"
  "CRYPT09.RMP"
  "CRYPT1.MCD"
  "CRYPT1.PCK"
  "CRYPT1.TAB"
  "CRYPT2.MCD"
  "CRYPT2.PCK"
  "CRYPT2.TAB"
  "CRYPT3.MCD"
  "CRYPT3.PCK"
  "CRYPT3.TAB"
  "CRYPT4.MCD"
  "CRYPT4.PCK"
  "CRYPT4.TAB"
  "CURSOR.PCK"
  "CURSOR.TAB"
  "D0.LBM"
  "D1.LBM"
  "D2.LBM"
  "D3.LBM"
  "DEBRIS.MCD"
  "DEBRIS.PCK"
  "DEBRIS.TAB"
  "DECKC.MCD"
  "DECKC.PCK"
  "DECKC.TAB"
  "DEEPONE.PCK"
  "DEEPONE.TAB"
  "DETBLOB.DAT"
  "DETBORD.BDY"
  "DETBORD2.BDY"
  "DRIVERS.CAT"
  "ENGLISH.DAT"
  "ENGLISH2.DAT"
  "ENTRY.MCD"
  "ENTRY.PCK"
  "ENTRY.TAB"
  "ENTRY00.MAP"
  "ENTRY00.RMP"
  "ENTRY01.MAP"
  "ENTRY01.RMP"
  "ENTRY02.MAP"
  "ENTRY02.RMP"
  "ENTRY03.MAP"
  "ENTRY03.RMP"
  "ENTRY04.MAP"
  "ENTRY04.RMP"
  "ENTRY05.MAP"
  "ENTRY05.RMP"
  "ENTRY06.MAP"
  "ENTRY06.RMP"
  "ENTRY07.MAP"
  "ENTRY07.RMP"
  "ENTRY08.MAP"
  "ENTRY08.RMP"
  "FLOOROB.PCK"
  "FLOOROB.TAB"
  "FRENCH.DAT"
  "FRENCH2.DAT"
  "GAL01.MAP"
  "GAL01.RMP"
  "GAL02.MAP"
  "GAL02.RMP"
  "GAL03.MAP"
  "GAL03.RMP"
  "GAL04.MAP"
  "GAL04.RMP"
  "GAL05.MAP"
  "GAL05.RMP"
  "GAL06.MAP"
  "GAL06.RMP"
  "GAL07.MAP"
  "GAL07.RMP"
  "GAL08.MAP"
  "GAL08.RMP"
  "GAL09.MAP"
  "GAL09.RMP"
  "GAL10.MAP"
  "GAL10.RMP"
  "GAL11.MAP"
  "GAL11.RMP"
  "GAL12.MAP"
  "GAL12.RMP"
  "GAL13.MAP"
  "GAL13.RMP"
  "GAL14.MAP"
  "GAL14.RMP"
  "GAL15.MAP"
  "GAL15.RMP"
  "GAL16.MAP"
  "GAL16.RMP"
  "GAMEOVER.IDX"
  "GAMEOVER.VID"
  "GAO01.LBM"
  "GAO02.LBM"
  "GAO03.LBM"
  "GAO04.LBM"
  "GAO05.LBM"
  "GEOBORD.SCR"
  "GERMAN.DAT"
  "GERMAN2.DAT"
  "GILLMAN.PCK"
  "GILLMAN.TAB"
  "GM.CAT"
  "GRAPH.BDY"
  "GRAPHS.SPK"
  "GRUNGE00.MAP"
  "GRUNGE00.RMP"
  "GRUNGE01.MAP"
  "GRUNGE01.RMP"
  "GRUNGE02.MAP"
  "GRUNGE02.RMP"
  "GRUNGE03.MAP"
  "GRUNGE03.RMP"
  "GRUNGE04.MAP"
  "GRUNGE04.RMP"
  "GRUNGE05.MAP"
  "GRUNGE05.RMP"
  "GRUNGE06.MAP"
  "GRUNGE06.RMP"
  "GRUNGE07.MAP"
  "GRUNGE07.RMP"
  "GRUNGE08.MAP"
  "GRUNGE08.RMP"
  "GRUNGE09.MAP"
  "GRUNGE09.RMP"
  "GRUNGE1.MCD"
  "GRUNGE1.PCK"
  "GRUNGE1.TAB"
  "GRUNGE10.MAP"
  "GRUNGE10.RMP"
  "GRUNGE11.MAP"
  "GRUNGE11.RMP"
  "GRUNGE12.MAP"
  "GRUNGE12.RMP"
  "GRUNGE13.MAP"
  "GRUNGE13.RMP"
  "GRUNGE14.MAP"
  "GRUNGE14.RMP"
  "GRUNGE15.MAP"
  "GRUNGE15.RMP"
  "GRUNGE16.MAP"
  "GRUNGE16.RMP"
  "GRUNGE2.MCD"
  "GRUNGE2.PCK"
  "GRUNGE2.TAB"
  "GRUNGE3.MCD"
  "GRUNGE3.PCK"
  "GRUNGE3.TAB"
  "GRUNGE4.MCD"
  "GRUNGE4.PCK"
  "GRUNGE4.TAB"
  "GRUNGE5.MCD"
  "GRUNGE5.PCK"
  "GRUNGE5.TAB"
  "HALLUCIN.PCK"
  "HALLUCIN.TAB"
  "HAMMER.MAP"
  "HAMMER.MCD"
  "HAMMER.PCK"
  "HAMMER.RMP"
  "HAMMER.TAB"
  "HAMMER1.MAP"
  "HAMMER1.RMP"
  "HAMMER2.MAP"
  "HAMMER2.RMP"
  "HANDOB.PCK"
  "HANDOB.TAB"
  "HIT.PCK"
  "HIT.TAB"
  "ICONS.BDY"
  "INT00.LBM"
  "INT01.LBM"
  "INT02.LBM"
  "INT03.LBM"
  "INT04.LBM"
  "INT05.LBM"
  "INT06.LBM"
  "INT07.LBM"
  "INT08.LBM"
  "INT09.LBM"
  "INT10.LBM"
  "INT11.LBM"
  "INT12.LBM"
  "INT13.LBM"
  "INT14.LBM"
  "INT15.LBM"
  "INT16.LBM"
  "INT17.LBM"
  "INT18.LBM"
  "INT19.LBM"
  "INT20.LBM"
  "INT21.LBM"
  "INTERWIN.DAT"
  "INTICON.PCK"
  "INTICON.TAB"
  "INTRO.IDX"
  "INTRO.VID"
  "ISLAND00.MAP"
  "ISLAND00.RMP"
  "ISLAND01.MAP"
  "ISLAND01.RMP"
  "ISLAND02.MAP"
  "ISLAND02.RMP"
  "ISLAND03.MAP"
  "ISLAND03.RMP"
  "ISLAND04.MAP"
  "ISLAND04.RMP"
  "ISLAND05.MAP"
  "ISLAND05.RMP"
  "ISLAND06.MAP"
  "ISLAND06.RMP"
  "ISLAND07.MAP"
  "ISLAND07.RMP"
  "ISLAND08.MAP"
  "ISLAND08.RMP"
  "ISLAND09.MAP"
  "ISLAND09.RMP"
  "ISLAND1.LBM"
  "ISLAND1.MCD"
  "ISLAND1.PCK"
  "ISLAND1.TAB"
  "ISLAND10.MAP"
  "ISLAND10.RMP"
  "ISLAND11.MAP"
  "ISLAND11.RMP"
  "ISLAND12.MAP"
  "ISLAND12.RMP"
  "ISLAND13.MAP"
  "ISLAND13.RMP"
  "ISLAND14.MAP"
  "ISLAND14.RMP"
  "ISLAND2.LBM"
  "ISLAND2.MCD"
  "ISLAND2.PCK"
  "ISLAND2.TAB"
  "ISLAND3.LBM"
  "ISLAND3.MCD"
  "ISLAND3.PCK"
  "ISLAND3.TAB"
  "ISLAND4.MCD"
  "LANG1.DAT"
  "LANG2.DAT"
  "LANG3.DAT"
  "LEVEL01.MAP"
  "LEVEL01.RMP"
  "LEVEL02.MAP"
  "LEVEL02.RMP"
  "LEVEL03.MAP"
  "LEVEL03.RMP"
  "LEVEL04.MAP"
  "LEVEL04.RMP"
  "LEVEL05.MAP"
  "LEVEL05.RMP"
  "LEVEL06.MAP"
  "LEVEL06.RMP"
  "LEVEL07.MAP"
  "LEVEL07.RMP"
  "LEVEL08.MAP"
  "LEVEL08.RMP"
  "LEVEL09.MAP"
  "LEVEL09.RMP"
  "LEVIATH.MAP"
  "LEVIATH.MCD"
  "LEVIATH.PCK"
  "LEVIATH.RMP"
  "LEVIATH.TAB"
  "LINERA.MCD"
  "LINERA.PCK"
  "LINERA.TAB"
  "LINERB.MCD"
  "LINERB.PCK"
  "LINERB.TAB"
  "LINERB02.MAP"
  "LINERB02.RMP"
  "LINERB03.MAP"
  "LINERB03.RMP"
  "LINERC.MCD"
  "LINERC.PCK"
  "LINERC.TAB"
  "LINERD.MCD"
  "LINERD.PCK"
  "LINERD.TAB"
  "LINERT00.MAP"
  "LINERT00.RMP"
  "LINERT01.MAP"
  "LINERT01.RMP"
  "LINERT02.MAP"
  "LINERT02.RMP"
  "LOBSTER.PCK"
  "LOBSTER.TAB"
  "ter-LOFTEMPS.DAT"
  "geo-LOFTEMPS.DAT"
  "LOGO.IDX"
  "LOGO.VID"
  "MAN_0F0.BDY"
  "MAN_0F1.BDY"
  "MAN_0F2.BDY"
  "MAN_0F3.BDY"
  "MAN_0M0.BDY"
  "MAN_0M1.BDY"
  "MAN_0M2.BDY"
  "MAN_0M3.BDY"
  "MAN_1F0.BDY"
  "MAN_1F1.BDY"
  "MAN_1F2.BDY"
  "MAN_1F3.BDY"
  "MAN_1M0.BDY"
  "MAN_1M1.BDY"
  "MAN_1M2.BDY"
  "MAN_1M3.BDY"
  "MAN_2F0.BDY"
  "MAN_2F1.BDY"
  "MAN_2F2.BDY"
  "MAN_2F3.BDY"
  "MAN_2M0.BDY"
  "MAN_2M1.BDY"
  "MAN_2M2.BDY"
  "MAN_2M3.BDY"
  "MAN_3F0.BDY"
  "MAN_3F1.BDY"
  "MAN_3F2.BDY"
  "MAN_3F3.BDY"
  "MAN_3M0.BDY"
  "MAN_3M1.BDY"
  "MAN_3M2.BDY"
  "MAN_3M3.BDY"
  "MAPS"
  "MEDIBITS.DAT"
  "MEDIBORD.BDY"
  "MSUNK00.MAP"
  "MSUNK00.RMP"
  "MSUNK01.MAP"
  "MSUNK01.RMP"
  "MSUNK02.MAP"
  "MSUNK02.RMP"
  "MSUNK03.MAP"
  "MSUNK03.RMP"
  "MSUNK04.MAP"
  "MSUNK04.RMP"
  "MSUNK05.MAP"
  "MSUNK05.RMP"
  "MSUNK06.MAP"
  "MSUNK06.RMP"
  "MSUNK07.MAP"
  "MSUNK07.RMP"
  "MSUNK08.MAP"
  "MSUNK08.RMP"
  "MSUNK09.MAP"
  "MSUNK09.RMP"
  "MSUNK1.MCD"
  "MSUNK1.PCK"
  "MSUNK1.TAB"
  "MSUNK10.MAP"
  "MSUNK10.RMP"
  "MSUNK11.MAP"
  "MSUNK11.RMP"
  "MSUNK12.MAP"
  "MSUNK12.RMP"
  "MSUNK13.MAP"
  "MSUNK13.RMP"
  "MSUNK2.MCD"
  "MSUNK2.PCK"
  "MSUNK2.TAB"
  "MU.MCD"
  "MU.PCK"
  "MU.TAB"
  "MU00.MAP"
  "MU00.RMP"
  "MU01.MAP"
  "MU01.RMP"
  "MU02.MAP"
  "MU02.RMP"
  "MU03.MAP"
  "MU03.RMP"
  "MU04.MAP"
  "MU04.RMP"
  "MU05.MAP"
  "MU05.RMP"
  "MU06.MAP"
  "MU06.RMP"
  "MU07.MAP"
  "MU07.RMP"
  "MU08.MAP"
  "MU08.RMP"
  "MU09.MAP"
  "MU09.RMP"
  "MU10.MAP"
  "MU10.RMP"
  "MU11.MAP"
  "MU11.RMP"
  "MU12.MAP"
  "MU12.RMP"
  "MU13.MAP"
  "MU14.MAP"
  "MUSIC.COM"
  "MVOL.DAT"
  "OBDATA.DAT"
  "ORGANIC.PCK"
  "ORGANIC.TAB"
  "ORGANIC1.MCD"
  "ORGANIC1.PCK"
  "ORGANIC1.TAB"
  "ORGANIC2.MCD"
  "ORGANIC2.PCK"
  "ORGANIC2.TAB"
  "ORGANIC3.MCD"
  "ORGANIC3.PCK"
  "ORGANIC3.TAB"
  "OUT01.LBM"
  "OUT02.LBM"
  "OUT03.LBM"
  "OUT04.LBM"
  "OUT05.LBM"
  "OUT06.LBM"
  "OUT07.LBM"
  "OUT08.LBM"
  "OUT09.LBM"
  "OUT10.LBM"
  "OUT11.LBM"
  "OUT12.LBM"
  "OUTRO.IDX"
  "OUTRO.VID"
  "PALETTES.DAT"
  "PIPES.MCD"
  "PIPES.PCK"
  "PIPES.TAB"
  "PIPES00.MAP"
  "PIPES00.RMP"
  "PIPES01.MAP"
  "PIPES01.RMP"
  "PIPES02.MAP"
  "PIPES02.RMP"
  "PIPES03.MAP"
  "PIPES03.RMP"
  "PIPES04.MAP"
  "PIPES04.RMP"
  "PIPES05.MAP"
  "PIPES05.RMP"
  "PIPES06.MAP"
  "PIPES06.RMP"
  "PIPES07.MAP"
  "PIPES07.RMP"
  "PIPES08.MAP"
  "PIPES08.RMP"
  "PIPES09.MAP"
  "PIPES09.RMP"
  "PIPES10.MAP"
  "PIPES10.RMP"
  "PIPES11.MAP"
  "PIPES11.RMP"
  "PLANE.MAP"
  "PLANE.MCD"
  "PLANE.PCK"
  "PLANE.TAB"
  "PLANE00.MAP"
  "PLANE00.RMP"
  "PLANE01.MAP"
  "PLANE01.RMP"
  "PLANE02.MAP"
  "PLANE02.RMP"
  "PLANE03.MAP"
  "PLANE03.RMP"
  "PLANE04.MAP"
  "PLANE04.RMP"
  "PLANE05.MAP"
  "PLANE05.RMP"
  "PLANE06.MAP"
  "PLANE06.RMP"
  "PLANE07.MAP"
  "PLANE07.RMP"
  "PLANE08.MAP"
  "PLANE08.RMP"
  "PLANE09.MAP"
  "PLANE09.RMP"
  "PLANE10.MAP"
  "PLANE10.RMP"
  "PLANE11.MAP"
  "PLANE11.RMP"
  "PLANE12.MAP"
  "PLANE12.RMP"
  "PLANE13.MAP"
  "PLANE13.RMP"
  "PLANE14.MAP"
  "PLANE14.RMP"
  "PLANE15.MAP"
  "PLANE15.RMP"
  "PLANE16.MAP"
  "PLANE16.RMP"
  "PLANE17.MAP"
  "PLANE17.RMP"
  "PLANE18.MAP"
  "PLANE18.RMP"
  "PLANE19.MAP"
  "PLANE19.RMP"
  "PLANE20.MAP"
  "PLANE20.RMP"
  "PORT00.MAP"
  "PORT00.RMP"
  "PORT01.MAP"
  "PORT01.MCD"
  "PORT01.PCK"
  "PORT01.RMP"
  "PORT01.TAB"
  "PORT02.MAP"
  "PORT02.MCD"
  "PORT02.PCK"
  "PORT02.RMP"
  "PORT02.TAB"
  "PORT03.MAP"
  "PORT03.RMP"
  "PORT04.MAP"
  "PORT04.RMP"
  "PORT05.MAP"
  "PORT05.RMP"
  "PORT06.MAP"
  "PORT06.RMP"
  "PORT07.MAP"
  "PORT07.RMP"
  "PORT08.MAP"
  "PORT08.RMP"
  "PORT09.MAP"
  "PORT09.RMP"
  "PORT1.MCD"
  "PORT1.PCK"
  "PORT1.TAB"
  "PORT10.MAP"
  "PORT10.RMP"
  "PORT11.MAP"
  "PORT11.RMP"
  "PORT12.MAP"
  "PORT12.RMP"
  "PORT13.MAP"
  "PORT13.RMP"
  "PORT14.MAP"
  "PORT14.RMP"
  "PORT15.MAP"
  "PORT15.RMP"
  "PORT16.MAP"
  "PORT16.RMP"
  "PORT17.MAP"
  "PORT17.RMP"
  "PORT18.MAP"
  "PORT18.RMP"
  "PORT19.MAP"
  "PORT19.RMP"
  "PORT20.MAP"
  "PORT20.RMP"
  "PSYNOM.MCD"
  "PSYNOM.PCK"
  "PSYNOM.TAB"
  "PYRAMID.MCD"
  "PYRAMID.PCK"
  "PYRAMID.TAB"
  "RISE.IDX"
  "RISE.VID"
  "ROCKS.MCD"
  "ROCKS.PCK"
  "ROCKS.TAB"
  "ROLAND.CAT"
  "ROUTES"
  "SAMPLE.CAT"
  "SAND.MCD"
  "SAND.PCK"
  "SAND.TAB"
  "SCANBORD.BDY"
  "ter-SCANG.DAT"
  "geo-SCANG.DAT"
  "SEA.MCD"
  "SEA.PCK"
  "SEA.TAB"
  "SEABED00.MAP"
  "SEABED00.RMP"
  "SEABED01.MAP"
  "SEABED01.RMP"
  "SEABED02.MAP"
  "SEABED02.RMP"
  "SEABED03.MAP"
  "SEABED03.RMP"
  "SEABED04.MAP"
  "SEABED04.RMP"
  "SEABED05.MAP"
  "SEABED05.RMP"
  "SEABED06.MAP"
  "SEABED06.RMP"
  "SEABED07.MAP"
  "SEABED07.RMP"
  "SEABED08.MAP"
  "SEABED08.RMP"
  "SEABED09.MAP"
  "SEABED09.RMP"
  "SEABED10.MAP"
  "SEABED10.RMP"
  "SEABED11.MAP"
  "SEABED11.RMP"
  "SEABED12.MAP"
  "SEABED12.RMP"
  "SINE.DAT"
  "SMALLSET.DAT"
  "SMOKE.PCK"
  "SMOKE.TAB"
  "SNDEND.EXE"
  "SNDSTART.EXE"
  "SOUND.CFG"
  "SOUNDRV.COM"
  "SPANISH.DAT"
  "SPANISH2.DAT"
  "SPICONS.DAT"
  "TAC00.SCR"
  "TAC01.BDY"
  "TANK01.PCK"
  "TANK01.TAB"
  "TASOTHS.PCK"
  "TASOTHS.TAB"
  "TDXCOM_0.PCK"
  "TDXCOM_0.TAB"
  "TDXCOM_1.PCK"
  "TDXCOM_1.TAB"
  "TDXCOM_2.PCK"
  "TDXCOM_2.TAB"
  "TENTAC.PCK"
  "TENTAC.TAB"
  "TEXTURE.DAT"
  "TRISCEN.PCK"
  "TRISCEN.TAB"
  "TRITON.MAP"
  "TRITON.MCD"
  "TRITON.PCK"
  "TRITON.RMP"
  "TRITON.TAB"
  "TWE01.LBM"
  "TWE02.LBM"
  "TWE03.LBM"
  "TWE04.LBM"
  "TWE05.LBM"
  "TWE06.LBM"
  "UEXT1.MCD"
  "UEXT1.PCK"
  "UEXT1.TAB"
  "UEXT2.MCD"
  "UEXT2.PCK"
  "UEXT2.TAB"
  "UEXT3.MCD"
  "UEXT3.PCK"
  "UEXT3.TAB"
  "UFO01.MAP"
  "UFO01.RMP"
  "UFO02.MAP"
  "UFO02.RMP"
  "UFO03.MAP"
  "UFO03.RMP"
  "UFO04.MAP"
  "UFO04.RMP"
  "UFO05.MAP"
  "UFO05.RMP"
  "UFO06.MAP"
  "UFO06.RMP"
  "UFO07.MAP"
  "UFO07.RMP"
  "UFO08.MAP"
  "UFO08.RMP"
  "UFOBITS.MCD"
  "UFOBITS.PCK"
  "UFOBITS.TAB"
  "UINT.PCK"
  "UINT.TAB"
  "UINT1.MCD"
  "UINT1.PCK"
  "UINT1.TAB"
  "UINT2.MCD"
  "UINT2.PCK"
  "UINT2.TAB"
  "UINT3.MCD"
  "UINT3.PCK"
  "UINT3.TAB"
  "UNIBORD.PCK"
  "UP001.BDY"
  "UP002.BDY"
  "UP003.BDY"
  "UP004.BDY"
  "UP005.BDY"
  "UP006.BDY"
  "UP007.BDY"
  "UP008.BDY"
  "UP009.BDY"
  "UP010.BDY"
  "UP011.BDY"
  "UP012.BDY"
  "UP013.BDY"
  "UP014.BDY"
  "UP015.BDY"
  "UP016.BDY"
  "UP017.BDY"
  "UP018.BDY"
  "UP019.BDY"
  "UP020.BDY"
  "UP021.BDY"
  "UP022.BDY"
  "UP023.BDY"
  "UP024.BDY"
  "UP025.BDY"
  "UP026.BDY"
  "UP027.BDY"
  "UP028.BDY"
  "UP029.BDY"
  "UP030.BDY"
  "UP031.BDY"
  "UP032.BDY"
  "UP033.BDY"
  "UP034.BDY"
  "UP035.BDY"
  "UP036.BDY"
  "UP037.BDY"
  "UP038.BDY"
  "UP039.BDY"
  "UP040.BDY"
  "UP041.BDY"
  "UP042.BDY"
  "UP043.BDY"
  "UP044.BDY"
  "UP045.BDY"
  "UP046.BDY"
  "UP047.BDY"
  "UP048.BDY"
  "UP049.BDY"
  "UP050.BDY"
  "UP051.BDY"
  "UP052.BDY"
  "UP053.BDY"
  "UP054.BDY"
  "UP055.BDY"
  "UP056.BDY"
  "UP057.BDY"
  "UP058.BDY"
  "UP059.BDY"
  "UP060.BDY"
  "UP061.BDY"
  "UP062.BDY"
  "UP063.BDY"
  "UP064.BDY"
  "UP065.BDY"
  "UP066.BDY"
  "UP067.BDY"
  "UP068.BDY"
  "UP069.BDY"
  "UP070.BDY"
  "UP071.BDY"
  "UP072.BDY"
  "UP073.BDY"
  "UP074.BDY"
  "UP075.BDY"
  "UP076.BDY"
  "UP077.BDY"
  "UP078.BDY"
  "UP079.BDY"
  "UP080.BDY"
  "UP081.BDY"
  "UP082.BDY"
  "UP083.BDY"
  "UP084.BDY"
  "UP085.BDY"
  "UP086.BDY"
  "UP087.BDY"
  "UP088.BDY"
  "UP089.BDY"
  "UP090.BDY"
  "UP091.BDY"
  "UP092.BDY"
  "UP093.BDY"
  "UP094.BDY"
  "UP095.BDY"
  "UP096.BDY"
  "UP097.BDY"
  "UP098.BDY"
  "UP099.BDY"
  "UP100.BDY"
  "UP101.BDY"
  "UP102.BDY"
  "UP103.BDY"
  "UP104.BDY"
  "UP105.BDY"
  "UP106.BDY"
  "UP107.BDY"
  "UP108.BDY"
  "UP109.BDY"
  "UP110.BDY"
  "UP111.BDY"
  "UP112.BDY"
  "UP_BORD2.SCR"
  "URBITS.MCD"
  "URBITS.PCK"
  "URBITS.TAB"
  "VECTOR.COM"
  "VOLC.MCD"
  "VOLC.PCK"
  "VOLC.TAB"
  "VOLC00.MAP"
  "VOLC00.RMP"
  "VOLC01.MAP"
  "VOLC01.RMP"
  "VOLC02.MAP"
  "VOLC02.RMP"
  "VOLC03.MAP"
  "VOLC03.RMP"
  "VOLC04.MAP"
  "VOLC04.RMP"
  "VOLC05.MAP"
  "VOLC05.RMP"
  "VOLC06.MAP"
  "VOLC06.RMP"
  "VOLC07.MAP"
  "VOLC07.RMP"
  "VOLC08.MAP"
  "VOLC08.RMP"
  "VOLC09.MAP"
  "VOLC09.RMP"
  "VOLC10.MAP"
  "VOLC10.RMP"
  "VOLC11.MAP"
  "VOLC11.RMP"
  "WEEDS.MCD"
  "WEEDS.PCK"
  "WEEDS.TAB"
  "WORLD.DAT"
  "X1.PCK"
  "X1.TAB"
  "XARQUID.PCK"
  "XARQUID.TAB"
  "XBASE1.MCD"
  "XBASE2.MCD"
  "XBASES00.MAP"
  "XBASES00.RMP"
  "XBASES01.MAP"
  "XBASES01.MCD"
  "XBASES01.PCK"
  "XBASES01.RMP"
  "XBASES01.TAB"
  "XBASES02.MAP"
  "XBASES02.MCD"
  "XBASES02.PCK"
  "XBASES02.RMP"
  "XBASES02.TAB"
  "XBASES03.MAP"
  "XBASES03.MCD"
  "XBASES03.PCK"
  "XBASES03.RMP"
  "XBASES03.TAB"
  "XBASES04.MAP"
  "XBASES04.MCD"
  "XBASES04.PCK"
  "XBASES04.RMP"
  "XBASES04.TAB"
  "XBASES05.MAP"
  "XBASES05.MCD"
  "XBASES05.PCK"
  "XBASES05.RMP"
  "XBASES05.TAB"
  "XBASES06.MAP"
  "XBASES06.RMP"
  "XBASES07.MAP"
  "XBASES07.RMP"
  "XBASES08.MAP"
  "XBASES08.RMP"
  "XBASES09.MAP"
  "XBASES09.RMP"
  "XBASES10.MAP"
  "XBASES10.RMP"
  "XBASES11.MAP"
  "XBASES11.RMP"
  "XBASES12.MAP"
  "XBASES12.RMP"
  "XBASES13.MAP"
  "XBASES13.RMP"
  "XBASES14.MAP"
  "XBASES14.RMP"
  "XBASES15.MAP"
  "XBASES15.RMP"
  "XBASES16.MAP"
  "XBASES16.RMP"
  "XBASES17.MAP"
  "XBASES17.RMP"
  "XBASES18.MAP"
  "XBASES18.RMP"
  "XBASES19.MAP"
  "XBASES19.RMP"
  "XBASES20.MAP"
  "XBASES20.RMP"
  "XBITS.MCD"
  "XBITS.PCK"
  "XBITS.TAB"
  "ZOMBIE.PCK"
  "ZOMBIE.TAB"
  "universal-patch-tftd.zip"
)

md5sums=('b46ab1beeadcac8c14dd61d69d57865a'
         '9e860e05a11e42b34f8ba4d790ba8bfc'
         'f41e41471074a14d1572f822d0e7824e'
         '770a3225f74c5dedbbc6c1320b316ada'
         'c455fed7fa42f927958533128e7cc7b5'
         '574f2254e1264b98abf1fac3896b881f'
         'b87e8e35a875224a44ece04936b0aae1'
         'd673990a6d55116718dd1b6cb2147622'
         '5200a09f401cf7c1237cc9f102ce4950'
         '29c95519c49ce1fc85a5d0119b95572f'
         '61567787d6f3ef16717ac69ae607a30f'
         '1a23b4f367833bf00fa51be6bb8a82fb'
         '8bb80210075cf8915e13218b6201061f'
         '41e75260805d6cc021686b067db05927'
         '3be9f983907a1c3c3b54c081da55dc34'
         '0f4ed07f4bccba7e2e12217a9e8d73ae'
         'd0adae002fbc3ab36a95447f2afced81'
         '5eba4c5013e22bf560c5e86ccce9e9dd'
         '255f04be8137be752338554ec44bbe3c'
         'fe123b673615668c228d49f700da22a1'
         '1c631b65e6e864c9b80ac9fc46bca05c'
         'e9fc3afd78967b4c6587751525654369'
         '79fcdfc2d8d146fae40b1cacd25c8c6b'
         'd7bb93108493c923f194abb1f129b5fb'
         'feeca07fbcba9ee4f52828eca2023b7d'
         'fa0f1624fbc1b5767cc76357fb8313ae'
         '7a33393dec610bcf83daacb309173e1a'
         'e42adb8dc2baa06a9cde3e41503a0b7a'
         '661ea71ad47e16ae9f577e28350033fb'
         'e8a494929c0e514ae647004c2002295b'
         'a711706158864b45c577eec56909fa99'
         '5e334e643e5f5dcf415531341f70fac3'
         'bbab96dab6881f65d6490c318a5c0d06'
         '75aa130e4372e53dad0dd2995f954328'
         '76d6dad7fef8364e1daa40d818426323'
         '2844c45410ab61dc22f4966f248436f3'
         '0443c08978d9eb839c0d90648a8b9e83'
         '437325cc764d722100bdb0c4cebf42a8'
         '425f75462c4bfcc36636aa39c4d900c8'
         '60b3dcf002c64231cc65c4ccb9dc34bc'
         'c205dd41a5587cc5140dc2cdbc4a9bc3'
         '4f96c8e204a11c539c65a6e3addece57'
         '1ef998ee7f743640b2c44d0d6f848434'
         '8ed87a1f5cf7b721711cd4cc8700e946'
         'd877fc293a204452356ff6025ece1a0f'
         'ff1892d7d331c0077af9152cb45ad3a6'
         '90581d5c930703da499431f363289097'
         'd93e82c6efbdf6de8f24370a10114394'
         '0c6efe7fa8c5dbf2669be7ad4551bfb4'
         '247c2abfb02e8fec9d87e2f274091984'
         '9a0c73bfff0ef905b2dbaba57fc57b63'
         '601b04378b3c66b7b0225b3c124af914'
         '16b4b0729dfd2b78a24ead51cbf1ed8a'
         '03913111c3332270cac9d8c41e5800d1'
         '3aa585d47b9665c2a61181d98e7a1611'
         'a547e176a6869871730a8cf068a8feb5'
         'b82e2f97fbab789a3ac142cdde6cb62a'
         '7f2d9ecbcb6c68cfa326ff4ddcad11d6'
         '8b5e1f2681c089cf475dca5eff001aa1'
         '5d6980ff23b17e3fad409497466fe10e'
         '2571a5da50d6575d9e67e232515af419'
         'deffb73ac23e44dbede8259b773d5338'
         'f48efaef6f78ca1ad54585195a996a7e'
         '54e4156ffb5ec0d64d1e17216d122133'
         '10293c2409d947a97cfcc5c7fad1aad2'
         '9eebd87f58de15dd623ebcc357e39544'
         '7ba51a7bacb4def4d1af85019a7cf6ce'
         '933687a1700e83c86ced8ce6812db56e'
         '279fd96cf370d9973cc4090567cf5822'
         '1e2ca622fe93d98e676c44a67d21194f'
         '7e63ee73d54ff53ef494369f174d2a2a'
         '78ff4011c1f51e1dde408bd87d1e7262'
         '18a74a77f1a728077a000a53acab3b55'
         'd0eaafe0e4d638a23bc5f6d7e269fb21'
         '46b461c6e5828093f7af992339ba4484'
         '871ff97dc60d00573f79b9f8f7ae3530'
         'f8a49ac474f4208b4c09188fe529311c'
         'de2936cccbc13b6105615077984766d4'
         '04adc566494e61cf18e679aa07d14d04'
         'dab0bd0fcaeecc885ae13e219894f376'
         '8a41576af4ce1bd964a39d6237bc39cf'
         'a98d35888fd7fe3f51cb72392e89a1cb'
         '6e629bb4487a26643bf79b8252c4e069'
         '6f1fa5e02a98bce22b9e9238defcb92b'
         '062bd94a3de1adb62b2c819827f07f0a'
         '8154b7b96b6504ba3f172abf4ac2aad0'
         '821c9536033a277c10e5456e736f991a'
         'beba0fcc4a13bd998b8dd69b45dee5fc'
         '67df1f3db5a810a92076bf19e1d7d9c2'
         'c29168611477bd05ddcdfa4073524b1c'
         'a61d67d5f7c271224e7011d919cb766d'
         'b65e708d86ab3adced528bef31c4cfce'
         '94a37e205fb19ce91af35226eacaa6bb'
         'dca3647de9fac958c49db558726792ec'
         '72104cdfae949917843038d32d544bee'
         '51566782e2625d8327be3f63b6c20896'
         'da256c3358ef0b5d74b33758834e9ad3'
         '75c4345ff656e112eef601e0aa8ca22e'
         'ed0c52f5bc9390840dea1ba28182eb5f'
         '9465c8753b211226cebb97c46ff279cb'
         'a31009e72407f443ee3433526ccf443c'
         '80337f8d00eb187d6904a161bbad8d10'
         'a50b27f0c6f9ebec3f98140c759ee8b4'
         '520ef3c315cd65be0db6ba3056d255ad'
         'f091e75a9688cbf740ecaa6fee366c77'
         '515cf52d01e10cc4fe6fffb3e88ba156'
         '7c53e496f97737658bfacdb784d8ca36'
         'fe236db14eef45215df7696f39f6eeb9'
         'ed7fc593d0d8864235a8831d4d7c49b2'
         'adc8bdade3e2dd3156abb8de5b491591'
         '36430672fb9881e3b98f87f8e346e849'
         '4b66baa5e6dd3c691c7ac9d5351ffe3b'
         '80526137240e61c2fafa6fe6bf90e79c'
         '5eb72d036a17257e3187b50a3189d0a6'
         '343adac91af58b5d043b8b3d0f7cbf10'
         '67da1bcc946a70195bd80a3c176784e4'
         '64231175ea61da51b12376a0cc2d2cf4'
         '696105648673b6cb8d50cdc48934b1e7'
         'f5c5cf347eabbd38c1703bca5fce32f2'
         '22b54ca3646dec0b343bdbe9e4613416'
         '211d94470d7fd6275b56f2c0d92507af'
         '2f1889b7d2abf6983214be8ad639d61d'
         '749641e29529cdac182238842fa7e45e'
         'cb39fc8decf6731b280e71166d6b6547'
         'f0ff877d8c8b63bf1862f96ef8e4ba67'
         'ddf68f7de3f365e115273a3bfdd3fe18'
         '23e06a3e87aeb5e8823db512156557c0'
         'a02c86c0af658bb584b0064530728b1a'
         '6b62f67dc3a42bfe8c2ce9773f59e0f3'
         '7fb1601b41e19b4e3a3de9e666c8d2cb'
         '7fb1601b41e19b4e3a3de9e666c8d2cb'
         'deeb2fc654de3eafe502481edc5afae7'
         '8b4b9071e5174ed85dc5dbbe2e82551a'
         '229c238e93a7f9a57cd1d32b75886b69'
         '8352cacdc0cc9af97270d0c070709f62'
         '3ce2b0d1e06bc041a76827f68a674746'
         'd4396704e792ca010d447366d6d2dd42'
         'd6a69e595c83c39ca0ba755a1d0d4ae8'
         '436d339ae64e1c10a4d65f92978cc152'
         '38006e3aa7167046c0576f21fbe24da2'
         '02c89397412e9052f1c660797d9ba97d'
         '224c23799692896f2e9ffb3181763c18'
         '6446c7f184dac64ec27fcdd4a6abb150'
         '3e242045b0bf3422556acb41db21cab5'
         'd973a4bda1df0711e3ff1256e6a7db83'
         'e1a053ca8eac4ee94d511f0a915443d6'
         'cd579534147482a9f3a612410adaebb4'
         '1b52a2ea0044063914f0a110ba3d487d'
         'eade2c715f7c7944f3467beac8213054'
         '6a2b1ec8182f5025ee505c6949356925'
         '38b4059a99cf0d16905e18d1d76ae71b'
         'f32638f274b22750e1087521feb0f88b'
         '5ca55ae29c6261e586ddb32d9b4afbc6'
         'd6aec92359d0f667e65bab86bca0b476'
         '4ed553a88d3ca01a468ec454cd826b5b'
         '5929466039e0843cd214eba6325d679e'
         '673a8fec3074beabc2582af2689dbc73'
         '6e1cdb04309e7f1e7ebbe60955220b89'
         '719504d2ccd07a6ad5e221bd0cc6725b'
         'aa11959a397c54223ad1f9e90d7a1934'
         '1c9c08cade1cf4b9fdd6106b6abccb85'
         '57dbd27d74f9b7e2549e4d4774043465'
         '1093b8fa12fcf1724523704b50942835'
         '10621bc6430efca658e0d9720d65b5c7'
         '3e88a00b07bf35815e862a92faa8aac1'
         '35d42f1ca331267940ec18577199670e'
         'b05eca59cec5ddfb70d44615857c20a1'
         'dd9b9cced2cffe7593483cf5dc3f4df7'
         'd67f415d1491bb3db8114d01abf00527'
         'cf5d2a6875de1f65acd5fb427e9ee8a8'
         '98d43be35d3c132ab3cefaea1c4424ba'
         'c585878be93999dbb253a9c52a0616cb'
         'ea99d634158e90719cde36b3b9be0764'
         '95066973337cdf0ad115355a13d7d3dc'
         '3d7ec2183cdcc4b060635e06c4c3bc5a'
         '45462a59ce02a683ac04ae7729237298'
         'f54e8b8d9033d62e87814662fcb25ad6'
         '07bb41630ac9b0e57bc0c268ccbcd5a6'
         '5ae0733e04e149865da72e93b5330466'
         'edbafd564252faf25c6347002f6f9eef'
         'caa16e74e7e41c9b139080e445e27d1f'
         'd104e643f6d47dee526b96a94b6d05bf'
         '61406797ba2842e7c5765a9b584a8e1d'
         '208a5e3fe45bc2fe0edb8e885857d777'
         'afe318bb88356bbcb4c18c9aa814a7f4'
         '4be510e4c58392b61d7cf1ae0884b59b'
         '8f61c1ac6e1953d06e3d609435486dea'
         '722d989404117c0d047e46cb059cf36c'
         'e04595f9a4404ad7fcdf53e646e6c5d2'
         'faf3a78c7d5bd0e472e8559c6c8d0495'
         '29a5b47868731173ec948c20eef35827'
         '2e0edca58f18ab0cdc1fbb0f209a2304'
         '60f14a274541f033cf703ee50b71f05c'
         'e6f6b3e90527c88930585bc847444813'
         '9f080f4ee0d71fcbcaa7ddc1a7df1d1a'
         'd6e4e846d41410b57ecd0a04574b5e46'
         '50c8947f9f6dded46dc516f67509bb81'
         'be933b6789c2679b08208d4a5e9bfd8b'
         '1546136c2e59c33a99fa167c60d21670'
         'bedffe12e05d5e70e2961320fd8483be'
         'd6ad606fd1c545335011ddcce148e4c8'
         '806069a3e626f43367383ccfc39de1a0'
         'beec2be8af4105c1d97b591ae45b661f'
         '5502d6c251bead5b63cfad22b1735a21'
         '9e2e7be4796d1467113ec915cbb70c2d'
         '537145f3ac202a41f5ee20a27c8b9b47'
         '8437884214c7e78f33b40850c14f9cb9'
         '5d71d22b5c828bfe97e08fa5bb081c41'
         '3ff9ef54e6b38b25bfa84e14fe97679a'
         '7a11063faa9295c2c57c119aad29a8d7'
         'bba7fa663d2d5974dd23804908a6cc44'
         '42dd1c4281b4a2ce32fb7ca4675b2172'
         'bbc249cd9d7c398d7bb5d932d161a32e'
         '7220ef2200c5d559352d42a504866e0a'
         '1d5646c5e6884a46f2ad2b00b52c1740'
         '4a3255aec7d0cfc117a05f8979b4d271'
         '2065f13f5ede8f1130374d58c52273a7'
         '31cb6c76a625f8bdaad13f57e374f991'
         'e98c64713cef09771d30aa459e80d83f'
         '380afe99e27fdc991fd8c4d5055c7e2c'
         'fda34081019ddb8ce36754dbf6d675d9'
         '1199549c6cc2f97b1aea0b52a02a3d8f'
         'dba2618428d131529b9e4fd371fa6c83'
         '39aa3b828da5ae2a9eca8b0a1f543a81'
         'a9ece4dd109524b65751e89cfdbc7129'
         'dacec32e36a0aeaefebef64a209d6879'
         'f19c2c4fd035255e74c2cb79b8aa91f2'
         '8fe8bff6a31433c27758c254913a0def'
         '78f864d126fba14d317546b6eb44564d'
         '42c335410eb7cfbd0f7b54bb6d27e010'
         'ea419af94395fdf35a46dec113a903e3'
         '8a4b46300af50cc76b09d5f4c3d4fc21'
         '619a64cf1e0ab0c2f214eb8a13bf190d'
         '09eee8315adf34ee7f0c9da93c6db0f3'
         '49e9c080b420a9eff7e4a2dbd09b4065'
         'a6c7c398efcc7b2be8543b9d85619256'
         '2dc516d0d473be1810cecf605b322a29'
         '503e314a2805c4efd177e4a488211d74'
         '8d358f7e20b490f4d0aaa97b94f55e7e'
         '0638e5ad616c9d6864ced4a3fb19f540'
         '8a41d4a5a0a69316bd07d27168d7d7ad'
         '7ab36dc8a37c98866163e4a3db566a6c'
         'be2551c5f8ec8e68784b679f74681fd2'
         '57dd008abd58470df807be30286000f9'
         '63f94d31044eba6c8c484fdfd865bfe2'
         '6cc360ecca6f6815f2e0621c023ded52'
         'a461c348bf83d57d2cede50f30a6a964'
         'eaba541607ecc38cbefd927c7cd008c5'
         'ac98f25e8d23151e1868b75bb38fdac3'
         '8e505c0835df30d2bc4e601e6645b57c'
         'abbe25b2f3cfd361fa5cd898bf12a7b4'
         '427f85217659b262283442717da51691'
         'c8595dc2912e69db8931edc97d4e6227'
         '99aefb672c5a314358a767d329b9afaa'
         '671438e724b4f2472ea398db495ef102'
         '18304e34fa77de07a7d15d48ea0db565'
         'debdf49e958f147c7f5166276f1bd16f'
         '825b0d78dfb0e38ec4d2ad64442dcf32'
         '05ca2c0f5a3a49279e23e1f3fcbef33c'
         '836de79682654e9c101ab8c581978ee8'
         '214bb7faae55c2c946ccff6d9837bd49'
         'd596af9fc445da0bdaf4bdce9c41dc6d'
         'edec5973083aae3532aae28ae06d4aae'
         '5349e27be3afc2facdb6a4347ac860dd'
         '241e6fa07e10b8fafa78505f65076f93'
         '1a788cdd0b9e6fd7c46b7ce88487433b'
         'e678c244f1a128ed68b830c95e29425f'
         'dff82b7fa9ef0c4b446472dc3fb62617'
         '7b074865253bba50018019e386f3297c'
         'ae93e39cb1f45d3a1c42999daa716634'
         'd939939f95ad2113efb1a95ce9c9ce02'
         'edeb7feaf581954b8532e9ead021ae0c'
         '0f3b5b016607f3855c4f3225bf8165a1'
         '3aa322d8a7f5f952e671541fcecc1d1d'
         '7ac7883774eee2f0d795e3a891684728'
         '65a5ab886f0180cd532c36de566a27a6'
         '389cdd05a031c42ed2b005da5a210fe4'
         '530a92e1a25d51de7dc62739c30ee115'
         'ceb9b96232c4eb1742738d7297a43f1d'
         '2a2ffa2d308c8ed3231c858ad9b8860d'
         'a0223c66cdd26d5c7e28d43bb06d2cfb'
         'dfa91bd09af1ccc7110575ca9b31da70'
         '53e4674a4533a8c3983e5991b4a2055c'
         'b02b2236c544c0c2f0edbb141524c2c4'
         '50c6de8ccfe2b57f18403145c4d63699'
         '4c17bbc2dacd1577d428e326eb3eb82a'
         'd423592ff321d9a3ba16f5d506364621'
         '062146ff817b3aa394c90574d7fc945c'
         '95bf903d8f3ddcc1dacbb39594bea0f9'
         '17f5b3256c82914758ccfc1ae541e625'
         '9ffccb1d14dc8389dc57172db0c77d98'
         '7ec15bf7bc66b9338697e249d4c13603'
         '69bf5fe57fd4ab6a7e8c3f2e367f7e19'
         '4a8572b884abb2f43dd61f11c9c08199'
         '1856d2c5e5cb761ecd94b1e447485ef5'
         'e47087c1cfe86aabf9fe6073564aaec3'
         'ea61c92bc516502ea49973e58d4f9944'
         'ae1b5f3642f4f3e622047b392e2bdc11'
         '0c8b576e35603b00ceaebe30f8bf0db0'
         'f3c5bead353a8bab7b80afde3c833a41'
         '0386ba2e31baf52fb4c4d6ad614f3c90'
         'e52996181d6f5486afb17e2537a343f8'
         '17c118b58ec8d58fac7f0047cc8e5adf'
         '79bdb747b7b35adadbe77ccbb5664644'
         'c4e7e87aa3f08edf812ab7c0a8153d51'
         '81aab6a312c52d83093ad27ea7a063fd'
         '122aae9ace0b2b4e38f8b97c0ddc27a3'
         'b9782ef8e962ef5ba0b055f3e5113f58'
         '821b1f4019decdb6880deb038baf4180'
         '41aa262799a326c9d2f584b5e03628dc'
         '4216bba147dd5226343937ced5fa4258'
         '2c7ccc12606726a1f042d33c3845e108'
         'a71c90e1ef533840e3aaba29a2605e62'
         'b4e5d3c13f445bc5f34d389e4b5adcf2'
         'e3ba3040c619252cc325191d048f5df5'
         '9468565f91cae1114d0d7ede88a09db6'
         '368d7c279af263b9eb89825b6207ae84'
         '9468565f91cae1114d0d7ede88a09db6'
         '6939b3b6dd29a19485c0b25496a2cc6e'
         '9468565f91cae1114d0d7ede88a09db6'
         'ee53c2d140a634d4a2455799f9ea0e9d'
         '9468565f91cae1114d0d7ede88a09db6'
         '9005c3a5fa5448790c22ecccc4128c73'
         '35be7fc8174d92aa4c2f933e4a86557a'
         '597bb0054fb39c504a1bd6ce8377b42f'
         '1ccad5274b37f2904e279de1ad5a90d9'
         'a5edb69b7fd1acbfd74734c066697234'
         '95058d6717fbe964190100591596c1f1'
         '483cf2a23380ed2628927226a4e55154'
         'e724180886139db084e091469bc31247'
         'c4cadf3659a294b8bf7d6ece7b83eae3'
         '895a49367ef870758af8a9b19118fb2c'
         '3ec0cdb7a3f74b9f09c8f84073d95ff0'
         '78e89f51ab0ee89b24c440646c21b7f4'
         '263475070ab4788fb9e2a8c9a1019680'
         'c32d29d32087b4bef5d2c2c371ac87a9'
         'f45e02edccf18796f56b8de3ace7a1c5'
         'f70af6e59080b6d1f47c96cdd9350417'
         '591d53fb0fe5ef080b91ee91ef25d20e'
         'b03d4fe513da0a3b35845d68f02ebfe5'
         'b04f9ee9f005daa430165b36715e9cc6'
         'd7ea4000c293b81bcebaee7ebd90c03d'
         'f06e76b13c0a0536339a91a46bd14a95'
         'e354f0642f214693fe52f41e969035aa'
         'be97f7541b4a9ea85188719c7e94b8d0'
         '1532cbf59540db00814640f2d2993806'
         'e1680e23a2b4dbb8da23448bf28063e3'
         'b78b3903a3959f5a2a0bd6efa3949eda'
         '74515f9deca1d354cac6bf53df48c790'
         '7ff2a069614c95299044b510609f6acf'
         '10efdb23be21eea57b5efe71405346b2'
         'd97ab136fe875fe764ab2e569465bf6e'
         'bb6c035649f4a550a44739363da171b6'
         '183d43feb113b4a1e79d8b77e8a40f2c'
         '08e8cc44a8cd41b0ec13ab50da95f7e7'
         'd260fdf643a1cdfe1ffba0163a70d35e'
         'f70ad6735701e89d83320e0a323c2557'
         '856fbd07c5782fcb8024b9674a4f613f'
         '2f64c93e5e4a6443d5ab254f4827a33c'
         'dcc612f3475d771acaf3c6b5e3f8946b'
         'bee3166675f21f5759eb01465def4395'
         '5dc6c25f6fa26370664b55b01daa455f'
         '1bedaf2a3d9ce2368e42e950ac525a80'
         'd3ce54f5d0b14e29a5cea0685c1b70bb'
         'afd712ac2ccf41fb39968ed8cb8dad37'
         'b4cd74fc0e8624a106a7441a4e532854'
         'a94015a7e1252ac7e06b6a635bd5d30b'
         '6c33eb37cf43ffff70f39f30e2e7bbd0'
         '541d703b00ce1a4389b5a5581875204f'
         '13bb9f24a253b0b6db3b597976099b75'
         'f4e48ee2abaf0644139b9155618ce59d'
         '544c521e9df53cb57805ffe8fbd0ecc5'
         '114c14e19e73a3e49c1ebbfd2e5b3a9f'
         '8fa443c0ec061d082b784b2ce49b332e'
         'be4bc4e782715181125227662d8a8ff1'
         'ecc78ef32ef4072588e7591b385dc1ba'
         '1cb350a3fc4d784af32e3d07921b9d57'
         '93d979c5a53492f0dfe2a1fdfb55f025'
         '2f4529e41d1fbf8dcc05ad9bf2cd9e8e'
         'e3f2594b257f46a1b7f72e313aa16935'
         '2340648cfa890aaaa354808a6efb9f44'
         '321c3df3ae3c0e04d7945cf42e0d5fb8'
         '9e497e3aaee95aa25fec86c3609ff373'
         '2ae9b77d7f586adfce09668bfc4534c1'
         'd9494c74007cfa0d8dc6a27b6deedc86'
         '76ca74b6d09cd93ff619c1ac35d6d361'
         '7ab77526f4925177712114d5e3bb8490'
         'f65fbf217f2fe97bf39de5c2895f9142'
         'e041d3cda95c9fcdc247036e6a939f6d'
         '832857bfe6e94d737485fa05efa7cb2a'
         'cad1dfb0149d2a7f60b76df96c983556'
         '56e897ee1fcdb00ab7c5675e690a24d7'
         '5634d780636e7f2f8f2f62183c158b43'
         '44499253ba7a2c6f008b8d00c6b40de7'
         'bc2423e75cc1f564ff1a6eed08135f90'
         '525efb28551ddfb5017f160870f04c68'
         'dd9bb3511b2f1566bda7dd9932aceda1'
         '62c1e90a91e68c3795063894a181fa47'
         'e543d9f8ad5bd917f1487d7f604a82dc'
         'c67d028828b8e9dc101342fc60bfbdd8'
         '661bc92ca049725ee3a51efba8bf87a1'
         'cf39bbe472c3665dc8f33f8ce38c804b'
         '73f7f7786c61b00de5432c10ee4f54be'
         'a1e577f99d73c68f496ae93319cd6a4f'
         '73820b51aa09385d4851918dd04f228e'
         'aba2858c4235910975f0eb14807735be'
         'd280138179d502bd281f498bef4a7a04'
         '90519037e0859537ffc5e81ecb3b3109'
         'b1e602165a283e3186f9bfbf761d1506'
         '6c1e83d1d27881c37dd788df8c242b4e'
         '57482996ec394d8e4edf635de0843496'
         '4aaa34d45e6cabcdef7cba35e15af6a1'
         '3105e9b7e1a91d96b0f4c620039ee19a'
         '226a1b1140e92424c6c194a75b6cc108'
         'c32a7645b139c9581cf6a8007dde2188'
         'adc0f745c41bdf4ec2353bcb69bb95a6'
         '9ea58b92a4b52d7a8e1afb9c8c147243'
         '910cd7a64882df1f58dae78ede9d0a08'
         '33d35befca4f5f6f35022d701c87d8bd'
         'fa28d772662abd08a026cf4492654d06'
         '0f6bc6ce23358dc856a3f3b8e242e1ec'
         '57f955c8181fc1f5f41e7ebf2806212c'
         'b922c137a9a8039b5c8fe5fce8c4f484'
         '547eba5a0cbe05d7fbbaec3a55c26aa0'
         '4a6714fd04c2f2631499d17ccf9b3213'
         '48eb2ffcccb43dd2db79292aac56f1d6'
         'bf7c8baa5e6636d85f7d08f7f3c36539'
         '40bb79ef740f9447dd95e10215e80e68'
         '311179698980754f8f384b0766ef01c7'
         '4d416617f4440c00d8c30c365dd3f03b'
         '73b2e27937a7aed44938a58414ca6598'
         'fdad6d3694b773c6a62d9e2b525904e3'
         '4a3c1a89a9c29d76afae7fb27b8ed157'
         'd66071044614bf25f92b3772b771265e'
         '8858913032b63d222b07384db4e52307'
         '1198d8a7861d4baba4f9df62ab9c1ecc'
         '18498c5cf8d63150f0db48afedeee147'
         '5c37b48e3fdc5b33e150b4dc4127342a'
         'b385f1a04285e03a68151c41db7d925d'
         '3fef3c2a71eb5151f8ada2e050ca65ad'
         'e488642c434ca8cd075782194d45491d'
         'fc75d776f39427ec5c0ab3f0604cf292'
         '053cd6f4e3a1227873a3742161dcea93'
         'ea6dd329e5d6434071d739998faf4b28'
         'e514a160a5b93308a8eb05441c79efde'
         '90d40802d64412d1ba14b94865c42161'
         '01bc17e0a38094989c60fd5cf5d0f156'
         'b003000e7bd63fc46b5a7209cd02291a'
         'd2c4400b2eab3bfea59799dcc33b5c57'
         '3994a19444b301ebef29a8ff046d9407'
         'a7a6b3146584e72307d4090128963a1c'
         '3d2aa6fdd8d9e1d848746a0bbc554b6e'
         'da8e61c5818500cf18f1310756f32c00'
         '42be8eb5fdb21bebadd0cf9894981a4b'
         'f2838635850f51bb35e9a3fb4c976925'
         '9fdd5533eae8a1d8237ff0529ef801f0'
         'c0cf8d05a7e1e5b46f1ea97a99d3e00d'
         '38fb3e64b6813b0c806e3eff496d9fc2'
         'fcd8b51529f0bca6e8762150b5ed4d65'
         'b16b7f837aaff67575f682474bc376b8'
         '6de561e6d0a04fd0d20fc57a605c737f'
         '6acb55a384287a040ca1b22dfc605d99'
         '1652e905cc09e31f7b21eef03558bbfb'
         '9fb73770f9b4641ab2d255456f41aaa9'
         '896d80aed7466b7c58b5a35c15787413'
         'c8358f54c430391607af834c051ed142'
         'd85a3d8d95858e115c81dc5b69374f03'
         '233aff4a336adf99043c7a6a8ec9435b'
         '68a2ed619fab829124d84c27a4da9a2f'
         'a34ac21e35a99dedf55a4f197874bc44'
         'fd5aa6cfde791b539e24ab53dfe94119'
         'b0dfdda0aa35d58f1a1c5f07ed70337f'
         'b1745a38ebd09d7d53924968815f3399'
         'a9bad6450903f2bfc16742c1fc0c30c5'
         '4c4b29c3da73efcd8f5040495a01f678'
         '88b54fc1ab99cbdf20fb29080835b519'
         '2b5544dca657477f58622d1e9cf88095'
         '64d82a192f3a990a9d9a54372d847425'
         'cdb5b6baaf7c353116e08f534dda6e73'
         '62da3de7564da40058025ca88cba4bf4'
         '2f8b21da39a0b7c6bf6fe89604378583'
         'e6cb7956a3e7271f6ef7bf3d3fa9b8a6'
         'eb8b2208073f4f88841a832ffb278cf1'
         '55c34a61afc508214acc51603e1070e7'
         '146f8f36476040dfd851e93893ee2487'
         '731970119481a7d0568093b66322da5f'
         '2f4abd7f0f8a9b86289302482b516fe2'
         'beda001451e797ff0ca26b3a8fd3e40c'
         'e6a27d3a6e8025379d5547b47b0831cb'
         'c808e507b12ebfff5cb2d8ed4a19e4b7'
         '67030a51d171de04544a5384e876fb3f'
         'eb387fe1455538cab167e24f507c95ee'
         '2729071cf4ffb778831c260d31d6f4b8'
         'ffa64bc3c108d0bf6d213573be9e386e'
         'e7125d36e94c1d9e019c6425b1277cf8'
         'e3f88e09ae957fbf9f5f42660129172c'
         'ff50f1b54d2824fccf487013c7f84a8c'
         '94bad03b33329838f18ee3e8dfef9170'
         '48e6c4731dfa6e3248d51d8b08be9698'
         '63fdd82f4844e3e5966cc6bfb284f1eb'
         '3c140ede4010451fa2613cb171b3c2c8'
         '532ab732ff9190b374344df67eba91a4'
         '73f1595a604e38081c0d010a5bb64d9a'
         'aaf3faca080c86b54a827750db1bb314'
         'cb3e561b08bad96b9745c65073d68f6b'
         '1f66a583d813357d2d1a75d913c1f786'
         '3d1dd4bf36e99883b807829e559af7ef'
         'c37e243330fdad5295c4e79dfefdb771'
         '847ef9630e06ba0f4e9d3d1f80255629'
         'b34d72a2ea543aa54c1456beb9eed49f'
         '6ecd22b4196d1cc21e5774080efcb57b'
         '70b8f827da9f2949f0195a2ab14cd1a0'
         'addd635d64ba97a97372d5015ab28ddb'
         '3c748e94b784dbddee0e19ab29bcee68'
         'bf5f58fe72a377e69337138e5de67727'
         '3f45f2ba1042cafed61179e5b686b8d9'
         '6c3663a5a0c53619a54df1fcae9d0435'
         '11d7fac6efdbdb0296b5be49a307a9c2'
         'a4e965c35b5ed76486bfd86791487482'
         'fbb8c39ee696ab01b47e169e450db7a9'
         '249f0ca5946ab9b77b290ffad9f18913'
         '6116d91f273e1bfde2e4a676b23ade9b'
         '9451c5887c7fbbef81470882c4008351'
         '34a832c22a515d6a4b74a03f70cd1276'
         '8ae157d225aa62ebe4a14a70af042ef4'
         'd4625a7a276f114456bab989c8cf61ab'
         '39f5c4d93e1f95e32901738c51863f5d'
         '76f6c08cad293e036f607edd84cbaebe'
         '964589bb964fd20c0609b1f2af43166b'
         '83b891bad8126b3e1269876d565fde04'
         'c08e8cf8513675e2992fd49858711cdb'
         'f5cdb751ceb61c99e54730caf78282f5'
         '0cfa9a5890f97f15624310fc8388293c'
         '8a8acf06f03e7ea97a6daf9d691f5179'
         '44f5f0b47778df471a8e6f0527587a66'
         'b0e062444d59fef717b4bb98d259591a'
         '2173828272ec1e0926d8c214646fd400'
         '207620db653cf3848201120a81701c19'
         'ee445db4cc1511590c1e030b05794d28'
         '2a4c6e3341066cf006d49c467ce626f7'
         '06aea30bcfc7219ca8b46869aaca626b'
         'b0663ff82da16e84ecd78a5ede8e74ee'
         'c0f40d3bccf7eaa464e86c10145fe3bc'
         '7707a991e70d65e10dfe88e6ba636f4a'
         '916a4827a0d36d7d6eb1a9bc71c9addc'
         '0fa984769f4540ae648d6caa8d7a0d9e'
         '0f3d2f774e0bf00d840508acfb1e5824'
         'c9209712e13e50842b3487edcf1f5699'
         '7e2ec69145fff65ec4135967ae752267'
         '8e07bd6036e797a3e776c5849489e210'
         '25e51d9fbfe25aa66df6fb22a35ecf81'
         'e21973022771095aed4b227000d9163e'
         '8076a582f6e52adbdcb93d0874d1856a'
         '21d937d0293e3c5bfe4df203fe43fc88'
         'de3497b7669d15201e7edd2189da49e3'
         '5ab3a7013f5020f2d00dcaf80b437f5f'
         'f20f1a06ff9478a90a79e95fdc8ed40d'
         '65ca448e250153f23a70e298ce6eb0b2'
         '5fd95bcffd86bb9095367bf279631479'
         '335d0aab2fbe2f6de5b88c5940f103e3'
         '76f4d2c0d11d8ff9935b80a6a1381de0'
         'fabee844753dacfd9d27aa201d7da598'
         'd8849dab946dc59b044f9f6d3c3fe667'
         'e9a1c6209dfc309a6d8737b8c5e69671'
         'ecb1680b386eb4a553e5734e1ee53ed5'
         'fdf32ef19e49acca0ca23d37f7939862'
         'e244337b265002aa4a181014ee316543'
         'ee26d8c6c6d735db87acd71ef9d00e59'
         '9e0b48a246b0e5dbf33e63108e6dbe64'
         '77a1c8b21748d8f866f6c14bee696524'
         '67ad5023cbf606beb47624357c3e831c'
         '797d3be6a8bdeab1078c6fcf45338df9'
         '163301bbb343d02766a44fa9f5373936'
         '122ab00b2f99dc9f0db0874b2061d420'
         '46dfd9c8c556c00e0eb34ae4e62a4c5c'
         '5e9d4c83976fd010afdf217dfdb02641'
         '023087ca926f43443bb8e603b3c6e7a2'
         '3aa02b6d1edcb109082fc4f9904e418f'
         'cd92c5678bfe54821359db91bcde4731'
         '8bcf84143b2f3987d6491cda855f6760'
         'c37dea3794dcb010550e6b46a2d5b7ac'
         '66ab4e640771329f5fd64a8793c5991e'
         'e95e7ef7d58484e4d0df40f984dd0d75'
         'cec2dc556c9d1e7dfaa915502f7ec049'
         '8987dbf06097721d9c7c88d84c049e1c'
         '6f29181dd43bcdb0138a0073d3c07bfa'
         '0c1a9aca64553165b6c058fa3744b634'
         '1811757a5e9ec8d1b1ef64bf8b9d60a6'
         'c3896152c5a871e9b3fdbb40dfdc1370'
         '3df9ed643bb781abfcbf3f1018cece9c'
         'dc455993f4807731b7638a1ab8273c84'
         '0f5497b79b6aeae8349b496c583809fb'
         'eb13ff025269c8f92761929750d43841'
         '42f3f5f0a9a72e4ee74337d289214ab9'
         'ef977007bee7b17ad22b6de1b64b8655'
         'b90997afdc8c76f8b0d946c8cf0ceb6f'
         'ca56793f9c00287f4b972e8dbe9304d8'
         '600a478ecf05f5adfb6e54fce450c8a2'
         'cffee577287821f75fe1d69e4272aa64'
         'bcb51e7fa3d64d235eb48cdc76265fff'
         '70d08a93113001ac1118bb6cd5240c47'
         '461df8a97ff493282c72f6d6e012cbef'
         'dc84f19b2b0f13fc884dc16136f337a8'
         'ba46f38b49ecbe65e08c9fc41b84bcc0'
         '23c519a9764761431f19c8778186a3e0'
         '72069204b930ab07cd05849f5fa74e56'
         '533ad8c5cf180eadb9ab2af38588c545'
         '08bd608eb161c3541e451eb125898362'
         '1795435657b6fab572117d75c06f8783'
         '3dc0982f7b6b9d493756bf1e02fb4f6d'
         'c190bac37a7eab9d510d910d9b044f87'
         '114fd91b631b419103a40b7043c1f2ae'
         'e491d8e03457aca3f1c7c6a2ace4e64d'
         'ad3bfe3d62166bc6acdd3a204afdf697'
         '0ca958fc648bf65ced079aa4eb0f1ebd'
         'eabd1c53de3fb2017d3a6ae2529e2de7'
         'c269e2b9d7b4578300ce7aac5fbb5ac2'
         '18abce088d9267fa63f01f7ff8db9f3a'
         'fa33aa574ded5f2608349d25a8b177c3'
         'c8197d6606b4fd5f8282be9c26ae9d2f'
         '03bf9de3a6f1fb73df9c0e3d96514047'
         'd9a405a84945aa53256c806ebc400ad3'
         'ca2e7b4ec4dceeeac2fb51b54f86dd7b'
         'd2f95b4db10c7d6203e7b96dd6477b6f'
         'add0a01c30afed1e35c59c109eead494'
         'e6b4ed04b6578c4cc26f57519432dc2f'
         '862b35e6cb483834295c098baba45699'
         'aa841422e3dcf2405f9efb81ca19572c'
         '589b22bb07ed5cc57242f905443a5923'
         'a3fb66a0b424891ad7101efbfbcf5516'
         '99b9fddc8b7cbd869db8b2371a6807b9'
         'a4ead1ddc7265cedbb21b0781e87ca45'
         'a3fb66a0b424891ad7101efbfbcf5516'
         '99b9fddc8b7cbd869db8b2371a6807b9'
         '5e8b53902b132b1e8cc87b8ac733c9fa'
         '0820d911821ec2b6176cfa1fb353fc4e'
         'c511e4788ddf032df2e29aa341cb7b25'
         'dd427ac1ac44e133a1f5ddac1464eeb3'
         '4afbf9d637ffd9d8c946d6d4350a0a20'
         '965716e7ae3c74b845a79ffda3551c6e'
         '33caa26de9252f4ab991bab106a70cc4'
         '2feb403676893096e28fbca80a28b5d5'
         '84132cd954b37664fb145e0c8b6b8f82'
         'c0a59caa5f7fe4a629526c11ebdc124d'
         'f6ddfd57268cd22cacd8248b26efcf55'
         'cd91836d66b3b71e32f87fc7c5aca799'
         '122bfe7e105fc4079988b95bc843eb1d'
         '8c1c930389ca1b40170f13fdba255478'
         '21feb3620fb2baf9fe2a9701f93a339e'
         '68d7f64c5f76b1c69b73b18258ae4d9a'
         'da4b13a0626ad190355b3ee45a055670'
         '30dcb18816f0c1dc098e7c72c4877922'
         '13fe1a2aca6ac944035d4a6281aeedee'
         '5a7236ac4ffe14fca45369f634bfa358'
         '4a3c4bf58e5b8102d79af449cf02c926'
         '9b0a0990a64e2a0cb4a907d58652ba9f'
         '039df5c39945776ace623d391abe0284'
         'ff8e1813f04012ff65f65488d346d7db'
         'c9d44e0db3d3006f66f7144225db3aa0'
         'faf3a78c7d5bd0e472e8559c6c8d0495'
         '56e7b90d2fe4e549802ef2a7dc6c4e1a'
         '068ee6d0c6915b70777e0adcb6e0d611'
         '4898d34984f0d1208159e0668a076450'
         'abec8de870ca28d54618bda1aa23b8e3'
         '076316c76868d4b29dffb15ea0098cd3'
         'ca751bbebcf29402533782368f7c40eb'
         'd59ea2be4e7264c0790e0d0349e93f63'
         'fd1220476897498921f3bb5dff6cc101'
         '9fe25fe0cdd45682262a25f12fa06e28'
         '5b5f47b376815328eb833a26d81cdaaa'
         'a09ee168cdd22c7c7e6b3c9a45885590'
         '146f8e5507eecebb5c82280540ebdb4c'
         'e4af8c210d9d2198f1b7dd24d2ea16b2'
         '2a88779675a0ffacc0c9d21eb2c593e6'
         'a916d8f9a4bff1140e8f4a06d8d6ea81'
         'bf33224c500f7da9762c4a1a6a9bcef6'
         'e19085c85f18d96b1d84db1613330395'
         '81f065f4cd47892b9ce7d36f850802fa'
         '50a4539267dfec2e06c6a578b29d46e1'
         '64a816af8f0f1348028d7421f8edcfbf'
         '507d2e514d52a849f41ddfc59060fd8f'
         'f5e89c3e7a72be62d44750023c905771'
         'ca9d42088b7f309caae2ab4412d8f2ae'
         'f0c6be219226fb06915b1c696a3f611b'
         '9fc0d0c6fc34bfccb1f348f1e35ee8e8'
         '052e3299f2d9ac20216b79860e4a86cf'
         '1f76f5ce0ab54d3e77e62ef561e3bc19'
         '5502d6c251bead5b63cfad22b1735a21'
         '0293606d5cca9f48525d37e7b95722be'
         'd7b7c79062f913d2b50635297d9d4528'
         '49581851a9191fe6c85a1dc0574b8b20'
         'd7b7c79062f913d2b50635297d9d4528'
         '0a32f1517b4b4b79448d0bc5a71bbde0'
         'd7b7c79062f913d2b50635297d9d4528'
         'a8238bdb48b5a98298a904d4138702ec'
         '16fc20c1b8b10217f898dfdd6753f170'
         'd0df1a5dae7927288bf363f5cf7f71ba'
         '839193a0a34d366a33b85e9ff0e92bfb'
         'a3c8fb43b43b4b4ef330675f3969d6a0'
         'ecb20adceab41aac2f0e7d3a5da2191c'
         'b6e60cd21491e4c0cc3a8d8ec12cbd04'
         '179ae52384396fe1804efd1eccb8e061'
         '910054cb56cf431d62d1d6c36ebdf335'
         '2c2940861dd868411d9d85dea8e2086b'
         'f18f25ad0277bad10da303a73079b276'
         'e572ac24dccf1498d05f6919880937da'
         'b0b03d1b71e8aa64f3674746282137d7'
         '79c21d34711591efb8fa3527440c0c83'
         'b28b7343e21600087eb4fdac066019ea'
         'dec54a558d887e593bb9251e4e3d7a87'
         '78189796942cfa30d421d1086e633815'
         '643912f1fcfdcd04190ab7e0320c36dc'
         'a43832909e1bb9b748e08c0034840842'
         '250663f94054db6113a399855af95984'
         'b01740c14bcf393bfae12ab3f27a2529'
         '250663f94054db6113a399855af95984'
         'a542a3cc79590e4d7887da2b09e485f2'
         '15644e88f2a361c4b71f3a553301c291'
         '6700c4e19e5780f4cbc1a9736fd761a9'
         '15644e88f2a361c4b71f3a553301c291'
         '4abd4d0aff54bd2713cb9066053fc3a4'
         '5d72b93c78a52dcdacb79e5ffb4db74d'
         '11b82fafde81ea92f52b958fcd42b8d3'
         '5d72b93c78a52dcdacb79e5ffb4db74d'
         '1263eeab420e167575cbbc6faaefc24d'
         '10eb00413a39ae2cd65910ac74b91152'
         '8b063fa24e62f538895258b6e320c1fa'
         '0760e4d615b5baa3c60115403f6031ae'
         'a9126ce6acea532ded6fd4902f5e209f'
         'fa6569a7418d0b8baeb6b66ab261ed43'
         'c58746bfd9f79e623c199713ee985818'
         'a34b38be13dff9cf56ff5c78d1cdeb94'
         'f6b56510c85068ece44d902739469950'
         '518550a35c6724e3463f631e62aef9fa'
         '66c6524c1e3616b0898690fa478abf43'
         '3a6eb6e4f506153f1ae8a17d5fe62414'
         '4636ef4f0114e444922a699154301e3d'
         '71de1877370fa7757a1e5167eb3fcced'
         '9bc31433b01352e44eb81295219f7a85'
         '537f792907fe871a85542c06fa0afaa9'
         '6dd9529d9633a574e1368f3a4aa5d476'
         '9d85612bed9450448ab60e76dfd1d771'
         'ac4651d0e316944b4c155f54475f403c'
         'e82964a28f9cc2e79d311b5c63fe1bcd'
         'c64cc6d412e762399b56988c1320edad'
         'e347313b90b8fb3de790de728ab6e994'
         '561a2108730cdc4e7865847f5aff1616'
         'a87682bd23f7940586af25d941aaea68'
         'cc5c67d8f03229bf7806479941a06259'
         '915fc06704a984c668d37bbe1f05ddaf'
         'd127850cc099f00610d7a23a820434b5'
         'cbe3f14775ad94262408d0946c61545a'
         '503713d39bb5c6a0589e8e1702ba5cb6'
         'cc68a0e5b12b333f69bf1ffa5fa23d89'
         'e7601f7ae3e8ce9ddb7c0949b8f33234'
         '25843ef01317b38b10156949b6ba032c'
         '2d36c09eecc0a2bfeb08d4b0377a3d73'
         'd21b6d2d3f5997bcf6bc8e828a4395f1'
         '78cde8d74c74c3d6da3ccb5624b8c646'
         'd43dbbb901501addd949bbab752d60a0'
         '70a2ae07c1d478f1a580c7e504933c9e'
         '8788d9bcf012d72037619125d3f23237'
         '3f67da72297153f1ceea433ed6f6e17e'
         '63535ab3ccc34eda6e1729b6db1bc174'
         '24b9557a9d02d92d640f27731c9c7a34'
         '2e2bb54e2df1107a3708beef1e38d010'
         'c7e063add656f4d977e2adcac3e61c5c'
         'c038a65f696fc2c461014819f00a16d6'
         '030bea19d034454e596824d048af8739'
         '5ea359fac67005b4c3d691b065207370'
         '84e5211987bd73f55d12dba3fbaa66c9'
         '228c14b65a77b39364911687c27cf2f8'
         'a98335c57c4ec1a052eed4461f471b08'
         'c1ff5dadaa3ea9cef71f3a7210b9c52c'
         '37435d1f51cf9f566efcd033b3530295'
         '89a439ee572c2e71034bc3092432ce87'
         '5a870b97541d45e95a72b0cb2a11f3a2'
         '3687ff44a3a0d4ffecdb727c96d52bd5'
         'd00cf17fabffd5dd1f9af7ec4f3f6570'
         '2f517f69d3e5cc00f2aa10ad15cfb2ad'
         'ecca039df2a97301a62f52daa2f53189'
         '3a96a07307e849b834ddc443f9745417'
         'ce6d15b3a922d26cbed263fc08418b5a'
         '4e940400114862b85308dee97a715256'
         '0ded20839851ce565408ede2e6be3edf'
         'a040677c9a87016528a5a0c2029ea437'
         'c6d7a5e80ab661a8a364516d90b0cfb0'
         '6cfaa613b773302ec832c51b8e13fd5e'
         'e57e37361190b7649828d6f09399bac9'
         'b6358a039bbed86fed710251708fc333'
         '9771db8ddd171f8bb47fc8da667fc3c8'
         '37f6275b066e5683e5d8bae0e464fe4e'
         '351997e10310672db8b177005b01977a'
         'd0f5986b47ca6e45bca09340b7d4b143'
         'a6119e4063b42af6915f6832e849aea9'
         'c34e7e09235cfcb8315b13ab31f5ce53'
         '90beb36801d96d566fcc33899dbbe0fc'
         'a097b97759e1bc778959924c637d9885'
         '8fe38b45409a937823d5d17c018b79bc'
         'd04b21185c13690aec9e98f8bf381517'
         'd1150d1fa9bfbb5cc9d75472d90b9d0b'
         '783ef53ecd7a6bc491b88431222f7441'
         '1f76f5ce0ab54d3e77e62ef561e3bc19'
         '5502d6c251bead5b63cfad22b1735a21'
         'a09710a921a25bc08984db52dec4c442'
         '4ac83b621f94d15d638e0c12ef45c194'
         'f4b164943c5cd73327f7b4953ce58742'
         '485be4e3be3df3605d632715408eff59'
         '7dba4eaf443094daf3414a0c9fcaad7d'
         '39844fe506dd50e5bc21121ffbf7b587'
         '0f2bcbc207f5ac5f4e949329498a69bb'
         '27024ab7a648e16fd77bdeb8c1301ffd'
         '131818d09edcb3d0bc30c6b0e8d5c52a'
         'a31d665680b202b6c84992534d7b153f'
         'db887d10837d4583a361ca472c8d0f39'
         '51181492ac1e72fd3a347ca7d91637cb'
         'b2f81c0b9c895b658fb85f97eb6d40cc'
         '0750385f5345d671e1f7c80267409a06'
         '068e557770b7c62926bcf24d39fffd41'
         '02ddccc9bbb1d05a52b2d63f72516bf1'
         '4005fd3b021e34a2628626f3b3fd7765'
         'af3b144c704edfaf968fd086cc026f55'
         'bc9357553f7ef295e10257a5d2255398'
         '528a030985f1bf8f95c691691e9443a1'
         'b8c64db2445c86466a78d99704717d80'
         '96c11050f6d390c6e858d3ed8ec77a64'
         'be87642940bc1992dd1457d83dcf51fb'
         'fc81b4377c5818cf5009f04295cd7556'
         'f5bcace36d84cd03a7f466847d50000a'
         '5ae490e16959e1961071f0172c793c94'
         '5323bb0b8fda63f36c18c53b6b76326b'
         '4074e00e49c2e4f694a41c1fbb964c2c'
         'b6d6f541d846728aabd325bf1109a692'
         'b69159945554055fd461c1d32d7cf98d'
         '486fb7d21a6d77fe3a4569f7c1a4afc1'
         '050abb720f38b83f0f5eb1215c9b4be3'
         'cd7b30d80f6a0f44553a894c0cefc764'
         'a3fb8e98e15a28fc7d2ab23069c43ad5'
         '504ae44a20e31e9680a6c0957c6f92fb'
         '7fcd2a1d69062d4b8ea4f4ebfde3f395'
         'b6bc64b72c76666c09af5928427f0b06'
         '6bf2996841863fb9cd09281ab0032640'
         '317d47c2f0618764a47b1b5834377b3d'
         'ced10ea84c4fd30044bfe8e9bfa7ac9f'
         '11f7673cf3273cf7eaab0f021a9023bb'
         'd8a18823c5c145920ece3531d7b42d4a'
         '13ca3e7fedffae99fc4f09c886f500e0'
         'a18c3dbd61570c88b2b4893c55dc97e2'
         '93afbf780c50bb795de74950a759a79c'
         'f8adc7d8f2c0c991782a77489edeffc1'
         '81756708dca0110771e33b9c191b6874'
         '6dee6528fa679e3d40f5cc0e4ed8ea3e'
         '150c2182054156c41f86810b91f50dc4'
         '9911dd519837963cfabdef05d9f9f8ad'
         '76bde8cc37b227ae4113940e3fdda9c7'
         '9dcf1952ed2ba1c60c23c9f1d6e55f27'
         'b6e85bee00e2f7aebeb9a72101fc7a8b'
         '71a79c7d5b29756b0a98a989fdd5b6b4'
         '5e8bc026e3c0b3dc865ae3327e17e653'
         'e5fc82474a03f98fe53d8acde9cd2cf8'
         'bcc47bb68cc9c84d7aae5d06762961c1'
         '94bf58ec438e415d660d5200ff36ee58'
         'e19894fabba64f7af07e921d7a60f027'
         '638d3caaf9f558ebe41b5c3f6da50af6'
         'c4f3a9a1d3927dc988e84e705e1704d3'
         '6a7067f862ce225a69ea89911c0c6753'
         'f27b01eae9f55a5788fde2be5f0cf302'
         'd087c361958125dfa3f78a2a94ede741'
         'f8e9afb1f1741e25e0901a54abd94bdd'
         'c5e1b926011f6550520ffe2ba8af9ab6'
         '33e56af2919d4c2ab9f8307925371cf0'
         '7b5a2150acf6a0f0b6c9394d267f2d93'
         '4007121d83df52a80cbba63e16e10869'
         'df25c6ac45941b8cf48d3a6c4b8c3801'
         '4ab6d47e622c39e2342c1d5ff7756b28'
         'eb2c9b180bd5e47e7781290c5ef6d79f'
         'c6bfcbb1bbe6dc4d540f0546354c7416'
         '123a10f167e4f3aeb04e8a342aec58ea'
         '4a4de54912cb15abaea3903eeb122792'
         '382f26e9e7ff6aa628bc88d1f6eb0b0d'
         '9dec506ebb1247f7d76b3d914a02839b'
         '27ed7e1823e5050d4fd74b8709e861cc'
         '47254586526759e91f0418578e1b8f97'
         '6f7a480f6580b4ff989b59b34389387a'
         '260f98087b7d3a9ebb4b2765104a7712'
         '6566cbd1832dd861c75e42c2b7daf2ab'
         'a15c9befb827966460662c7594f4b889'
         '771ab632ccfbab8ee70b8b0dd0a66f0a'
         '9fcae0ef9981341ea804a8fafcbb2b7e'
         'c316f7c76190602053b7092026626963'
         'de0ff239cc2faa27571150587b72f014'
         '23c7c0c58833a4e951667d301a1d14b0'
         '45b68b12099547ebcc406fe5c48ce107'
         'ce22b5eb39968bbf9a3d92c4eb0e4686'
         '8b024a886b2152e9d483e25d15e3fe42'
         '5450b60a3db9817531e03d67b2ce0e6b'
         '6b872d86d318f5f53aa021754dce81cf'
         'a36f9395d337729c7bd77de0f59263e4'
         '82f7f0aa5727243bd59eedb77b77fe81'
         'a852ebcf58e22c6db9b968cc5b9775a0'
         '9348b31f565f2f6bbf3c29e321e50d6f'
         'b7a8337599ab0425bcc6e29a8b71f439'
         '6d7a52630ee5470b56544c676dc5b147'
         'b23ef616095532763f6783ffe45a80d1'
         'acff13c06d443feb8125998a48b82b2e'
         '084970df88e23b517d068fc677f62285'
         '55f43468742e5a9d95e4f955a49f482e'
         'aabf0eff078f812924c4a5732a043396'
         '35782241de653f267d332734906b488a'
         '4067531d0a17cd83dddf26cbc90f05f9'
         '56bb31573b1523c15421937e15616309'
         '5e874f71764638e0f30f81d793b38a7d'
         '79452a1c0d7e52cf0e89f8aa95a07f9a'
         '219af9f520f7ef56de28c93338e8c43e'
         'f7238073f8064d4520ab916f91ee9700'
         '2ca3eef3e7ab836d38362068ed22d6ec'
         '39015cd7f547af3e226b5e90545f8273'
         '07fa656ab22a5b6c7ef84bdb42c9a45e'
         'b5175f412973075d615f1359977b4d7b'
         '2d4c8d18b002074337aa7f709c54b2b8'
         '4a31eb4c12e5035320af7834ed0c1e02'
         'c9de0f6bbd6fed5919309017690ba6a0'
         '7bbc8921e1ce578c3b5cfbae8a29187f'
         'effc9f3555bcec9a03834607575c9a4a'
         'f4656e799a1e3e63673834a2de6e71a8'
         '85243eeaa1b7a04fa6344664b1a0bfb1'
         '4a0ddc5e23a0e47dbb4d66b186baad7b'
         'bea7e4899a49e181a252a52e331e8a0c'
         'c02ae09893cd68a4f9630b4138aafa4a'
         'f68c959fcf934a85fd3feb519c581489'
         '22f94cdab1d3c9db5fade9030b00fa61'
         'd58af97bbbd7005303a9e33e00ad3730'
         '1865311a31d672e68cd0cbc09f8beb73'
         '8ca4a74d0986ea319f4e120dde573132'
         '7cfc65930457f1fcf5574c4b954b3d85'
         '6df2ac74cef827ca6c30f47a10f9c6f4'
         '2f3483e73a5bff26a932631bbad7e41a'
         'a6b971ee8f516ae6978767dc63d382d3'
         '2fa8b2c26ff3cb413938f6d7a7ba0776'
         'd7a53b30fc219c17546f66070dac3a73'
         '0bc87b45730ee361e4d61bfee4bef9cf'
         'a6751bd06ec2e99143f464739a88a883'
         'b7ea11600faf09629e69ca447e4979a9'
         '3052d99df7061a7cd97b698b6a8dc59b'
         '890f84add395385ec3e2035991053cb6'
         '42c1e999e36a71b725e8878bc052360c'
         'e6cabb414b45c11ebf0f8b980762a980'
         '5124204329c1463ad52c0e6ca2b28b51'
         '6a968be34057af58d132e0a2aa0f1a77'
         'b4c5e72de48e78976b133d10eaaeef3a'
         'd2945b67c6359c8a31b06ca9f50d7e7e'
         '7693d4e37f3f8d4f501a96092eaaa8ac'
         'de671e1c99eb88709d23e873b444cbc0'
         'd96078cdd32b32c6544f668aa1e8c22d'
         '271e3d0d4c90d8a8e5962055828b1c65'
         'ca1f5adfd172f2e1ec8cefe35567b957'
         '2411b77a2fe763ccc1ac71489446a156'
         '7fbdb685ff749b36c9b3faf68ae98d15'
         '5971dd2abc30cf713bff230c24a0a99b'
         'ddb16db4c537da68e26f62639ee8d7fc'
         '923f93aeb5e8735075c93bab81d6f771'
         'fd094bedc7342710912e9c1837fc3fb0'
         '85303079ab0f186e2991257a97e21c0c'
         '4c8f216dfb99e301d9487173605e2ba9'
         '98b770f8b1e11070bb7113ecda58d7d5'
         '49216fb49b77757ea79be1429e3c43a2'
         'f128d9cacbb25eefbc43cdbee1d3ea82'
         'e0acd515202e5f8954f49017577e0afa'
         'd69972c7d4f3ed29f7accda1f079b94d'
         'c6b4b022593974007b0e1a48dcbedcae'
         '30f7ef539e4418271b896957c1fc0717'
         '6a96131f68e8e99e1417d17b8855db80'
         '24bc59e7178a7856f4700e594f1aab31'
         'e2f52a16536c4747ed674be335ab5cbe'
         'ccdf40db7c12fe17bcbf332cccabc769'
         'ad11f111361d96fbc3434bba56cf4c29'
         '4bae9efd66d7182bdc17d1542ecf6a43'
         '24c7f8ab4fd9ab7aca3c5399b48b4446'
         '40dcb2b1a1dfe040288f91fb6945cc43'
         'c5e16091d5c3800bbb238cb8fec1368b'
         'fa4a56dbf64b12016d1ca9ca9c857a2c'
         '3e45ca08a14fe29fad4aeff6743a549d'
         '30d230c4690c9813e8897e32aeeed78e'
         '24e42fc9c627c49cb852bdfe0574b2e2'
         'af9f0450519ac1241b27a33e9b8f8a00'
         'cf47e3882aab875db2eac4cd03d6835d'
         '15f1392679019c2b535816af5b761a75'
         'bbba6ad05af017b8970191e34e4b0d17'
         '7a982b4e0e706ce93dab62049258f054'
         '698888f5c7eae518334665fc9f26cdde'
         '42820df0e079dcf433a017bf5e791b6e'
         'cc14218bc65c23d521f651b30c371ae9'
         '69ab8943820bba00a357e019712db6a7'
         'a814278c25010f7f8f06e2310ee6e351'
         '06b74ba28436a50f3a4d34aabe5b36fe'
         '5c385357abcad7f8e29b578a97a005b4'
         '4959aec5f5b650645a9ea50471ae04f0'
         '9d83f0ea45ff111ff6c2fda03a623568'
         '55ad369c40b00e7626648bfb2b3756c2'
         '72c3f74f0abf6f64615d9734257c8c44'
         '5aedbb5ec4d871ea5d13a5a1b43385a3'
         'c675c8a6c977d6267ac5c3c570490a75'
         'ad6639c9c0a73a3009cf478f3c7b332b'
         'bc67a81f390b04f03a2491d88d115a05'
         '439f75d44003c49d26d84bc28090bc0d'
         '629d0e7d235d93270a7844ba3e6f035d'
         '2d8155f2c7574218827b30e24957ad78'
         '4e3816ee49627f5a7cae94d935bef4d4'
         '1b59ce1acd3a5ddf140675e94c67a90f'
         '185cba3612dd886d81fb3ca07a79faac'
         'a499eb1fc6860a1b8fe73cba0ac787c6'
         '9bbed54810b32e4ca301d38813a40c65'
         '7b18a35008e8d90e9e299feb28284784'
         '515e76b803e5db6301cf327f57a3b3db'
         '1112c8081f3d106f7a587ede84151011'
         '77d3672ff88228e51e96a9223da34762'
         '2bc4223e8fbfa0ff26b3b442c65a0dc1'
         '9412bd01dd923a42477ce2527d574f5b'
         '4475738569978cbf9e0ece5855ab27f7'
         '7ed89fab536e596c77f19f1013342b33'
         'd41cd66452242356ae0650ac74143d92'
         'f621866489565f905b9e4e11faed6be4'
         '6adf5ce34ff333f53ac4c69c90ba7264'
         'bbe504b369a2ee48abe09e425c4e4a7e'
         '0494ab2b5543bec559ef8eb31c431468'
         'e590a62da026c95189b8487c8276cb2a'
         'bbf03ee47e5bea3b11c3f39aac5e3409'
         'eefab9932fe288345f97ab221a4e61a2'
         'faf3a78c7d5bd0e472e8559c6c8d0495'
         'baef16c1803fc9c185a64abb6c68fbc9'
         '5ba5ed474592748fddb861d5cac7298f'
         '8ec12580ec20679e25847e1c5c070217'
         'a25bb956e33a7431e2f6cfbe6aac3909'
         '9eb25b55fd7bca0355d25f0d1dd95e2f'
         '228170e1f71cc06a7329ac974fd51663'
         'd785d2cb632ae9447052e1b07f660156'
         '7bb83f70d8c339e681654ba50c1446ae'
         '13366768d0ca890f3e72ef508fd3f5c6'
         '2dc78bd8e551ed5218c0c40c937d72cc'
         'ea0302156a9cbe86a624d711fe1dd2e0'
         '1712968ac1fa8525fdf71a1ace4756ae'
         '0fca260f9a3c36c28e7fbe287486776c'
         '35e61478637c07e992187634a10be669'
         '4862e6aa61463f29b7ab3331439d3e93'
         'ce2bf28c7cc875e26cf6ca34becdbd07'
         'b43afa67f90dd0ced9bd62d1f9c3452e'
         'a33cb66dd512b37d277ff704ace74d4e'
         '00c75909d5c2e823a22573a86b47a690'
         '9cbe9be844456bc447996440f29c401f'
         'e49d5437f3b77700c2b03cfad4fa85a6'
         '67929386a079010f9f4d72134157e1d6'
         '3792483ecab5a8b1e201cb8dd781cbf6'
         'dd2e98fd074338245a94bdb3f759545e'
         '9cec9070bf0f22ff2e46348d8670d790'
         'b3c506a1920d1ab6327bd8d58fe57909'
         '3f4bbf2dfcae30bd0a9a857387a57959'
         '16d293d99d4e4c7460be2f4bb3f132f6'
         'aea66ceceb351fdb440f6bc23039b589'
         'b8ad450ff0a15393d77914beae12cd7e'
         '388331ac31b65fb55987d8fce6c14693'
         'b43256c3df5eb2b3f5c616d83c650ff2'
         '566e3e0ff01ef2260d27dbec5ea78a2c'
         '60ba4942403b13028b69152fdcfc76ea'
         'ccbbd208e5c6700e4123b1b56c32658c'
         '5a7d0753813d208cadc48b73a80ef153'
         '94afe388ba206996062a9fa7ebc6b5c0'
         'a29b75d0e8bcaac7ccb5bff8171726b7'
         '504dc89bf2671ef0e2da6e17c9a0181f'
         'ef9cd931b7fc51db96969fc4fa1358be'
         '4b1be8dd719eaa7d4836f9df93ad436d'
         'dd63b722f0fb17c1597daa945067f9ac'
         '7ddb69f4639528090d8bee214de5f20c'
         'b44213dab136d0a6e63252c2a70cc89a'
         '8a219f07a0f04aaba3232d5d90dc5c0e'
         'd2dc0731f4f7f5f3e7bc88cffb6647f1'
         '0a75b45a6683e9fa0263ce3f8faaa632'
         '60388cf7e6bd4cfc8c18160920d935b5'
         '3b13cf04f3987cc4de7e7d6f95e0dc75'
         'c3e13ac3d7bbdcb818f6045e0cd0706e'
         '7e291ac21fc625db9c5dd0d0359836d8'
         '312a53b7438a3a4e1dafb23c59b3fc40'
         '3abb98c29a9406d60202a6300c50a767'
         '11cf2df10c42a5e57a7471886cc57b82'
         '06183a5f4cdf2b80212fc4b6ddf708be'
         '7f04f3d888c7856ca1debfb630b7b5bc'
         '476f4c9443f91d0ec8de8bb4682a489c'
         '7d7c63fbd9f9d2ff2333553f7c2db50f'
         'fc543510f5e783469b0bf32ea68cc83a'
         '6015767ea69b7bca7494f26eb90b6846'
         'f9e386c1754458737619df5fb268b949'
         '0d4602ca6a836f0955a0faf9d04aaffa'
         'f65b6c89aa3ba4a96ba4b8624f68bfde'
         'd33bb71689424696251b2d08d72d9021'
         '13bb21929d0bacae285ff7360b84b4bd'
         'b0c937f8c158e216655fa75b8a9b92aa'
         '26fac3d1618bc0b1af09dd8fe9b50d5d'
         '857ef506532e0245bf7e09366b8d6325'
         '98db93596df443cd1df7de1734431ec0'
         '524d12a348d529f38b3ef4bcbec8973c'
         'ae5fb33a938652ea02f220fce6a25329'
         '61660f36f524a5ad27e64f32c01c7298'
         'a39963cf6c1579308b2873df2aaf5849'
         '7a55346cfe20d99a5f95216baee32fe0'
         '10f1b17c41097466d847019a23db2fe5'
         '4786cbe41d530094a66b76fcdb9e9b17'
         '308699b97443876d64835a0c8e146d44'
         '175b66a4ba92fc8f6381f2c17ae2f542'
         '00f08b8ce8acd323b594c4db1def285e'
         '45bed90f22dbf0f74acdcd0328485150'
         'a9d7c667bdbb5fc6da4ec5ba39234b11'
         '681d69847d69ab8be98645f47b1d56b6'
         '1a7a71cedde3bb3360bc306837ba7923'
         '9fd3efb1844a62ff2b8385d28149ef7a'
         '4a3df86406ef16e312b5cabdc5125c18'
         '4a43f187d8354586f0c4c4899e114ad2'
         'a4cdaeb79fa68eac2eeb43824a0ac2de'
         'efe5002c01c25bc775e3c7e0639b82dd'
         'af5fcd7b995ae76990f384976f356976'
         '5d13494e8783c03bd32bf28a03780942'
         '0882c01f3d76dfb9b431da1f2403c73b'
         'd95ad283b92cbbc955c7195c2e13721b'
         'e127b9197ffbd28a0562e4bfc5e6a68b'
         'aec879064656ab80efcdbf82ad39411e'
         'a6af59cb753655036f1cdac72aae2210')
         

package() {
  _destdir="${pkgdir}/usr/share/openxcom/TFTD"

  install -Dm644 "${srcdir}/ADLIB.CAT"                "${_destdir}/SOUND/ADLIB.CAT"
  install -Dm644 "${srcdir}/ALART00.MAP"              "${_destdir}/MAPS/ALART00.MAP"
  install -Dm644 "${srcdir}/ALART00.RMP"              "${_destdir}/ROUTES/ALART00.RMP"
  install -Dm644 "${srcdir}/ALART01.MAP"              "${_destdir}/MAPS/ALART01.MAP"
  install -Dm644 "${srcdir}/ALART01.RMP"              "${_destdir}/ROUTES/ALART01.RMP"
  install -Dm644 "${srcdir}/ALART02.MAP"              "${_destdir}/MAPS/ALART02.MAP"
  install -Dm644 "${srcdir}/ALART02.RMP"              "${_destdir}/ROUTES/ALART02.RMP"
  install -Dm644 "${srcdir}/ALART03.MAP"              "${_destdir}/MAPS/ALART03.MAP"
  install -Dm644 "${srcdir}/ALART03.RMP"              "${_destdir}/ROUTES/ALART03.RMP"
  install -Dm644 "${srcdir}/ALART04.MAP"              "${_destdir}/MAPS/ALART04.MAP"
  install -Dm644 "${srcdir}/ALART04.RMP"              "${_destdir}/ROUTES/ALART04.RMP"
  install -Dm644 "${srcdir}/ALART05.MAP"              "${_destdir}/MAPS/ALART05.MAP"
  install -Dm644 "${srcdir}/ALART05.RMP"              "${_destdir}/ROUTES/ALART05.RMP"
  install -Dm644 "${srcdir}/ALART06.MAP"              "${_destdir}/MAPS/ALART06.MAP"
  install -Dm644 "${srcdir}/ALART06.RMP"              "${_destdir}/ROUTES/ALART06.RMP"
  install -Dm644 "${srcdir}/ALART07.MAP"              "${_destdir}/MAPS/ALART07.MAP"
  install -Dm644 "${srcdir}/ALART07.RMP"              "${_destdir}/ROUTES/ALART07.RMP"
  install -Dm644 "${srcdir}/ALART08.MAP"              "${_destdir}/MAPS/ALART08.MAP"
  install -Dm644 "${srcdir}/ALART08.RMP"              "${_destdir}/ROUTES/ALART08.RMP"
  install -Dm644 "${srcdir}/ALART09.MAP"              "${_destdir}/MAPS/ALART09.MAP"
  install -Dm644 "${srcdir}/ALART09.RMP"              "${_destdir}/ROUTES/ALART09.RMP"
  install -Dm644 "${srcdir}/ALART10.MAP"              "${_destdir}/MAPS/ALART10.MAP"
  install -Dm644 "${srcdir}/ALART10.RMP"              "${_destdir}/ROUTES/ALART10.RMP"
  install -Dm644 "${srcdir}/ALART11.MAP"              "${_destdir}/MAPS/ALART11.MAP"
  install -Dm644 "${srcdir}/ALART11.RMP"              "${_destdir}/ROUTES/ALART11.RMP"
  install -Dm644 "${srcdir}/ALSHIP00.MAP"             "${_destdir}/MAPS/ALSHIP00.MAP"
  install -Dm644 "${srcdir}/ALSHIP00.RMP"             "${_destdir}/ROUTES/ALSHIP00.RMP"
  install -Dm644 "${srcdir}/ALSHIP01.MAP"             "${_destdir}/MAPS/ALSHIP01.MAP"
  install -Dm644 "${srcdir}/ALSHIP01.RMP"             "${_destdir}/ROUTES/ALSHIP01.RMP"
  install -Dm644 "${srcdir}/ALSHIP02.MAP"             "${_destdir}/MAPS/ALSHIP02.MAP"
  install -Dm644 "${srcdir}/ALSHIP02.RMP"             "${_destdir}/ROUTES/ALSHIP02.RMP"
  install -Dm644 "${srcdir}/ALSHIP03.MAP"             "${_destdir}/MAPS/ALSHIP03.MAP"
  install -Dm644 "${srcdir}/ALSHIP03.RMP"             "${_destdir}/ROUTES/ALSHIP03.RMP"
  install -Dm644 "${srcdir}/ALSHIP04.MAP"             "${_destdir}/MAPS/ALSHIP04.MAP"
  install -Dm644 "${srcdir}/ALSHIP04.RMP"             "${_destdir}/ROUTES/ALSHIP04.RMP"
  install -Dm644 "${srcdir}/ALSHIP05.MAP"             "${_destdir}/MAPS/ALSHIP05.MAP"
  install -Dm644 "${srcdir}/ALSHIP05.RMP"             "${_destdir}/ROUTES/ALSHIP05.RMP"
  install -Dm644 "${srcdir}/ALSHIP06.MAP"             "${_destdir}/MAPS/ALSHIP06.MAP"
  install -Dm644 "${srcdir}/ALSHIP06.RMP"             "${_destdir}/ROUTES/ALSHIP06.RMP"
  install -Dm644 "${srcdir}/ALSHIP07.MAP"             "${_destdir}/MAPS/ALSHIP07.MAP"
  install -Dm644 "${srcdir}/ALSHIP07.RMP"             "${_destdir}/ROUTES/ALSHIP07.RMP"
  install -Dm644 "${srcdir}/ALSHIP08.MAP"             "${_destdir}/MAPS/ALSHIP08.MAP"
  install -Dm644 "${srcdir}/ALSHIP08.RMP"             "${_destdir}/ROUTES/ALSHIP08.RMP"
  install -Dm644 "${srcdir}/ALSHIP09.MAP"             "${_destdir}/MAPS/ALSHIP09.MAP"
  install -Dm644 "${srcdir}/ALSHIP09.RMP"             "${_destdir}/ROUTES/ALSHIP09.RMP"
  install -Dm644 "${srcdir}/ALSHIP10.MAP"             "${_destdir}/MAPS/ALSHIP10.MAP"
  install -Dm644 "${srcdir}/ALSHIP10.RMP"             "${_destdir}/ROUTES/ALSHIP10.RMP"
  install -Dm644 "${srcdir}/ALSHIP11.MAP"             "${_destdir}/MAPS/ALSHIP11.MAP"
  install -Dm644 "${srcdir}/ALSHIP11.RMP"             "${_destdir}/ROUTES/ALSHIP11.RMP"
  install -Dm644 "${srcdir}/ALSHIP12.MAP"             "${_destdir}/MAPS/ALSHIP12.MAP"
  install -Dm644 "${srcdir}/ALSHIP12.RMP"             "${_destdir}/ROUTES/ALSHIP12.RMP"
  install -Dm644 "${srcdir}/ALSHIP13.MAP"             "${_destdir}/MAPS/ALSHIP13.MAP"
  install -Dm644 "${srcdir}/ALSHIP13.RMP"             "${_destdir}/ROUTES/ALSHIP13.RMP"
  install -Dm644 "${srcdir}/ALSHIP14.MAP"             "${_destdir}/MAPS/ALSHIP14.MAP"
  install -Dm644 "${srcdir}/ALSHIP14.RMP"             "${_destdir}/ROUTES/ALSHIP14.RMP"
  install -Dm644 "${srcdir}/ALSHIP15.MAP"             "${_destdir}/MAPS/ALSHIP15.MAP"
  install -Dm644 "${srcdir}/ALSHIP15.RMP"             "${_destdir}/ROUTES/ALSHIP15.RMP"
  install -Dm644 "${srcdir}/ALSHIP16.MAP"             "${_destdir}/MAPS/ALSHIP16.MAP"
  install -Dm644 "${srcdir}/ALSHIP16.RMP"             "${_destdir}/ROUTES/ALSHIP16.RMP"
  install -Dm644 "${srcdir}/ALSHIP17.MAP"             "${_destdir}/MAPS/ALSHIP17.MAP"
  install -Dm644 "${srcdir}/ALSHIP17.RMP"             "${_destdir}/ROUTES/ALSHIP17.RMP"
  install -Dm644 "${srcdir}/AQUA.PCK"                 "${_destdir}/UNITS/AQUA.PCK"
  install -Dm644 "${srcdir}/AQUA.TAB"                 "${_destdir}/UNITS/AQUA.TAB"
  install -Dm644 "${srcdir}/ASUNK.MCD"                "${_destdir}/TERRAIN/ASUNK.MCD"
  install -Dm644 "${srcdir}/ASUNK.PCK"                "${_destdir}/TERRAIN/ASUNK.PCK"
  install -Dm644 "${srcdir}/ASUNK.TAB"                "${_destdir}/TERRAIN/ASUNK.TAB"
  install -Dm644 "${srcdir}/ATLAN00.MAP"              "${_destdir}/MAPS/ATLAN00.MAP"
  install -Dm644 "${srcdir}/ATLAN00.RMP"              "${_destdir}/ROUTES/ATLAN00.RMP"
  install -Dm644 "${srcdir}/ATLAN01.MAP"              "${_destdir}/MAPS/ATLAN01.MAP"
  install -Dm644 "${srcdir}/ATLAN01.RMP"              "${_destdir}/ROUTES/ATLAN01.RMP"
  install -Dm644 "${srcdir}/ATLAN02.MAP"              "${_destdir}/MAPS/ATLAN02.MAP"
  install -Dm644 "${srcdir}/ATLAN02.RMP"              "${_destdir}/ROUTES/ATLAN02.RMP"
  install -Dm644 "${srcdir}/ATLAN03.MAP"              "${_destdir}/MAPS/ATLAN03.MAP"
  install -Dm644 "${srcdir}/ATLAN03.RMP"              "${_destdir}/ROUTES/ATLAN03.RMP"
  install -Dm644 "${srcdir}/ATLAN04.MAP"              "${_destdir}/MAPS/ATLAN04.MAP"
  install -Dm644 "${srcdir}/ATLAN04.RMP"              "${_destdir}/ROUTES/ATLAN04.RMP"
  install -Dm644 "${srcdir}/ATLAN05.MAP"              "${_destdir}/MAPS/ATLAN05.MAP"
  install -Dm644 "${srcdir}/ATLAN05.RMP"              "${_destdir}/ROUTES/ATLAN05.RMP"
  install -Dm644 "${srcdir}/ATLAN06.MAP"              "${_destdir}/MAPS/ATLAN06.MAP"
  install -Dm644 "${srcdir}/ATLAN06.RMP"              "${_destdir}/ROUTES/ATLAN06.RMP"
  install -Dm644 "${srcdir}/ATLAN07.MAP"              "${_destdir}/MAPS/ATLAN07.MAP"
  install -Dm644 "${srcdir}/ATLAN07.RMP"              "${_destdir}/ROUTES/ATLAN07.RMP"
  install -Dm644 "${srcdir}/ATLAN08.MAP"              "${_destdir}/MAPS/ATLAN08.MAP"
  install -Dm644 "${srcdir}/ATLAN08.RMP"              "${_destdir}/ROUTES/ATLAN08.RMP"
  install -Dm644 "${srcdir}/ATLAN09.MAP"              "${_destdir}/MAPS/ATLAN09.MAP"
  install -Dm644 "${srcdir}/ATLAN09.RMP"              "${_destdir}/ROUTES/ATLAN09.RMP"
  install -Dm644 "${srcdir}/ATLAN10.MAP"              "${_destdir}/MAPS/ATLAN10.MAP"
  install -Dm644 "${srcdir}/ATLAN10.RMP"              "${_destdir}/ROUTES/ATLAN10.RMP"
  install -Dm644 "${srcdir}/ATLAN11.MAP"              "${_destdir}/MAPS/ATLAN11.MAP"
  install -Dm644 "${srcdir}/ATLAN11.RMP"              "${_destdir}/ROUTES/ATLAN11.RMP"
  install -Dm644 "${srcdir}/ATLAN12.MAP"              "${_destdir}/MAPS/ATLAN12.MAP"
  install -Dm644 "${srcdir}/ATLAN12.RMP"              "${_destdir}/ROUTES/ATLAN12.RMP"
  install -Dm644 "${srcdir}/ATLANTIS.MCD"             "${_destdir}/TERRAIN/ATLANTIS.MCD"
  install -Dm644 "${srcdir}/ATLANTIS.PCK"             "${_destdir}/TERRAIN/ATLANTIS.PCK"
  install -Dm644 "${srcdir}/ATLANTIS.TAB"             "${_destdir}/TERRAIN/ATLANTIS.TAB"
  install -Dm644 "${srcdir}/A_BASE00.MAP"             "${_destdir}/MAPS/A_BASE00.MAP"
  install -Dm644 "${srcdir}/A_BASE00.RMP"             "${_destdir}/ROUTES/A_BASE00.RMP"
  install -Dm644 "${srcdir}/A_BASE01.MAP"             "${_destdir}/MAPS/A_BASE01.MAP"
  install -Dm644 "${srcdir}/A_BASE01.RMP"             "${_destdir}/ROUTES/A_BASE01.RMP"
  install -Dm644 "${srcdir}/A_BASE02.MAP"             "${_destdir}/MAPS/A_BASE02.MAP"
  install -Dm644 "${srcdir}/A_BASE02.RMP"             "${_destdir}/ROUTES/A_BASE02.RMP"
  install -Dm644 "${srcdir}/A_BASE03.MAP"             "${_destdir}/MAPS/A_BASE03.MAP"
  install -Dm644 "${srcdir}/A_BASE03.RMP"             "${_destdir}/ROUTES/A_BASE03.RMP"
  install -Dm644 "${srcdir}/A_BASE04.MAP"             "${_destdir}/MAPS/A_BASE04.MAP"
  install -Dm644 "${srcdir}/A_BASE04.RMP"             "${_destdir}/ROUTES/A_BASE04.RMP"
  install -Dm644 "${srcdir}/A_BASE05.MAP"             "${_destdir}/MAPS/A_BASE05.MAP"
  install -Dm644 "${srcdir}/A_BASE05.RMP"             "${_destdir}/ROUTES/A_BASE05.RMP"
  install -Dm644 "${srcdir}/A_BASE06.MAP"             "${_destdir}/MAPS/A_BASE06.MAP"
  install -Dm644 "${srcdir}/A_BASE06.RMP"             "${_destdir}/ROUTES/A_BASE06.RMP"
  install -Dm644 "${srcdir}/A_BASE07.MAP"             "${_destdir}/MAPS/A_BASE07.MAP"
  install -Dm644 "${srcdir}/A_BASE07.RMP"             "${_destdir}/ROUTES/A_BASE07.RMP"
  install -Dm644 "${srcdir}/A_BASE08.MAP"             "${_destdir}/MAPS/A_BASE08.MAP"
  install -Dm644 "${srcdir}/A_BASE08.RMP"             "${_destdir}/ROUTES/A_BASE08.RMP"
  install -Dm644 "${srcdir}/A_BASE09.MAP"             "${_destdir}/MAPS/A_BASE09.MAP"
  install -Dm644 "${srcdir}/A_BASE09.RMP"             "${_destdir}/ROUTES/A_BASE09.RMP"
  install -Dm644 "${srcdir}/A_BASE10.MAP"             "${_destdir}/MAPS/A_BASE10.MAP"
  install -Dm644 "${srcdir}/A_BASE10.RMP"             "${_destdir}/ROUTES/A_BASE10.RMP"
  install -Dm644 "${srcdir}/A_BASE11.MAP"             "${_destdir}/MAPS/A_BASE11.MAP"
  install -Dm644 "${srcdir}/A_BASE11.RMP"             "${_destdir}/ROUTES/A_BASE11.RMP"
  install -Dm644 "${srcdir}/A_BASE12.MAP"             "${_destdir}/MAPS/A_BASE12.MAP"
  install -Dm644 "${srcdir}/A_BASE12.RMP"             "${_destdir}/ROUTES/A_BASE12.RMP"
  install -Dm644 "${srcdir}/A_BASE13.MAP"             "${_destdir}/MAPS/A_BASE13.MAP"
  install -Dm644 "${srcdir}/A_BASE13.RMP"             "${_destdir}/ROUTES/A_BASE13.RMP"
  install -Dm644 "${srcdir}/A_BASE14.MAP"             "${_destdir}/MAPS/A_BASE14.MAP"
  install -Dm644 "${srcdir}/A_BASE14.RMP"             "${_destdir}/ROUTES/A_BASE14.RMP"
  install -Dm644 "${srcdir}/A_BASE15.MAP"             "${_destdir}/MAPS/A_BASE15.MAP"
  install -Dm644 "${srcdir}/A_BASE15.RMP"             "${_destdir}/ROUTES/A_BASE15.RMP"
  install -Dm644 "${srcdir}/A_BASE18.RMP"             "${_destdir}/ROUTES/A_BASE18.RMP"
  install -Dm644 "${srcdir}/A_BASE20.RMP"             "${_destdir}/ROUTES/A_BASE20.RMP"
  install -Dm644 "${srcdir}/BACK01.SCR"               "${_destdir}/GEOGRAPH/BACK01.SCR"
  install -Dm644 "${srcdir}/BACK02.SCR"               "${_destdir}/GEOGRAPH/BACK02.SCR"
  install -Dm644 "${srcdir}/BACK03.SCR"               "${_destdir}/GEOGRAPH/BACK03.SCR"
  install -Dm644 "${srcdir}/BACK04.SCR"               "${_destdir}/GEOGRAPH/BACK04.SCR"
  install -Dm644 "${srcdir}/BACK05.SCR"               "${_destdir}/GEOGRAPH/BACK05.SCR"
  install -Dm644 "${srcdir}/BACK06.SCR"               "${_destdir}/GEOGRAPH/BACK06.SCR"
  install -Dm644 "${srcdir}/BACK07.SCR"               "${_destdir}/GEOGRAPH/BACK07.SCR"
  install -Dm644 "${srcdir}/BACK08.SCR"               "${_destdir}/GEOGRAPH/BACK08.SCR"
  install -Dm644 "${srcdir}/BACK12.SCR"               "${_destdir}/GEOGRAPH/BACK12.SCR"
  install -Dm644 "${srcdir}/BACK13.SCR"               "${_destdir}/GEOGRAPH/BACK13.SCR"
  install -Dm644 "${srcdir}/BACK14.SCR"               "${_destdir}/GEOGRAPH/BACK14.SCR"
  install -Dm644 "${srcdir}/BACK15.SCR"               "${_destdir}/GEOGRAPH/BACK15.SCR"
  install -Dm644 "${srcdir}/BACK16.SCR"               "${_destdir}/GEOGRAPH/BACK16.SCR"
  install -Dm644 "${srcdir}/BACK17.SCR"               "${_destdir}/GEOGRAPH/BACK17.SCR"
  install -Dm644 "${srcdir}/BACKG.LBM"                "${_destdir}/GEOGRAPH/BACKG.LBM"
  install -Dm644 "${srcdir}/BACKPALS.DAT"             "${_destdir}/GEODATA/BACKPALS.DAT"
  install -Dm644 "${srcdir}/BASEBITS.PCK"             "${_destdir}/GEOGRAPH/BASEBITS.PCK"
  install -Dm644 "${srcdir}/BASEBITS.TAB"             "${_destdir}/GEOGRAPH/BASEBITS.TAB"
  install -Dm644 "${srcdir}/BIGLETS.DAT"              "${_destdir}/GEODATA/BIGLETS.DAT"
  install -Dm644 "${srcdir}/BIGOBS.PCK"               "${_destdir}/UNITS/BIGOBS.PCK"
  install -Dm644 "${srcdir}/BIGOBS.TAB"               "${_destdir}/UNITS/BIGOBS.TAB"
  install -Dm644 "${srcdir}/BIODRON.PCK"              "${_destdir}/UNITS/BIODRON.PCK"
  install -Dm644 "${srcdir}/BIODRON.TAB"              "${_destdir}/UNITS/BIODRON.TAB"
  install -Dm644 "${srcdir}/BLANKS.MCD"               "${_destdir}/TERRAIN/BLANKS.MCD"
  install -Dm644 "${srcdir}/BLANKS.PCK"               "${_destdir}/TERRAIN/BLANKS.PCK"
  install -Dm644 "${srcdir}/BLANKS.TAB"               "${_destdir}/TERRAIN/BLANKS.TAB"
  install -Dm644 "${srcdir}/BREATH-1.PCK"             "${_destdir}/UNITS/BREATH-1.PCK"
  install -Dm644 "${srcdir}/BREATH-1.TAB"             "${_destdir}/UNITS/BREATH-1.TAB"
  install -Dm644 "${srcdir}/CALCIN.PCK"               "${_destdir}/UNITS/CALCIN.PCK"
  install -Dm644 "${srcdir}/CALCIN.TAB"               "${_destdir}/UNITS/CALCIN.TAB"
  install -Dm644 "${srcdir}/CARGO00.MAP"              "${_destdir}/MAPS/CARGO00.MAP"
  install -Dm644 "${srcdir}/CARGO00.RMP"              "${_destdir}/ROUTES/CARGO00.RMP"
  install -Dm644 "${srcdir}/CARGO01.MAP"              "${_destdir}/MAPS/CARGO01.MAP"
  install -Dm644 "${srcdir}/CARGO01.RMP"              "${_destdir}/ROUTES/CARGO01.RMP"
  install -Dm644 "${srcdir}/CARGO02.MAP"              "${_destdir}/MAPS/CARGO02.MAP"
  install -Dm644 "${srcdir}/CARGO02.RMP"              "${_destdir}/ROUTES/CARGO02.RMP"
  install -Dm644 "${srcdir}/CARGO1.MCD"               "${_destdir}/TERRAIN/CARGO1.MCD"
  install -Dm644 "${srcdir}/CARGO1.PCK"               "${_destdir}/TERRAIN/CARGO1.PCK"
  install -Dm644 "${srcdir}/CARGO1.TAB"               "${_destdir}/TERRAIN/CARGO1.TAB"
  install -Dm644 "${srcdir}/CARGO2.MCD"               "${_destdir}/TERRAIN/CARGO2.MCD"
  install -Dm644 "${srcdir}/CARGO2.PCK"               "${_destdir}/TERRAIN/CARGO2.PCK"
  install -Dm644 "${srcdir}/CARGO2.TAB"               "${_destdir}/TERRAIN/CARGO2.TAB"
  install -Dm644 "${srcdir}/CARGO3.MCD"               "${_destdir}/TERRAIN/CARGO3.MCD"
  install -Dm644 "${srcdir}/CARGO3.PCK"               "${_destdir}/TERRAIN/CARGO3.PCK"
  install -Dm644 "${srcdir}/CARGO3.TAB"               "${_destdir}/TERRAIN/CARGO3.TAB"
  install -Dm644 "${srcdir}/CARGO4.PCK"               "${_destdir}/TERRAIN/CARGO4.PCK"
  install -Dm644 "${srcdir}/CARGO4.TAB"               "${_destdir}/TERRAIN/CARGO4.TAB"
  install -Dm644 "${srcdir}/CARGO5.PCK"               "${_destdir}/TERRAIN/CARGO5.PCK"
  install -Dm644 "${srcdir}/CARGO5.TAB"               "${_destdir}/TERRAIN/CARGO5.TAB"
  install -Dm644 "${srcdir}/CDSPEED.DAT"              "${_destdir}/SOUND/CDSPEED.DAT"
  install -Dm644 "${srcdir}/CIVIL_1.PCK"              "${_destdir}/UNITS/CIVIL_1.PCK"
  install -Dm644 "${srcdir}/CIVIL_1.TAB"              "${_destdir}/UNITS/CIVIL_1.TAB"
  install -Dm644 "${srcdir}/CIVIL_2.PCK"              "${_destdir}/UNITS/CIVIL_2.PCK"
  install -Dm644 "${srcdir}/CIVIL_2.TAB"              "${_destdir}/UNITS/CIVIL_2.TAB"
  install -Dm644 "${srcdir}/CORAL.MCD"                "${_destdir}/TERRAIN/CORAL.MCD"
  install -Dm644 "${srcdir}/CORAL.PCK"                "${_destdir}/TERRAIN/CORAL.PCK"
  install -Dm644 "${srcdir}/CORAL.TAB"                "${_destdir}/TERRAIN/CORAL.TAB"
  install -Dm644 "${srcdir}/CORAL00.MAP"              "${_destdir}/MAPS/CORAL00.MAP"
  install -Dm644 "${srcdir}/CORAL00.RMP"              "${_destdir}/ROUTES/CORAL00.RMP"
  install -Dm644 "${srcdir}/CORAL01.MAP"              "${_destdir}/MAPS/CORAL01.MAP"
  install -Dm644 "${srcdir}/CORAL01.RMP"              "${_destdir}/ROUTES/CORAL01.RMP"
  install -Dm644 "${srcdir}/CORAL02.MAP"              "${_destdir}/MAPS/CORAL02.MAP"
  install -Dm644 "${srcdir}/CORAL02.RMP"              "${_destdir}/ROUTES/CORAL02.RMP"
  install -Dm644 "${srcdir}/CORAL03.MAP"              "${_destdir}/MAPS/CORAL03.MAP"
  install -Dm644 "${srcdir}/CORAL03.RMP"              "${_destdir}/ROUTES/CORAL03.RMP"
  install -Dm644 "${srcdir}/CORAL04.MAP"              "${_destdir}/MAPS/CORAL04.MAP"
  install -Dm644 "${srcdir}/CORAL04.RMP"              "${_destdir}/ROUTES/CORAL04.RMP"
  install -Dm644 "${srcdir}/CORAL05.MAP"              "${_destdir}/MAPS/CORAL05.MAP"
  install -Dm644 "${srcdir}/CORAL05.RMP"              "${_destdir}/ROUTES/CORAL05.RMP"
  install -Dm644 "${srcdir}/CORAL06.MAP"              "${_destdir}/MAPS/CORAL06.MAP"
  install -Dm644 "${srcdir}/CORAL06.RMP"              "${_destdir}/ROUTES/CORAL06.RMP"
  install -Dm644 "${srcdir}/CORAL07.MAP"              "${_destdir}/MAPS/CORAL07.MAP"
  install -Dm644 "${srcdir}/CORAL07.RMP"              "${_destdir}/ROUTES/CORAL07.RMP"
  install -Dm644 "${srcdir}/CORAL08.MAP"              "${_destdir}/MAPS/CORAL08.MAP"
  install -Dm644 "${srcdir}/CORAL08.RMP"              "${_destdir}/ROUTES/CORAL08.RMP"
  install -Dm644 "${srcdir}/CORAL09.MAP"              "${_destdir}/MAPS/CORAL09.MAP"
  install -Dm644 "${srcdir}/CORAL09.RMP"              "${_destdir}/ROUTES/CORAL09.RMP"
  install -Dm644 "${srcdir}/CORAL10.MAP"              "${_destdir}/MAPS/CORAL10.MAP"
  install -Dm644 "${srcdir}/CORAL10.RMP"              "${_destdir}/ROUTES/CORAL10.RMP"
  install -Dm644 "${srcdir}/CORAL11.MAP"              "${_destdir}/MAPS/CORAL11.MAP"
  install -Dm644 "${srcdir}/CORAL11.RMP"              "${_destdir}/ROUTES/CORAL11.RMP"
  install -Dm644 "${srcdir}/CORAL12.MAP"              "${_destdir}/MAPS/CORAL12.MAP"
  install -Dm644 "${srcdir}/CORAL12.RMP"              "${_destdir}/ROUTES/CORAL12.RMP"
  install -Dm644 "${srcdir}/COS.DAT"                  "${_destdir}/GEODATA/COS.DAT"
  install -Dm644 "${srcdir}/CRYPT01.MAP"              "${_destdir}/MAPS/CRYPT01.MAP"
  install -Dm644 "${srcdir}/CRYPT01.RMP"              "${_destdir}/ROUTES/CRYPT01.RMP"
  install -Dm644 "${srcdir}/CRYPT02.MAP"              "${_destdir}/MAPS/CRYPT02.MAP"
  install -Dm644 "${srcdir}/CRYPT02.RMP"              "${_destdir}/ROUTES/CRYPT02.RMP"
  install -Dm644 "${srcdir}/CRYPT03.MAP"              "${_destdir}/MAPS/CRYPT03.MAP"
  install -Dm644 "${srcdir}/CRYPT03.RMP"              "${_destdir}/ROUTES/CRYPT03.RMP"
  install -Dm644 "${srcdir}/CRYPT04.MAP"              "${_destdir}/MAPS/CRYPT04.MAP"
  install -Dm644 "${srcdir}/CRYPT04.RMP"              "${_destdir}/ROUTES/CRYPT04.RMP"
  install -Dm644 "${srcdir}/CRYPT05.MAP"              "${_destdir}/MAPS/CRYPT05.MAP"
  install -Dm644 "${srcdir}/CRYPT05.RMP"              "${_destdir}/ROUTES/CRYPT05.RMP"
  install -Dm644 "${srcdir}/CRYPT06.MAP"              "${_destdir}/MAPS/CRYPT06.MAP"
  install -Dm644 "${srcdir}/CRYPT06.RMP"              "${_destdir}/ROUTES/CRYPT06.RMP"
  install -Dm644 "${srcdir}/CRYPT07.MAP"              "${_destdir}/MAPS/CRYPT07.MAP"
  install -Dm644 "${srcdir}/CRYPT07.RMP"              "${_destdir}/ROUTES/CRYPT07.RMP"
  install -Dm644 "${srcdir}/CRYPT08.MAP"              "${_destdir}/MAPS/CRYPT08.MAP"
  install -Dm644 "${srcdir}/CRYPT08.RMP"              "${_destdir}/ROUTES/CRYPT08.RMP"
  install -Dm644 "${srcdir}/CRYPT09.MAP"              "${_destdir}/MAPS/CRYPT09.MAP"
  install -Dm644 "${srcdir}/CRYPT09.RMP"              "${_destdir}/ROUTES/CRYPT09.RMP"
  install -Dm644 "${srcdir}/CRYPT1.MCD"               "${_destdir}/TERRAIN/CRYPT1.MCD"
  install -Dm644 "${srcdir}/CRYPT1.PCK"               "${_destdir}/TERRAIN/CRYPT1.PCK"
  install -Dm644 "${srcdir}/CRYPT1.TAB"               "${_destdir}/TERRAIN/CRYPT1.TAB"
  install -Dm644 "${srcdir}/CRYPT2.MCD"               "${_destdir}/TERRAIN/CRYPT2.MCD"
  install -Dm644 "${srcdir}/CRYPT2.PCK"               "${_destdir}/TERRAIN/CRYPT2.PCK"
  install -Dm644 "${srcdir}/CRYPT2.TAB"               "${_destdir}/TERRAIN/CRYPT2.TAB"
  install -Dm644 "${srcdir}/CRYPT3.MCD"               "${_destdir}/TERRAIN/CRYPT3.MCD"
  install -Dm644 "${srcdir}/CRYPT3.PCK"               "${_destdir}/TERRAIN/CRYPT3.PCK"
  install -Dm644 "${srcdir}/CRYPT3.TAB"               "${_destdir}/TERRAIN/CRYPT3.TAB"
  install -Dm644 "${srcdir}/CRYPT4.MCD"               "${_destdir}/TERRAIN/CRYPT4.MCD"
  install -Dm644 "${srcdir}/CRYPT4.PCK"               "${_destdir}/TERRAIN/CRYPT4.PCK"
  install -Dm644 "${srcdir}/CRYPT4.TAB"               "${_destdir}/TERRAIN/CRYPT4.TAB"
  install -Dm644 "${srcdir}/CURSOR.PCK"               "${_destdir}/UFOGRAPH/CURSOR.PCK"
  install -Dm644 "${srcdir}/CURSOR.TAB"               "${_destdir}/UFOGRAPH/CURSOR.TAB"
  install -Dm644 "${srcdir}/D0.LBM"                   "${_destdir}/UFOGRAPH/D0.LBM"
  install -Dm644 "${srcdir}/D1.LBM"                   "${_destdir}/UFOGRAPH/D1.LBM"
  install -Dm644 "${srcdir}/D2.LBM"                   "${_destdir}/UFOGRAPH/D2.LBM"
  install -Dm644 "${srcdir}/D3.LBM"                   "${_destdir}/UFOGRAPH/D3.LBM"
  install -Dm644 "${srcdir}/DEBRIS.MCD"               "${_destdir}/TERRAIN/DEBRIS.MCD"
  install -Dm644 "${srcdir}/DEBRIS.PCK"               "${_destdir}/TERRAIN/DEBRIS.PCK"
  install -Dm644 "${srcdir}/DEBRIS.TAB"               "${_destdir}/TERRAIN/DEBRIS.TAB"
  install -Dm644 "${srcdir}/DECKC.MCD"                "${_destdir}/TERRAIN/DECKC.MCD"
  install -Dm644 "${srcdir}/DECKC.PCK"                "${_destdir}/TERRAIN/DECKC.PCK"
  install -Dm644 "${srcdir}/DECKC.TAB"                "${_destdir}/TERRAIN/DECKC.TAB"
  install -Dm644 "${srcdir}/DEEPONE.PCK"              "${_destdir}/UNITS/DEEPONE.PCK"
  install -Dm644 "${srcdir}/DEEPONE.TAB"              "${_destdir}/UNITS/DEEPONE.TAB"
  install -Dm644 "${srcdir}/DETBLOB.DAT"              "${_destdir}/UFOGRAPH/DETBLOB.DAT"
  install -Dm644 "${srcdir}/DETBORD.BDY"              "${_destdir}/UFOGRAPH/DETBORD.BDY"
  install -Dm644 "${srcdir}/DETBORD2.BDY"             "${_destdir}/UFOGRAPH/DETBORD2.BDY"
  install -Dm644 "${srcdir}/DRIVERS.CAT"              "${_destdir}/SOUND/DRIVERS.CAT"
  install -Dm644 "${srcdir}/ENGLISH.DAT"              "${_destdir}/GEODATA/ENGLISH.DAT"
  install -Dm644 "${srcdir}/ENGLISH2.DAT"             "${_destdir}/GEODATA/ENGLISH2.DAT"
  install -Dm644 "${srcdir}/ENTRY.MCD"                "${_destdir}/TERRAIN/ENTRY.MCD"
  install -Dm644 "${srcdir}/ENTRY.PCK"                "${_destdir}/TERRAIN/ENTRY.PCK"
  install -Dm644 "${srcdir}/ENTRY.TAB"                "${_destdir}/TERRAIN/ENTRY.TAB"
  install -Dm644 "${srcdir}/ENTRY00.MAP"              "${_destdir}/MAPS/ENTRY00.MAP"
  install -Dm644 "${srcdir}/ENTRY00.RMP"              "${_destdir}/ROUTES/ENTRY00.RMP"
  install -Dm644 "${srcdir}/ENTRY01.MAP"              "${_destdir}/MAPS/ENTRY01.MAP"
  install -Dm644 "${srcdir}/ENTRY01.RMP"              "${_destdir}/ROUTES/ENTRY01.RMP"
  install -Dm644 "${srcdir}/ENTRY02.MAP"              "${_destdir}/MAPS/ENTRY02.MAP"
  install -Dm644 "${srcdir}/ENTRY02.RMP"              "${_destdir}/ROUTES/ENTRY02.RMP"
  install -Dm644 "${srcdir}/ENTRY03.MAP"              "${_destdir}/MAPS/ENTRY03.MAP"
  install -Dm644 "${srcdir}/ENTRY03.RMP"              "${_destdir}/ROUTES/ENTRY03.RMP"
  install -Dm644 "${srcdir}/ENTRY04.MAP"              "${_destdir}/MAPS/ENTRY04.MAP"
  install -Dm644 "${srcdir}/ENTRY04.RMP"              "${_destdir}/ROUTES/ENTRY04.RMP"
  install -Dm644 "${srcdir}/ENTRY05.MAP"              "${_destdir}/MAPS/ENTRY05.MAP"
  install -Dm644 "${srcdir}/ENTRY05.RMP"              "${_destdir}/ROUTES/ENTRY05.RMP"
  install -Dm644 "${srcdir}/ENTRY06.MAP"              "${_destdir}/MAPS/ENTRY06.MAP"
  install -Dm644 "${srcdir}/ENTRY06.RMP"              "${_destdir}/ROUTES/ENTRY06.RMP"
  install -Dm644 "${srcdir}/ENTRY07.MAP"              "${_destdir}/MAPS/ENTRY07.MAP"
  install -Dm644 "${srcdir}/ENTRY07.RMP"              "${_destdir}/ROUTES/ENTRY07.RMP"
  install -Dm644 "${srcdir}/ENTRY08.MAP"              "${_destdir}/MAPS/ENTRY08.MAP"
  install -Dm644 "${srcdir}/ENTRY08.RMP"              "${_destdir}/ROUTES/ENTRY08.RMP"
  install -Dm644 "${srcdir}/FLOOROB.PCK"              "${_destdir}/UNITS/FLOOROB.PCK"
  install -Dm644 "${srcdir}/FLOOROB.TAB"              "${_destdir}/UNITS/FLOOROB.TAB"
  install -Dm644 "${srcdir}/FRENCH.DAT"               "${_destdir}/GEODATA/FRENCH.DAT"
  install -Dm644 "${srcdir}/FRENCH2.DAT"              "${_destdir}/GEODATA/FRENCH2.DAT"
  install -Dm644 "${srcdir}/GAL01.MAP"                "${_destdir}/MAPS/GAL01.MAP"
  install -Dm644 "${srcdir}/GAL01.RMP"                "${_destdir}/ROUTES/GAL01.RMP"
  install -Dm644 "${srcdir}/GAL02.MAP"                "${_destdir}/MAPS/GAL02.MAP"
  install -Dm644 "${srcdir}/GAL02.RMP"                "${_destdir}/ROUTES/GAL02.RMP"
  install -Dm644 "${srcdir}/GAL03.MAP"                "${_destdir}/MAPS/GAL03.MAP"
  install -Dm644 "${srcdir}/GAL03.RMP"                "${_destdir}/ROUTES/GAL03.RMP"
  install -Dm644 "${srcdir}/GAL04.MAP"                "${_destdir}/MAPS/GAL04.MAP"
  install -Dm644 "${srcdir}/GAL04.RMP"                "${_destdir}/ROUTES/GAL04.RMP"
  install -Dm644 "${srcdir}/GAL05.MAP"                "${_destdir}/MAPS/GAL05.MAP"
  install -Dm644 "${srcdir}/GAL05.RMP"                "${_destdir}/ROUTES/GAL05.RMP"
  install -Dm644 "${srcdir}/GAL06.MAP"                "${_destdir}/MAPS/GAL06.MAP"
  install -Dm644 "${srcdir}/GAL06.RMP"                "${_destdir}/ROUTES/GAL06.RMP"
  install -Dm644 "${srcdir}/GAL07.MAP"                "${_destdir}/MAPS/GAL07.MAP"
  install -Dm644 "${srcdir}/GAL07.RMP"                "${_destdir}/ROUTES/GAL07.RMP"
  install -Dm644 "${srcdir}/GAL08.MAP"                "${_destdir}/MAPS/GAL08.MAP"
  install -Dm644 "${srcdir}/GAL08.RMP"                "${_destdir}/ROUTES/GAL08.RMP"
  install -Dm644 "${srcdir}/GAL09.MAP"                "${_destdir}/MAPS/GAL09.MAP"
  install -Dm644 "${srcdir}/GAL09.RMP"                "${_destdir}/ROUTES/GAL09.RMP"
  install -Dm644 "${srcdir}/GAL10.MAP"                "${_destdir}/MAPS/GAL10.MAP"
  install -Dm644 "${srcdir}/GAL10.RMP"                "${_destdir}/ROUTES/GAL10.RMP"
  install -Dm644 "${srcdir}/GAL11.MAP"                "${_destdir}/MAPS/GAL11.MAP"
  install -Dm644 "${srcdir}/GAL11.RMP"                "${_destdir}/ROUTES/GAL11.RMP"
  install -Dm644 "${srcdir}/GAL12.MAP"                "${_destdir}/MAPS/GAL12.MAP"
  install -Dm644 "${srcdir}/GAL12.RMP"                "${_destdir}/ROUTES/GAL12.RMP"
  install -Dm644 "${srcdir}/GAL13.MAP"                "${_destdir}/MAPS/GAL13.MAP"
  install -Dm644 "${srcdir}/GAL13.RMP"                "${_destdir}/ROUTES/GAL13.RMP"
  install -Dm644 "${srcdir}/GAL14.MAP"                "${_destdir}/MAPS/GAL14.MAP"
  install -Dm644 "${srcdir}/GAL14.RMP"                "${_destdir}/ROUTES/GAL14.RMP"
  install -Dm644 "${srcdir}/GAL15.MAP"                "${_destdir}/MAPS/GAL15.MAP"
  install -Dm644 "${srcdir}/GAL15.RMP"                "${_destdir}/ROUTES/GAL15.RMP"
  install -Dm644 "${srcdir}/GAL16.MAP"                "${_destdir}/MAPS/GAL16.MAP"
  install -Dm644 "${srcdir}/GAL16.RMP"                "${_destdir}/ROUTES/GAL16.RMP"
  install -Dm644 "${srcdir}/GAMEOVER.IDX"             "${_destdir}/ANIMS/GAMEOVER.IDX"
  install -Dm644 "${srcdir}/GAMEOVER.VID"             "${_destdir}/ANIMS/GAMEOVER.VID"
  install -Dm644 "${srcdir}/GAO01.LBM"                "${_destdir}/FLOP_INT/GAO01.LBM"
  install -Dm644 "${srcdir}/GAO02.LBM"                "${_destdir}/FLOP_INT/GAO02.LBM"
  install -Dm644 "${srcdir}/GAO03.LBM"                "${_destdir}/FLOP_INT/GAO03.LBM"
  install -Dm644 "${srcdir}/GAO04.LBM"                "${_destdir}/FLOP_INT/GAO04.LBM"
  install -Dm644 "${srcdir}/GAO05.LBM"                "${_destdir}/FLOP_INT/GAO05.LBM"
  install -Dm644 "${srcdir}/GEOBORD.SCR"              "${_destdir}/GEOGRAPH/GEOBORD.SCR"
  install -Dm644 "${srcdir}/GERMAN.DAT"               "${_destdir}/GEODATA/GERMAN.DAT"
  install -Dm644 "${srcdir}/GERMAN2.DAT"              "${_destdir}/GEODATA/GERMAN2.DAT"
  install -Dm644 "${srcdir}/GILLMAN.PCK"              "${_destdir}/UNITS/GILLMAN.PCK"
  install -Dm644 "${srcdir}/GILLMAN.TAB"              "${_destdir}/UNITS/GILLMAN.TAB"
  install -Dm644 "${srcdir}/GM.CAT"                   "${_destdir}/SOUND/GM.CAT"
  install -Dm644 "${srcdir}/GRAPH.BDY"                "${_destdir}/GEOGRAPH/GRAPH.BDY"
  install -Dm644 "${srcdir}/GRAPHS.SPK"               "${_destdir}/GEOGRAPH/GRAPHS.SPK"
  install -Dm644 "${srcdir}/GRUNGE00.MAP"             "${_destdir}/MAPS/GRUNGE00.MAP"
  install -Dm644 "${srcdir}/GRUNGE00.RMP"             "${_destdir}/ROUTES/GRUNGE00.RMP"
  install -Dm644 "${srcdir}/GRUNGE01.MAP"             "${_destdir}/MAPS/GRUNGE01.MAP"
  install -Dm644 "${srcdir}/GRUNGE01.RMP"             "${_destdir}/ROUTES/GRUNGE01.RMP"
  install -Dm644 "${srcdir}/GRUNGE02.MAP"             "${_destdir}/MAPS/GRUNGE02.MAP"
  install -Dm644 "${srcdir}/GRUNGE02.RMP"             "${_destdir}/ROUTES/GRUNGE02.RMP"
  install -Dm644 "${srcdir}/GRUNGE03.MAP"             "${_destdir}/MAPS/GRUNGE03.MAP"
  install -Dm644 "${srcdir}/GRUNGE03.RMP"             "${_destdir}/ROUTES/GRUNGE03.RMP"
  install -Dm644 "${srcdir}/GRUNGE04.MAP"             "${_destdir}/MAPS/GRUNGE04.MAP"
  install -Dm644 "${srcdir}/GRUNGE04.RMP"             "${_destdir}/ROUTES/GRUNGE04.RMP"
  install -Dm644 "${srcdir}/GRUNGE05.MAP"             "${_destdir}/MAPS/GRUNGE05.MAP"
  install -Dm644 "${srcdir}/GRUNGE05.RMP"             "${_destdir}/ROUTES/GRUNGE05.RMP"
  install -Dm644 "${srcdir}/GRUNGE06.MAP"             "${_destdir}/MAPS/GRUNGE06.MAP"
  install -Dm644 "${srcdir}/GRUNGE06.RMP"             "${_destdir}/ROUTES/GRUNGE06.RMP"
  install -Dm644 "${srcdir}/GRUNGE07.MAP"             "${_destdir}/MAPS/GRUNGE07.MAP"
  install -Dm644 "${srcdir}/GRUNGE07.RMP"             "${_destdir}/ROUTES/GRUNGE07.RMP"
  install -Dm644 "${srcdir}/GRUNGE08.MAP"             "${_destdir}/MAPS/GRUNGE08.MAP"
  install -Dm644 "${srcdir}/GRUNGE08.RMP"             "${_destdir}/ROUTES/GRUNGE08.RMP"
  install -Dm644 "${srcdir}/GRUNGE09.MAP"             "${_destdir}/MAPS/GRUNGE09.MAP"
  install -Dm644 "${srcdir}/GRUNGE09.RMP"             "${_destdir}/ROUTES/GRUNGE09.RMP"
  install -Dm644 "${srcdir}/GRUNGE1.MCD"              "${_destdir}/TERRAIN/GRUNGE1.MCD"
  install -Dm644 "${srcdir}/GRUNGE1.PCK"              "${_destdir}/TERRAIN/GRUNGE1.PCK"
  install -Dm644 "${srcdir}/GRUNGE1.TAB"              "${_destdir}/TERRAIN/GRUNGE1.TAB"
  install -Dm644 "${srcdir}/GRUNGE10.MAP"             "${_destdir}/MAPS/GRUNGE10.MAP"
  install -Dm644 "${srcdir}/GRUNGE10.RMP"             "${_destdir}/ROUTES/GRUNGE10.RMP"
  install -Dm644 "${srcdir}/GRUNGE11.MAP"             "${_destdir}/MAPS/GRUNGE11.MAP"
  install -Dm644 "${srcdir}/GRUNGE11.RMP"             "${_destdir}/ROUTES/GRUNGE11.RMP"
  install -Dm644 "${srcdir}/GRUNGE12.MAP"             "${_destdir}/MAPS/GRUNGE12.MAP"
  install -Dm644 "${srcdir}/GRUNGE12.RMP"             "${_destdir}/ROUTES/GRUNGE12.RMP"
  install -Dm644 "${srcdir}/GRUNGE13.MAP"             "${_destdir}/MAPS/GRUNGE13.MAP"
  install -Dm644 "${srcdir}/GRUNGE13.RMP"             "${_destdir}/ROUTES/GRUNGE13.RMP"
  install -Dm644 "${srcdir}/GRUNGE14.MAP"             "${_destdir}/MAPS/GRUNGE14.MAP"
  install -Dm644 "${srcdir}/GRUNGE14.RMP"             "${_destdir}/ROUTES/GRUNGE14.RMP"
  install -Dm644 "${srcdir}/GRUNGE15.MAP"             "${_destdir}/MAPS/GRUNGE15.MAP"
  install -Dm644 "${srcdir}/GRUNGE15.RMP"             "${_destdir}/ROUTES/GRUNGE15.RMP"
  install -Dm644 "${srcdir}/GRUNGE16.MAP"             "${_destdir}/MAPS/GRUNGE16.MAP"
  install -Dm644 "${srcdir}/GRUNGE16.RMP"             "${_destdir}/ROUTES/GRUNGE16.RMP"
  install -Dm644 "${srcdir}/GRUNGE2.MCD"              "${_destdir}/TERRAIN/GRUNGE2.MCD"
  install -Dm644 "${srcdir}/GRUNGE2.PCK"              "${_destdir}/TERRAIN/GRUNGE2.PCK"
  install -Dm644 "${srcdir}/GRUNGE2.TAB"              "${_destdir}/TERRAIN/GRUNGE2.TAB"
  install -Dm644 "${srcdir}/GRUNGE3.MCD"              "${_destdir}/TERRAIN/GRUNGE3.MCD"
  install -Dm644 "${srcdir}/GRUNGE3.PCK"              "${_destdir}/TERRAIN/GRUNGE3.PCK"
  install -Dm644 "${srcdir}/GRUNGE3.TAB"              "${_destdir}/TERRAIN/GRUNGE3.TAB"
  install -Dm644 "${srcdir}/GRUNGE4.MCD"              "${_destdir}/TERRAIN/GRUNGE4.MCD"
  install -Dm644 "${srcdir}/GRUNGE4.PCK"              "${_destdir}/TERRAIN/GRUNGE4.PCK"
  install -Dm644 "${srcdir}/GRUNGE4.TAB"              "${_destdir}/TERRAIN/GRUNGE4.TAB"
  install -Dm644 "${srcdir}/GRUNGE5.MCD"              "${_destdir}/TERRAIN/GRUNGE5.MCD"
  install -Dm644 "${srcdir}/GRUNGE5.PCK"              "${_destdir}/TERRAIN/GRUNGE5.PCK"
  install -Dm644 "${srcdir}/GRUNGE5.TAB"              "${_destdir}/TERRAIN/GRUNGE5.TAB"
  install -Dm644 "${srcdir}/HALLUCIN.PCK"             "${_destdir}/UNITS/HALLUCIN.PCK"
  install -Dm644 "${srcdir}/HALLUCIN.TAB"             "${_destdir}/UNITS/HALLUCIN.TAB"
  install -Dm644 "${srcdir}/HAMMER.MAP"               "${_destdir}/MAPS/HAMMER.MAP"
  install -Dm644 "${srcdir}/HAMMER.MCD"               "${_destdir}/TERRAIN/HAMMER.MCD"
  install -Dm644 "${srcdir}/HAMMER.PCK"               "${_destdir}/TERRAIN/HAMMER.PCK"
  install -Dm644 "${srcdir}/HAMMER.RMP"               "${_destdir}/ROUTES/HAMMER.RMP"
  install -Dm644 "${srcdir}/HAMMER.TAB"               "${_destdir}/TERRAIN/HAMMER.TAB"
  install -Dm644 "${srcdir}/HAMMER1.MAP"              "${_destdir}/MAPS/HAMMER1.MAP"
  install -Dm644 "${srcdir}/HAMMER1.RMP"              "${_destdir}/ROUTES/HAMMER1.RMP"
  install -Dm644 "${srcdir}/HAMMER2.MAP"              "${_destdir}/MAPS/HAMMER2.MAP"
  install -Dm644 "${srcdir}/HAMMER2.RMP"              "${_destdir}/ROUTES/HAMMER2.RMP"
  install -Dm644 "${srcdir}/HANDOB.PCK"               "${_destdir}/UNITS/HANDOB.PCK"
  install -Dm644 "${srcdir}/HANDOB.TAB"               "${_destdir}/UNITS/HANDOB.TAB"
  install -Dm644 "${srcdir}/HIT.PCK"                  "${_destdir}/UFOGRAPH/HIT.PCK"
  install -Dm644 "${srcdir}/HIT.TAB"                  "${_destdir}/UFOGRAPH/HIT.TAB"
  install -Dm644 "${srcdir}/ICONS.BDY"                "${_destdir}/UFOGRAPH/ICONS.BDY"
  install -Dm644 "${srcdir}/INT00.LBM"                "${_destdir}/FLOP_INT/INT00.LBM"
  install -Dm644 "${srcdir}/INT01.LBM"                "${_destdir}/FLOP_INT/INT01.LBM"
  install -Dm644 "${srcdir}/INT02.LBM"                "${_destdir}/FLOP_INT/INT02.LBM"
  install -Dm644 "${srcdir}/INT03.LBM"                "${_destdir}/FLOP_INT/INT03.LBM"
  install -Dm644 "${srcdir}/INT04.LBM"                "${_destdir}/FLOP_INT/INT04.LBM"
  install -Dm644 "${srcdir}/INT05.LBM"                "${_destdir}/FLOP_INT/INT05.LBM"
  install -Dm644 "${srcdir}/INT06.LBM"                "${_destdir}/FLOP_INT/INT06.LBM"
  install -Dm644 "${srcdir}/INT07.LBM"                "${_destdir}/FLOP_INT/INT07.LBM"
  install -Dm644 "${srcdir}/INT08.LBM"                "${_destdir}/FLOP_INT/INT08.LBM"
  install -Dm644 "${srcdir}/INT09.LBM"                "${_destdir}/FLOP_INT/INT09.LBM"
  install -Dm644 "${srcdir}/INT10.LBM"                "${_destdir}/FLOP_INT/INT10.LBM"
  install -Dm644 "${srcdir}/INT11.LBM"                "${_destdir}/FLOP_INT/INT11.LBM"
  install -Dm644 "${srcdir}/INT12.LBM"                "${_destdir}/FLOP_INT/INT12.LBM"
  install -Dm644 "${srcdir}/INT13.LBM"                "${_destdir}/FLOP_INT/INT13.LBM"
  install -Dm644 "${srcdir}/INT14.LBM"                "${_destdir}/FLOP_INT/INT14.LBM"
  install -Dm644 "${srcdir}/INT15.LBM"                "${_destdir}/FLOP_INT/INT15.LBM"
  install -Dm644 "${srcdir}/INT16.LBM"                "${_destdir}/FLOP_INT/INT16.LBM"
  install -Dm644 "${srcdir}/INT17.LBM"                "${_destdir}/FLOP_INT/INT17.LBM"
  install -Dm644 "${srcdir}/INT18.LBM"                "${_destdir}/FLOP_INT/INT18.LBM"
  install -Dm644 "${srcdir}/INT19.LBM"                "${_destdir}/FLOP_INT/INT19.LBM"
  install -Dm644 "${srcdir}/INT20.LBM"                "${_destdir}/FLOP_INT/INT20.LBM"
  install -Dm644 "${srcdir}/INT21.LBM"                "${_destdir}/FLOP_INT/INT21.LBM"
  install -Dm644 "${srcdir}/INTERWIN.DAT"             "${_destdir}/GEODATA/INTERWIN.DAT"
  install -Dm644 "${srcdir}/INTICON.PCK"              "${_destdir}/GEOGRAPH/INTICON.PCK"
  install -Dm644 "${srcdir}/INTICON.TAB"              "${_destdir}/GEOGRAPH/INTICON.TAB"
  install -Dm644 "${srcdir}/INTRO.IDX"                "${_destdir}/ANIMS/INTRO.IDX"
  install -Dm644 "${srcdir}/INTRO.VID"                "${_destdir}/ANIMS/INTRO.VID"
  install -Dm644 "${srcdir}/ISLAND00.MAP"             "${_destdir}/MAPS/ISLAND00.MAP"
  install -Dm644 "${srcdir}/ISLAND00.RMP"             "${_destdir}/ROUTES/ISLAND00.RMP"
  install -Dm644 "${srcdir}/ISLAND01.MAP"             "${_destdir}/MAPS/ISLAND01.MAP"
  install -Dm644 "${srcdir}/ISLAND01.RMP"             "${_destdir}/ROUTES/ISLAND01.RMP"
  install -Dm644 "${srcdir}/ISLAND02.MAP"             "${_destdir}/MAPS/ISLAND02.MAP"
  install -Dm644 "${srcdir}/ISLAND02.RMP"             "${_destdir}/ROUTES/ISLAND02.RMP"
  install -Dm644 "${srcdir}/ISLAND03.MAP"             "${_destdir}/MAPS/ISLAND03.MAP"
  install -Dm644 "${srcdir}/ISLAND03.RMP"             "${_destdir}/ROUTES/ISLAND03.RMP"
  install -Dm644 "${srcdir}/ISLAND04.MAP"             "${_destdir}/MAPS/ISLAND04.MAP"
  install -Dm644 "${srcdir}/ISLAND04.RMP"             "${_destdir}/ROUTES/ISLAND04.RMP"
  install -Dm644 "${srcdir}/ISLAND05.MAP"             "${_destdir}/MAPS/ISLAND05.MAP"
  install -Dm644 "${srcdir}/ISLAND05.RMP"             "${_destdir}/ROUTES/ISLAND05.RMP"
  install -Dm644 "${srcdir}/ISLAND06.MAP"             "${_destdir}/MAPS/ISLAND06.MAP"
  install -Dm644 "${srcdir}/ISLAND06.RMP"             "${_destdir}/ROUTES/ISLAND06.RMP"
  install -Dm644 "${srcdir}/ISLAND07.MAP"             "${_destdir}/MAPS/ISLAND07.MAP"
  install -Dm644 "${srcdir}/ISLAND07.RMP"             "${_destdir}/ROUTES/ISLAND07.RMP"
  install -Dm644 "${srcdir}/ISLAND08.MAP"             "${_destdir}/MAPS/ISLAND08.MAP"
  install -Dm644 "${srcdir}/ISLAND08.RMP"             "${_destdir}/ROUTES/ISLAND08.RMP"
  install -Dm644 "${srcdir}/ISLAND09.MAP"             "${_destdir}/MAPS/ISLAND09.MAP"
  install -Dm644 "${srcdir}/ISLAND09.RMP"             "${_destdir}/ROUTES/ISLAND09.RMP"
  install -Dm644 "${srcdir}/ISLAND1.LBM"              "${_destdir}/TERRAIN/ISLAND1.LBM"
  install -Dm644 "${srcdir}/ISLAND1.MCD"              "${_destdir}/TERRAIN/ISLAND1.MCD"
  install -Dm644 "${srcdir}/ISLAND1.PCK"              "${_destdir}/TERRAIN/ISLAND1.PCK"
  install -Dm644 "${srcdir}/ISLAND1.TAB"              "${_destdir}/TERRAIN/ISLAND1.TAB"
  install -Dm644 "${srcdir}/ISLAND10.MAP"             "${_destdir}/MAPS/ISLAND10.MAP"
  install -Dm644 "${srcdir}/ISLAND10.RMP"             "${_destdir}/ROUTES/ISLAND10.RMP"
  install -Dm644 "${srcdir}/ISLAND11.MAP"             "${_destdir}/MAPS/ISLAND11.MAP"
  install -Dm644 "${srcdir}/ISLAND11.RMP"             "${_destdir}/ROUTES/ISLAND11.RMP"
  install -Dm644 "${srcdir}/ISLAND12.MAP"             "${_destdir}/MAPS/ISLAND12.MAP"
  install -Dm644 "${srcdir}/ISLAND12.RMP"             "${_destdir}/ROUTES/ISLAND12.RMP"
  install -Dm644 "${srcdir}/ISLAND13.MAP"             "${_destdir}/MAPS/ISLAND13.MAP"
  install -Dm644 "${srcdir}/ISLAND13.RMP"             "${_destdir}/ROUTES/ISLAND13.RMP"
  install -Dm644 "${srcdir}/ISLAND14.MAP"             "${_destdir}/MAPS/ISLAND14.MAP"
  install -Dm644 "${srcdir}/ISLAND14.RMP"             "${_destdir}/ROUTES/ISLAND14.RMP"
  install -Dm644 "${srcdir}/ISLAND2.LBM"              "${_destdir}/TERRAIN/ISLAND2.LBM"
  install -Dm644 "${srcdir}/ISLAND2.MCD"              "${_destdir}/TERRAIN/ISLAND2.MCD"
  install -Dm644 "${srcdir}/ISLAND2.PCK"              "${_destdir}/TERRAIN/ISLAND2.PCK"
  install -Dm644 "${srcdir}/ISLAND2.TAB"              "${_destdir}/TERRAIN/ISLAND2.TAB"
  install -Dm644 "${srcdir}/ISLAND3.LBM"              "${_destdir}/TERRAIN/ISLAND3.LBM"
  install -Dm644 "${srcdir}/ISLAND3.MCD"              "${_destdir}/TERRAIN/ISLAND3.MCD"
  install -Dm644 "${srcdir}/ISLAND3.PCK"              "${_destdir}/TERRAIN/ISLAND3.PCK"
  install -Dm644 "${srcdir}/ISLAND3.TAB"              "${_destdir}/TERRAIN/ISLAND3.TAB"
  install -Dm644 "${srcdir}/ISLAND4.MCD"              "${_destdir}/TERRAIN/ISLAND4.MCD"
  install -Dm644 "${srcdir}/LANG1.DAT"                "${_destdir}/GEODATA/LANG1.DAT"
  install -Dm644 "${srcdir}/LANG2.DAT"                "${_destdir}/GEODATA/LANG2.DAT"
  install -Dm644 "${srcdir}/LANG3.DAT"                "${_destdir}/GEODATA/LANG3.DAT"
  install -Dm644 "${srcdir}/LEVEL01.MAP"              "${_destdir}/MAPS/LEVEL01.MAP"
  install -Dm644 "${srcdir}/LEVEL01.RMP"              "${_destdir}/ROUTES/LEVEL01.RMP"
  install -Dm644 "${srcdir}/LEVEL02.MAP"              "${_destdir}/MAPS/LEVEL02.MAP"
  install -Dm644 "${srcdir}/LEVEL02.RMP"              "${_destdir}/ROUTES/LEVEL02.RMP"
  install -Dm644 "${srcdir}/LEVEL03.MAP"              "${_destdir}/MAPS/LEVEL03.MAP"
  install -Dm644 "${srcdir}/LEVEL03.RMP"              "${_destdir}/ROUTES/LEVEL03.RMP"
  install -Dm644 "${srcdir}/LEVEL04.MAP"              "${_destdir}/MAPS/LEVEL04.MAP"
  install -Dm644 "${srcdir}/LEVEL04.RMP"              "${_destdir}/ROUTES/LEVEL04.RMP"
  install -Dm644 "${srcdir}/LEVEL05.MAP"              "${_destdir}/MAPS/LEVEL05.MAP"
  install -Dm644 "${srcdir}/LEVEL05.RMP"              "${_destdir}/ROUTES/LEVEL05.RMP"
  install -Dm644 "${srcdir}/LEVEL06.MAP"              "${_destdir}/MAPS/LEVEL06.MAP"
  install -Dm644 "${srcdir}/LEVEL06.RMP"              "${_destdir}/ROUTES/LEVEL06.RMP"
  install -Dm644 "${srcdir}/LEVEL07.MAP"              "${_destdir}/MAPS/LEVEL07.MAP"
  install -Dm644 "${srcdir}/LEVEL07.RMP"              "${_destdir}/ROUTES/LEVEL07.RMP"
  install -Dm644 "${srcdir}/LEVEL08.MAP"              "${_destdir}/MAPS/LEVEL08.MAP"
  install -Dm644 "${srcdir}/LEVEL08.RMP"              "${_destdir}/ROUTES/LEVEL08.RMP"
  install -Dm644 "${srcdir}/LEVEL09.MAP"              "${_destdir}/MAPS/LEVEL09.MAP"
  install -Dm644 "${srcdir}/LEVEL09.RMP"              "${_destdir}/ROUTES/LEVEL09.RMP"
  install -Dm644 "${srcdir}/LEVIATH.MAP"              "${_destdir}/MAPS/LEVIATH.MAP"
  install -Dm644 "${srcdir}/LEVIATH.MCD"              "${_destdir}/TERRAIN/LEVIATH.MCD"
  install -Dm644 "${srcdir}/LEVIATH.PCK"              "${_destdir}/TERRAIN/LEVIATH.PCK"
  install -Dm644 "${srcdir}/LEVIATH.RMP"              "${_destdir}/ROUTES/LEVIATH.RMP"
  install -Dm644 "${srcdir}/LEVIATH.TAB"              "${_destdir}/TERRAIN/LEVIATH.TAB"
  install -Dm644 "${srcdir}/LINERA.MCD"               "${_destdir}/TERRAIN/LINERA.MCD"
  install -Dm644 "${srcdir}/LINERA.PCK"               "${_destdir}/TERRAIN/LINERA.PCK"
  install -Dm644 "${srcdir}/LINERA.TAB"               "${_destdir}/TERRAIN/LINERA.TAB"
  install -Dm644 "${srcdir}/LINERB.MCD"               "${_destdir}/TERRAIN/LINERB.MCD"
  install -Dm644 "${srcdir}/LINERB.PCK"               "${_destdir}/TERRAIN/LINERB.PCK"
  install -Dm644 "${srcdir}/LINERB.TAB"               "${_destdir}/TERRAIN/LINERB.TAB"
  install -Dm644 "${srcdir}/LINERB02.MAP"             "${_destdir}/MAPS/LINERB02.MAP"
  install -Dm644 "${srcdir}/LINERB02.RMP"             "${_destdir}/ROUTES/LINERB02.RMP"
  install -Dm644 "${srcdir}/LINERB03.MAP"             "${_destdir}/MAPS/LINERB03.MAP"
  install -Dm644 "${srcdir}/LINERB03.RMP"             "${_destdir}/ROUTES/LINERB03.RMP"
  install -Dm644 "${srcdir}/LINERC.MCD"               "${_destdir}/TERRAIN/LINERC.MCD"
  install -Dm644 "${srcdir}/LINERC.PCK"               "${_destdir}/TERRAIN/LINERC.PCK"
  install -Dm644 "${srcdir}/LINERC.TAB"               "${_destdir}/TERRAIN/LINERC.TAB"
  install -Dm644 "${srcdir}/LINERD.MCD"               "${_destdir}/TERRAIN/LINERD.MCD"
  install -Dm644 "${srcdir}/LINERD.PCK"               "${_destdir}/TERRAIN/LINERD.PCK"
  install -Dm644 "${srcdir}/LINERD.TAB"               "${_destdir}/TERRAIN/LINERD.TAB"
  install -Dm644 "${srcdir}/LINERT00.MAP"             "${_destdir}/MAPS/LINERT00.MAP"
  install -Dm644 "${srcdir}/LINERT00.RMP"             "${_destdir}/ROUTES/LINERT00.RMP"
  install -Dm644 "${srcdir}/LINERT01.MAP"             "${_destdir}/MAPS/LINERT01.MAP"
  install -Dm644 "${srcdir}/LINERT01.RMP"             "${_destdir}/ROUTES/LINERT01.RMP"
  install -Dm644 "${srcdir}/LINERT02.MAP"             "${_destdir}/MAPS/LINERT02.MAP"
  install -Dm644 "${srcdir}/LINERT02.RMP"             "${_destdir}/ROUTES/LINERT02.RMP"
  install -Dm644 "${srcdir}/LOBSTER.PCK"              "${_destdir}/UNITS/LOBSTER.PCK"
  install -Dm644 "${srcdir}/LOBSTER.TAB"              "${_destdir}/UNITS/LOBSTER.TAB"
  install -Dm644 "${srcdir}/ter-LOFTEMPS.DAT"         "${_destdir}/TERRAIN/LOFTEMPS.DAT"
  install -Dm644 "${srcdir}/geo-LOFTEMPS.DAT"         "${_destdir}/GEODATA/LOFTEMPS.DAT"
  install -Dm644 "${srcdir}/LOGO.IDX"                 "${_destdir}/ANIMS/LOGO.IDX"
  install -Dm644 "${srcdir}/LOGO.VID"                 "${_destdir}/ANIMS/LOGO.VID"
  install -Dm644 "${srcdir}/MAN_0F0.BDY"              "${_destdir}/UFOGRAPH/MAN_0F0.BDY"
  install -Dm644 "${srcdir}/MAN_0F1.BDY"              "${_destdir}/UFOGRAPH/MAN_0F1.BDY"
  install -Dm644 "${srcdir}/MAN_0F2.BDY"              "${_destdir}/UFOGRAPH/MAN_0F2.BDY"
  install -Dm644 "${srcdir}/MAN_0F3.BDY"              "${_destdir}/UFOGRAPH/MAN_0F3.BDY"
  install -Dm644 "${srcdir}/MAN_0M0.BDY"              "${_destdir}/UFOGRAPH/MAN_0M0.BDY"
  install -Dm644 "${srcdir}/MAN_0M1.BDY"              "${_destdir}/UFOGRAPH/MAN_0M1.BDY"
  install -Dm644 "${srcdir}/MAN_0M2.BDY"              "${_destdir}/UFOGRAPH/MAN_0M2.BDY"
  install -Dm644 "${srcdir}/MAN_0M3.BDY"              "${_destdir}/UFOGRAPH/MAN_0M3.BDY"
  install -Dm644 "${srcdir}/MAN_1F0.BDY"              "${_destdir}/UFOGRAPH/MAN_1F0.BDY"
  install -Dm644 "${srcdir}/MAN_1F1.BDY"              "${_destdir}/UFOGRAPH/MAN_1F1.BDY"
  install -Dm644 "${srcdir}/MAN_1F2.BDY"              "${_destdir}/UFOGRAPH/MAN_1F2.BDY"
  install -Dm644 "${srcdir}/MAN_1F3.BDY"              "${_destdir}/UFOGRAPH/MAN_1F3.BDY"
  install -Dm644 "${srcdir}/MAN_1M0.BDY"              "${_destdir}/UFOGRAPH/MAN_1M0.BDY"
  install -Dm644 "${srcdir}/MAN_1M1.BDY"              "${_destdir}/UFOGRAPH/MAN_1M1.BDY"
  install -Dm644 "${srcdir}/MAN_1M2.BDY"              "${_destdir}/UFOGRAPH/MAN_1M2.BDY"
  install -Dm644 "${srcdir}/MAN_1M3.BDY"              "${_destdir}/UFOGRAPH/MAN_1M3.BDY"
  install -Dm644 "${srcdir}/MAN_2F0.BDY"              "${_destdir}/UFOGRAPH/MAN_2F0.BDY"
  install -Dm644 "${srcdir}/MAN_2F1.BDY"              "${_destdir}/UFOGRAPH/MAN_2F1.BDY"
  install -Dm644 "${srcdir}/MAN_2F2.BDY"              "${_destdir}/UFOGRAPH/MAN_2F2.BDY"
  install -Dm644 "${srcdir}/MAN_2F3.BDY"              "${_destdir}/UFOGRAPH/MAN_2F3.BDY"
  install -Dm644 "${srcdir}/MAN_2M0.BDY"              "${_destdir}/UFOGRAPH/MAN_2M0.BDY"
  install -Dm644 "${srcdir}/MAN_2M1.BDY"              "${_destdir}/UFOGRAPH/MAN_2M1.BDY"
  install -Dm644 "${srcdir}/MAN_2M2.BDY"              "${_destdir}/UFOGRAPH/MAN_2M2.BDY"
  install -Dm644 "${srcdir}/MAN_2M3.BDY"              "${_destdir}/UFOGRAPH/MAN_2M3.BDY"
  install -Dm644 "${srcdir}/MAN_3F0.BDY"              "${_destdir}/UFOGRAPH/MAN_3F0.BDY"
  install -Dm644 "${srcdir}/MAN_3F1.BDY"              "${_destdir}/UFOGRAPH/MAN_3F1.BDY"
  install -Dm644 "${srcdir}/MAN_3F2.BDY"              "${_destdir}/UFOGRAPH/MAN_3F2.BDY"
  install -Dm644 "${srcdir}/MAN_3F3.BDY"              "${_destdir}/UFOGRAPH/MAN_3F3.BDY"
  install -Dm644 "${srcdir}/MAN_3M0.BDY"              "${_destdir}/UFOGRAPH/MAN_3M0.BDY"
  install -Dm644 "${srcdir}/MAN_3M1.BDY"              "${_destdir}/UFOGRAPH/MAN_3M1.BDY"
  install -Dm644 "${srcdir}/MAN_3M2.BDY"              "${_destdir}/UFOGRAPH/MAN_3M2.BDY"
  install -Dm644 "${srcdir}/MAN_3M3.BDY"              "${_destdir}/UFOGRAPH/MAN_3M3.BDY"
  install -Dm644 "${srcdir}/MAPS"                     "${_destdir}/MAPS/MAPS"
  install -Dm644 "${srcdir}/MEDIBITS.DAT"             "${_destdir}/UFOGRAPH/MEDIBITS.DAT"
  install -Dm644 "${srcdir}/MEDIBORD.BDY"             "${_destdir}/UFOGRAPH/MEDIBORD.BDY"
  install -Dm644 "${srcdir}/MSUNK00.MAP"              "${_destdir}/MAPS/MSUNK00.MAP"
  install -Dm644 "${srcdir}/MSUNK00.RMP"              "${_destdir}/ROUTES/MSUNK00.RMP"
  install -Dm644 "${srcdir}/MSUNK01.MAP"              "${_destdir}/MAPS/MSUNK01.MAP"
  install -Dm644 "${srcdir}/MSUNK01.RMP"              "${_destdir}/ROUTES/MSUNK01.RMP"
  install -Dm644 "${srcdir}/MSUNK02.MAP"              "${_destdir}/MAPS/MSUNK02.MAP"
  install -Dm644 "${srcdir}/MSUNK02.RMP"              "${_destdir}/ROUTES/MSUNK02.RMP"
  install -Dm644 "${srcdir}/MSUNK03.MAP"              "${_destdir}/MAPS/MSUNK03.MAP"
  install -Dm644 "${srcdir}/MSUNK03.RMP"              "${_destdir}/ROUTES/MSUNK03.RMP"
  install -Dm644 "${srcdir}/MSUNK04.MAP"              "${_destdir}/MAPS/MSUNK04.MAP"
  install -Dm644 "${srcdir}/MSUNK04.RMP"              "${_destdir}/ROUTES/MSUNK04.RMP"
  install -Dm644 "${srcdir}/MSUNK05.MAP"              "${_destdir}/MAPS/MSUNK05.MAP"
  install -Dm644 "${srcdir}/MSUNK05.RMP"              "${_destdir}/ROUTES/MSUNK05.RMP"
  install -Dm644 "${srcdir}/MSUNK06.MAP"              "${_destdir}/MAPS/MSUNK06.MAP"
  install -Dm644 "${srcdir}/MSUNK06.RMP"              "${_destdir}/ROUTES/MSUNK06.RMP"
  install -Dm644 "${srcdir}/MSUNK07.MAP"              "${_destdir}/MAPS/MSUNK07.MAP"
  install -Dm644 "${srcdir}/MSUNK07.RMP"              "${_destdir}/ROUTES/MSUNK07.RMP"
  install -Dm644 "${srcdir}/MSUNK08.MAP"              "${_destdir}/MAPS/MSUNK08.MAP"
  install -Dm644 "${srcdir}/MSUNK08.RMP"              "${_destdir}/ROUTES/MSUNK08.RMP"
  install -Dm644 "${srcdir}/MSUNK09.MAP"              "${_destdir}/MAPS/MSUNK09.MAP"
  install -Dm644 "${srcdir}/MSUNK09.RMP"              "${_destdir}/ROUTES/MSUNK09.RMP"
  install -Dm644 "${srcdir}/MSUNK1.MCD"               "${_destdir}/TERRAIN/MSUNK1.MCD"
  install -Dm644 "${srcdir}/MSUNK1.PCK"               "${_destdir}/TERRAIN/MSUNK1.PCK"
  install -Dm644 "${srcdir}/MSUNK1.TAB"               "${_destdir}/TERRAIN/MSUNK1.TAB"
  install -Dm644 "${srcdir}/MSUNK10.MAP"              "${_destdir}/MAPS/MSUNK10.MAP"
  install -Dm644 "${srcdir}/MSUNK10.RMP"              "${_destdir}/ROUTES/MSUNK10.RMP"
  install -Dm644 "${srcdir}/MSUNK11.MAP"              "${_destdir}/MAPS/MSUNK11.MAP"
  install -Dm644 "${srcdir}/MSUNK11.RMP"              "${_destdir}/ROUTES/MSUNK11.RMP"
  install -Dm644 "${srcdir}/MSUNK12.MAP"              "${_destdir}/MAPS/MSUNK12.MAP"
  install -Dm644 "${srcdir}/MSUNK12.RMP"              "${_destdir}/ROUTES/MSUNK12.RMP"
  install -Dm644 "${srcdir}/MSUNK13.MAP"              "${_destdir}/MAPS/MSUNK13.MAP"
  install -Dm644 "${srcdir}/MSUNK13.RMP"              "${_destdir}/ROUTES/MSUNK13.RMP"
  install -Dm644 "${srcdir}/MSUNK2.MCD"               "${_destdir}/TERRAIN/MSUNK2.MCD"
  install -Dm644 "${srcdir}/MSUNK2.PCK"               "${_destdir}/TERRAIN/MSUNK2.PCK"
  install -Dm644 "${srcdir}/MSUNK2.TAB"               "${_destdir}/TERRAIN/MSUNK2.TAB"
  install -Dm644 "${srcdir}/MU.MCD"                   "${_destdir}/TERRAIN/MU.MCD"
  install -Dm644 "${srcdir}/MU.PCK"                   "${_destdir}/TERRAIN/MU.PCK"
  install -Dm644 "${srcdir}/MU.TAB"                   "${_destdir}/TERRAIN/MU.TAB"
  install -Dm644 "${srcdir}/MU00.MAP"                 "${_destdir}/MAPS/MU00.MAP"
  install -Dm644 "${srcdir}/MU00.RMP"                 "${_destdir}/ROUTES/MU00.RMP"
  install -Dm644 "${srcdir}/MU01.MAP"                 "${_destdir}/MAPS/MU01.MAP"
  install -Dm644 "${srcdir}/MU01.RMP"                 "${_destdir}/ROUTES/MU01.RMP"
  install -Dm644 "${srcdir}/MU02.MAP"                 "${_destdir}/MAPS/MU02.MAP"
  install -Dm644 "${srcdir}/MU02.RMP"                 "${_destdir}/ROUTES/MU02.RMP"
  install -Dm644 "${srcdir}/MU03.MAP"                 "${_destdir}/MAPS/MU03.MAP"
  install -Dm644 "${srcdir}/MU03.RMP"                 "${_destdir}/ROUTES/MU03.RMP"
  install -Dm644 "${srcdir}/MU04.MAP"                 "${_destdir}/MAPS/MU04.MAP"
  install -Dm644 "${srcdir}/MU04.RMP"                 "${_destdir}/ROUTES/MU04.RMP"
  install -Dm644 "${srcdir}/MU05.MAP"                 "${_destdir}/MAPS/MU05.MAP"
  install -Dm644 "${srcdir}/MU05.RMP"                 "${_destdir}/ROUTES/MU05.RMP"
  install -Dm644 "${srcdir}/MU06.MAP"                 "${_destdir}/MAPS/MU06.MAP"
  install -Dm644 "${srcdir}/MU06.RMP"                 "${_destdir}/ROUTES/MU06.RMP"
  install -Dm644 "${srcdir}/MU07.MAP"                 "${_destdir}/MAPS/MU07.MAP"
  install -Dm644 "${srcdir}/MU07.RMP"                 "${_destdir}/ROUTES/MU07.RMP"
  install -Dm644 "${srcdir}/MU08.MAP"                 "${_destdir}/MAPS/MU08.MAP"
  install -Dm644 "${srcdir}/MU08.RMP"                 "${_destdir}/ROUTES/MU08.RMP"
  install -Dm644 "${srcdir}/MU09.MAP"                 "${_destdir}/MAPS/MU09.MAP"
  install -Dm644 "${srcdir}/MU09.RMP"                 "${_destdir}/ROUTES/MU09.RMP"
  install -Dm644 "${srcdir}/MU10.MAP"                 "${_destdir}/MAPS/MU10.MAP"
  install -Dm644 "${srcdir}/MU10.RMP"                 "${_destdir}/ROUTES/MU10.RMP"
  install -Dm644 "${srcdir}/MU11.MAP"                 "${_destdir}/MAPS/MU11.MAP"
  install -Dm644 "${srcdir}/MU11.RMP"                 "${_destdir}/ROUTES/MU11.RMP"
  install -Dm644 "${srcdir}/MU12.MAP"                 "${_destdir}/MAPS/MU12.MAP"
  install -Dm644 "${srcdir}/MU12.RMP"                 "${_destdir}/ROUTES/MU12.RMP"
  install -Dm644 "${srcdir}/MU13.MAP"                 "${_destdir}/MAPS/MU13.MAP"
  install -Dm644 "${srcdir}/MU14.MAP"                 "${_destdir}/MAPS/MU14.MAP"
  install -Dm644 "${srcdir}/MUSIC.COM"                "${_destdir}/SOUND/MUSIC.COM"
  install -Dm644 "${srcdir}/MVOL.DAT"                 "${_destdir}/SOUND/MVOL.DAT"
  install -Dm644 "${srcdir}/OBDATA.DAT"               "${_destdir}/GEODATA/OBDATA.DAT"
  install -Dm644 "${srcdir}/ORGANIC.PCK"              "${_destdir}/TERRAIN/ORGANIC.PCK"
  install -Dm644 "${srcdir}/ORGANIC.TAB"              "${_destdir}/TERRAIN/ORGANIC.TAB"
  install -Dm644 "${srcdir}/ORGANIC1.MCD"             "${_destdir}/TERRAIN/ORGANIC1.MCD"
  install -Dm644 "${srcdir}/ORGANIC1.PCK"             "${_destdir}/TERRAIN/ORGANIC1.PCK"
  install -Dm644 "${srcdir}/ORGANIC1.TAB"             "${_destdir}/TERRAIN/ORGANIC1.TAB"
  install -Dm644 "${srcdir}/ORGANIC2.MCD"             "${_destdir}/TERRAIN/ORGANIC2.MCD"
  install -Dm644 "${srcdir}/ORGANIC2.PCK"             "${_destdir}/TERRAIN/ORGANIC2.PCK"
  install -Dm644 "${srcdir}/ORGANIC2.TAB"             "${_destdir}/TERRAIN/ORGANIC2.TAB"
  install -Dm644 "${srcdir}/ORGANIC3.MCD"             "${_destdir}/TERRAIN/ORGANIC3.MCD"
  install -Dm644 "${srcdir}/ORGANIC3.PCK"             "${_destdir}/TERRAIN/ORGANIC3.PCK"
  install -Dm644 "${srcdir}/ORGANIC3.TAB"             "${_destdir}/TERRAIN/ORGANIC3.TAB"
  install -Dm644 "${srcdir}/OUT01.LBM"                "${_destdir}/FLOP_INT/OUT01.LBM"
  install -Dm644 "${srcdir}/OUT02.LBM"                "${_destdir}/FLOP_INT/OUT02.LBM"
  install -Dm644 "${srcdir}/OUT03.LBM"                "${_destdir}/FLOP_INT/OUT03.LBM"
  install -Dm644 "${srcdir}/OUT04.LBM"                "${_destdir}/FLOP_INT/OUT04.LBM"
  install -Dm644 "${srcdir}/OUT05.LBM"                "${_destdir}/FLOP_INT/OUT05.LBM"
  install -Dm644 "${srcdir}/OUT06.LBM"                "${_destdir}/FLOP_INT/OUT06.LBM"
  install -Dm644 "${srcdir}/OUT07.LBM"                "${_destdir}/FLOP_INT/OUT07.LBM"
  install -Dm644 "${srcdir}/OUT08.LBM"                "${_destdir}/FLOP_INT/OUT08.LBM"
  install -Dm644 "${srcdir}/OUT09.LBM"                "${_destdir}/FLOP_INT/OUT09.LBM"
  install -Dm644 "${srcdir}/OUT10.LBM"                "${_destdir}/FLOP_INT/OUT10.LBM"
  install -Dm644 "${srcdir}/OUT11.LBM"                "${_destdir}/FLOP_INT/OUT11.LBM"
  install -Dm644 "${srcdir}/OUT12.LBM"                "${_destdir}/FLOP_INT/OUT12.LBM"
  install -Dm644 "${srcdir}/OUTRO.IDX"                "${_destdir}/ANIMS/OUTRO.IDX"
  install -Dm644 "${srcdir}/OUTRO.VID"                "${_destdir}/ANIMS/OUTRO.VID"
  install -Dm644 "${srcdir}/PALETTES.DAT"             "${_destdir}/GEODATA/PALETTES.DAT"
  install -Dm644 "${srcdir}/PIPES.MCD"                "${_destdir}/TERRAIN/PIPES.MCD"
  install -Dm644 "${srcdir}/PIPES.PCK"                "${_destdir}/TERRAIN/PIPES.PCK"
  install -Dm644 "${srcdir}/PIPES.TAB"                "${_destdir}/TERRAIN/PIPES.TAB"
  install -Dm644 "${srcdir}/PIPES00.MAP"              "${_destdir}/MAPS/PIPES00.MAP"
  install -Dm644 "${srcdir}/PIPES00.RMP"              "${_destdir}/ROUTES/PIPES00.RMP"
  install -Dm644 "${srcdir}/PIPES01.MAP"              "${_destdir}/MAPS/PIPES01.MAP"
  install -Dm644 "${srcdir}/PIPES01.RMP"              "${_destdir}/ROUTES/PIPES01.RMP"
  install -Dm644 "${srcdir}/PIPES02.MAP"              "${_destdir}/MAPS/PIPES02.MAP"
  install -Dm644 "${srcdir}/PIPES02.RMP"              "${_destdir}/ROUTES/PIPES02.RMP"
  install -Dm644 "${srcdir}/PIPES03.MAP"              "${_destdir}/MAPS/PIPES03.MAP"
  install -Dm644 "${srcdir}/PIPES03.RMP"              "${_destdir}/ROUTES/PIPES03.RMP"
  install -Dm644 "${srcdir}/PIPES04.MAP"              "${_destdir}/MAPS/PIPES04.MAP"
  install -Dm644 "${srcdir}/PIPES04.RMP"              "${_destdir}/ROUTES/PIPES04.RMP"
  install -Dm644 "${srcdir}/PIPES05.MAP"              "${_destdir}/MAPS/PIPES05.MAP"
  install -Dm644 "${srcdir}/PIPES05.RMP"              "${_destdir}/ROUTES/PIPES05.RMP"
  install -Dm644 "${srcdir}/PIPES06.MAP"              "${_destdir}/MAPS/PIPES06.MAP"
  install -Dm644 "${srcdir}/PIPES06.RMP"              "${_destdir}/ROUTES/PIPES06.RMP"
  install -Dm644 "${srcdir}/PIPES07.MAP"              "${_destdir}/MAPS/PIPES07.MAP"
  install -Dm644 "${srcdir}/PIPES07.RMP"              "${_destdir}/ROUTES/PIPES07.RMP"
  install -Dm644 "${srcdir}/PIPES08.MAP"              "${_destdir}/MAPS/PIPES08.MAP"
  install -Dm644 "${srcdir}/PIPES08.RMP"              "${_destdir}/ROUTES/PIPES08.RMP"
  install -Dm644 "${srcdir}/PIPES09.MAP"              "${_destdir}/MAPS/PIPES09.MAP"
  install -Dm644 "${srcdir}/PIPES09.RMP"              "${_destdir}/ROUTES/PIPES09.RMP"
  install -Dm644 "${srcdir}/PIPES10.MAP"              "${_destdir}/MAPS/PIPES10.MAP"
  install -Dm644 "${srcdir}/PIPES10.RMP"              "${_destdir}/ROUTES/PIPES10.RMP"
  install -Dm644 "${srcdir}/PIPES11.MAP"              "${_destdir}/MAPS/PIPES11.MAP"
  install -Dm644 "${srcdir}/PIPES11.RMP"              "${_destdir}/ROUTES/PIPES11.RMP"
  install -Dm644 "${srcdir}/PLANE.MAP"                "${_destdir}/MAPS/PLANE.MAP"
  install -Dm644 "${srcdir}/PLANE.MCD"                "${_destdir}/TERRAIN/PLANE.MCD"
  install -Dm644 "${srcdir}/PLANE.PCK"                "${_destdir}/TERRAIN/PLANE.PCK"
  install -Dm644 "${srcdir}/PLANE.TAB"                "${_destdir}/TERRAIN/PLANE.TAB"
  install -Dm644 "${srcdir}/PLANE00.MAP"              "${_destdir}/MAPS/PLANE00.MAP"
  install -Dm644 "${srcdir}/PLANE00.RMP"              "${_destdir}/ROUTES/PLANE00.RMP"
  install -Dm644 "${srcdir}/PLANE01.MAP"              "${_destdir}/MAPS/PLANE01.MAP"
  install -Dm644 "${srcdir}/PLANE01.RMP"              "${_destdir}/ROUTES/PLANE01.RMP"
  install -Dm644 "${srcdir}/PLANE02.MAP"              "${_destdir}/MAPS/PLANE02.MAP"
  install -Dm644 "${srcdir}/PLANE02.RMP"              "${_destdir}/ROUTES/PLANE02.RMP"
  install -Dm644 "${srcdir}/PLANE03.MAP"              "${_destdir}/MAPS/PLANE03.MAP"
  install -Dm644 "${srcdir}/PLANE03.RMP"              "${_destdir}/ROUTES/PLANE03.RMP"
  install -Dm644 "${srcdir}/PLANE04.MAP"              "${_destdir}/MAPS/PLANE04.MAP"
  install -Dm644 "${srcdir}/PLANE04.RMP"              "${_destdir}/ROUTES/PLANE04.RMP"
  install -Dm644 "${srcdir}/PLANE05.MAP"              "${_destdir}/MAPS/PLANE05.MAP"
  install -Dm644 "${srcdir}/PLANE05.RMP"              "${_destdir}/ROUTES/PLANE05.RMP"
  install -Dm644 "${srcdir}/PLANE06.MAP"              "${_destdir}/MAPS/PLANE06.MAP"
  install -Dm644 "${srcdir}/PLANE06.RMP"              "${_destdir}/ROUTES/PLANE06.RMP"
  install -Dm644 "${srcdir}/PLANE07.MAP"              "${_destdir}/MAPS/PLANE07.MAP"
  install -Dm644 "${srcdir}/PLANE07.RMP"              "${_destdir}/ROUTES/PLANE07.RMP"
  install -Dm644 "${srcdir}/PLANE08.MAP"              "${_destdir}/MAPS/PLANE08.MAP"
  install -Dm644 "${srcdir}/PLANE08.RMP"              "${_destdir}/ROUTES/PLANE08.RMP"
  install -Dm644 "${srcdir}/PLANE09.MAP"              "${_destdir}/MAPS/PLANE09.MAP"
  install -Dm644 "${srcdir}/PLANE09.RMP"              "${_destdir}/ROUTES/PLANE09.RMP"
  install -Dm644 "${srcdir}/PLANE10.MAP"              "${_destdir}/MAPS/PLANE10.MAP"
  install -Dm644 "${srcdir}/PLANE10.RMP"              "${_destdir}/ROUTES/PLANE10.RMP"
  install -Dm644 "${srcdir}/PLANE11.MAP"              "${_destdir}/MAPS/PLANE11.MAP"
  install -Dm644 "${srcdir}/PLANE11.RMP"              "${_destdir}/ROUTES/PLANE11.RMP"
  install -Dm644 "${srcdir}/PLANE12.MAP"              "${_destdir}/MAPS/PLANE12.MAP"
  install -Dm644 "${srcdir}/PLANE12.RMP"              "${_destdir}/ROUTES/PLANE12.RMP"
  install -Dm644 "${srcdir}/PLANE13.MAP"              "${_destdir}/MAPS/PLANE13.MAP"
  install -Dm644 "${srcdir}/PLANE13.RMP"              "${_destdir}/ROUTES/PLANE13.RMP"
  install -Dm644 "${srcdir}/PLANE14.MAP"              "${_destdir}/MAPS/PLANE14.MAP"
  install -Dm644 "${srcdir}/PLANE14.RMP"              "${_destdir}/ROUTES/PLANE14.RMP"
  install -Dm644 "${srcdir}/PLANE15.MAP"              "${_destdir}/MAPS/PLANE15.MAP"
  install -Dm644 "${srcdir}/PLANE15.RMP"              "${_destdir}/ROUTES/PLANE15.RMP"
  install -Dm644 "${srcdir}/PLANE16.MAP"              "${_destdir}/MAPS/PLANE16.MAP"
  install -Dm644 "${srcdir}/PLANE16.RMP"              "${_destdir}/ROUTES/PLANE16.RMP"
  install -Dm644 "${srcdir}/PLANE17.MAP"              "${_destdir}/MAPS/PLANE17.MAP"
  install -Dm644 "${srcdir}/PLANE17.RMP"              "${_destdir}/ROUTES/PLANE17.RMP"
  install -Dm644 "${srcdir}/PLANE18.MAP"              "${_destdir}/MAPS/PLANE18.MAP"
  install -Dm644 "${srcdir}/PLANE18.RMP"              "${_destdir}/ROUTES/PLANE18.RMP"
  install -Dm644 "${srcdir}/PLANE19.MAP"              "${_destdir}/MAPS/PLANE19.MAP"
  install -Dm644 "${srcdir}/PLANE19.RMP"              "${_destdir}/ROUTES/PLANE19.RMP"
  install -Dm644 "${srcdir}/PLANE20.MAP"              "${_destdir}/MAPS/PLANE20.MAP"
  install -Dm644 "${srcdir}/PLANE20.RMP"              "${_destdir}/ROUTES/PLANE20.RMP"
  install -Dm644 "${srcdir}/PORT00.MAP"               "${_destdir}/MAPS/PORT00.MAP"
  install -Dm644 "${srcdir}/PORT00.RMP"               "${_destdir}/ROUTES/PORT00.RMP"
  install -Dm644 "${srcdir}/PORT01.MAP"               "${_destdir}/MAPS/PORT01.MAP"
  install -Dm644 "${srcdir}/PORT01.MCD"               "${_destdir}/TERRAIN/PORT01.MCD"
  install -Dm644 "${srcdir}/PORT01.PCK"               "${_destdir}/TERRAIN/PORT01.PCK"
  install -Dm644 "${srcdir}/PORT01.RMP"               "${_destdir}/ROUTES/PORT01.RMP"
  install -Dm644 "${srcdir}/PORT01.TAB"               "${_destdir}/TERRAIN/PORT01.TAB"
  install -Dm644 "${srcdir}/PORT02.MAP"               "${_destdir}/MAPS/PORT02.MAP"
  install -Dm644 "${srcdir}/PORT02.MCD"               "${_destdir}/TERRAIN/PORT02.MCD"
  install -Dm644 "${srcdir}/PORT02.PCK"               "${_destdir}/TERRAIN/PORT02.PCK"
  install -Dm644 "${srcdir}/PORT02.RMP"               "${_destdir}/ROUTES/PORT02.RMP"
  install -Dm644 "${srcdir}/PORT02.TAB"               "${_destdir}/TERRAIN/PORT02.TAB"
  install -Dm644 "${srcdir}/PORT03.MAP"               "${_destdir}/MAPS/PORT03.MAP"
  install -Dm644 "${srcdir}/PORT03.RMP"               "${_destdir}/ROUTES/PORT03.RMP"
  install -Dm644 "${srcdir}/PORT04.MAP"               "${_destdir}/MAPS/PORT04.MAP"
  install -Dm644 "${srcdir}/PORT04.RMP"               "${_destdir}/ROUTES/PORT04.RMP"
  install -Dm644 "${srcdir}/PORT05.MAP"               "${_destdir}/MAPS/PORT05.MAP"
  install -Dm644 "${srcdir}/PORT05.RMP"               "${_destdir}/ROUTES/PORT05.RMP"
  install -Dm644 "${srcdir}/PORT06.MAP"               "${_destdir}/MAPS/PORT06.MAP"
  install -Dm644 "${srcdir}/PORT06.RMP"               "${_destdir}/ROUTES/PORT06.RMP"
  install -Dm644 "${srcdir}/PORT07.MAP"               "${_destdir}/MAPS/PORT07.MAP"
  install -Dm644 "${srcdir}/PORT07.RMP"               "${_destdir}/ROUTES/PORT07.RMP"
  install -Dm644 "${srcdir}/PORT08.MAP"               "${_destdir}/MAPS/PORT08.MAP"
  install -Dm644 "${srcdir}/PORT08.RMP"               "${_destdir}/ROUTES/PORT08.RMP"
  install -Dm644 "${srcdir}/PORT09.MAP"               "${_destdir}/MAPS/PORT09.MAP"
  install -Dm644 "${srcdir}/PORT09.RMP"               "${_destdir}/ROUTES/PORT09.RMP"
  install -Dm644 "${srcdir}/PORT1.MCD"                "${_destdir}/TERRAIN/PORT1.MCD"
  install -Dm644 "${srcdir}/PORT1.PCK"                "${_destdir}/TERRAIN/PORT1.PCK"
  install -Dm644 "${srcdir}/PORT1.TAB"                "${_destdir}/TERRAIN/PORT1.TAB"
  install -Dm644 "${srcdir}/PORT10.MAP"               "${_destdir}/MAPS/PORT10.MAP"
  install -Dm644 "${srcdir}/PORT10.RMP"               "${_destdir}/ROUTES/PORT10.RMP"
  install -Dm644 "${srcdir}/PORT11.MAP"               "${_destdir}/MAPS/PORT11.MAP"
  install -Dm644 "${srcdir}/PORT11.RMP"               "${_destdir}/ROUTES/PORT11.RMP"
  install -Dm644 "${srcdir}/PORT12.MAP"               "${_destdir}/MAPS/PORT12.MAP"
  install -Dm644 "${srcdir}/PORT12.RMP"               "${_destdir}/ROUTES/PORT12.RMP"
  install -Dm644 "${srcdir}/PORT13.MAP"               "${_destdir}/MAPS/PORT13.MAP"
  install -Dm644 "${srcdir}/PORT13.RMP"               "${_destdir}/ROUTES/PORT13.RMP"
  install -Dm644 "${srcdir}/PORT14.MAP"               "${_destdir}/MAPS/PORT14.MAP"
  install -Dm644 "${srcdir}/PORT14.RMP"               "${_destdir}/ROUTES/PORT14.RMP"
  install -Dm644 "${srcdir}/PORT15.MAP"               "${_destdir}/MAPS/PORT15.MAP"
  install -Dm644 "${srcdir}/PORT15.RMP"               "${_destdir}/ROUTES/PORT15.RMP"
  install -Dm644 "${srcdir}/PORT16.MAP"               "${_destdir}/MAPS/PORT16.MAP"
  install -Dm644 "${srcdir}/PORT16.RMP"               "${_destdir}/ROUTES/PORT16.RMP"
  install -Dm644 "${srcdir}/PORT17.MAP"               "${_destdir}/MAPS/PORT17.MAP"
  install -Dm644 "${srcdir}/PORT17.RMP"               "${_destdir}/ROUTES/PORT17.RMP"
  install -Dm644 "${srcdir}/PORT18.MAP"               "${_destdir}/MAPS/PORT18.MAP"
  install -Dm644 "${srcdir}/PORT18.RMP"               "${_destdir}/ROUTES/PORT18.RMP"
  install -Dm644 "${srcdir}/PORT19.MAP"               "${_destdir}/MAPS/PORT19.MAP"
  install -Dm644 "${srcdir}/PORT19.RMP"               "${_destdir}/ROUTES/PORT19.RMP"
  install -Dm644 "${srcdir}/PORT20.MAP"               "${_destdir}/MAPS/PORT20.MAP"
  install -Dm644 "${srcdir}/PORT20.RMP"               "${_destdir}/ROUTES/PORT20.RMP"
  install -Dm644 "${srcdir}/PSYNOM.MCD"               "${_destdir}/TERRAIN/PSYNOM.MCD"
  install -Dm644 "${srcdir}/PSYNOM.PCK"               "${_destdir}/TERRAIN/PSYNOM.PCK"
  install -Dm644 "${srcdir}/PSYNOM.TAB"               "${_destdir}/TERRAIN/PSYNOM.TAB"
  install -Dm644 "${srcdir}/PYRAMID.MCD"              "${_destdir}/TERRAIN/PYRAMID.MCD"
  install -Dm644 "${srcdir}/PYRAMID.PCK"              "${_destdir}/TERRAIN/PYRAMID.PCK"
  install -Dm644 "${srcdir}/PYRAMID.TAB"              "${_destdir}/TERRAIN/PYRAMID.TAB"
  install -Dm644 "${srcdir}/RISE.IDX"                 "${_destdir}/ANIMS/RISE.IDX"
  install -Dm644 "${srcdir}/RISE.VID"                 "${_destdir}/ANIMS/RISE.VID"
  install -Dm644 "${srcdir}/ROCKS.MCD"                "${_destdir}/TERRAIN/ROCKS.MCD"
  install -Dm644 "${srcdir}/ROCKS.PCK"                "${_destdir}/TERRAIN/ROCKS.PCK"
  install -Dm644 "${srcdir}/ROCKS.TAB"                "${_destdir}/TERRAIN/ROCKS.TAB"
  install -Dm644 "${srcdir}/ROLAND.CAT"               "${_destdir}/SOUND/ROLAND.CAT"
  install -Dm644 "${srcdir}/ROUTES"                   "${_destdir}/MAPS/ROUTES"
  install -Dm644 "${srcdir}/SAMPLE.CAT"               "${_destdir}/SOUND/SAMPLE.CAT"
  install -Dm644 "${srcdir}/SAND.MCD"                 "${_destdir}/TERRAIN/SAND.MCD"
  install -Dm644 "${srcdir}/SAND.PCK"                 "${_destdir}/TERRAIN/SAND.PCK"
  install -Dm644 "${srcdir}/SAND.TAB"                 "${_destdir}/TERRAIN/SAND.TAB"
  install -Dm644 "${srcdir}/SCANBORD.BDY"             "${_destdir}/UFOGRAPH/SCANBORD.BDY"
  install -Dm644 "${srcdir}/ter-SCANG.DAT"            "${_destdir}/TERRAIN/SCANG.DAT"
  install -Dm644 "${srcdir}/geo-SCANG.DAT"            "${_destdir}/GEODATA/SCANG.DAT"
  install -Dm644 "${srcdir}/SEA.MCD"                  "${_destdir}/TERRAIN/SEA.MCD"
  install -Dm644 "${srcdir}/SEA.PCK"                  "${_destdir}/TERRAIN/SEA.PCK"
  install -Dm644 "${srcdir}/SEA.TAB"                  "${_destdir}/TERRAIN/SEA.TAB"
  install -Dm644 "${srcdir}/SEABED00.MAP"             "${_destdir}/MAPS/SEABED00.MAP"
  install -Dm644 "${srcdir}/SEABED00.RMP"             "${_destdir}/ROUTES/SEABED00.RMP"
  install -Dm644 "${srcdir}/SEABED01.MAP"             "${_destdir}/MAPS/SEABED01.MAP"
  install -Dm644 "${srcdir}/SEABED01.RMP"             "${_destdir}/ROUTES/SEABED01.RMP"
  install -Dm644 "${srcdir}/SEABED02.MAP"             "${_destdir}/MAPS/SEABED02.MAP"
  install -Dm644 "${srcdir}/SEABED02.RMP"             "${_destdir}/ROUTES/SEABED02.RMP"
  install -Dm644 "${srcdir}/SEABED03.MAP"             "${_destdir}/MAPS/SEABED03.MAP"
  install -Dm644 "${srcdir}/SEABED03.RMP"             "${_destdir}/ROUTES/SEABED03.RMP"
  install -Dm644 "${srcdir}/SEABED04.MAP"             "${_destdir}/MAPS/SEABED04.MAP"
  install -Dm644 "${srcdir}/SEABED04.RMP"             "${_destdir}/ROUTES/SEABED04.RMP"
  install -Dm644 "${srcdir}/SEABED05.MAP"             "${_destdir}/MAPS/SEABED05.MAP"
  install -Dm644 "${srcdir}/SEABED05.RMP"             "${_destdir}/ROUTES/SEABED05.RMP"
  install -Dm644 "${srcdir}/SEABED06.MAP"             "${_destdir}/MAPS/SEABED06.MAP"
  install -Dm644 "${srcdir}/SEABED06.RMP"             "${_destdir}/ROUTES/SEABED06.RMP"
  install -Dm644 "${srcdir}/SEABED07.MAP"             "${_destdir}/MAPS/SEABED07.MAP"
  install -Dm644 "${srcdir}/SEABED07.RMP"             "${_destdir}/ROUTES/SEABED07.RMP"
  install -Dm644 "${srcdir}/SEABED08.MAP"             "${_destdir}/MAPS/SEABED08.MAP"
  install -Dm644 "${srcdir}/SEABED08.RMP"             "${_destdir}/ROUTES/SEABED08.RMP"
  install -Dm644 "${srcdir}/SEABED09.MAP"             "${_destdir}/MAPS/SEABED09.MAP"
  install -Dm644 "${srcdir}/SEABED09.RMP"             "${_destdir}/ROUTES/SEABED09.RMP"
  install -Dm644 "${srcdir}/SEABED10.MAP"             "${_destdir}/MAPS/SEABED10.MAP"
  install -Dm644 "${srcdir}/SEABED10.RMP"             "${_destdir}/ROUTES/SEABED10.RMP"
  install -Dm644 "${srcdir}/SEABED11.MAP"             "${_destdir}/MAPS/SEABED11.MAP"
  install -Dm644 "${srcdir}/SEABED11.RMP"             "${_destdir}/ROUTES/SEABED11.RMP"
  install -Dm644 "${srcdir}/SEABED12.MAP"             "${_destdir}/MAPS/SEABED12.MAP"
  install -Dm644 "${srcdir}/SEABED12.RMP"             "${_destdir}/ROUTES/SEABED12.RMP"
  install -Dm644 "${srcdir}/SINE.DAT"                 "${_destdir}/GEODATA/SINE.DAT"
  install -Dm644 "${srcdir}/SMALLSET.DAT"             "${_destdir}/GEODATA/SMALLSET.DAT"
  install -Dm644 "${srcdir}/SMOKE.PCK"                "${_destdir}/UFOGRAPH/SMOKE.PCK"
  install -Dm644 "${srcdir}/SMOKE.TAB"                "${_destdir}/UFOGRAPH/SMOKE.TAB"
  install -Dm644 "${srcdir}/SNDEND.EXE"               "${_destdir}/SOUND/SNDEND.EXE"
  install -Dm644 "${srcdir}/SNDSTART.EXE"             "${_destdir}/SOUND/SNDSTART.EXE"
  install -Dm644 "${srcdir}/SOUND.CFG"                "${_destdir}/SOUND/SOUND.CFG"
  install -Dm644 "${srcdir}/SOUNDRV.COM"              "${_destdir}/SOUND/SOUNDRV.COM"
  install -Dm644 "${srcdir}/SPANISH.DAT"              "${_destdir}/GEODATA/SPANISH.DAT"
  install -Dm644 "${srcdir}/SPANISH2.DAT"             "${_destdir}/GEODATA/SPANISH2.DAT"
  install -Dm644 "${srcdir}/SPICONS.DAT"              "${_destdir}/UFOGRAPH/SPICONS.DAT"
  install -Dm644 "${srcdir}/TAC00.SCR"                "${_destdir}/UFOGRAPH/TAC00.SCR"
  install -Dm644 "${srcdir}/TAC01.BDY"                "${_destdir}/UFOGRAPH/TAC01.BDY"
  install -Dm644 "${srcdir}/TANK01.PCK"               "${_destdir}/UNITS/TANK01.PCK"
  install -Dm644 "${srcdir}/TANK01.TAB"               "${_destdir}/UNITS/TANK01.TAB"
  install -Dm644 "${srcdir}/TASOTHS.PCK"              "${_destdir}/UNITS/TASOTHS.PCK"
  install -Dm644 "${srcdir}/TASOTHS.TAB"              "${_destdir}/UNITS/TASOTHS.TAB"
  install -Dm644 "${srcdir}/TDXCOM_0.PCK"             "${_destdir}/UNITS/TDXCOM_0.PCK"
  install -Dm644 "${srcdir}/TDXCOM_0.TAB"             "${_destdir}/UNITS/TDXCOM_0.TAB"
  install -Dm644 "${srcdir}/TDXCOM_1.PCK"             "${_destdir}/UNITS/TDXCOM_1.PCK"
  install -Dm644 "${srcdir}/TDXCOM_1.TAB"             "${_destdir}/UNITS/TDXCOM_1.TAB"
  install -Dm644 "${srcdir}/TDXCOM_2.PCK"             "${_destdir}/UNITS/TDXCOM_2.PCK"
  install -Dm644 "${srcdir}/TDXCOM_2.TAB"             "${_destdir}/UNITS/TDXCOM_2.TAB"
  install -Dm644 "${srcdir}/TENTAC.PCK"               "${_destdir}/UNITS/TENTAC.PCK"
  install -Dm644 "${srcdir}/TENTAC.TAB"               "${_destdir}/UNITS/TENTAC.TAB"
  install -Dm644 "${srcdir}/TEXTURE.DAT"              "${_destdir}/GEOGRAPH/TEXTURE.DAT"
  install -Dm644 "${srcdir}/TRISCEN.PCK"              "${_destdir}/UNITS/TRISCEN.PCK"
  install -Dm644 "${srcdir}/TRISCEN.TAB"              "${_destdir}/UNITS/TRISCEN.TAB"
  install -Dm644 "${srcdir}/TRITON.MAP"               "${_destdir}/MAPS/TRITON.MAP"
  install -Dm644 "${srcdir}/TRITON.MCD"               "${_destdir}/TERRAIN/TRITON.MCD"
  install -Dm644 "${srcdir}/TRITON.PCK"               "${_destdir}/TERRAIN/TRITON.PCK"
  install -Dm644 "${srcdir}/TRITON.RMP"               "${_destdir}/ROUTES/TRITON.RMP"
  install -Dm644 "${srcdir}/TRITON.TAB"               "${_destdir}/TERRAIN/TRITON.TAB"
  install -Dm644 "${srcdir}/TWE01.LBM"                "${_destdir}/FLOP_INT/TWE01.LBM"
  install -Dm644 "${srcdir}/TWE02.LBM"                "${_destdir}/FLOP_INT/TWE02.LBM"
  install -Dm644 "${srcdir}/TWE03.LBM"                "${_destdir}/FLOP_INT/TWE03.LBM"
  install -Dm644 "${srcdir}/TWE04.LBM"                "${_destdir}/FLOP_INT/TWE04.LBM"
  install -Dm644 "${srcdir}/TWE05.LBM"                "${_destdir}/FLOP_INT/TWE05.LBM"
  install -Dm644 "${srcdir}/TWE06.LBM"                "${_destdir}/FLOP_INT/TWE06.LBM"
  install -Dm644 "${srcdir}/UEXT1.MCD"                "${_destdir}/TERRAIN/UEXT1.MCD"
  install -Dm644 "${srcdir}/UEXT1.PCK"                "${_destdir}/TERRAIN/UEXT1.PCK"
  install -Dm644 "${srcdir}/UEXT1.TAB"                "${_destdir}/TERRAIN/UEXT1.TAB"
  install -Dm644 "${srcdir}/UEXT2.MCD"                "${_destdir}/TERRAIN/UEXT2.MCD"
  install -Dm644 "${srcdir}/UEXT2.PCK"                "${_destdir}/TERRAIN/UEXT2.PCK"
  install -Dm644 "${srcdir}/UEXT2.TAB"                "${_destdir}/TERRAIN/UEXT2.TAB"
  install -Dm644 "${srcdir}/UEXT3.MCD"                "${_destdir}/TERRAIN/UEXT3.MCD"
  install -Dm644 "${srcdir}/UEXT3.PCK"                "${_destdir}/TERRAIN/UEXT3.PCK"
  install -Dm644 "${srcdir}/UEXT3.TAB"                "${_destdir}/TERRAIN/UEXT3.TAB"
  install -Dm644 "${srcdir}/UFO01.MAP"                "${_destdir}/MAPS/UFO01.MAP"
  install -Dm644 "${srcdir}/UFO01.RMP"                "${_destdir}/ROUTES/UFO01.RMP"
  install -Dm644 "${srcdir}/UFO02.MAP"                "${_destdir}/MAPS/UFO02.MAP"
  install -Dm644 "${srcdir}/UFO02.RMP"                "${_destdir}/ROUTES/UFO02.RMP"
  install -Dm644 "${srcdir}/UFO03.MAP"                "${_destdir}/MAPS/UFO03.MAP"
  install -Dm644 "${srcdir}/UFO03.RMP"                "${_destdir}/ROUTES/UFO03.RMP"
  install -Dm644 "${srcdir}/UFO04.MAP"                "${_destdir}/MAPS/UFO04.MAP"
  install -Dm644 "${srcdir}/UFO04.RMP"                "${_destdir}/ROUTES/UFO04.RMP"
  install -Dm644 "${srcdir}/UFO05.MAP"                "${_destdir}/MAPS/UFO05.MAP"
  install -Dm644 "${srcdir}/UFO05.RMP"                "${_destdir}/ROUTES/UFO05.RMP"
  install -Dm644 "${srcdir}/UFO06.MAP"                "${_destdir}/MAPS/UFO06.MAP"
  install -Dm644 "${srcdir}/UFO06.RMP"                "${_destdir}/ROUTES/UFO06.RMP"
  install -Dm644 "${srcdir}/UFO07.MAP"                "${_destdir}/MAPS/UFO07.MAP"
  install -Dm644 "${srcdir}/UFO07.RMP"                "${_destdir}/ROUTES/UFO07.RMP"
  install -Dm644 "${srcdir}/UFO08.MAP"                "${_destdir}/MAPS/UFO08.MAP"
  install -Dm644 "${srcdir}/UFO08.RMP"                "${_destdir}/ROUTES/UFO08.RMP"
  install -Dm644 "${srcdir}/UFOBITS.MCD"              "${_destdir}/TERRAIN/UFOBITS.MCD"
  install -Dm644 "${srcdir}/UFOBITS.PCK"              "${_destdir}/TERRAIN/UFOBITS.PCK"
  install -Dm644 "${srcdir}/UFOBITS.TAB"              "${_destdir}/TERRAIN/UFOBITS.TAB"
  install -Dm644 "${srcdir}/UINT.PCK"                 "${_destdir}/TERRAIN/UINT.PCK"
  install -Dm644 "${srcdir}/UINT.TAB"                 "${_destdir}/TERRAIN/UINT.TAB"
  install -Dm644 "${srcdir}/UINT1.MCD"                "${_destdir}/TERRAIN/UINT1.MCD"
  install -Dm644 "${srcdir}/UINT1.PCK"                "${_destdir}/TERRAIN/UINT1.PCK"
  install -Dm644 "${srcdir}/UINT1.TAB"                "${_destdir}/TERRAIN/UINT1.TAB"
  install -Dm644 "${srcdir}/UINT2.MCD"                "${_destdir}/TERRAIN/UINT2.MCD"
  install -Dm644 "${srcdir}/UINT2.PCK"                "${_destdir}/TERRAIN/UINT2.PCK"
  install -Dm644 "${srcdir}/UINT2.TAB"                "${_destdir}/TERRAIN/UINT2.TAB"
  install -Dm644 "${srcdir}/UINT3.MCD"                "${_destdir}/TERRAIN/UINT3.MCD"
  install -Dm644 "${srcdir}/UINT3.PCK"                "${_destdir}/TERRAIN/UINT3.PCK"
  install -Dm644 "${srcdir}/UINT3.TAB"                "${_destdir}/TERRAIN/UINT3.TAB"
  install -Dm644 "${srcdir}/UNIBORD.PCK"              "${_destdir}/UFOGRAPH/UNIBORD.PCK"
  install -Dm644 "${srcdir}/UP001.BDY"                "${_destdir}/GEOGRAPH/UP001.BDY"
  install -Dm644 "${srcdir}/UP002.BDY"                "${_destdir}/GEOGRAPH/UP002.BDY"
  install -Dm644 "${srcdir}/UP003.BDY"                "${_destdir}/GEOGRAPH/UP003.BDY"
  install -Dm644 "${srcdir}/UP004.BDY"                "${_destdir}/GEOGRAPH/UP004.BDY"
  install -Dm644 "${srcdir}/UP005.BDY"                "${_destdir}/GEOGRAPH/UP005.BDY"
  install -Dm644 "${srcdir}/UP006.BDY"                "${_destdir}/GEOGRAPH/UP006.BDY"
  install -Dm644 "${srcdir}/UP007.BDY"                "${_destdir}/GEOGRAPH/UP007.BDY"
  install -Dm644 "${srcdir}/UP008.BDY"                "${_destdir}/GEOGRAPH/UP008.BDY"
  install -Dm644 "${srcdir}/UP009.BDY"                "${_destdir}/GEOGRAPH/UP009.BDY"
  install -Dm644 "${srcdir}/UP010.BDY"                "${_destdir}/GEOGRAPH/UP010.BDY"
  install -Dm644 "${srcdir}/UP011.BDY"                "${_destdir}/GEOGRAPH/UP011.BDY"
  install -Dm644 "${srcdir}/UP012.BDY"                "${_destdir}/GEOGRAPH/UP012.BDY"
  install -Dm644 "${srcdir}/UP013.BDY"                "${_destdir}/GEOGRAPH/UP013.BDY"
  install -Dm644 "${srcdir}/UP014.BDY"                "${_destdir}/GEOGRAPH/UP014.BDY"
  install -Dm644 "${srcdir}/UP015.BDY"                "${_destdir}/GEOGRAPH/UP015.BDY"
  install -Dm644 "${srcdir}/UP016.BDY"                "${_destdir}/GEOGRAPH/UP016.BDY"
  install -Dm644 "${srcdir}/UP017.BDY"                "${_destdir}/GEOGRAPH/UP017.BDY"
  install -Dm644 "${srcdir}/UP018.BDY"                "${_destdir}/GEOGRAPH/UP018.BDY"
  install -Dm644 "${srcdir}/UP019.BDY"                "${_destdir}/GEOGRAPH/UP019.BDY"
  install -Dm644 "${srcdir}/UP020.BDY"                "${_destdir}/GEOGRAPH/UP020.BDY"
  install -Dm644 "${srcdir}/UP021.BDY"                "${_destdir}/GEOGRAPH/UP021.BDY"
  install -Dm644 "${srcdir}/UP022.BDY"                "${_destdir}/GEOGRAPH/UP022.BDY"
  install -Dm644 "${srcdir}/UP023.BDY"                "${_destdir}/GEOGRAPH/UP023.BDY"
  install -Dm644 "${srcdir}/UP024.BDY"                "${_destdir}/GEOGRAPH/UP024.BDY"
  install -Dm644 "${srcdir}/UP025.BDY"                "${_destdir}/GEOGRAPH/UP025.BDY"
  install -Dm644 "${srcdir}/UP026.BDY"                "${_destdir}/GEOGRAPH/UP026.BDY"
  install -Dm644 "${srcdir}/UP027.BDY"                "${_destdir}/GEOGRAPH/UP027.BDY"
  install -Dm644 "${srcdir}/UP028.BDY"                "${_destdir}/GEOGRAPH/UP028.BDY"
  install -Dm644 "${srcdir}/UP029.BDY"                "${_destdir}/GEOGRAPH/UP029.BDY"
  install -Dm644 "${srcdir}/UP030.BDY"                "${_destdir}/GEOGRAPH/UP030.BDY"
  install -Dm644 "${srcdir}/UP031.BDY"                "${_destdir}/GEOGRAPH/UP031.BDY"
  install -Dm644 "${srcdir}/UP032.BDY"                "${_destdir}/GEOGRAPH/UP032.BDY"
  install -Dm644 "${srcdir}/UP033.BDY"                "${_destdir}/GEOGRAPH/UP033.BDY"
  install -Dm644 "${srcdir}/UP034.BDY"                "${_destdir}/GEOGRAPH/UP034.BDY"
  install -Dm644 "${srcdir}/UP035.BDY"                "${_destdir}/GEOGRAPH/UP035.BDY"
  install -Dm644 "${srcdir}/UP036.BDY"                "${_destdir}/GEOGRAPH/UP036.BDY"
  install -Dm644 "${srcdir}/UP037.BDY"                "${_destdir}/GEOGRAPH/UP037.BDY"
  install -Dm644 "${srcdir}/UP038.BDY"                "${_destdir}/GEOGRAPH/UP038.BDY"
  install -Dm644 "${srcdir}/UP039.BDY"                "${_destdir}/GEOGRAPH/UP039.BDY"
  install -Dm644 "${srcdir}/UP040.BDY"                "${_destdir}/GEOGRAPH/UP040.BDY"
  install -Dm644 "${srcdir}/UP041.BDY"                "${_destdir}/GEOGRAPH/UP041.BDY"
  install -Dm644 "${srcdir}/UP042.BDY"                "${_destdir}/GEOGRAPH/UP042.BDY"
  install -Dm644 "${srcdir}/UP043.BDY"                "${_destdir}/GEOGRAPH/UP043.BDY"
  install -Dm644 "${srcdir}/UP044.BDY"                "${_destdir}/GEOGRAPH/UP044.BDY"
  install -Dm644 "${srcdir}/UP045.BDY"                "${_destdir}/GEOGRAPH/UP045.BDY"
  install -Dm644 "${srcdir}/UP046.BDY"                "${_destdir}/GEOGRAPH/UP046.BDY"
  install -Dm644 "${srcdir}/UP047.BDY"                "${_destdir}/GEOGRAPH/UP047.BDY"
  install -Dm644 "${srcdir}/UP048.BDY"                "${_destdir}/GEOGRAPH/UP048.BDY"
  install -Dm644 "${srcdir}/UP049.BDY"                "${_destdir}/GEOGRAPH/UP049.BDY"
  install -Dm644 "${srcdir}/UP050.BDY"                "${_destdir}/GEOGRAPH/UP050.BDY"
  install -Dm644 "${srcdir}/UP051.BDY"                "${_destdir}/GEOGRAPH/UP051.BDY"
  install -Dm644 "${srcdir}/UP052.BDY"                "${_destdir}/GEOGRAPH/UP052.BDY"
  install -Dm644 "${srcdir}/UP053.BDY"                "${_destdir}/GEOGRAPH/UP053.BDY"
  install -Dm644 "${srcdir}/UP054.BDY"                "${_destdir}/GEOGRAPH/UP054.BDY"
  install -Dm644 "${srcdir}/UP055.BDY"                "${_destdir}/GEOGRAPH/UP055.BDY"
  install -Dm644 "${srcdir}/UP056.BDY"                "${_destdir}/GEOGRAPH/UP056.BDY"
  install -Dm644 "${srcdir}/UP057.BDY"                "${_destdir}/GEOGRAPH/UP057.BDY"
  install -Dm644 "${srcdir}/UP058.BDY"                "${_destdir}/GEOGRAPH/UP058.BDY"
  install -Dm644 "${srcdir}/UP059.BDY"                "${_destdir}/GEOGRAPH/UP059.BDY"
  install -Dm644 "${srcdir}/UP060.BDY"                "${_destdir}/GEOGRAPH/UP060.BDY"
  install -Dm644 "${srcdir}/UP061.BDY"                "${_destdir}/GEOGRAPH/UP061.BDY"
  install -Dm644 "${srcdir}/UP062.BDY"                "${_destdir}/GEOGRAPH/UP062.BDY"
  install -Dm644 "${srcdir}/UP063.BDY"                "${_destdir}/GEOGRAPH/UP063.BDY"
  install -Dm644 "${srcdir}/UP064.BDY"                "${_destdir}/GEOGRAPH/UP064.BDY"
  install -Dm644 "${srcdir}/UP065.BDY"                "${_destdir}/GEOGRAPH/UP065.BDY"
  install -Dm644 "${srcdir}/UP066.BDY"                "${_destdir}/GEOGRAPH/UP066.BDY"
  install -Dm644 "${srcdir}/UP067.BDY"                "${_destdir}/GEOGRAPH/UP067.BDY"
  install -Dm644 "${srcdir}/UP068.BDY"                "${_destdir}/GEOGRAPH/UP068.BDY"
  install -Dm644 "${srcdir}/UP069.BDY"                "${_destdir}/GEOGRAPH/UP069.BDY"
  install -Dm644 "${srcdir}/UP070.BDY"                "${_destdir}/GEOGRAPH/UP070.BDY"
  install -Dm644 "${srcdir}/UP071.BDY"                "${_destdir}/GEOGRAPH/UP071.BDY"
  install -Dm644 "${srcdir}/UP072.BDY"                "${_destdir}/GEOGRAPH/UP072.BDY"
  install -Dm644 "${srcdir}/UP073.BDY"                "${_destdir}/GEOGRAPH/UP073.BDY"
  install -Dm644 "${srcdir}/UP074.BDY"                "${_destdir}/GEOGRAPH/UP074.BDY"
  install -Dm644 "${srcdir}/UP075.BDY"                "${_destdir}/GEOGRAPH/UP075.BDY"
  install -Dm644 "${srcdir}/UP076.BDY"                "${_destdir}/GEOGRAPH/UP076.BDY"
  install -Dm644 "${srcdir}/UP077.BDY"                "${_destdir}/GEOGRAPH/UP077.BDY"
  install -Dm644 "${srcdir}/UP078.BDY"                "${_destdir}/GEOGRAPH/UP078.BDY"
  install -Dm644 "${srcdir}/UP079.BDY"                "${_destdir}/GEOGRAPH/UP079.BDY"
  install -Dm644 "${srcdir}/UP080.BDY"                "${_destdir}/GEOGRAPH/UP080.BDY"
  install -Dm644 "${srcdir}/UP081.BDY"                "${_destdir}/GEOGRAPH/UP081.BDY"
  install -Dm644 "${srcdir}/UP082.BDY"                "${_destdir}/GEOGRAPH/UP082.BDY"
  install -Dm644 "${srcdir}/UP083.BDY"                "${_destdir}/GEOGRAPH/UP083.BDY"
  install -Dm644 "${srcdir}/UP084.BDY"                "${_destdir}/GEOGRAPH/UP084.BDY"
  install -Dm644 "${srcdir}/UP085.BDY"                "${_destdir}/GEOGRAPH/UP085.BDY"
  install -Dm644 "${srcdir}/UP086.BDY"                "${_destdir}/GEOGRAPH/UP086.BDY"
  install -Dm644 "${srcdir}/UP087.BDY"                "${_destdir}/GEOGRAPH/UP087.BDY"
  install -Dm644 "${srcdir}/UP088.BDY"                "${_destdir}/GEOGRAPH/UP088.BDY"
  install -Dm644 "${srcdir}/UP089.BDY"                "${_destdir}/GEOGRAPH/UP089.BDY"
  install -Dm644 "${srcdir}/UP090.BDY"                "${_destdir}/GEOGRAPH/UP090.BDY"
  install -Dm644 "${srcdir}/UP091.BDY"                "${_destdir}/GEOGRAPH/UP091.BDY"
  install -Dm644 "${srcdir}/UP092.BDY"                "${_destdir}/GEOGRAPH/UP092.BDY"
  install -Dm644 "${srcdir}/UP093.BDY"                "${_destdir}/GEOGRAPH/UP093.BDY"
  install -Dm644 "${srcdir}/UP094.BDY"                "${_destdir}/GEOGRAPH/UP094.BDY"
  install -Dm644 "${srcdir}/UP095.BDY"                "${_destdir}/GEOGRAPH/UP095.BDY"
  install -Dm644 "${srcdir}/UP096.BDY"                "${_destdir}/GEOGRAPH/UP096.BDY"
  install -Dm644 "${srcdir}/UP097.BDY"                "${_destdir}/GEOGRAPH/UP097.BDY"
  install -Dm644 "${srcdir}/UP098.BDY"                "${_destdir}/GEOGRAPH/UP098.BDY"
  install -Dm644 "${srcdir}/UP099.BDY"                "${_destdir}/GEOGRAPH/UP099.BDY"
  install -Dm644 "${srcdir}/UP100.BDY"                "${_destdir}/GEOGRAPH/UP100.BDY"
  install -Dm644 "${srcdir}/UP101.BDY"                "${_destdir}/GEOGRAPH/UP101.BDY"
  install -Dm644 "${srcdir}/UP102.BDY"                "${_destdir}/GEOGRAPH/UP102.BDY"
  install -Dm644 "${srcdir}/UP103.BDY"                "${_destdir}/GEOGRAPH/UP103.BDY"
  install -Dm644 "${srcdir}/UP104.BDY"                "${_destdir}/GEOGRAPH/UP104.BDY"
  install -Dm644 "${srcdir}/UP105.BDY"                "${_destdir}/GEOGRAPH/UP105.BDY"
  install -Dm644 "${srcdir}/UP106.BDY"                "${_destdir}/GEOGRAPH/UP106.BDY"
  install -Dm644 "${srcdir}/UP107.BDY"                "${_destdir}/GEOGRAPH/UP107.BDY"
  install -Dm644 "${srcdir}/UP108.BDY"                "${_destdir}/GEOGRAPH/UP108.BDY"
  install -Dm644 "${srcdir}/UP109.BDY"                "${_destdir}/GEOGRAPH/UP109.BDY"
  install -Dm644 "${srcdir}/UP110.BDY"                "${_destdir}/GEOGRAPH/UP110.BDY"
  install -Dm644 "${srcdir}/UP111.BDY"                "${_destdir}/GEOGRAPH/UP111.BDY"
  install -Dm644 "${srcdir}/UP112.BDY"                "${_destdir}/GEOGRAPH/UP112.BDY"
  install -Dm644 "${srcdir}/UP_BORD2.SCR"             "${_destdir}/GEOGRAPH/UP_BORD2.SCR"
  install -Dm644 "${srcdir}/URBITS.MCD"               "${_destdir}/TERRAIN/URBITS.MCD"
  install -Dm644 "${srcdir}/URBITS.PCK"               "${_destdir}/TERRAIN/URBITS.PCK"
  install -Dm644 "${srcdir}/URBITS.TAB"               "${_destdir}/TERRAIN/URBITS.TAB"
  install -Dm644 "${srcdir}/VECTOR.COM"               "${_destdir}/SOUND/VECTOR.COM"
  install -Dm644 "${srcdir}/VOLC.MCD"                 "${_destdir}/TERRAIN/VOLC.MCD"
  install -Dm644 "${srcdir}/VOLC.PCK"                 "${_destdir}/TERRAIN/VOLC.PCK"
  install -Dm644 "${srcdir}/VOLC.TAB"                 "${_destdir}/TERRAIN/VOLC.TAB"
  install -Dm644 "${srcdir}/VOLC00.MAP"               "${_destdir}/MAPS/VOLC00.MAP"
  install -Dm644 "${srcdir}/VOLC00.RMP"               "${_destdir}/ROUTES/VOLC00.RMP"
  install -Dm644 "${srcdir}/VOLC01.MAP"               "${_destdir}/MAPS/VOLC01.MAP"
  install -Dm644 "${srcdir}/VOLC01.RMP"               "${_destdir}/ROUTES/VOLC01.RMP"
  install -Dm644 "${srcdir}/VOLC02.MAP"               "${_destdir}/MAPS/VOLC02.MAP"
  install -Dm644 "${srcdir}/VOLC02.RMP"               "${_destdir}/ROUTES/VOLC02.RMP"
  install -Dm644 "${srcdir}/VOLC03.MAP"               "${_destdir}/MAPS/VOLC03.MAP"
  install -Dm644 "${srcdir}/VOLC03.RMP"               "${_destdir}/ROUTES/VOLC03.RMP"
  install -Dm644 "${srcdir}/VOLC04.MAP"               "${_destdir}/MAPS/VOLC04.MAP"
  install -Dm644 "${srcdir}/VOLC04.RMP"               "${_destdir}/ROUTES/VOLC04.RMP"
  install -Dm644 "${srcdir}/VOLC05.MAP"               "${_destdir}/MAPS/VOLC05.MAP"
  install -Dm644 "${srcdir}/VOLC05.RMP"               "${_destdir}/ROUTES/VOLC05.RMP"
  install -Dm644 "${srcdir}/VOLC06.MAP"               "${_destdir}/MAPS/VOLC06.MAP"
  install -Dm644 "${srcdir}/VOLC06.RMP"               "${_destdir}/ROUTES/VOLC06.RMP"
  install -Dm644 "${srcdir}/VOLC07.MAP"               "${_destdir}/MAPS/VOLC07.MAP"
  install -Dm644 "${srcdir}/VOLC07.RMP"               "${_destdir}/ROUTES/VOLC07.RMP"
  install -Dm644 "${srcdir}/VOLC08.MAP"               "${_destdir}/MAPS/VOLC08.MAP"
  install -Dm644 "${srcdir}/VOLC08.RMP"               "${_destdir}/ROUTES/VOLC08.RMP"
  install -Dm644 "${srcdir}/VOLC09.MAP"               "${_destdir}/MAPS/VOLC09.MAP"
  install -Dm644 "${srcdir}/VOLC09.RMP"               "${_destdir}/ROUTES/VOLC09.RMP"
  install -Dm644 "${srcdir}/VOLC10.MAP"               "${_destdir}/MAPS/VOLC10.MAP"
  install -Dm644 "${srcdir}/VOLC10.RMP"               "${_destdir}/ROUTES/VOLC10.RMP"
  install -Dm644 "${srcdir}/VOLC11.MAP"               "${_destdir}/MAPS/VOLC11.MAP"
  install -Dm644 "${srcdir}/VOLC11.RMP"               "${_destdir}/ROUTES/VOLC11.RMP"
  install -Dm644 "${srcdir}/WEEDS.MCD"                "${_destdir}/TERRAIN/WEEDS.MCD"
  install -Dm644 "${srcdir}/WEEDS.PCK"                "${_destdir}/TERRAIN/WEEDS.PCK"
  install -Dm644 "${srcdir}/WEEDS.TAB"                "${_destdir}/TERRAIN/WEEDS.TAB"
  install -Dm644 "${srcdir}/WORLD.DAT"                "${_destdir}/GEODATA/WORLD.DAT"
  install -Dm644 "${srcdir}/X1.PCK"                   "${_destdir}/UFOGRAPH/X1.PCK"
  install -Dm644 "${srcdir}/X1.TAB"                   "${_destdir}/UFOGRAPH/X1.TAB"
  install -Dm644 "${srcdir}/XARQUID.PCK"              "${_destdir}/UNITS/XARQUID.PCK"
  install -Dm644 "${srcdir}/XARQUID.TAB"              "${_destdir}/UNITS/XARQUID.TAB"
  install -Dm644 "${srcdir}/XBASE1.MCD"               "${_destdir}/TERRAIN/XBASE1.MCD"
  install -Dm644 "${srcdir}/XBASE2.MCD"               "${_destdir}/TERRAIN/XBASE2.MCD"
  install -Dm644 "${srcdir}/XBASES00.MAP"             "${_destdir}/MAPS/XBASES00.MAP"
  install -Dm644 "${srcdir}/XBASES00.RMP"             "${_destdir}/ROUTES/XBASES00.RMP"
  install -Dm644 "${srcdir}/XBASES01.MAP"             "${_destdir}/MAPS/XBASES01.MAP"
  install -Dm644 "${srcdir}/XBASES01.MCD"             "${_destdir}/TERRAIN/XBASES01.MCD"
  install -Dm644 "${srcdir}/XBASES01.PCK"             "${_destdir}/TERRAIN/XBASES01.PCK"
  install -Dm644 "${srcdir}/XBASES01.RMP"             "${_destdir}/ROUTES/XBASES01.RMP"
  install -Dm644 "${srcdir}/XBASES01.TAB"             "${_destdir}/TERRAIN/XBASES01.TAB"
  install -Dm644 "${srcdir}/XBASES02.MAP"             "${_destdir}/MAPS/XBASES02.MAP"
  install -Dm644 "${srcdir}/XBASES02.MCD"             "${_destdir}/TERRAIN/XBASES02.MCD"
  install -Dm644 "${srcdir}/XBASES02.PCK"             "${_destdir}/TERRAIN/XBASES02.PCK"
  install -Dm644 "${srcdir}/XBASES02.RMP"             "${_destdir}/ROUTES/XBASES02.RMP"
  install -Dm644 "${srcdir}/XBASES02.TAB"             "${_destdir}/TERRAIN/XBASES02.TAB"
  install -Dm644 "${srcdir}/XBASES03.MAP"             "${_destdir}/MAPS/XBASES03.MAP"
  install -Dm644 "${srcdir}/XBASES03.MCD"             "${_destdir}/TERRAIN/XBASES03.MCD"
  install -Dm644 "${srcdir}/XBASES03.PCK"             "${_destdir}/TERRAIN/XBASES03.PCK"
  install -Dm644 "${srcdir}/XBASES03.RMP"             "${_destdir}/ROUTES/XBASES03.RMP"
  install -Dm644 "${srcdir}/XBASES03.TAB"             "${_destdir}/TERRAIN/XBASES03.TAB"
  install -Dm644 "${srcdir}/XBASES04.MAP"             "${_destdir}/MAPS/XBASES04.MAP"
  install -Dm644 "${srcdir}/XBASES04.MCD"             "${_destdir}/TERRAIN/XBASES04.MCD"
  install -Dm644 "${srcdir}/XBASES04.PCK"             "${_destdir}/TERRAIN/XBASES04.PCK"
  install -Dm644 "${srcdir}/XBASES04.RMP"             "${_destdir}/ROUTES/XBASES04.RMP"
  install -Dm644 "${srcdir}/XBASES04.TAB"             "${_destdir}/TERRAIN/XBASES04.TAB"
  install -Dm644 "${srcdir}/XBASES05.MAP"             "${_destdir}/MAPS/XBASES05.MAP"
  install -Dm644 "${srcdir}/XBASES05.MCD"             "${_destdir}/TERRAIN/XBASES05.MCD"
  install -Dm644 "${srcdir}/XBASES05.PCK"             "${_destdir}/TERRAIN/XBASES05.PCK"
  install -Dm644 "${srcdir}/XBASES05.RMP"             "${_destdir}/ROUTES/XBASES05.RMP"
  install -Dm644 "${srcdir}/XBASES05.TAB"             "${_destdir}/TERRAIN/XBASES05.TAB"
  install -Dm644 "${srcdir}/XBASES06.MAP"             "${_destdir}/MAPS/XBASES06.MAP"
  install -Dm644 "${srcdir}/XBASES06.RMP"             "${_destdir}/ROUTES/XBASES06.RMP"
  install -Dm644 "${srcdir}/XBASES07.MAP"             "${_destdir}/MAPS/XBASES07.MAP"
  install -Dm644 "${srcdir}/XBASES07.RMP"             "${_destdir}/ROUTES/XBASES07.RMP"
  install -Dm644 "${srcdir}/XBASES08.MAP"             "${_destdir}/MAPS/XBASES08.MAP"
  install -Dm644 "${srcdir}/XBASES08.RMP"             "${_destdir}/ROUTES/XBASES08.RMP"
  install -Dm644 "${srcdir}/XBASES09.MAP"             "${_destdir}/MAPS/XBASES09.MAP"
  install -Dm644 "${srcdir}/XBASES09.RMP"             "${_destdir}/ROUTES/XBASES09.RMP"
  install -Dm644 "${srcdir}/XBASES10.MAP"             "${_destdir}/MAPS/XBASES10.MAP"
  install -Dm644 "${srcdir}/XBASES10.RMP"             "${_destdir}/ROUTES/XBASES10.RMP"
  install -Dm644 "${srcdir}/XBASES11.MAP"             "${_destdir}/MAPS/XBASES11.MAP"
  install -Dm644 "${srcdir}/XBASES11.RMP"             "${_destdir}/ROUTES/XBASES11.RMP"
  install -Dm644 "${srcdir}/XBASES12.MAP"             "${_destdir}/MAPS/XBASES12.MAP"
  install -Dm644 "${srcdir}/XBASES12.RMP"             "${_destdir}/ROUTES/XBASES12.RMP"
  install -Dm644 "${srcdir}/XBASES13.MAP"             "${_destdir}/MAPS/XBASES13.MAP"
  install -Dm644 "${srcdir}/XBASES13.RMP"             "${_destdir}/ROUTES/XBASES13.RMP"
  install -Dm644 "${srcdir}/XBASES14.MAP"             "${_destdir}/MAPS/XBASES14.MAP"
  install -Dm644 "${srcdir}/XBASES14.RMP"             "${_destdir}/ROUTES/XBASES14.RMP"
  install -Dm644 "${srcdir}/XBASES15.MAP"             "${_destdir}/MAPS/XBASES15.MAP"
  install -Dm644 "${srcdir}/XBASES15.RMP"             "${_destdir}/ROUTES/XBASES15.RMP"
  install -Dm644 "${srcdir}/XBASES16.MAP"             "${_destdir}/MAPS/XBASES16.MAP"
  install -Dm644 "${srcdir}/XBASES16.RMP"             "${_destdir}/ROUTES/XBASES16.RMP"
  install -Dm644 "${srcdir}/XBASES17.MAP"             "${_destdir}/MAPS/XBASES17.MAP"
  install -Dm644 "${srcdir}/XBASES17.RMP"             "${_destdir}/ROUTES/XBASES17.RMP"
  install -Dm644 "${srcdir}/XBASES18.MAP"             "${_destdir}/MAPS/XBASES18.MAP"
  install -Dm644 "${srcdir}/XBASES18.RMP"             "${_destdir}/ROUTES/XBASES18.RMP"
  install -Dm644 "${srcdir}/XBASES19.MAP"             "${_destdir}/MAPS/XBASES19.MAP"
  install -Dm644 "${srcdir}/XBASES19.RMP"             "${_destdir}/ROUTES/XBASES19.RMP"
  install -Dm644 "${srcdir}/XBASES20.MAP"             "${_destdir}/MAPS/XBASES20.MAP"
  install -Dm644 "${srcdir}/XBASES20.RMP"             "${_destdir}/ROUTES/XBASES20.RMP"
  install -Dm644 "${srcdir}/XBITS.MCD"                "${_destdir}/TERRAIN/XBITS.MCD"
  install -Dm644 "${srcdir}/XBITS.PCK"                "${_destdir}/TERRAIN/XBITS.PCK"
  install -Dm644 "${srcdir}/XBITS.TAB"                "${_destdir}/TERRAIN/XBITS.TAB"
  install -Dm644 "${srcdir}/ZOMBIE.PCK"               "${_destdir}/UNITS/ZOMBIE.PCK"
  install -Dm644 "${srcdir}/ZOMBIE.TAB"               "${_destdir}/UNITS/ZOMBIE.TAB"

  # extract patch
  bsdtar -C "${_destdir}" -xf "${srcdir}/universal-patch-tftd.zip"

  # fix perms (borked by patch extraction)
  find "${_destdir}" -type d -exec chmod 755 {} \;
  find "${_destdir}" -type f -exec chmod 644 {} \;
}
