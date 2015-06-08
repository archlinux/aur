# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

# NOTE: You must own X-COM: UFO Defence (aka UFO: Enemy Unknown) on steam
# Download the files using steamcmd (available on the AUR):
#   1. Start steamcmd
#   2. At the Steam> prompt, run:
#                   @sSteamCmdForcePlatformType "windows"
#   3. (optionally) Set the preferred download location with
#                   force_install_dir /path/to/dir
#   4. Log in to your account using:
#                   login your-steam-username
#   5. Download the game files by running:
#                   app_update 7760
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

# The placement of data files has changed in the git version of openxcom
# so set the following variable to "git" if you are using openxcom-git
_openxcom_ver=1.0
#_openxcom_ver=git

pkgname=openxcom-data-steam
pkgver=2
pkgrel=1
pkgdesc="X-COM data files (from steam) for openxcom"
arch=(any)
url="http://steamcommunity.com/app/7760"
license=('custom')
depends=('openxcom')
provides=('openxcom-data')
DLAGENTS+=('localfile::/usr/bin/echo "Could not find %u. Use the copier.sh script to copy them into this directory"')
source=(
  "filelist"
  "copier.sh"
  "localfile://ADLIB.CAT"
  "localfile://AINTRO.CAT"
  "localfile://AVENGER.MAP"
  "localfile://AVENGER.MCD"
  "localfile://AVENGER.PCK"
  "localfile://AVENGER.RMP"
  "localfile://AVENGER.TAB"
  "localfile://BACK01.SCR"
  "localfile://BACK02.SCR"
  "localfile://BACK03.SCR"
  "localfile://BACK04.SCR"
  "localfile://BACK05.SCR"
  "localfile://BACK06.SCR"
  "localfile://BACK07.SCR"
  "localfile://BACK08.SCR"
  "localfile://BACK09.SCR"
  "localfile://BACK10.SCR"
  "localfile://BACK11.SCR"
  "localfile://BACK12.SCR"
  "localfile://BACK13.SCR"
  "localfile://BACK14.SCR"
  "localfile://BACK15.SCR"
  "localfile://BACK16.SCR"
  "localfile://BACK17.SCR"
  "localfile://BACKPALS.DAT"
  "localfile://BARN.MCD"
  "localfile://BARN.PCK"
  "localfile://BARN.TAB"
  "localfile://BASEBITS.PCK"
  "localfile://BASEBITS.TAB"
  "localfile://BIGLETS.DAT"
  "localfile://BIGOBS.PCK"
  "localfile://BIGOBS.TAB"
  "localfile://BIGOB_00.PCK"
  "localfile://BIGOB_01.PCK"
  "localfile://BIGOB_02.PCK"
  "localfile://BIGOB_03.PCK"
  "localfile://BIGOB_04.PCK"
  "localfile://BIGOB_05.PCK"
  "localfile://BIGOB_06.PCK"
  "localfile://BIGOB_07.PCK"
  "localfile://BIGOB_08.PCK"
  "localfile://BIGOB_09.PCK"
  "localfile://BIGOB_10.PCK"
  "localfile://BIGOB_11.PCK"
  "localfile://BIGOB_12.PCK"
  "localfile://BIGOB_13.PCK"
  "localfile://BIGOB_14.PCK"
  "localfile://BIGOB_15.PCK"
  "localfile://BIGOB_16.PCK"
  "localfile://BIGOB_17.PCK"
  "localfile://BIGOB_18.PCK"
  "localfile://BIGOB_19.PCK"
  "localfile://BIGOB_20.PCK"
  "localfile://BIGOB_21.PCK"
  "localfile://BIGOB_22.PCK"
  "localfile://BIGOB_23.PCK"
  "localfile://BIGOB_24.PCK"
  "localfile://BIGOB_25.PCK"
  "localfile://BIGOB_26.PCK"
  "localfile://BIGOB_27.PCK"
  "localfile://BIGOB_28.PCK"
  "localfile://BIGOB_29.PCK"
  "localfile://BIGOB_30.PCK"
  "localfile://BIGOB_31.PCK"
  "localfile://BIGOB_32.PCK"
  "localfile://BIGOB_33.PCK"
  "localfile://BIGOB_34.PCK"
  "localfile://BIGOB_35.PCK"
  "localfile://BIGOB_36.PCK"
  "localfile://BIGOB_37.PCK"
  "localfile://BIGOB_38.PCK"
  "localfile://BIGOB_39.PCK"
  "localfile://BIGOB_40.PCK"
  "localfile://BIGOB_41.PCK"
  "localfile://BIGOB_42.PCK"
  "localfile://BIGOB_43.PCK"
  "localfile://BIGOB_44.PCK"
  "localfile://BIGOB_45.PCK"
  "localfile://BIGOB_46.PCK"
  "localfile://BIGOB_47.PCK"
  "localfile://BIGOB_48.PCK"
  "localfile://BIGOB_49.PCK"
  "localfile://BIGOB_50.PCK"
  "localfile://BIGOB_51.PCK"
  "localfile://BIGOB_52.PCK"
  "localfile://BIGOB_53.PCK"
  "localfile://BIGOB_54.PCK"
  "localfile://BIGOB_55.PCK"
  "localfile://BIGOB_56.PCK"
  "localfile://BLANKS.MCD"
  "localfile://BLANKS.PCK"
  "localfile://BLANKS.TAB"
  "localfile://BRAIN.MCD"
  "localfile://BRAIN.PCK"
  "localfile://BRAIN.TAB"
  "localfile://CELATID.PCK"
  "localfile://CELATID.TAB"
  "localfile://CHRYS.PCK"
  "localfile://CHRYS.TAB"
  "localfile://CIVF.PCK"
  "localfile://CIVF.TAB"
  "localfile://CIVM.PCK"
  "localfile://CIVM.TAB"
  "localfile://COS.DAT"
  "localfile://CULTA00.MAP"
  "localfile://CULTA00.RMP"
  "localfile://CULTA01.MAP"
  "localfile://CULTA01.RMP"
  "localfile://CULTA02.MAP"
  "localfile://CULTA02.RMP"
  "localfile://CULTA03.MAP"
  "localfile://CULTA03.RMP"
  "localfile://CULTA04.MAP"
  "localfile://CULTA04.RMP"
  "localfile://CULTA05.MAP"
  "localfile://CULTA05.RMP"
  "localfile://CULTA06.MAP"
  "localfile://CULTA06.RMP"
  "localfile://CULTA07.MAP"
  "localfile://CULTA07.RMP"
  "localfile://CULTA08.MAP"
  "localfile://CULTA08.RMP"
  "localfile://CULTA09.MAP"
  "localfile://CULTA09.RMP"
  "localfile://CULTA10.MAP"
  "localfile://CULTA10.RMP"
  "localfile://CULTA11.MAP"
  "localfile://CULTA11.RMP"
  "localfile://CULTA12.MAP"
  "localfile://CULTA12.RMP"
  "localfile://CULTA13.MAP"
  "localfile://CULTA13.RMP"
  "localfile://CULTA14.MAP"
  "localfile://CULTA14.RMP"
  "localfile://CULTA15.MAP"
  "localfile://CULTA15.RMP"
  "localfile://CULTA16.MAP"
  "localfile://CULTA16.RMP"
  "localfile://CULTA17.MAP"
  "localfile://CULTA17.RMP"
  "localfile://CULTA18.MAP"
  "localfile://CULTA18.RMP"
  "localfile://CULTIVAT.MCD"
  "localfile://CULTIVAT.PCK"
  "localfile://CULTIVAT.TAB"
  "localfile://CURSOR.PCK"
  "localfile://CURSOR.TAB"
  "localfile://CYBER.PCK"
  "localfile://CYBER.TAB"
  "localfile://DESERT.MCD"
  "localfile://DESERT.PCK"
  "localfile://DESERT.TAB"
  "localfile://DESERT00.MAP"
  "localfile://DESERT00.RMP"
  "localfile://DESERT01.MAP"
  "localfile://DESERT01.RMP"
  "localfile://DESERT02.MAP"
  "localfile://DESERT02.RMP"
  "localfile://DESERT03.MAP"
  "localfile://DESERT03.RMP"
  "localfile://DESERT04.MAP"
  "localfile://DESERT04.RMP"
  "localfile://DESERT05.MAP"
  "localfile://DESERT05.RMP"
  "localfile://DESERT06.MAP"
  "localfile://DESERT06.RMP"
  "localfile://DESERT07.MAP"
  "localfile://DESERT07.RMP"
  "localfile://DESERT08.MAP"
  "localfile://DESERT08.RMP"
  "localfile://DESERT09.MAP"
  "localfile://DESERT09.RMP"
  "localfile://DESERT10.MAP"
  "localfile://DESERT10.RMP"
  "localfile://DESERT11.MAP"
  "localfile://DESERT11.RMP"
  "localfile://DETBLOB.DAT"
  "localfile://DETBORD.PCK"
  "localfile://DETBORD2.PCK"
  "localfile://ufo-DP_PREFS"
  "localfile://geo-DP_PREFS"
  "localfile://DRIVERS.CAT"
  "localfile://ENGLISH.DAT"
  "localfile://ENGLISH2.DAT"
  "localfile://ETHEREAL.PCK"
  "localfile://ETHEREAL.TAB"
  "localfile://FLOATER.PCK"
  "localfile://FLOATER.TAB"
  "localfile://FLOOROB.PCK"
  "localfile://FLOOROB.TAB"
  "localfile://FOREST.MCD"
  "localfile://FOREST.PCK"
  "localfile://FOREST.TAB"
  "localfile://FOREST00.MAP"
  "localfile://FOREST00.RMP"
  "localfile://FOREST01.MAP"
  "localfile://FOREST01.RMP"
  "localfile://FOREST02.MAP"
  "localfile://FOREST02.RMP"
  "localfile://FOREST03.MAP"
  "localfile://FOREST03.RMP"
  "localfile://FOREST04.MAP"
  "localfile://FOREST04.RMP"
  "localfile://FOREST05.MAP"
  "localfile://FOREST05.RMP"
  "localfile://FOREST06.MAP"
  "localfile://FOREST06.RMP"
  "localfile://FOREST07.MAP"
  "localfile://FOREST07.RMP"
  "localfile://FOREST08.MAP"
  "localfile://FOREST08.RMP"
  "localfile://FOREST09.MAP"
  "localfile://FOREST09.RMP"
  "localfile://FOREST10.MAP"
  "localfile://FOREST10.RMP"
  "localfile://FOREST11.MAP"
  "localfile://FOREST11.RMP"
  "localfile://FRENCH.DAT"
  "localfile://FRENCH2.DAT"
  "localfile://FRNITURE.MCD"
  "localfile://FRNITURE.PCK"
  "localfile://FRNITURE.TAB"
  "localfile://GEOBORD.SCR"
  "localfile://GEODATA.DAT"
  "localfile://GERMAN.DAT"
  "localfile://GERMAN2.DAT"
  "localfile://GM.CAT"
  "localfile://GMDEFEND.MID"
  "localfile://GMENBASE.MID"
  "localfile://GMGEO1.MID"
  "localfile://GMGEO2.MID"
  "localfile://GMINTER.MID"
  "localfile://GMINTRO1.MID"
  "localfile://GMINTRO2.MID"
  "localfile://GMINTRO3.MID"
  "localfile://GMLOSE.MID"
  "localfile://GMMARS.MID"
  "localfile://GMNEWMAR.MID"
  "localfile://GMSTORY.MID"
  "localfile://GMTACTIC.MID"
  "localfile://GMWIN.MID"
  "localfile://GRAPHS.SPK"
  "localfile://HANDOB.PCK"
  "localfile://HANDOB.TAB"
  "localfile://HIT.PCK"
  "localfile://HIT.TAB"
  "localfile://ICONS.PCK"
  "localfile://INTERWIN.DAT"
  "localfile://ufo-INTICON.PCK"
  "localfile://geo-INTICON.PCK"
  "localfile://ufo-INTICON.TAB"
  "localfile://geo-INTICON.TAB"
  "localfile://INTRO.CAT"
  "localfile://JUNGLE.MCD"
  "localfile://JUNGLE.PCK"
  "localfile://JUNGLE.TAB"
  "localfile://JUNGLE00.MAP"
  "localfile://JUNGLE00.RMP"
  "localfile://JUNGLE01.MAP"
  "localfile://JUNGLE01.RMP"
  "localfile://JUNGLE02.MAP"
  "localfile://JUNGLE02.RMP"
  "localfile://JUNGLE03.MAP"
  "localfile://JUNGLE03.RMP"
  "localfile://JUNGLE04.MAP"
  "localfile://JUNGLE04.RMP"
  "localfile://JUNGLE05.MAP"
  "localfile://JUNGLE05.RMP"
  "localfile://JUNGLE06.MAP"
  "localfile://JUNGLE06.RMP"
  "localfile://JUNGLE07.MAP"
  "localfile://JUNGLE07.RMP"
  "localfile://JUNGLE08.MAP"
  "localfile://JUNGLE08.RMP"
  "localfile://JUNGLE09.MAP"
  "localfile://JUNGLE09.RMP"
  "localfile://JUNGLE10.MAP"
  "localfile://JUNGLE10.RMP"
  "localfile://JUNGLE11.MAP"
  "localfile://JUNGLE11.RMP"
  "localfile://LANG1.DAT"
  "localfile://LANG2.DAT"
  "localfile://LAPC1.PAT"
  "localfile://LIGHTNIN.MAP"
  "localfile://LIGHTNIN.MCD"
  "localfile://LIGHTNIN.PCK"
  "localfile://LIGHTNIN.RMP"
  "localfile://LIGHTNIN.TAB"
  "localfile://LOFTEMPS.DAT"
  "localfile://MAN_0F0.SPK"
  "localfile://MAN_0F1.SPK"
  "localfile://MAN_0F2.SPK"
  "localfile://MAN_0F3.SPK"
  "localfile://MAN_0M0.SPK"
  "localfile://MAN_0M1.SPK"
  "localfile://MAN_0M2.SPK"
  "localfile://MAN_0M3.SPK"
  "localfile://MAN_1F0.SPK"
  "localfile://MAN_1F1.SPK"
  "localfile://MAN_1F2.SPK"
  "localfile://MAN_1F3.SPK"
  "localfile://MAN_1M0.SPK"
  "localfile://MAN_1M1.SPK"
  "localfile://MAN_1M2.SPK"
  "localfile://MAN_1M3.SPK"
  "localfile://MAN_2.SPK"
  "localfile://MAN_3.SPK"
  "localfile://MAP3.MAP"
  "localfile://MAP4.MAP"
  "localfile://MARS.MCD"
  "localfile://MARS.PCK"
  "localfile://MARS.TAB"
  "localfile://MARS00.MAP"
  "localfile://MARS00.RMP"
  "localfile://MARS01.MAP"
  "localfile://MARS01.RMP"
  "localfile://MARS02.MAP"
  "localfile://MARS02.RMP"
  "localfile://MARS03.MAP"
  "localfile://MARS03.RMP"
  "localfile://MARS04.MAP"
  "localfile://MARS04.RMP"
  "localfile://MARS05.MAP"
  "localfile://MARS05.RMP"
  "localfile://MARS06.MAP"
  "localfile://MARS06.RMP"
  "localfile://MARS07.MAP"
  "localfile://MARS07.RMP"
  "localfile://MARS08.MAP"
  "localfile://MARS08.RMP"
  "localfile://MARS09.MAP"
  "localfile://MARS09.RMP"
  "localfile://MARS10.MAP"
  "localfile://MARS10.RMP"
  "localfile://MEDIBITS.DAT"
  "localfile://MEDIBORD.PCK"
  "localfile://MOC1.LBM"
  "localfile://MOUNT.MCD"
  "localfile://MOUNT.PCK"
  "localfile://MOUNT.TAB"
  "localfile://MOUNT00.MAP"
  "localfile://MOUNT00.RMP"
  "localfile://MOUNT01.MAP"
  "localfile://MOUNT01.RMP"
  "localfile://MOUNT02.MAP"
  "localfile://MOUNT02.RMP"
  "localfile://MOUNT03.MAP"
  "localfile://MOUNT03.RMP"
  "localfile://MOUNT04.MAP"
  "localfile://MOUNT04.RMP"
  "localfile://MOUNT05.MAP"
  "localfile://MOUNT05.RMP"
  "localfile://MOUNT06.MAP"
  "localfile://MOUNT06.RMP"
  "localfile://MOUNT07.MAP"
  "localfile://MOUNT07.RMP"
  "localfile://MOUNT08.MAP"
  "localfile://MOUNT08.RMP"
  "localfile://MOUNT09.MAP"
  "localfile://MOUNT09.RMP"
  "localfile://MOUNT10.MAP"
  "localfile://MOUNT10.RMP"
  "localfile://MOUNT11.MAP"
  "localfile://MOUNT11.RMP"
  "localfile://MOUNT12.MAP"
  "localfile://MOUNT12.RMP"
  "localfile://MUSIC.COM"
  "localfile://MUTON.PCK"
  "localfile://MUTON.TAB"
  "localfile://OBDATA.DAT"
  "localfile://PABDUCT.MAP"
  "localfile://PALETTES.DAT"
  "localfile://PHARVEST.MAP"
  "localfile://PICT1.LBM"
  "localfile://PICT2.LBM"
  "localfile://PICT3.LBM"
  "localfile://PICT4.LBM"
  "localfile://PICT5.LBM"
  "localfile://PICT6.LBM"
  "localfile://PICT7.LBM"
  "localfile://PLANE.MAP"
  "localfile://PLANE.MCD"
  "localfile://PLANE.PCK"
  "localfile://PLANE.RMP"
  "localfile://PLANE.TAB"
  "localfile://POLAR.MCD"
  "localfile://POLAR.PCK"
  "localfile://POLAR.TAB"
  "localfile://POLAR00.MAP"
  "localfile://POLAR00.RMP"
  "localfile://POLAR01.MAP"
  "localfile://POLAR01.RMP"
  "localfile://POLAR02.MAP"
  "localfile://POLAR02.RMP"
  "localfile://POLAR03.MAP"
  "localfile://POLAR03.RMP"
  "localfile://POLAR04.MAP"
  "localfile://POLAR04.RMP"
  "localfile://POLAR05.MAP"
  "localfile://POLAR05.RMP"
  "localfile://POLAR06.MAP"
  "localfile://POLAR06.RMP"
  "localfile://POLAR07.MAP"
  "localfile://POLAR07.RMP"
  "localfile://POLAR08.MAP"
  "localfile://POLAR08.RMP"
  "localfile://POLAR09.MAP"
  "localfile://POLAR09.RMP"
  "localfile://POLAR10.MAP"
  "localfile://POLAR10.RMP"
  "localfile://POLAR11.MAP"
  "localfile://POLAR11.RMP"
  "localfile://POLAR12.MAP"
  "localfile://POLAR12.RMP"
  "localfile://POLAR13.MAP"
  "localfile://POLAR13.RMP"
  "localfile://PSCOUT.MAP"
  "localfile://RINTRO.CAT"
  "localfile://ROADS.MCD"
  "localfile://ROADS.PCK"
  "localfile://ROADS.TAB"
  "localfile://ROLAND.CAT"
  "localfile://SAMPLE.CAT"
  "localfile://SAMPLE2.CAT"
  "localfile://SAMPLE3.CAT"
  "localfile://SCANBORD.PCK"
  "localfile://SCANG.DAT"
  "localfile://SECTOID.PCK"
  "localfile://SECTOID.TAB"
  "localfile://SILACOID.PCK"
  "localfile://SILACOID.TAB"
  "localfile://SINE.DAT"
  "localfile://SMALLSET.DAT"
  "localfile://SMOKE.PCK"
  "localfile://SMOKE.TAB"
  "localfile://SNAKEMAN.PCK"
  "localfile://SNAKEMAN.TAB"
  "localfile://SNDEND.EXE"
  "localfile://SNDSTART.EXE"
  "localfile://SOUND.CFG"
  "localfile://SOUND1.CAT"
  "localfile://SOUND2.CAT"
  "localfile://SOUNDRV.COM"
  "localfile://SPICONS.DAT"
  "localfile://TAC00.SCR"
  "localfile://TAC01.SCR"
  "localfile://TANKS.PCK"
  "localfile://TANKS.TAB"
  "localfile://TEMP.MAP"
  "localfile://TEMP.RMP"
  "localfile://TEMP1.MAP"
  "localfile://TEMP1.RMP"
  "localfile://TEMP2.MAP"
  "localfile://TEMP2.RMP"
  "localfile://TEMP3.MAP"
  "localfile://TEMP3.RMP"
  "localfile://TEXTURE.DAT"
  "localfile://UBASE_00.MAP"
  "localfile://UBASE_00.RMP"
  "localfile://UBASE_01.MAP"
  "localfile://UBASE_01.RMP"
  "localfile://UBASE_02.MAP"
  "localfile://UBASE_02.RMP"
  "localfile://UBASE_03.MAP"
  "localfile://UBASE_03.RMP"
  "localfile://UBASE_04.MAP"
  "localfile://UBASE_04.RMP"
  "localfile://UBASE_05.MAP"
  "localfile://UBASE_05.RMP"
  "localfile://UBASE_06.MAP"
  "localfile://UBASE_06.RMP"
  "localfile://UBASE_07.MAP"
  "localfile://UBASE_07.RMP"
  "localfile://UBASE_08.MAP"
  "localfile://UBASE_08.RMP"
  "localfile://UBASE_09.MAP"
  "localfile://UBASE_09.RMP"
  "localfile://UBASE_10.MAP"
  "localfile://UBASE_10.RMP"
  "localfile://UBASE_11.MAP"
  "localfile://UBASE_11.RMP"
  "localfile://UBASE_12.MAP"
  "localfile://UBASE_12.RMP"
  "localfile://UBASE_13.MAP"
  "localfile://UBASE_13.RMP"
  "localfile://UBASE_14.MAP"
  "localfile://UBASE_14.RMP"
  "localfile://UBASE_15.MAP"
  "localfile://UBASE_15.RMP"
  "localfile://UFO1.MCD"
  "localfile://UFO1.PCK"
  "localfile://UFO1.TAB"
  "localfile://UFO1A.MAP"
  "localfile://UFO1A.RMP"
  "localfile://UFO1B.MAP"
  "localfile://UFOINT.FLI"
  "localfile://UFO_000.MAP"
  "localfile://UFO_000.RMP"
  "localfile://UFO_010.MAP"
  "localfile://UFO_010.RMP"
  "localfile://UFO_110.MAP"
  "localfile://UFO_110.RMP"
  "localfile://UFO_120.MAP"
  "localfile://UFO_120.RMP"
  "localfile://UFO_130.MAP"
  "localfile://UFO_130.RMP"
  "localfile://UFO_140.MAP"
  "localfile://UFO_140.RMP"
  "localfile://UFO_150.MAP"
  "localfile://UFO_150.RMP"
  "localfile://UFO_160.MAP"
  "localfile://UFO_160.RMP"
  "localfile://UFO_170.MAP"
  "localfile://UFO_170.RMP"
  "localfile://UNIBORD.PCK"
  "localfile://UP001.SPK"
  "localfile://UP002.SPK"
  "localfile://UP003.SPK"
  "localfile://UP004.SPK"
  "localfile://UP005.SPK"
  "localfile://UP006.SPK"
  "localfile://UP007.SPK"
  "localfile://UP008.SPK"
  "localfile://UP009.SPK"
  "localfile://UP010.SPK"
  "localfile://UP011.SPK"
  "localfile://UP012.SPK"
  "localfile://UP013.SPK"
  "localfile://UP014.SPK"
  "localfile://UP015.SPK"
  "localfile://UP016.SPK"
  "localfile://UP017.SPK"
  "localfile://UP018.SPK"
  "localfile://UP019.SPK"
  "localfile://UP020.SPK"
  "localfile://UP021.SPK"
  "localfile://UP022.SPK"
  "localfile://UP023.SPK"
  "localfile://UP024.SPK"
  "localfile://UP025.SPK"
  "localfile://UP026.SPK"
  "localfile://UP027.SPK"
  "localfile://UP028.SPK"
  "localfile://UP029.SPK"
  "localfile://UP030.SPK"
  "localfile://UP031.SPK"
  "localfile://UP032.SPK"
  "localfile://UP033.SPK"
  "localfile://UP034.SPK"
  "localfile://UP035.SPK"
  "localfile://UP036.SPK"
  "localfile://UP037.SPK"
  "localfile://UP038.SPK"
  "localfile://UP039.SPK"
  "localfile://UP040.SPK"
  "localfile://UP041.SPK"
  "localfile://UP042.SPK"
  "localfile://UP_BORD1.SPK"
  "localfile://UP_BORD2.SCR"
  "localfile://UP_BORD2.SPK"
  "localfile://UP_BORD3.SPK"
  "localfile://URBAN.MCD"
  "localfile://URBAN.PCK"
  "localfile://URBAN.TAB"
  "localfile://URBAN00.MAP"
  "localfile://URBAN00.RMP"
  "localfile://URBAN01.MAP"
  "localfile://URBAN01.RMP"
  "localfile://URBAN02.MAP"
  "localfile://URBAN02.RMP"
  "localfile://URBAN03.MAP"
  "localfile://URBAN03.RMP"
  "localfile://URBAN04.MAP"
  "localfile://URBAN04.RMP"
  "localfile://URBAN05.MAP"
  "localfile://URBAN05.RMP"
  "localfile://URBAN06.MAP"
  "localfile://URBAN06.RMP"
  "localfile://URBAN07.MAP"
  "localfile://URBAN07.RMP"
  "localfile://URBAN08.MAP"
  "localfile://URBAN08.RMP"
  "localfile://URBAN09.MAP"
  "localfile://URBAN09.RMP"
  "localfile://URBAN14.MAP"
  "localfile://URBAN14.RMP"
  "localfile://URBAN15.MAP"
  "localfile://URBAN15.RMP"
  "localfile://URBAN16.MAP"
  "localfile://URBAN16.RMP"
  "localfile://URBAN17.MAP"
  "localfile://URBAN17.RMP"
  "localfile://URBAN18.MAP"
  "localfile://URBAN18.RMP"
  "localfile://URBITS.MCD"
  "localfile://URBITS.PCK"
  "localfile://URBITS.TAB"
  "localfile://U_BASE.MCD"
  "localfile://U_BASE.PCK"
  "localfile://U_BASE.TAB"
  "localfile://U_BITS.MCD"
  "localfile://U_BITS.PCK"
  "localfile://U_BITS.TAB"
  "localfile://U_DISEC2.MCD"
  "localfile://U_DISEC2.PCK"
  "localfile://U_DISEC2.TAB"
  "localfile://U_EXT02.MCD"
  "localfile://U_EXT02.PCK"
  "localfile://U_EXT02.TAB"
  "localfile://U_OPER2.MCD"
  "localfile://U_OPER2.PCK"
  "localfile://U_OPER2.TAB"
  "localfile://U_PODS.MCD"
  "localfile://U_PODS.PCK"
  "localfile://U_PODS.TAB"
  "localfile://U_WALL02.MCD"
  "localfile://U_WALL02.PCK"
  "localfile://U_WALL02.TAB"
  "localfile://VECTOR.COM"
  "localfile://WORLD.DAT"
  "localfile://X1.PCK"
  "localfile://X1.TAB"
  "localfile://XBASE1.MCD"
  "localfile://XBASE1.PCK"
  "localfile://XBASE1.TAB"
  "localfile://XBASE2.MCD"
  "localfile://XBASE2.PCK"
  "localfile://XBASE2.TAB"
  "localfile://XBASE_00.MAP"
  "localfile://XBASE_00.RMP"
  "localfile://XBASE_01.MAP"
  "localfile://XBASE_01.RMP"
  "localfile://XBASE_02.MAP"
  "localfile://XBASE_02.RMP"
  "localfile://XBASE_03.MAP"
  "localfile://XBASE_03.RMP"
  "localfile://XBASE_04.MAP"
  "localfile://XBASE_04.RMP"
  "localfile://XBASE_05.MAP"
  "localfile://XBASE_05.RMP"
  "localfile://XBASE_06.MAP"
  "localfile://XBASE_06.RMP"
  "localfile://XBASE_07.MAP"
  "localfile://XBASE_07.RMP"
  "localfile://XBASE_08.MAP"
  "localfile://XBASE_08.RMP"
  "localfile://XBASE_09.MAP"
  "localfile://XBASE_09.RMP"
  "localfile://XBASE_10.MAP"
  "localfile://XBASE_10.RMP"
  "localfile://XBASE_11.MAP"
  "localfile://XBASE_11.RMP"
  "localfile://XBASE_12.MAP"
  "localfile://XBASE_12.RMP"
  "localfile://XBASE_13.MAP"
  "localfile://XBASE_13.RMP"
  "localfile://XBASE_14.MAP"
  "localfile://XBASE_14.RMP"
  "localfile://XBASE_15.MAP"
  "localfile://XBASE_15.RMP"
  "localfile://XBASE_16.MAP"
  "localfile://XBASE_16.RMP"
  "localfile://XBASE_17.MAP"
  "localfile://XBASE_17.RMP"
  "localfile://XBASE_18.MAP"
  "localfile://XBASE_18.RMP"
  "localfile://XBASE_19.MAP"
  "localfile://XBASE_19.RMP"
  "localfile://XBASE_20.MAP"
  "localfile://XBASE_20.RMP"
  "localfile://XCOM_0.PCK"
  "localfile://XCOM_0.TAB"
  "localfile://XCOM_1.PCK"
  "localfile://XCOM_1.TAB"
  "localfile://XCOM_2.PCK"
  "localfile://XCOM_2.TAB"
  "localfile://X_REAP.PCK"
  "localfile://X_REAP.TAB"
  "localfile://X_ROB.PCK"
  "localfile://X_ROB.TAB"
  "localfile://ZOMBIE.PCK"
  "localfile://ZOMBIE.TAB"
)
noextract=(
  "filelist"
  "copier.sh"
  "ADLIB.CAT"
  "AINTRO.CAT"
  "AVENGER.MAP"
  "AVENGER.MCD"
  "AVENGER.PCK"
  "AVENGER.RMP"
  "AVENGER.TAB"
  "BACK01.SCR"
  "BACK02.SCR"
  "BACK03.SCR"
  "BACK04.SCR"
  "BACK05.SCR"
  "BACK06.SCR"
  "BACK07.SCR"
  "BACK08.SCR"
  "BACK09.SCR"
  "BACK10.SCR"
  "BACK11.SCR"
  "BACK12.SCR"
  "BACK13.SCR"
  "BACK14.SCR"
  "BACK15.SCR"
  "BACK16.SCR"
  "BACK17.SCR"
  "BACKPALS.DAT"
  "BARN.MCD"
  "BARN.PCK"
  "BARN.TAB"
  "BASEBITS.PCK"
  "BASEBITS.TAB"
  "BIGLETS.DAT"
  "BIGOBS.PCK"
  "BIGOBS.TAB"
  "BIGOB_00.PCK"
  "BIGOB_01.PCK"
  "BIGOB_02.PCK"
  "BIGOB_03.PCK"
  "BIGOB_04.PCK"
  "BIGOB_05.PCK"
  "BIGOB_06.PCK"
  "BIGOB_07.PCK"
  "BIGOB_08.PCK"
  "BIGOB_09.PCK"
  "BIGOB_10.PCK"
  "BIGOB_11.PCK"
  "BIGOB_12.PCK"
  "BIGOB_13.PCK"
  "BIGOB_14.PCK"
  "BIGOB_15.PCK"
  "BIGOB_16.PCK"
  "BIGOB_17.PCK"
  "BIGOB_18.PCK"
  "BIGOB_19.PCK"
  "BIGOB_20.PCK"
  "BIGOB_21.PCK"
  "BIGOB_22.PCK"
  "BIGOB_23.PCK"
  "BIGOB_24.PCK"
  "BIGOB_25.PCK"
  "BIGOB_26.PCK"
  "BIGOB_27.PCK"
  "BIGOB_28.PCK"
  "BIGOB_29.PCK"
  "BIGOB_30.PCK"
  "BIGOB_31.PCK"
  "BIGOB_32.PCK"
  "BIGOB_33.PCK"
  "BIGOB_34.PCK"
  "BIGOB_35.PCK"
  "BIGOB_36.PCK"
  "BIGOB_37.PCK"
  "BIGOB_38.PCK"
  "BIGOB_39.PCK"
  "BIGOB_40.PCK"
  "BIGOB_41.PCK"
  "BIGOB_42.PCK"
  "BIGOB_43.PCK"
  "BIGOB_44.PCK"
  "BIGOB_45.PCK"
  "BIGOB_46.PCK"
  "BIGOB_47.PCK"
  "BIGOB_48.PCK"
  "BIGOB_49.PCK"
  "BIGOB_50.PCK"
  "BIGOB_51.PCK"
  "BIGOB_52.PCK"
  "BIGOB_53.PCK"
  "BIGOB_54.PCK"
  "BIGOB_55.PCK"
  "BIGOB_56.PCK"
  "BLANKS.MCD"
  "BLANKS.PCK"
  "BLANKS.TAB"
  "BRAIN.MCD"
  "BRAIN.PCK"
  "BRAIN.TAB"
  "CELATID.PCK"
  "CELATID.TAB"
  "CHRYS.PCK"
  "CHRYS.TAB"
  "CIVF.PCK"
  "CIVF.TAB"
  "CIVM.PCK"
  "CIVM.TAB"
  "COS.DAT"
  "CULTA00.MAP"
  "CULTA00.RMP"
  "CULTA01.MAP"
  "CULTA01.RMP"
  "CULTA02.MAP"
  "CULTA02.RMP"
  "CULTA03.MAP"
  "CULTA03.RMP"
  "CULTA04.MAP"
  "CULTA04.RMP"
  "CULTA05.MAP"
  "CULTA05.RMP"
  "CULTA06.MAP"
  "CULTA06.RMP"
  "CULTA07.MAP"
  "CULTA07.RMP"
  "CULTA08.MAP"
  "CULTA08.RMP"
  "CULTA09.MAP"
  "CULTA09.RMP"
  "CULTA10.MAP"
  "CULTA10.RMP"
  "CULTA11.MAP"
  "CULTA11.RMP"
  "CULTA12.MAP"
  "CULTA12.RMP"
  "CULTA13.MAP"
  "CULTA13.RMP"
  "CULTA14.MAP"
  "CULTA14.RMP"
  "CULTA15.MAP"
  "CULTA15.RMP"
  "CULTA16.MAP"
  "CULTA16.RMP"
  "CULTA17.MAP"
  "CULTA17.RMP"
  "CULTA18.MAP"
  "CULTA18.RMP"
  "CULTIVAT.MCD"
  "CULTIVAT.PCK"
  "CULTIVAT.TAB"
  "CURSOR.PCK"
  "CURSOR.TAB"
  "CYBER.PCK"
  "CYBER.TAB"
  "DESERT.MCD"
  "DESERT.PCK"
  "DESERT.TAB"
  "DESERT00.MAP"
  "DESERT00.RMP"
  "DESERT01.MAP"
  "DESERT01.RMP"
  "DESERT02.MAP"
  "DESERT02.RMP"
  "DESERT03.MAP"
  "DESERT03.RMP"
  "DESERT04.MAP"
  "DESERT04.RMP"
  "DESERT05.MAP"
  "DESERT05.RMP"
  "DESERT06.MAP"
  "DESERT06.RMP"
  "DESERT07.MAP"
  "DESERT07.RMP"
  "DESERT08.MAP"
  "DESERT08.RMP"
  "DESERT09.MAP"
  "DESERT09.RMP"
  "DESERT10.MAP"
  "DESERT10.RMP"
  "DESERT11.MAP"
  "DESERT11.RMP"
  "DETBLOB.DAT"
  "DETBORD.PCK"
  "DETBORD2.PCK"
  "ufo-DP_PREFS"
  "geo-DP_PREFS"
  "DRIVERS.CAT"
  "ENGLISH.DAT"
  "ENGLISH2.DAT"
  "ETHEREAL.PCK"
  "ETHEREAL.TAB"
  "FLOATER.PCK"
  "FLOATER.TAB"
  "FLOOROB.PCK"
  "FLOOROB.TAB"
  "FOREST.MCD"
  "FOREST.PCK"
  "FOREST.TAB"
  "FOREST00.MAP"
  "FOREST00.RMP"
  "FOREST01.MAP"
  "FOREST01.RMP"
  "FOREST02.MAP"
  "FOREST02.RMP"
  "FOREST03.MAP"
  "FOREST03.RMP"
  "FOREST04.MAP"
  "FOREST04.RMP"
  "FOREST05.MAP"
  "FOREST05.RMP"
  "FOREST06.MAP"
  "FOREST06.RMP"
  "FOREST07.MAP"
  "FOREST07.RMP"
  "FOREST08.MAP"
  "FOREST08.RMP"
  "FOREST09.MAP"
  "FOREST09.RMP"
  "FOREST10.MAP"
  "FOREST10.RMP"
  "FOREST11.MAP"
  "FOREST11.RMP"
  "FRENCH.DAT"
  "FRENCH2.DAT"
  "FRNITURE.MCD"
  "FRNITURE.PCK"
  "FRNITURE.TAB"
  "GEOBORD.SCR"
  "GEODATA.DAT"
  "GERMAN.DAT"
  "GERMAN2.DAT"
  "GM.CAT"
  "GMDEFEND.MID"
  "GMENBASE.MID"
  "GMGEO1.MID"
  "GMGEO2.MID"
  "GMINTER.MID"
  "GMINTRO1.MID"
  "GMINTRO2.MID"
  "GMINTRO3.MID"
  "GMLOSE.MID"
  "GMMARS.MID"
  "GMNEWMAR.MID"
  "GMSTORY.MID"
  "GMTACTIC.MID"
  "GMWIN.MID"
  "GRAPHS.SPK"
  "HANDOB.PCK"
  "HANDOB.TAB"
  "HIT.PCK"
  "HIT.TAB"
  "ICONS.PCK"
  "INTERWIN.DAT"
  "ufo-INTICON.PCK"
  "geo-INTICON.PCK"
  "ufo-INTICON.TAB"
  "geo-INTICON.TAB"
  "INTRO.CAT"
  "JUNGLE.MCD"
  "JUNGLE.PCK"
  "JUNGLE.TAB"
  "JUNGLE00.MAP"
  "JUNGLE00.RMP"
  "JUNGLE01.MAP"
  "JUNGLE01.RMP"
  "JUNGLE02.MAP"
  "JUNGLE02.RMP"
  "JUNGLE03.MAP"
  "JUNGLE03.RMP"
  "JUNGLE04.MAP"
  "JUNGLE04.RMP"
  "JUNGLE05.MAP"
  "JUNGLE05.RMP"
  "JUNGLE06.MAP"
  "JUNGLE06.RMP"
  "JUNGLE07.MAP"
  "JUNGLE07.RMP"
  "JUNGLE08.MAP"
  "JUNGLE08.RMP"
  "JUNGLE09.MAP"
  "JUNGLE09.RMP"
  "JUNGLE10.MAP"
  "JUNGLE10.RMP"
  "JUNGLE11.MAP"
  "JUNGLE11.RMP"
  "LANG1.DAT"
  "LANG2.DAT"
  "LAPC1.PAT"
  "LIGHTNIN.MAP"
  "LIGHTNIN.MCD"
  "LIGHTNIN.PCK"
  "LIGHTNIN.RMP"
  "LIGHTNIN.TAB"
  "LOFTEMPS.DAT"
  "MAN_0F0.SPK"
  "MAN_0F1.SPK"
  "MAN_0F2.SPK"
  "MAN_0F3.SPK"
  "MAN_0M0.SPK"
  "MAN_0M1.SPK"
  "MAN_0M2.SPK"
  "MAN_0M3.SPK"
  "MAN_1F0.SPK"
  "MAN_1F1.SPK"
  "MAN_1F2.SPK"
  "MAN_1F3.SPK"
  "MAN_1M0.SPK"
  "MAN_1M1.SPK"
  "MAN_1M2.SPK"
  "MAN_1M3.SPK"
  "MAN_2.SPK"
  "MAN_3.SPK"
  "MAP3.MAP"
  "MAP4.MAP"
  "MARS.MCD"
  "MARS.PCK"
  "MARS.TAB"
  "MARS00.MAP"
  "MARS00.RMP"
  "MARS01.MAP"
  "MARS01.RMP"
  "MARS02.MAP"
  "MARS02.RMP"
  "MARS03.MAP"
  "MARS03.RMP"
  "MARS04.MAP"
  "MARS04.RMP"
  "MARS05.MAP"
  "MARS05.RMP"
  "MARS06.MAP"
  "MARS06.RMP"
  "MARS07.MAP"
  "MARS07.RMP"
  "MARS08.MAP"
  "MARS08.RMP"
  "MARS09.MAP"
  "MARS09.RMP"
  "MARS10.MAP"
  "MARS10.RMP"
  "MEDIBITS.DAT"
  "MEDIBORD.PCK"
  "MOC1.LBM"
  "MOUNT.MCD"
  "MOUNT.PCK"
  "MOUNT.TAB"
  "MOUNT00.MAP"
  "MOUNT00.RMP"
  "MOUNT01.MAP"
  "MOUNT01.RMP"
  "MOUNT02.MAP"
  "MOUNT02.RMP"
  "MOUNT03.MAP"
  "MOUNT03.RMP"
  "MOUNT04.MAP"
  "MOUNT04.RMP"
  "MOUNT05.MAP"
  "MOUNT05.RMP"
  "MOUNT06.MAP"
  "MOUNT06.RMP"
  "MOUNT07.MAP"
  "MOUNT07.RMP"
  "MOUNT08.MAP"
  "MOUNT08.RMP"
  "MOUNT09.MAP"
  "MOUNT09.RMP"
  "MOUNT10.MAP"
  "MOUNT10.RMP"
  "MOUNT11.MAP"
  "MOUNT11.RMP"
  "MOUNT12.MAP"
  "MOUNT12.RMP"
  "MUSIC.COM"
  "MUTON.PCK"
  "MUTON.TAB"
  "OBDATA.DAT"
  "PABDUCT.MAP"
  "PALETTES.DAT"
  "PHARVEST.MAP"
  "PICT1.LBM"
  "PICT2.LBM"
  "PICT3.LBM"
  "PICT4.LBM"
  "PICT5.LBM"
  "PICT6.LBM"
  "PICT7.LBM"
  "PLANE.MAP"
  "PLANE.MCD"
  "PLANE.PCK"
  "PLANE.RMP"
  "PLANE.TAB"
  "POLAR.MCD"
  "POLAR.PCK"
  "POLAR.TAB"
  "POLAR00.MAP"
  "POLAR00.RMP"
  "POLAR01.MAP"
  "POLAR01.RMP"
  "POLAR02.MAP"
  "POLAR02.RMP"
  "POLAR03.MAP"
  "POLAR03.RMP"
  "POLAR04.MAP"
  "POLAR04.RMP"
  "POLAR05.MAP"
  "POLAR05.RMP"
  "POLAR06.MAP"
  "POLAR06.RMP"
  "POLAR07.MAP"
  "POLAR07.RMP"
  "POLAR08.MAP"
  "POLAR08.RMP"
  "POLAR09.MAP"
  "POLAR09.RMP"
  "POLAR10.MAP"
  "POLAR10.RMP"
  "POLAR11.MAP"
  "POLAR11.RMP"
  "POLAR12.MAP"
  "POLAR12.RMP"
  "POLAR13.MAP"
  "POLAR13.RMP"
  "PSCOUT.MAP"
  "RINTRO.CAT"
  "ROADS.MCD"
  "ROADS.PCK"
  "ROADS.TAB"
  "ROLAND.CAT"
  "SAMPLE.CAT"
  "SAMPLE2.CAT"
  "SAMPLE3.CAT"
  "SCANBORD.PCK"
  "SCANG.DAT"
  "SECTOID.PCK"
  "SECTOID.TAB"
  "SILACOID.PCK"
  "SILACOID.TAB"
  "SINE.DAT"
  "SMALLSET.DAT"
  "SMOKE.PCK"
  "SMOKE.TAB"
  "SNAKEMAN.PCK"
  "SNAKEMAN.TAB"
  "SNDEND.EXE"
  "SNDSTART.EXE"
  "SOUND.CFG"
  "SOUND1.CAT"
  "SOUND2.CAT"
  "SOUNDRV.COM"
  "SPICONS.DAT"
  "TAC00.SCR"
  "TAC01.SCR"
  "TANKS.PCK"
  "TANKS.TAB"
  "TEMP.MAP"
  "TEMP.RMP"
  "TEMP1.MAP"
  "TEMP1.RMP"
  "TEMP2.MAP"
  "TEMP2.RMP"
  "TEMP3.MAP"
  "TEMP3.RMP"
  "TEXTURE.DAT"
  "UBASE_00.MAP"
  "UBASE_00.RMP"
  "UBASE_01.MAP"
  "UBASE_01.RMP"
  "UBASE_02.MAP"
  "UBASE_02.RMP"
  "UBASE_03.MAP"
  "UBASE_03.RMP"
  "UBASE_04.MAP"
  "UBASE_04.RMP"
  "UBASE_05.MAP"
  "UBASE_05.RMP"
  "UBASE_06.MAP"
  "UBASE_06.RMP"
  "UBASE_07.MAP"
  "UBASE_07.RMP"
  "UBASE_08.MAP"
  "UBASE_08.RMP"
  "UBASE_09.MAP"
  "UBASE_09.RMP"
  "UBASE_10.MAP"
  "UBASE_10.RMP"
  "UBASE_11.MAP"
  "UBASE_11.RMP"
  "UBASE_12.MAP"
  "UBASE_12.RMP"
  "UBASE_13.MAP"
  "UBASE_13.RMP"
  "UBASE_14.MAP"
  "UBASE_14.RMP"
  "UBASE_15.MAP"
  "UBASE_15.RMP"
  "UFO1.MCD"
  "UFO1.PCK"
  "UFO1.TAB"
  "UFO1A.MAP"
  "UFO1A.RMP"
  "UFO1B.MAP"
  "UFOINT.FLI"
  "UFO_000.MAP"
  "UFO_000.RMP"
  "UFO_010.MAP"
  "UFO_010.RMP"
  "UFO_110.MAP"
  "UFO_110.RMP"
  "UFO_120.MAP"
  "UFO_120.RMP"
  "UFO_130.MAP"
  "UFO_130.RMP"
  "UFO_140.MAP"
  "UFO_140.RMP"
  "UFO_150.MAP"
  "UFO_150.RMP"
  "UFO_160.MAP"
  "UFO_160.RMP"
  "UFO_170.MAP"
  "UFO_170.RMP"
  "UNIBORD.PCK"
  "UP001.SPK"
  "UP002.SPK"
  "UP003.SPK"
  "UP004.SPK"
  "UP005.SPK"
  "UP006.SPK"
  "UP007.SPK"
  "UP008.SPK"
  "UP009.SPK"
  "UP010.SPK"
  "UP011.SPK"
  "UP012.SPK"
  "UP013.SPK"
  "UP014.SPK"
  "UP015.SPK"
  "UP016.SPK"
  "UP017.SPK"
  "UP018.SPK"
  "UP019.SPK"
  "UP020.SPK"
  "UP021.SPK"
  "UP022.SPK"
  "UP023.SPK"
  "UP024.SPK"
  "UP025.SPK"
  "UP026.SPK"
  "UP027.SPK"
  "UP028.SPK"
  "UP029.SPK"
  "UP030.SPK"
  "UP031.SPK"
  "UP032.SPK"
  "UP033.SPK"
  "UP034.SPK"
  "UP035.SPK"
  "UP036.SPK"
  "UP037.SPK"
  "UP038.SPK"
  "UP039.SPK"
  "UP040.SPK"
  "UP041.SPK"
  "UP042.SPK"
  "UP_BORD1.SPK"
  "UP_BORD2.SCR"
  "UP_BORD2.SPK"
  "UP_BORD3.SPK"
  "URBAN.MCD"
  "URBAN.PCK"
  "URBAN.TAB"
  "URBAN00.MAP"
  "URBAN00.RMP"
  "URBAN01.MAP"
  "URBAN01.RMP"
  "URBAN02.MAP"
  "URBAN02.RMP"
  "URBAN03.MAP"
  "URBAN03.RMP"
  "URBAN04.MAP"
  "URBAN04.RMP"
  "URBAN05.MAP"
  "URBAN05.RMP"
  "URBAN06.MAP"
  "URBAN06.RMP"
  "URBAN07.MAP"
  "URBAN07.RMP"
  "URBAN08.MAP"
  "URBAN08.RMP"
  "URBAN09.MAP"
  "URBAN09.RMP"
  "URBAN14.MAP"
  "URBAN14.RMP"
  "URBAN15.MAP"
  "URBAN15.RMP"
  "URBAN16.MAP"
  "URBAN16.RMP"
  "URBAN17.MAP"
  "URBAN17.RMP"
  "URBAN18.MAP"
  "URBAN18.RMP"
  "URBITS.MCD"
  "URBITS.PCK"
  "URBITS.TAB"
  "U_BASE.MCD"
  "U_BASE.PCK"
  "U_BASE.TAB"
  "U_BITS.MCD"
  "U_BITS.PCK"
  "U_BITS.TAB"
  "U_DISEC2.MCD"
  "U_DISEC2.PCK"
  "U_DISEC2.TAB"
  "U_EXT02.MCD"
  "U_EXT02.PCK"
  "U_EXT02.TAB"
  "U_OPER2.MCD"
  "U_OPER2.PCK"
  "U_OPER2.TAB"
  "U_PODS.MCD"
  "U_PODS.PCK"
  "U_PODS.TAB"
  "U_WALL02.MCD"
  "U_WALL02.PCK"
  "U_WALL02.TAB"
  "VECTOR.COM"
  "WORLD.DAT"
  "X1.PCK"
  "X1.TAB"
  "XBASE1.MCD"
  "XBASE1.PCK"
  "XBASE1.TAB"
  "XBASE2.MCD"
  "XBASE2.PCK"
  "XBASE2.TAB"
  "XBASE_00.MAP"
  "XBASE_00.RMP"
  "XBASE_01.MAP"
  "XBASE_01.RMP"
  "XBASE_02.MAP"
  "XBASE_02.RMP"
  "XBASE_03.MAP"
  "XBASE_03.RMP"
  "XBASE_04.MAP"
  "XBASE_04.RMP"
  "XBASE_05.MAP"
  "XBASE_05.RMP"
  "XBASE_06.MAP"
  "XBASE_06.RMP"
  "XBASE_07.MAP"
  "XBASE_07.RMP"
  "XBASE_08.MAP"
  "XBASE_08.RMP"
  "XBASE_09.MAP"
  "XBASE_09.RMP"
  "XBASE_10.MAP"
  "XBASE_10.RMP"
  "XBASE_11.MAP"
  "XBASE_11.RMP"
  "XBASE_12.MAP"
  "XBASE_12.RMP"
  "XBASE_13.MAP"
  "XBASE_13.RMP"
  "XBASE_14.MAP"
  "XBASE_14.RMP"
  "XBASE_15.MAP"
  "XBASE_15.RMP"
  "XBASE_16.MAP"
  "XBASE_16.RMP"
  "XBASE_17.MAP"
  "XBASE_17.RMP"
  "XBASE_18.MAP"
  "XBASE_18.RMP"
  "XBASE_19.MAP"
  "XBASE_19.RMP"
  "XBASE_20.MAP"
  "XBASE_20.RMP"
  "XCOM_0.PCK"
  "XCOM_0.TAB"
  "XCOM_1.PCK"
  "XCOM_1.TAB"
  "XCOM_2.PCK"
  "XCOM_2.TAB"
  "X_REAP.PCK"
  "X_REAP.TAB"
  "X_ROB.PCK"
  "X_ROB.TAB"
  "ZOMBIE.PCK"
  "ZOMBIE.TAB"
)

md5sums=('c693a4ea46867f3a470c8e01c4c6f248'
         '50e021ec260f2722a7336da7a7155cac'
         'e3f22daa6e73e2c38044aa76fee532a5'
         '82b5e4a288785b6c4dbf1ce187e0128b'
         'ea8bbd10926b276d805512c4a3f4b1d4'
         '0a8d6a67cfd2dcd13af5ef41c5faa760'
         '7a64fa43bb6dc0f968d4705938062556'
         'b6f6d67e8a21dbbba1123ceb094821b2'
         '072682538fb00704259e1836609583a4'
         '267bb8dc07a6c09e0dadafe9317bbb35'
         'e76b9b7e93bc4ee04c0ad640900996fe'
         'cc194bb192c1603774fca0cab9b32590'
         '77a3cee208ba8a00f5b9c0dfb6bcbde6'
         'ba7143310bf616928237056c12537034'
         '5e7c72fa8f12192d2f2c873a052aac9d'
         'ac4c77781e84289ec06d70eb83a8ae39'
         '479cade3442cdfaf10074802c08b0e34'
         '7ed89fab536e596c77f19f1013342b33'
         'dc8c1b412dbe877f341dd660646e3017'
         '2e6beb4104cf7f7d82995a8e5bf9473e'
         '27a7ca24219ccb37731c6f6496aa1550'
         '3faa7d19996ad65dd70176248633e73c'
         'ceacb3d5e0c589ae01ac27b5290cd857'
         '00451ed6211e66a5a7f4234581d1b041'
         '390c8890222cbdc239daf22d0cb46723'
         'd973a4bda1df0711e3ff1256e6a7db83'
         '667aefa3e14317e9504cccdd2b8522ad'
         '598267ab2faf15b472ba2f04520e2809'
         'f393cbfce4ffac299ebfad8cf0d46895'
         '71c15b30e9314d4189bb96ad22303926'
         'c2b9c81703c504a7ff6aa4c62082cedf'
         '7cb90b8591f5682683871c539e102d7a'
         '6a2b1ec8182f5025ee505c6949356925'
         '1cf2e272c30c7d1d38b34c4a1b7ea24d'
         'e50fab4aa04d080a7050ec37ff84f7aa'
         '205dd6a3dd72ce2725d722eb9d202ce7'
         '777b72e47f209e757ab3c1b16e820da4'
         'be045ca7c1d58f63d1a53a497805efe5'
         'ce9f77cbe6e04fdc0f06ddb039d7c020'
         '83c73c51bbe1fd498de70aa2a99bcd63'
         'c600fb026d3857d3eddaa34caab24c3a'
         '6536a51242e32524e120301ec2858d9b'
         '80b9980778b54403f7ad6a170bb79a93'
         'ba8ab454b2d31f4ce61b6afc2f61bdcb'
         '1a2b9115ca2aeacc19a1e251b0df8ae8'
         'f9487841c42d23329278589655d60fd5'
         'd0202010ae2346a0f24cbf91d082bac9'
         '517aadacd81de60a30a7f348307d5331'
         '374fbf1913c2f12424e4161895efecc0'
         '447d0793b3b566e6d9ce75c60d08ff14'
         '8dd3c445930e492d3387aec535a854f7'
         '69d4f0d6ae89b517d07436498606afe4'
         '69f5f873566911db56e7e65acee60204'
         '6595a35efbd4214112b7940f04f7fd7d'
         '4c9af3301376bbcf8315a73ef7d1cf6b'
         '937d3fd05074a9cbdb5d476add998756'
         'a895aac99e1c38a1c043c83a2d58688b'
         'd0b2e26120542a65e87cc022264bcf8b'
         '3d983939f05b67e01a1d37cdd4bf39cf'
         'b624d1c8196532e8e26346eff709b526'
         '4cf25ebcb8d34182fff33c7b48ad0fd9'
         '4afcd1dc68953038a17e8387af8dac22'
         '9865096c8b52419e2f45286e4bcea5d0'
         '0ed764d01078f1b98ce78f32da690568'
         '89e2190887e672050a0636a97f4d11c1'
         'f18dde05de27cd57d72164b7b95e0a0f'
         '2e8d5b24b78bf8d809f224cf18e21bbd'
         '08e519ec93a85634f76778072ffeb2eb'
         '60cff79468734bf294dd2c9d802bfc2b'
         '5779489e3cc357e0e4bb02323dcaf781'
         '88c65412b3be4de194993fdb46f7d11f'
         '5ac617b6a39ecebb311ed1cf61ed52f2'
         'f8b5c8462492a704262fda7f3b86ce90'
         '9e770a5f6a73f5a6f197c3bc45c7d76b'
         '8824f0db663d0b3bee04444b13d27e3f'
         '55c398c0e95cb2cee9b43a55b0cd4022'
         'e246830e78f46d28ed43c2409045660c'
         'a90da98888507a87d3851e243ed7a0c7'
         'f1c7f8693c1ec635e31c774435dc5879'
         'b52cc7820faaf53d8c061e1dbacc41df'
         '160729cd517cdcb359039bfd194c4c16'
         'c56a188e0244d420d0756e58a0a118d0'
         'e41ea8e3a7c4e2486f468c5b6b65aeec'
         '9c5e7b4166000ad286d63b05d175119c'
         '76c534ded8e806c35ff614bafeb4d115'
         '4301465fdb3ee791f0a424c6a08088ac'
         'dc6a4f8a5c0ce58a9f9fac9ad5b2eb46'
         'af6e3ec952bf7963d336ba507eea88f3'
         'febbd56fd781ee45d062fe4c00521f28'
         '18c03252bd559fa5f4362c0c92f3ceea'
         '0823e6c1521fa28d5bc730e283c59f84'
         '1afbc0b17fe91b801a29604f9f975722'
         '6f00f52240e297174cf7e5c8292b66b5'
         '2164eb9bd7f7715222eb9193f2aa76f2'
         '673a8fec3074beabc2582af2689dbc73'
         '4a0d10c4d0f9e9cd14cf4a72bbb78492'
         'd465f57491d2a1fd49dbf3c61a8661ce'
         'd73b8b686e3f585f0a88bb98fe990040'
         '010cccc1df5ee511d54d3c5f8eaa2e7d'
         '11d2b0c342aa2270af8e6c85b21234d0'
         'b3087fced68d68a5f7c6f369b8d9ca7f'
         '959af7ff62e91a5dd8beb78352c78057'
         '056289900bf7145dffc4de7316b52515'
         'b5c25b7964a16d6070b9811e9a52f050'
         'f4ba8182da37e7d961eff092cac1aaed'
         'a8121396db566ee41a0a383af4aed07c'
         '1d5646c5e6884a46f2ad2b00b52c1740'
         'e45f22b78376345c01903aef30071af8'
         '4f06072f7826ec79ea8c8b407c630b70'
         'c9ac4e850d7c3895ab7130a67a627789'
         '3da3e88d457e131e417b5b1d5409764a'
         'fa34988360a3b35d9e0266ace6e9281d'
         '1f67a551efa31862ef57404207669b42'
         'ade1723bb818128d943d2bef427d411a'
         '59a4360f50a1560cab97f59919344c51'
         'fcad31371bb1f52d290a8d4988be4ffc'
         '1e19548c001685837786fac485cdfce1'
         '93dccebd0061974959abf2c8b615b871'
         '75e5f45de6f135cbb7c29ab559fcf7f6'
         '643d680dc45e51edcfa7b2b8945575cc'
         '4e840146ac2e4925d48b2fd2aebedd85'
         '78575686fd30e641b85bb7537e84c95e'
         'fe3a24aae8d573da70e1924cf2dd9cd2'
         '3f4c839fdf42ec68fa37d0a0ed6a1af8'
         'fe3a24aae8d573da70e1924cf2dd9cd2'
         '14f68d626fb646161aa9b614ab8dc65c'
         '68596632c4a7e3a2f6a1213a6a295d2b'
         '018f312775120dca0cba2a5381e40fdb'
         'd9b31fe696a8832bf7858db7bb3ec1a3'
         'a7980259c04518f2444b07dd2b3486a8'
         'fe3a24aae8d573da70e1924cf2dd9cd2'
         'ff36e0778bcb29a52af49277452c757e'
         '1e19548c001685837786fac485cdfce1'
         '92b3500a9dd8e47687aab54aed093106'
         '5379937f0662380292550016b91ec720'
         'deef21ae62cb8d61e84818edecf6c1f6'
         '96cd10395c47a5d30b3d82d51562cd20'
         'e1fad3ccd8f05469c34cac9a2d4d4b9d'
         '4707a7331c0843ab1d050ff76dd3ecdf'
         '405b2d5f7bfe3f0bae1828dbe639617a'
         '63cb3ca4b0205e487ba57aeddf30fa6a'
         '57787a7050bfc407f5d7ee3cf856f811'
         '5b60fa2cf9d2a0f55f2ea3d93639bf8c'
         '793540ba378eb660de1be0c32f09ea71'
         '8d450bced8575abcdac5cd2df7a5ef21'
         '263311a749d7f8e60720b508ea87725c'
         '78d8527e0e7de2003ccddfa8b6a2681d'
         '38585c5a4f90fd584b7b0535e777b0a1'
         '70f8707673ff4deff09c9543a4852419'
         '55a0c68adc90147abf6598071f4bdf70'
         '7541428b953647cbc7bd61140a39176a'
         '94e7ddda33132a09dbd585ade1546bb3'
         'c76318a326cdd5603264d5275a31bbb7'
         '9fd3de145a90b528c827a0f321f1e130'
         '00666c39354f5ac09c2b23c4a2f5cfaf'
         'f2d674337281a7a7dcbd9bb9baca9955'
         '309d8e942a5417128f384443ae27e6c5'
         'f81607caaf2316ded7d27495415bfc0e'
         '309d8e942a5417128f384443ae27e6c5'
         '5d52beb2a361557d4206de381cdf77c8'
         '309d8e942a5417128f384443ae27e6c5'
         'd74f8587e99877615bc038e566c661f9'
         '9daad328d97e6688cb9b05808ea9da23'
         '5629fc898de785340b8feff749fb9a56'
         'ce908ff7662764205ab14280642407b3'
         '3f455dc4a74a09373a38099f2ef82d34'
         '234c35d1b32e921ec55e00f0bbe8df7c'
         '430a05b4c613d09651145eb306cdc369'
         '1e27e125e7895298acc8d08e07323964'
         '5d9b9681eb6490a2fd8db2b36705c532'
         'abb43ede61e03d63e1656899585cbd15'
         'b1a8c2dc8968fbe524d4405fb3769b94'
         'f2a5dbcccf90d6390d8b6cffd83449de'
         '4b65739bea09acaede79086bc87e0edb'
         'e6dfd1ebe1711611342d584d0ba15755'
         '6572202cf2ba2e59195914d16eb45203'
         'd090363a9e19ead10943fa822b439eab'
         '5aedc0e56a1b38bf58c8a8622df5eaaf'
         '809019fa243bddbe8b40ad0883719c0e'
         '836de79682654e9c101ab8c581978ee8'
         '94cb11d3b347621d2c6239f1146d9757'
         '84e8d530fe986843df4a607054fdbe94'
         'c5bb339f464ecca0c8059f908682a7c5'
         '9a164bbb4d470f50ee2f78c3a942431f'
         '1471b390591787eb1f95430370965a22'
         '1770cf9f3a18350c7afa54b0e271c359'
         'da7cbe5d5ff2761f08569bf2355ede3f'
         '0b1579ba74a39d751844056a2c54afd0'
         '5092edfd94dfa7b12275d9413d91586f'
         '07e4a853c8d75e6025b30bf977945995'
         'f7013dd9b8704d3ba780ae3f5bfba97f'
         '50ba7e7f1ca51e29b6ef11ce4d628d2b'
         'd47fed94442eba13c9f14d379507ce27'
         '11f8beedddd50f046be5110bf33457af'
         '3bfd6bd182749c8c3b6b7e4ae453b3c4'
         'e9e1fb1ff3060ffc8c1ed85af7c17255'
         '219123b920943d57dfb4d07d6997b263'
         'b022be6fda2eca980323fbb371626636'
         '79d84358741d56574f5cab5c8d03aebf'
         'b022be6fda2eca980323fbb371626636'
         '426118ef0d6e9092a352f1a58a5efaaf'
         '309d8e942a5417128f384443ae27e6c5'
         '1d5a0ea43ad585616e83eb55b6097aac'
         '7b146256fc7c67d2be075acc93b02e73'
         '398f5900b53936023c750b85b0e83f55'
         '38b5c51744727662c27e9832a6853b2b'
         '314563890faff161915cb6b7ee8cc154'
         '896608ef71c681ae71b9764abd1206e8'
         '4c4f43dcc9d51e560941b867dca23b9f'
         '7ea708917ea08a581fbba3c45ba7d509'
         'f7ef6e0e71d0bf9f27574971628a59e4'
         'c6c1a9a3a27510812dd20a4ce0256a07'
         '00336ee4235e46138efcddaa62e10169'
         '325ddb92427fbc39a3c77798d4774137'
         '9db62ce4ae854246dbb929f24e994faf'
         'abb43ede61e03d63e1656899585cbd15'
         'e58609faeee3878362ed2df423b4e0e3'
         'e6dfd1ebe1711611342d584d0ba15755'
         'df1eaee8183a457a309b46c619f3f6b2'
         '28ce0700fdc4b3766ecc93df599ecd63'
         'eacbbca8d2de655cda7aa403702bec46'
         '6ddb11139c33b43a6f7aba8629cedfe7'
         'bf2061f7709b70bd8a6e69106842b549'
         '3ee09171983ecdd96256ea2183987abb'
         '8a5ac3b9180f47971758d3b11efb6068'
         '39347a710141ec045847cde0cf7fea38'
         '2cbd3257e995eb61d9f0cfba123d223e'
         '1cd8dd5069970d0f2a6983339057a34b'
         '4d38f5bc9c19244d77727e50e9a58611'
         'c7b320d0a7b61b22bb881c11093bd340'
         '4982e0bb29f414678126b41fd3fc8192'
         '0a110ec57a2328589f1f07678b5dc16f'
         'ed98950fe927da9fac6b38134b92528d'
         'b0dfa6b551a44066700f1ba6a3287fd0'
         '80e531199ba3b4c1bddc7970761dcbef'
         'e7cf855f16a0e1fb29f07a6c457abfee'
         '347712041a2cdf49f6d4df1de6ffe988'
         '3d62dba705543384882d829662b2e5d7'
         'e74d727808e4526f210773134b3b9bb2'
         '553b4b16be864558b6a6774d75b48a80'
         '7280f31a2104184e1846e1d06596d81a'
         'b797298af6dadb6d4e82339f975da449'
         '280d106f5c7af410181209f7c49f0508'
         '5356084220d634fc9011db4e102ca55b'
         'f45e02edccf18796f56b8de3ace7a1c5'
         '04b8f096db1fc76b7a2f1caac40c41bd'
         'd721eb4d39caccf8efcb21598a4d0df1'
         'c67d028828b8e9dc101342fc60bfbdd8'
         '661bc92ca049725ee3a51efba8bf87a1'
         '5c6b4c3cacc330ebb3917777d7066e84'
         '4a6b3ad33a23b008be75f80a590fddab'
         '36e4bfcf7fa8361b3fdbc5e233c3ee37'
         'ec45c59ecc38708ac65be7dd9eafa1d1'
         '101d67c052f68915c41b80aa0f8b9bfe'
         '0aa80a9eb4dcbe754d862dd350b7cc86'
         '93d0b58b4ad90c521b177a253a4c957f'
         '81cf9f33df16a36a48eafc32c6d8e6cb'
         'ee856b6e9ac7e95da618a749af707054'
         '6f544b1119753c611977f64633d1929f'
         '67a6b8ceb85c8e572bf4e90913a83a8d'
         'b022be6fda2eca980323fbb371626636'
         '6e5a20c1e975b6348bd65b8b3abd54c3'
         'b022be6fda2eca980323fbb371626636'
         '423b6331a5131be0d07bdb6b9fc02579'
         'b022be6fda2eca980323fbb371626636'
         'd27f312a5b9ab97094921c7839494ce0'
         'c6c1740fee16ad360f01db70520071f2'
         'c87b1000fb8ae5e345d3a53c99f4e041'
         '81b517afa516d5f7be12805827da6141'
         '521a86b0eb84f8a4e1a1fc76af513cad'
         '2bc2ff0f7fa690b7062fa5290d8f7611'
         '086a21205d7bf1fcfe4d32ed5390cae7'
         'aa86fc2fdb8febdb3808623a45b4e1fa'
         'e89be88eb2466d80c91e79217c2f560a'
         'e8f2df41f5d690e23ca02f0fddcfe2b8'
         '4c47376f4ef2410781dd2abda4d46390'
         '9ccfdd14706aa5613b2b043eabc9aa3e'
         '5fc723edff6f7866fa4d4b1f13787e33'
         'a34e6283629afe13585abf75e5a59c42'
         '325240d0dfac1bec007ad26db31544e2'
         'f4fe901fc63f2bd2096da94fe46a70d0'
         'b98c5789f8c1546d9ac72c09d7ca54c1'
         '640080a20810e36161dfaaec603075ee'
         '15a7273a011f55011e5301b5d7b4672a'
         '34f7a464e9c24c6bdfcc0fc4b91ecc97'
         '7c26cc92de6e2acf406691163e83842f'
         'd489a494938bb33c741faefcefcb583d'
         '80324f58dc447d3624691d20fd18862b'
         '04871b61227a52de69c1219030f76c19'
         'c33485164f6eaf1ff7ce131c2bd6239e'
         'af475e1583ef00c4c8cf74c42201f0bb'
         '34a832c22a515d6a4b74a03f70cd1276'
         '691adeaff8e3342e4d3e07f76c346e0a'
         '27b759a7b025bfde6bc412b86c8cf722'
         '5cfb0273ab01e2d41d19a5fa564dde68'
         'bb04d2762a917bdf3fe78226f23bbd15'
         '10a7a5d15a10ff4e5e09a7e8152aa7af'
         'a589d9888641be2deaec0e4ade9f9a28'
         'ed7f478b06fe47c222daa39420b138eb'
         '9036aa2965def08524077b07aafa0ded'
         'f6c7cb7b876d1cc6530a6218705bd399'
         '4813900b4256e95abcdc504dab713b01'
         '300af3da23aae032ddccd5207759b61a'
         '6da4dc4b1089637770269fbc188c02a9'
         'f984ac404574c0bf436407b7c3dbfd9e'
         'd435d221d3f3a6d6c402b35df1c36a56'
         '843612d9b9f7d521e83649f4c0ea5c50'
         '1a7fcce72a8fbf343b09fb635f751712'
         '8aa8f99ea0160aec56a2e283a698a88c'
         'af542512c9461f07b91bc7643ba293eb'
         'd8811d0ae15ccc381fcc8b53b01d3f7f'
         'e2e8fb28176275264a6f61715793277e'
         'f9339369d3e6f691e9c0a9b2aa1da093'
         'd4c17c51cc54791884da993327f0d092'
         'a1e7e8335b01db5d6a0bdf44fb1a475b'
         '5566fea4b416bb456c0d0f1bd3abc20d'
         'b022be6fda2eca980323fbb371626636'
         'ca82f8492c506a6c2229839b679d84ae'
         '309d8e942a5417128f384443ae27e6c5'
         '5cdc1255e52e695b07698fbf2178d84b'
         'f41f6a651a84de8ab0db84ce71913520'
         '74bb18b97c8c9466d65db1296afc0034'
         'a208df23eed97f5b39f251098f647f5d'
         '1db605512f0386f70ffb08c2567fae06'
         '1f56179cbf797e6fb569177273d45799'
         '08a28be94ab7c57f0a07589fefa0aaed'
         '4feb37704727e6d7a400174baa8fe81f'
         'ed3484b3647a1ae8328dbdabc53eebe3'
         '0e6ea23d00bb9daffb7fd538f43169c5'
         '16b3f1499cc8642659c82d7f0044655c'
         '18c58c1970a1c6b94b27e3b68b7c84e0'
         'e24dd74b3b0ba74c5b79d07a784408a0'
         'd5b42dc7cc2fa2576bdb1f28f132eacb'
         'afea7c12910c5caee0452fc7ba2efbfc'
         '3be43fc22ed43524194f75c166586007'
         'dbbc4f194423448d00ea821d919bde87'
         'edd8b42866211ada5791bd29d91a2407'
         '335d0aab2fbe2f6de5b88c5940f103e3'
         '1a60956012205c2755af53e74b28a9f2'
         '304e0256bb001de705d16bfa829a02de'
         '33f8f0087d1b10090d5b0fac89ab12cd'
         '44247f3ff65b00250ed609b53369dd94'
         '2d7fc8e86739aab81c2739117f36caa2'
         'bcdc025760c526f35afa4971e96d5758'
         'b022be6fda2eca980323fbb371626636'
         'f33080b30536ece0de691dbc4371b49f'
         'b022be6fda2eca980323fbb371626636'
         '747993d151aec64f7610c3ba5472e53c'
         'b022be6fda2eca980323fbb371626636'
         '1a0b8357ab2efc1fdfce17d27a5801ec'
         'c5f3d1605f2d9e65442d49f1a3f410ac'
         '353c55c572c28ff0ac12202e884da5f3'
         '9382c8902bb5400b09c2255bdbe67092'
         '0661dc5590dea04b296ff7542cc8c58f'
         'c482c2fb32a4edaa36c256bcc3ab8413'
         'a0bae6d593c812cb7ac06cc45968fc65'
         '8a9789810628d106ae91980f4ce1ca38'
         'c278c43e7b9fe2de38f1cdb88c53041d'
         '1f1d44895e6f8e4f5f6be93c043d24a7'
         '64e7823d4a30ff3d34aad2f322747c59'
         '3a7f7dd4d60032f95f8be9f4310d4833'
         'fa05dddd83eece549e4b62ca4a02de86'
         '15fdfd81007a9c0793cf77fb03ad3f3f'
         '6bb1eb6410489f6e6e51b837fd4e2443'
         'dfe6ccd4d5a97cbb49758d885eeae08d'
         'ac44c1e29d8cb7cb65f6f98e6b8c03dd'
         '228ca08662fd0414cad151318370d27f'
         '75a2e0fff3a587c36d005c169edcf71a'
         'd95856fd6fc4311014f8e1836bccce27'
         'd0d3eb55cf4429d852a311397a5c39dc'
         '7b876360e2244313b66cc6b8cb9becc2'
         '77c96e92eaec18c7fe4d0b47bb5ef6a2'
         '3bffcccf16658237ab4eb86c43e64164'
         '17c294507f01efd8db607e0ccb19a3cd'
         '8f516b151eb68e2e0ec37b3b76e06141'
         '89c3a59737f12808c5a022a80e3d5031'
         '20eb0736a6609b482ce0545929957470'
         '81665eddf4a2b5a081c78fca129139b8'
         'c4b98b14a8d2fe84949c395b185c05d2'
         '093a152435b3f6da8d569b30d6551f58'
         '76b3258c37142c33b2624b21310207cb'
         'e53e37a60fd84e0f7b546e2dcfd267b6'
         '120b593bf3771def6eeb385aa5992b07'
         'ca9d42088b7f309caae2ab4412d8f2ae'
         '82c5fd2952bca4af240550bddf7d8167'
         '6c0778d0e70b741025061e0a4ddb7a2c'
         'c5df40a4f1609c3377b7b1a627c2e621'
         'a76a9155538079db8fa5ce08bd3b56de'
         'e6b2193442aa7dbb86482ea91ab53605'
         'b1e17062836723d5b30f0add82b12a7c'
         'cd0a86952fba988349837c88800ab99c'
         '0830333c3af1cf4bd551e0a8ce8c9fe6'
         'b022be6fda2eca980323fbb371626636'
         '7458697e1915df3d1bc6761068247a06'
         'b022be6fda2eca980323fbb371626636'
         '62f7420718ad2964541172fb7fdb1749'
         'b022be6fda2eca980323fbb371626636'
         '86a6d6582d439af2ad1d650a040ef34c'
         'a6a27bb724f0eef354023d1043a1bbb8'
         '35831ad91fd5044bba6eb44101c94dbb'
         'e08c563bdb48b88c4489ab849b761937'
         '6799a4e27685d1875add4a06642eb875'
         'cb2690dd23e073a351e5e869cc8b193b'
         'f12bea1c05d2b27766acc690b2b191c9'
         '234c35d1b32e921ec55e00f0bbe8df7c'
         'da54561638a889855e9efd60973c8235'
         '234c35d1b32e921ec55e00f0bbe8df7c'
         '8ac603beaaf08909eb786c34ef24c73c'
         '1e5be485cee2f132bd6f26c3b4275fc6'
         '809e1eee76ee4bae1c3364d3b81dab3b'
         'e164c38ad902f847b64e92c57ff40cdc'
         '8e895ec14c3aa3df26978dc6dbc952c7'
         '87de5f59b5af11ef518f1859ee2b985b'
         '46dce54987878f59f568fa9874e63d3a'
         'd7f446dad5814bff85fb4249b1ad14a1'
         '9a8051ae917782e71328cb7fc4f2a918'
         '13eeb8b38e32aeee90797221aba00750'
         '2814f64f67f2246033ad63de2fa981e1'
         '37c97322361b5ea1703cb183da983bf1'
         'd723afa6b2fee0fd3b3bbda091840c38'
         'f0163b0a3c9c1eff1ce1dfb9c049afc1'
         '9987e4fb05e5db3951b09045d1a9aac0'
         '8d642c905bd55222015bbfec66fcf194'
         'b0ac87278386dfe2adf8745018c3c117'
         '7194c1480e6ce2d3e188133ece4fdefb'
         '07cbd4d42bfaa9de6d0d8edb8f8a4ff9'
         'ba2c300b2fee5b508254cc07aabc6643'
         '670c10f725d92b8261606289d97e4195'
         '67697503d92322bb5df0aa72d05ac381'
         '4504a0df16f1f745cdb833c9aa58d400'
         '72c2f4f8ef34003f2314dae526b4a616'
         '32df82ca0c2f9cd7d0586e325fa1e4d0'
         'e6c2aa2f0c194f1588e544e8076cbe69'
         '2bf305ceb9dd50dfc1f6ed849e0da4ff'
         'f5bcace36d84cd03a7f466847d50000a'
         '5ae490e16959e1961071f0172c793c94'
         '41520d1144b9438117a2844c02e030a6'
         'd109329c413b4720cd189e4fa8cbbd13'
         'e370493ef03cc9bb870c65eb6a23e192'
         'be8dacd43ff0936faf52b960872ad180'
         'b6d6f541d846728aabd325bf1109a692'
         'eba918d123f319ecd053a49e71c58a84'
         '1ec6a29bc71b25ef1cdd73874fd5be47'
         '0bc607f9a03cac159c36846f95e74ef2'
         '322deccf4813bac7e0b7d968c5083ebb'
         '65aeb6487b19ee4744cbfcbf69223127'
         '504ae44a20e31e9680a6c0957c6f92fb'
         '2a5b87d32cde9750c7b07d0dd9310b06'
         '0ed4bf53016f11dfb3147a23f58182d0'
         '88dae1c5e334375bbeaffed313ec24ff'
         '2020d2a4c835f7357edbf214e3d16bc7'
         '45f7602937695c6cc71847043d5497c0'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd2cf657b5aa6d84ae24fd8b97d3ee618'
         'd41d8cd98f00b204e9800998ecf8427e'
         '63f71e68b8a9e3bb9d9f454c011ca563'
         'd41d8cd98f00b204e9800998ecf8427e'
         'caf851aa80b9007aac7d915abe75febe'
         'd41d8cd98f00b204e9800998ecf8427e'
         '0e3224afbb5b2f72669e337508ff6e2d'
         'ba35c0018f55e6b114be661d508de485'
         'a8ffe3dccc9732b78f8ee59484a3447d'
         '30607031974391c661c855694139be33'
         '7aeae3ee761f574fd8f1eea673b18723'
         'd2ae5636d532cd19457b1b785c456967'
         'd2091cb6b82323f12782bd48766959df'
         '2dd75060c5aa9f4074dfc7c46265912f'
         'ac48e98509f7a5e30e2d1ff162fa218c'
         '7e5ef67a0545ff49c5e79e69210012c6'
         '61ba564e6725eab7489eea4742c7402a'
         '86cdc986c5d9e600fe58ab4524d4c3b8'
         '0b6d20f84ffc57e66aa8f3bbf2d0f34c'
         '7b46362744b7a86f8dafa17943076e71'
         '0172f9e2fdc1e7f9e484cc92ed451a1e'
         '781ab0273feb1217195d38b240124c50'
         'c682dad0f2d78c1a3f734924e23a3609'
         'a954d95da23f13d58c32dd6636d1ecb8'
         '8c0325a3496f14b3c824b96796ef9d29'
         'aa5708bb83ae58d628ac6bfda69a3764'
         'b7683d2e1d93a5ba3aed7fd7ef788ec9'
         '4dc092f003a1e59cb9927960fc557c48'
         'c682dad0f2d78c1a3f734924e23a3609'
         '8317b5155fe60fb1fea452684a5af72b'
         'a03b0a6ed6a3671ee6fa65fd572e5c9a'
         '657ce5fbf38688267a1afd5ed912b1dd'
         '73ff8de52d8a7477759f21b7b2a2d8f6'
         '5f1c23e761d774e367ae4740dfff6640'
         '27fe63dcf876471fa81c783eb7160cbd'
         '960b18a20d9b70a843c817325ec89926'
         'aa421eb10ce3d31673c8aa35e5ed1ae8'
         '1215eef638bb8bd9e7c6e8d75ca1c6b8'
         '745b841b6257eaaf5f319e8dd3da8e49'
         '81a728e828948f1b11476cbecb7a79f3'
         'c7d3920937cd53dbf1195b3f536b7431'
         '09f2fcc240f0b1306e7031602f8aeb82'
         'b9f0fe37910035c3530d5ef2deff354a'
         'ad77aa4d36af5956b0784282af6f1eb6'
         '16b6acd6df5a810c0fbd9b887bd3bd9f'
         '7671338b8d416b7a6f48a26806802ddc'
         '0689d8f217de590b06483467aaa49d61'
         'd6333341333cb7b345660a3d78d091aa'
         'b1905e07bd036ed268586b1cf827d785'
         'f89f84efeeaf236e540e3dcdf8009640'
         'ee4c755339ae84cdd8457e1529de603f'
         '1cd42cfa0791de4fa3916668596ece6a'
         '06f0c54cc8392f9b85af7a5c610eb140'
         '1a28a777f75f42a958a86b1bc9a81ffe'
         'a8df99efcfa4e8de558d57611e98fb49'
         'b1352cbc4404333f68200f136077850d'
         '72ebda2670540e10f4877dcbd626556a'
         '6bb716b25ebc210b77529fbe5104efc4'
         '5c4b7fee317a8e7a6d59e36ac2507287'
         '57b45421d17591786b1ab0bc51597c5e'
         '22e5c03ab1568e2ec42d20bd56b24130'
         'afe77b9e23560721c60e9656e8e5cfeb'
         'ad310ac0f82abe91b2566ba0bc1cab2f'
         'ad43c825834a43d793fa814883054939'
         '55f43468742e5a9d95e4f955a49f482e'
         '1dcd25153c9fd888422d396d2dc88a15'
         '863e26224be0900a1d026c50258eb3da'
         '6a78b506b07dd9f2451a75ca16c36cc1'
         '43b599b418fa379c2734474f4ead3345'
         '46427c0316b7d8552652d95afc24c4fa'
         '08f2d83ec3877152e43659d07311ed70'
         '29a6fad3ca6f2fa287159749695b2e30'
         'a220696e5a1e746cb1f25409cd07cb6f'
         '6008e3eb1af1d8044658bbd4bc1cc5cc'
         '824d807ab75df715b7ff5610ba82d35d'
         'daa69ca6b18fd8afc6d26a78d56d4e38'
         '0fb603984aee1f44fba203d00ad2b658'
         '71a306e101efcb2f11a72507979a75ab'
         '84f84fc2b1682b2c9d30e327848242d7'
         'a8776a261738d7d13567d87a34acf189'
         '45e60be3ef7cb94c3e459fe5126225bf'
         '78074e7ae21f00ada20392dc595989ae'
         '653896150c3505509bf4b7db484d5a88'
         '5a1e29bcc8309849211158b5c1d41118'
         '5378506956de5330469b84182f304d95'
         '771c5b630cf2d8b5ea130a7b4b7233c0'
         '77102dc234b6db35db025a55ee1b8037'
         '3cb55e82a1d20a3e44296b7c8985d31e'
         'a85607bb6b1c87b5a7316adc372ee9fa'
         'fdee087c6c9d47c31e9e2f70bc11e7ca'
         'f6f6a3dd1b202354afd635dc10b67a9e'
         '3a92273b12d57e7fcceedb6fc0442fce'
         '68082b93461307d18b07477d842dea55'
         '20a5717f56a9675125ba7b7663a2e201'
         '0c993bcffbdd2d6ca13fedf75615129c'
         'bd0a8b015564dbae711a620260a03edd'
         '4a1114ad0a543f95bad4b3b80208ec18'
         'c5eeaf1d512a3cc44c2af4d242595f2b'
         '8f0e92bbc23ca37386834bcc7ff1857b'
         '7a0564579650aa01fce9544b2ba83fe1'
         '0c89cf03ff1b67ea05ec33acd2c45538'
         '532501413d8984bcb199199994059348'
         'a0a76d7bbeb7b181f3ac4fc1d1525c67'
         '979be071e79a51df0ff561b74881e80e'
         '4f5648a80768144301b3cceb5eb35cc2'
         '7d3c2c4311413cdc724c8b4480c05827'
         'a81ccb6a640dd49e413310780ec66aca'
         '6e2a14444aeea612d64f539cb75e7293'
         '7ed89fab536e596c77f19f1013342b33'
         'e481ca3147288cc2b6957d720872e175'
         '5e3b66770ca245b21ebcaa7c169546a1'
         'cbc94ba50d8a9d2ec4e66e0a14abc338'
         'd28f2bacab7cdaae1628772ac19f6650'
         '4508f0368b79ed657160bd18c3b17e42'
         'b037c972845ca86cd3066fc905ab7709'
         '6f1b520a0a6e4c60940f714ec23110a6'
         '712578e67df00cda72583dbfe887624b'
         '6f1b520a0a6e4c60940f714ec23110a6'
         'ed64ac5571b8314f10234d8c24f52ca8'
         '51139fd21c528c512062204061c65899'
         '01f258378338ddba489cd451de3ceee4'
         'd051b1d9894905b04380506daacded53'
         '4e55b97022186ff22e4b51218e095f39'
         'd051b1d9894905b04380506daacded53'
         '648f6330819f69d482ee288ef60d74b8'
         '5bae7ce749f2362aa5bc219cd551034d'
         '49823ec6fc010fabac94b58d653234c5'
         '7735dfc0c734e2d1e5f25552c875f8db'
         '99fbcce7140619aeab5fbc64ca52fbb9'
         '163a7b2640bc59de7c1094bdac53f263'
         '23ee72ea437fca8ddc592f95afd68a52'
         '2e337e04bf768410fc755dbb6a37dcc6'
         '113cdd8898b4f7e297334f7191be4eb3'
         'b1be135810b2595d8bf15eec6f2c19c8'
         'da8ac992978343bf06fa8af75f9d02f1'
         '18843b3044a703a7abc8d01949a9d56c'
         'd0dfdd480407eb351376ab5fe19118e0'
         'c3893f0e0ff822d16d892a87401ed5c2'
         'def85d74dff9e768df739a9130e1e0f2'
         '5cb97e94429c5bd3837bdf6da9da175b'
         '77896333db512bf3b6bb5a213b25d118'
         'c2301d69385ad646eda76dae668eb35d'
         '065ac68f318ca57a87b711cf7932b240'
         '0c3380297aed8d94bd56e569904db1d5'
         'd41cd66452242356ae0650ac74143d92'
         'f621866489565f905b9e4e11faed6be4'
         '6adf5ce34ff333f53ac4c69c90ba7264'
         'fbee54fb6b73b126adb8b67fb1df5417'
         '02ec6086b2faf463c43575c3b07294e0'
         '5a24f33315de0a37d22842c626cf1320'
         '3986072b72f002414df8a63809f6de55'
         '9ce4c7302703c6bc26f1b5de6bcc2bbc'
         'd66a99d8f035f5daf308736890c01af5'
         '8636c03eefa7fa13a396b249c56926af'
         '132b961823a904495377cc64a5a59bc1'
         '8ed97009271a570d2c744b16a12652c3'
         '3d58690b0eec4fca9715874c7c8cd4c3'
         '71bf136d986fb08144913ee5127cc002'
         'db0aebbab0c974ae51ac06a412d5b4cf'
         'eb83339691a37dd38a1e6119148b99b3'
         'f3362cd1f32e328f7e896883a98b94b0'
         'e22fe746c2cb64583f6e05ec058979c5'
         '851af2e34dda839274f2079d8043d348'
         '7307fb6be65849c083780da5c1eae254'
         'b29ded3981248ac95a67385ec1ec644f'
         '50e14b2d6c66e48b88664b1d672775c4'
         '4490a90b4d75c85fd0137b65e8400f33'
         '6359e88eb0b166890811f5cfac291d52'
         'bbe504b369a2ee48abe09e425c4e4a7e'
         '0407f830a1567d488f1a450c0f534507'
         '9327d84be90266c1373cdb00124559b6'
         'ab21dc3121a2ae86177318038f81aac0'
         'e235e91e52a4201e5f0a7284447f3111'
         '2e672139e6ed879bfafa24efc4d7f128'
         'b9c4584344ea42460f0ef9da9aa376e3'
         '64282325a447e2dbb81de34a7cb2adb0'
         'eabaec8d66e95981855489b88b2f0ca8'
         '817b7673dafc722187a25cd48905d24d'
         '9626886a4e265f56ac6e3d8e90a4f170'
         '50bd29bf1bd6c7813f1d04c9162e5f34'
         'fef099bdc6b00942aa36e4c136606c1e'
         '036963c9f7d216f0b5eab9d7ece58c33'
         'e25e66c7d16dcb7be7b888f3b3ebc220'
         '632bafd85a6315c380944aa289bc5c31'
         'e7924b4d020577d513cd839f8cdc1dc2'
         'b838a187180eaa1a8b30f7dfb2d2c5e2'
         'bfac8c2ad5b92a6e15e1e360306e8a74'
         'a3931236c1a771c8b6d44e63613ceee6'
         'cc8c8358f9d9538f7dc79ea37e95bacb'
         '671a10c66c992922af0429da4b57c86d'
         '1bc36f2ad5454d123d9611b2bc17ed63'
         'b1fd2210d1d2182d4af6b2158d16251b'
         '69ad7e03a71e6cf6650f6b5d173ec5e3'
         'af4fd8b71e4754ce271745b568c7816e'
         'c32366dc1661580ef72406752cac83ce'
         '9cd663b6a1240b89c6048149c0248e9f'
         'a74ac6f3d71065845ec7b02939638f5e'
         '0f7dcef3e1b68c6eaaa6b3ebb7d63b4e'
         '46d0172039287b0eb379481adf09533d'
         'b9235c93b8b7c8d87a9bfba4ed57712b'
         'eef13c216d10e0e31dcad2df29218517'
         '4d600e2b15f191bf7955f8bb52cc7538'
         '141da5ddb44964bc808a714041a4ba6a'
         '0ffd478a9b2caef9cae7d1f31d97b6d0'
         'e0c9d3efe75fe00fcac98e2b83501864'
         'd7a261f46e2c9ac7f1fa5710923c0cd9'
         'af1ef2554e508d7ac892b1fbfe487486'
         'f91ee0038da72dd4f1ee8a7bb23b0303'
         '2983110160156f04af546fb5cfb80426'
         'd7a261f46e2c9ac7f1fa5710923c0cd9'
         '259156606d07d0c6d2f7408115c466ac'
         '69ef947664077c67a22bd264f8e72e67'
         '2645754dcf1f1181e580e33bfc03a60f'
         '42ef014420a3b9a7285fa4294d14c0e1'
         '670430864aa3800e11751b474e4efd57'
         'a66f94af439f381b945c0afb09647ce9'
         '6710bbed86ebc85360c3693ed8f89d56'
         '076f06c833052c62efd47f928580c3ed'
         'ff06069a106261a74e4c43d49abd3393'
         'af5fcd7b995ae76990f384976f356976'
         '6062f7004fbf78a05ffc0b59587eb2b2'
         '0fc22cdde3fa4b4ad7614acde9042471'
         'a74c6f2d601461076661e2f4e0bf0a94'
         '4bc53ec04ddaab92c99fae54542fb2f1'
         '60af54dc6d7d3d0673214713d0926bed'
         'c2beb550385aaccfe171449287e60a68'
         '677c3e1c93374237db30c7511faa6404'
         '30efbae728e6badacdc00138f6ab21ca'
         '2356b92a61e3c6820378668b7fa45e92'
         '4bb74d9a02999c507684610a6d0ea8c0'
         '5b79584785abef1a63d8f66cccecea46'
         'df99de4cb437e18ab49e0586b8739bd9')

package() {
  case $_openxcom_ver in
    git)
      _destdir="$pkgdir/usr/share/openxcom/UFO"
      ;;
    1.0)
      _destdir="$pkgdir/usr/share/openxcom/data"
      ;;
    *)
      printf "Incorrect version specified.\n"
      return 1
      ;;
  esac

  install -Dm644 "$srcdir/ADLIB.CAT"    "$_destdir/SOUND/ADLIB.CAT"
  install -Dm644 "$srcdir/AINTRO.CAT"   "$_destdir/SOUND/AINTRO.CAT"
  install -Dm644 "$srcdir/AVENGER.MAP"  "$_destdir/MAPS/AVENGER.MAP"
  install -Dm644 "$srcdir/AVENGER.MCD"  "$_destdir/TERRAIN/AVENGER.MCD"
  install -Dm644 "$srcdir/AVENGER.PCK"  "$_destdir/TERRAIN/AVENGER.PCK"
  install -Dm644 "$srcdir/AVENGER.RMP"  "$_destdir/ROUTES/AVENGER.RMP"
  install -Dm644 "$srcdir/AVENGER.TAB"  "$_destdir/TERRAIN/AVENGER.TAB"
  install -Dm644 "$srcdir/BACK01.SCR"   "$_destdir/GEOGRAPH/BACK01.SCR"
  install -Dm644 "$srcdir/BACK02.SCR"   "$_destdir/GEOGRAPH/BACK02.SCR"
  install -Dm644 "$srcdir/BACK03.SCR"   "$_destdir/GEOGRAPH/BACK03.SCR"
  install -Dm644 "$srcdir/BACK04.SCR"   "$_destdir/GEOGRAPH/BACK04.SCR"
  install -Dm644 "$srcdir/BACK05.SCR"   "$_destdir/GEOGRAPH/BACK05.SCR"
  install -Dm644 "$srcdir/BACK06.SCR"   "$_destdir/GEOGRAPH/BACK06.SCR"
  install -Dm644 "$srcdir/BACK07.SCR"   "$_destdir/GEOGRAPH/BACK07.SCR"
  install -Dm644 "$srcdir/BACK08.SCR"   "$_destdir/GEOGRAPH/BACK08.SCR"
  install -Dm644 "$srcdir/BACK09.SCR"   "$_destdir/GEOGRAPH/BACK09.SCR"
  install -Dm644 "$srcdir/BACK10.SCR"   "$_destdir/GEOGRAPH/BACK10.SCR"
  install -Dm644 "$srcdir/BACK11.SCR"   "$_destdir/GEOGRAPH/BACK11.SCR"
  install -Dm644 "$srcdir/BACK12.SCR"   "$_destdir/GEOGRAPH/BACK12.SCR"
  install -Dm644 "$srcdir/BACK13.SCR"   "$_destdir/GEOGRAPH/BACK13.SCR"
  install -Dm644 "$srcdir/BACK14.SCR"   "$_destdir/GEOGRAPH/BACK14.SCR"
  install -Dm644 "$srcdir/BACK15.SCR"   "$_destdir/GEOGRAPH/BACK15.SCR"
  install -Dm644 "$srcdir/BACK16.SCR"   "$_destdir/GEOGRAPH/BACK16.SCR"
  install -Dm644 "$srcdir/BACK17.SCR"   "$_destdir/GEOGRAPH/BACK17.SCR"
  install -Dm644 "$srcdir/BACKPALS.DAT" "$_destdir/GEODATA/BACKPALS.DAT"
  install -Dm644 "$srcdir/BARN.MCD"     "$_destdir/TERRAIN/BARN.MCD"
  install -Dm644 "$srcdir/BARN.PCK"     "$_destdir/TERRAIN/BARN.PCK"
  install -Dm644 "$srcdir/BARN.TAB"     "$_destdir/TERRAIN/BARN.TAB"
  install -Dm644 "$srcdir/BASEBITS.PCK" "$_destdir/GEOGRAPH/BASEBITS.PCK"
  install -Dm644 "$srcdir/BASEBITS.TAB" "$_destdir/GEOGRAPH/BASEBITS.TAB"
  install -Dm644 "$srcdir/BIGLETS.DAT"  "$_destdir/GEODATA/BIGLETS.DAT"
  install -Dm644 "$srcdir/BIGOBS.PCK"   "$_destdir/UNITS/BIGOBS.PCK"
  install -Dm644 "$srcdir/BIGOBS.TAB"   "$_destdir/UNITS/BIGOBS.TAB"
  install -Dm644 "$srcdir/BIGOB_00.PCK" "$_destdir/UFOGRAPH/BIGOB_00.PCK"
  install -Dm644 "$srcdir/BIGOB_01.PCK" "$_destdir/UFOGRAPH/BIGOB_01.PCK"
  install -Dm644 "$srcdir/BIGOB_02.PCK" "$_destdir/UFOGRAPH/BIGOB_02.PCK"
  install -Dm644 "$srcdir/BIGOB_03.PCK" "$_destdir/UFOGRAPH/BIGOB_03.PCK"
  install -Dm644 "$srcdir/BIGOB_04.PCK" "$_destdir/UFOGRAPH/BIGOB_04.PCK"
  install -Dm644 "$srcdir/BIGOB_05.PCK" "$_destdir/UFOGRAPH/BIGOB_05.PCK"
  install -Dm644 "$srcdir/BIGOB_06.PCK" "$_destdir/UFOGRAPH/BIGOB_06.PCK"
  install -Dm644 "$srcdir/BIGOB_07.PCK" "$_destdir/UFOGRAPH/BIGOB_07.PCK"
  install -Dm644 "$srcdir/BIGOB_08.PCK" "$_destdir/UFOGRAPH/BIGOB_08.PCK"
  install -Dm644 "$srcdir/BIGOB_09.PCK" "$_destdir/UFOGRAPH/BIGOB_09.PCK"
  install -Dm644 "$srcdir/BIGOB_10.PCK" "$_destdir/UFOGRAPH/BIGOB_10.PCK"
  install -Dm644 "$srcdir/BIGOB_11.PCK" "$_destdir/UFOGRAPH/BIGOB_11.PCK"
  install -Dm644 "$srcdir/BIGOB_12.PCK" "$_destdir/UFOGRAPH/BIGOB_12.PCK"
  install -Dm644 "$srcdir/BIGOB_13.PCK" "$_destdir/UFOGRAPH/BIGOB_13.PCK"
  install -Dm644 "$srcdir/BIGOB_14.PCK" "$_destdir/UFOGRAPH/BIGOB_14.PCK"
  install -Dm644 "$srcdir/BIGOB_15.PCK" "$_destdir/UFOGRAPH/BIGOB_15.PCK"
  install -Dm644 "$srcdir/BIGOB_16.PCK" "$_destdir/UFOGRAPH/BIGOB_16.PCK"
  install -Dm644 "$srcdir/BIGOB_17.PCK" "$_destdir/UFOGRAPH/BIGOB_17.PCK"
  install -Dm644 "$srcdir/BIGOB_18.PCK" "$_destdir/UFOGRAPH/BIGOB_18.PCK"
  install -Dm644 "$srcdir/BIGOB_19.PCK" "$_destdir/UFOGRAPH/BIGOB_19.PCK"
  install -Dm644 "$srcdir/BIGOB_20.PCK" "$_destdir/UFOGRAPH/BIGOB_20.PCK"
  install -Dm644 "$srcdir/BIGOB_21.PCK" "$_destdir/UFOGRAPH/BIGOB_21.PCK"
  install -Dm644 "$srcdir/BIGOB_22.PCK" "$_destdir/UFOGRAPH/BIGOB_22.PCK"
  install -Dm644 "$srcdir/BIGOB_23.PCK" "$_destdir/UFOGRAPH/BIGOB_23.PCK"
  install -Dm644 "$srcdir/BIGOB_24.PCK" "$_destdir/UFOGRAPH/BIGOB_24.PCK"
  install -Dm644 "$srcdir/BIGOB_25.PCK" "$_destdir/UFOGRAPH/BIGOB_25.PCK"
  install -Dm644 "$srcdir/BIGOB_26.PCK" "$_destdir/UFOGRAPH/BIGOB_26.PCK"
  install -Dm644 "$srcdir/BIGOB_27.PCK" "$_destdir/UFOGRAPH/BIGOB_27.PCK"
  install -Dm644 "$srcdir/BIGOB_28.PCK" "$_destdir/UFOGRAPH/BIGOB_28.PCK"
  install -Dm644 "$srcdir/BIGOB_29.PCK" "$_destdir/UFOGRAPH/BIGOB_29.PCK"
  install -Dm644 "$srcdir/BIGOB_30.PCK" "$_destdir/UFOGRAPH/BIGOB_30.PCK"
  install -Dm644 "$srcdir/BIGOB_31.PCK" "$_destdir/UFOGRAPH/BIGOB_31.PCK"
  install -Dm644 "$srcdir/BIGOB_32.PCK" "$_destdir/UFOGRAPH/BIGOB_32.PCK"
  install -Dm644 "$srcdir/BIGOB_33.PCK" "$_destdir/UFOGRAPH/BIGOB_33.PCK"
  install -Dm644 "$srcdir/BIGOB_34.PCK" "$_destdir/UFOGRAPH/BIGOB_34.PCK"
  install -Dm644 "$srcdir/BIGOB_35.PCK" "$_destdir/UFOGRAPH/BIGOB_35.PCK"
  install -Dm644 "$srcdir/BIGOB_36.PCK" "$_destdir/UFOGRAPH/BIGOB_36.PCK"
  install -Dm644 "$srcdir/BIGOB_37.PCK" "$_destdir/UFOGRAPH/BIGOB_37.PCK"
  install -Dm644 "$srcdir/BIGOB_38.PCK" "$_destdir/UFOGRAPH/BIGOB_38.PCK"
  install -Dm644 "$srcdir/BIGOB_39.PCK" "$_destdir/UFOGRAPH/BIGOB_39.PCK"
  install -Dm644 "$srcdir/BIGOB_40.PCK" "$_destdir/UFOGRAPH/BIGOB_40.PCK"
  install -Dm644 "$srcdir/BIGOB_41.PCK" "$_destdir/UFOGRAPH/BIGOB_41.PCK"
  install -Dm644 "$srcdir/BIGOB_42.PCK" "$_destdir/UFOGRAPH/BIGOB_42.PCK"
  install -Dm644 "$srcdir/BIGOB_43.PCK" "$_destdir/UFOGRAPH/BIGOB_43.PCK"
  install -Dm644 "$srcdir/BIGOB_44.PCK" "$_destdir/UFOGRAPH/BIGOB_44.PCK"
  install -Dm644 "$srcdir/BIGOB_45.PCK" "$_destdir/UFOGRAPH/BIGOB_45.PCK"
  install -Dm644 "$srcdir/BIGOB_46.PCK" "$_destdir/UFOGRAPH/BIGOB_46.PCK"
  install -Dm644 "$srcdir/BIGOB_47.PCK" "$_destdir/UFOGRAPH/BIGOB_47.PCK"
  install -Dm644 "$srcdir/BIGOB_48.PCK" "$_destdir/UFOGRAPH/BIGOB_48.PCK"
  install -Dm644 "$srcdir/BIGOB_49.PCK" "$_destdir/UFOGRAPH/BIGOB_49.PCK"
  install -Dm644 "$srcdir/BIGOB_50.PCK" "$_destdir/UFOGRAPH/BIGOB_50.PCK"
  install -Dm644 "$srcdir/BIGOB_51.PCK" "$_destdir/UFOGRAPH/BIGOB_51.PCK"
  install -Dm644 "$srcdir/BIGOB_52.PCK" "$_destdir/UFOGRAPH/BIGOB_52.PCK"
  install -Dm644 "$srcdir/BIGOB_53.PCK" "$_destdir/UFOGRAPH/BIGOB_53.PCK"
  install -Dm644 "$srcdir/BIGOB_54.PCK" "$_destdir/UFOGRAPH/BIGOB_54.PCK"
  install -Dm644 "$srcdir/BIGOB_55.PCK" "$_destdir/UFOGRAPH/BIGOB_55.PCK"
  install -Dm644 "$srcdir/BIGOB_56.PCK" "$_destdir/UFOGRAPH/BIGOB_56.PCK"
  install -Dm644 "$srcdir/BLANKS.MCD"   "$_destdir/TERRAIN/BLANKS.MCD"
  install -Dm644 "$srcdir/BLANKS.PCK"   "$_destdir/TERRAIN/BLANKS.PCK"
  install -Dm644 "$srcdir/BLANKS.TAB"   "$_destdir/TERRAIN/BLANKS.TAB"
  install -Dm644 "$srcdir/BRAIN.MCD"    "$_destdir/TERRAIN/BRAIN.MCD"
  install -Dm644 "$srcdir/BRAIN.PCK"    "$_destdir/TERRAIN/BRAIN.PCK"
  install -Dm644 "$srcdir/BRAIN.TAB"    "$_destdir/TERRAIN/BRAIN.TAB"
  install -Dm644 "$srcdir/CELATID.PCK"  "$_destdir/UNITS/CELATID.PCK"
  install -Dm644 "$srcdir/CELATID.TAB"  "$_destdir/UNITS/CELATID.TAB"
  install -Dm644 "$srcdir/CHRYS.PCK"    "$_destdir/UNITS/CHRYS.PCK"
  install -Dm644 "$srcdir/CHRYS.TAB"    "$_destdir/UNITS/CHRYS.TAB"
  install -Dm644 "$srcdir/CIVF.PCK"     "$_destdir/UNITS/CIVF.PCK"
  install -Dm644 "$srcdir/CIVF.TAB"     "$_destdir/UNITS/CIVF.TAB"
  install -Dm644 "$srcdir/CIVM.PCK"     "$_destdir/UNITS/CIVM.PCK"
  install -Dm644 "$srcdir/CIVM.TAB"     "$_destdir/UNITS/CIVM.TAB"
  install -Dm644 "$srcdir/COS.DAT"      "$_destdir/GEODATA/COS.DAT"
  install -Dm644 "$srcdir/CULTA00.MAP"  "$_destdir/MAPS/CULTA00.MAP"
  install -Dm644 "$srcdir/CULTA00.RMP"  "$_destdir/ROUTES/CULTA00.RMP"
  install -Dm644 "$srcdir/CULTA01.MAP"  "$_destdir/MAPS/CULTA01.MAP"
  install -Dm644 "$srcdir/CULTA01.RMP"  "$_destdir/ROUTES/CULTA01.RMP"
  install -Dm644 "$srcdir/CULTA02.MAP"  "$_destdir/MAPS/CULTA02.MAP"
  install -Dm644 "$srcdir/CULTA02.RMP"  "$_destdir/ROUTES/CULTA02.RMP"
  install -Dm644 "$srcdir/CULTA03.MAP"  "$_destdir/MAPS/CULTA03.MAP"
  install -Dm644 "$srcdir/CULTA03.RMP"  "$_destdir/ROUTES/CULTA03.RMP"
  install -Dm644 "$srcdir/CULTA04.MAP"  "$_destdir/MAPS/CULTA04.MAP"
  install -Dm644 "$srcdir/CULTA04.RMP"  "$_destdir/ROUTES/CULTA04.RMP"
  install -Dm644 "$srcdir/CULTA05.MAP"  "$_destdir/MAPS/CULTA05.MAP"
  install -Dm644 "$srcdir/CULTA05.RMP"  "$_destdir/ROUTES/CULTA05.RMP"
  install -Dm644 "$srcdir/CULTA06.MAP"  "$_destdir/MAPS/CULTA06.MAP"
  install -Dm644 "$srcdir/CULTA06.RMP"  "$_destdir/ROUTES/CULTA06.RMP"
  install -Dm644 "$srcdir/CULTA07.MAP"  "$_destdir/MAPS/CULTA07.MAP"
  install -Dm644 "$srcdir/CULTA07.RMP"  "$_destdir/ROUTES/CULTA07.RMP"
  install -Dm644 "$srcdir/CULTA08.MAP"  "$_destdir/MAPS/CULTA08.MAP"
  install -Dm644 "$srcdir/CULTA08.RMP"  "$_destdir/ROUTES/CULTA08.RMP"
  install -Dm644 "$srcdir/CULTA09.MAP"  "$_destdir/MAPS/CULTA09.MAP"
  install -Dm644 "$srcdir/CULTA09.RMP"  "$_destdir/ROUTES/CULTA09.RMP"
  install -Dm644 "$srcdir/CULTA10.MAP"  "$_destdir/MAPS/CULTA10.MAP"
  install -Dm644 "$srcdir/CULTA10.RMP"  "$_destdir/ROUTES/CULTA10.RMP"
  install -Dm644 "$srcdir/CULTA11.MAP"  "$_destdir/MAPS/CULTA11.MAP"
  install -Dm644 "$srcdir/CULTA11.RMP"  "$_destdir/ROUTES/CULTA11.RMP"
  install -Dm644 "$srcdir/CULTA12.MAP"  "$_destdir/MAPS/CULTA12.MAP"
  install -Dm644 "$srcdir/CULTA12.RMP"  "$_destdir/ROUTES/CULTA12.RMP"
  install -Dm644 "$srcdir/CULTA13.MAP"  "$_destdir/MAPS/CULTA13.MAP"
  install -Dm644 "$srcdir/CULTA13.RMP"  "$_destdir/ROUTES/CULTA13.RMP"
  install -Dm644 "$srcdir/CULTA14.MAP"  "$_destdir/MAPS/CULTA14.MAP"
  install -Dm644 "$srcdir/CULTA14.RMP"  "$_destdir/ROUTES/CULTA14.RMP"
  install -Dm644 "$srcdir/CULTA15.MAP"  "$_destdir/MAPS/CULTA15.MAP"
  install -Dm644 "$srcdir/CULTA15.RMP"  "$_destdir/ROUTES/CULTA15.RMP"
  install -Dm644 "$srcdir/CULTA16.MAP"  "$_destdir/MAPS/CULTA16.MAP"
  install -Dm644 "$srcdir/CULTA16.RMP"  "$_destdir/ROUTES/CULTA16.RMP"
  install -Dm644 "$srcdir/CULTA17.MAP"  "$_destdir/MAPS/CULTA17.MAP"
  install -Dm644 "$srcdir/CULTA17.RMP"  "$_destdir/ROUTES/CULTA17.RMP"
  install -Dm644 "$srcdir/CULTA18.MAP"  "$_destdir/MAPS/CULTA18.MAP"
  install -Dm644 "$srcdir/CULTA18.RMP"  "$_destdir/ROUTES/CULTA18.RMP"
  install -Dm644 "$srcdir/CULTIVAT.MCD" "$_destdir/TERRAIN/CULTIVAT.MCD"
  install -Dm644 "$srcdir/CULTIVAT.PCK" "$_destdir/TERRAIN/CULTIVAT.PCK"
  install -Dm644 "$srcdir/CULTIVAT.TAB" "$_destdir/TERRAIN/CULTIVAT.TAB"
  install -Dm644 "$srcdir/CURSOR.PCK"   "$_destdir/UFOGRAPH/CURSOR.PCK"
  install -Dm644 "$srcdir/CURSOR.TAB"   "$_destdir/UFOGRAPH/CURSOR.TAB"
  install -Dm644 "$srcdir/CYBER.PCK"    "$_destdir/UNITS/CYBER.PCK"
  install -Dm644 "$srcdir/CYBER.TAB"    "$_destdir/UNITS/CYBER.TAB"
  install -Dm644 "$srcdir/DESERT.MCD"   "$_destdir/TERRAIN/DESERT.MCD"
  install -Dm644 "$srcdir/DESERT.PCK"   "$_destdir/TERRAIN/DESERT.PCK"
  install -Dm644 "$srcdir/DESERT.TAB"   "$_destdir/TERRAIN/DESERT.TAB"
  install -Dm644 "$srcdir/DESERT00.MAP" "$_destdir/MAPS/DESERT00.MAP"
  install -Dm644 "$srcdir/DESERT00.RMP" "$_destdir/ROUTES/DESERT00.RMP"
  install -Dm644 "$srcdir/DESERT01.MAP" "$_destdir/MAPS/DESERT01.MAP"
  install -Dm644 "$srcdir/DESERT01.RMP" "$_destdir/ROUTES/DESERT01.RMP"
  install -Dm644 "$srcdir/DESERT02.MAP" "$_destdir/MAPS/DESERT02.MAP"
  install -Dm644 "$srcdir/DESERT02.RMP" "$_destdir/ROUTES/DESERT02.RMP"
  install -Dm644 "$srcdir/DESERT03.MAP" "$_destdir/MAPS/DESERT03.MAP"
  install -Dm644 "$srcdir/DESERT03.RMP" "$_destdir/ROUTES/DESERT03.RMP"
  install -Dm644 "$srcdir/DESERT04.MAP" "$_destdir/MAPS/DESERT04.MAP"
  install -Dm644 "$srcdir/DESERT04.RMP" "$_destdir/ROUTES/DESERT04.RMP"
  install -Dm644 "$srcdir/DESERT05.MAP" "$_destdir/MAPS/DESERT05.MAP"
  install -Dm644 "$srcdir/DESERT05.RMP" "$_destdir/ROUTES/DESERT05.RMP"
  install -Dm644 "$srcdir/DESERT06.MAP" "$_destdir/MAPS/DESERT06.MAP"
  install -Dm644 "$srcdir/DESERT06.RMP" "$_destdir/ROUTES/DESERT06.RMP"
  install -Dm644 "$srcdir/DESERT07.MAP" "$_destdir/MAPS/DESERT07.MAP"
  install -Dm644 "$srcdir/DESERT07.RMP" "$_destdir/ROUTES/DESERT07.RMP"
  install -Dm644 "$srcdir/DESERT08.MAP" "$_destdir/MAPS/DESERT08.MAP"
  install -Dm644 "$srcdir/DESERT08.RMP" "$_destdir/ROUTES/DESERT08.RMP"
  install -Dm644 "$srcdir/DESERT09.MAP" "$_destdir/MAPS/DESERT09.MAP"
  install -Dm644 "$srcdir/DESERT09.RMP" "$_destdir/ROUTES/DESERT09.RMP"
  install -Dm644 "$srcdir/DESERT10.MAP" "$_destdir/MAPS/DESERT10.MAP"
  install -Dm644 "$srcdir/DESERT10.RMP" "$_destdir/ROUTES/DESERT10.RMP"
  install -Dm644 "$srcdir/DESERT11.MAP" "$_destdir/MAPS/DESERT11.MAP"
  install -Dm644 "$srcdir/DESERT11.RMP" "$_destdir/ROUTES/DESERT11.RMP"
  install -Dm644 "$srcdir/DETBLOB.DAT"  "$_destdir/UFOGRAPH/DETBLOB.DAT"
  install -Dm644 "$srcdir/DETBORD.PCK"  "$_destdir/UFOGRAPH/DETBORD.PCK"
  install -Dm644 "$srcdir/DETBORD2.PCK" "$_destdir/UFOGRAPH/DETBORD2.PCK"
  install -Dm644 "$srcdir/ufo-DP_PREFS" "$_destdir/UFOGRAPH/DP_PREFS"
  install -Dm644 "$srcdir/geo-DP_PREFS" "$_destdir/GEOGRAPH/DP_PREFS"
  install -Dm644 "$srcdir/DRIVERS.CAT"  "$_destdir/SOUND/DRIVERS.CAT"
  install -Dm644 "$srcdir/ENGLISH.DAT"  "$_destdir/GEODATA/ENGLISH.DAT"
  install -Dm644 "$srcdir/ENGLISH2.DAT" "$_destdir/GEODATA/ENGLISH2.DAT"
  install -Dm644 "$srcdir/ETHEREAL.PCK" "$_destdir/UNITS/ETHEREAL.PCK"
  install -Dm644 "$srcdir/ETHEREAL.TAB" "$_destdir/UNITS/ETHEREAL.TAB"
  install -Dm644 "$srcdir/FLOATER.PCK"  "$_destdir/UNITS/FLOATER.PCK"
  install -Dm644 "$srcdir/FLOATER.TAB"  "$_destdir/UNITS/FLOATER.TAB"
  install -Dm644 "$srcdir/FLOOROB.PCK"  "$_destdir/UNITS/FLOOROB.PCK"
  install -Dm644 "$srcdir/FLOOROB.TAB"  "$_destdir/UNITS/FLOOROB.TAB"
  install -Dm644 "$srcdir/FOREST.MCD"   "$_destdir/TERRAIN/FOREST.MCD"
  install -Dm644 "$srcdir/FOREST.PCK"   "$_destdir/TERRAIN/FOREST.PCK"
  install -Dm644 "$srcdir/FOREST.TAB"   "$_destdir/TERRAIN/FOREST.TAB"
  install -Dm644 "$srcdir/FOREST00.MAP" "$_destdir/MAPS/FOREST00.MAP"
  install -Dm644 "$srcdir/FOREST00.RMP" "$_destdir/ROUTES/FOREST00.RMP"
  install -Dm644 "$srcdir/FOREST01.MAP" "$_destdir/MAPS/FOREST01.MAP"
  install -Dm644 "$srcdir/FOREST01.RMP" "$_destdir/ROUTES/FOREST01.RMP"
  install -Dm644 "$srcdir/FOREST02.MAP" "$_destdir/MAPS/FOREST02.MAP"
  install -Dm644 "$srcdir/FOREST02.RMP" "$_destdir/ROUTES/FOREST02.RMP"
  install -Dm644 "$srcdir/FOREST03.MAP" "$_destdir/MAPS/FOREST03.MAP"
  install -Dm644 "$srcdir/FOREST03.RMP" "$_destdir/ROUTES/FOREST03.RMP"
  install -Dm644 "$srcdir/FOREST04.MAP" "$_destdir/MAPS/FOREST04.MAP"
  install -Dm644 "$srcdir/FOREST04.RMP" "$_destdir/ROUTES/FOREST04.RMP"
  install -Dm644 "$srcdir/FOREST05.MAP" "$_destdir/MAPS/FOREST05.MAP"
  install -Dm644 "$srcdir/FOREST05.RMP" "$_destdir/ROUTES/FOREST05.RMP"
  install -Dm644 "$srcdir/FOREST06.MAP" "$_destdir/MAPS/FOREST06.MAP"
  install -Dm644 "$srcdir/FOREST06.RMP" "$_destdir/ROUTES/FOREST06.RMP"
  install -Dm644 "$srcdir/FOREST07.MAP" "$_destdir/MAPS/FOREST07.MAP"
  install -Dm644 "$srcdir/FOREST07.RMP" "$_destdir/ROUTES/FOREST07.RMP"
  install -Dm644 "$srcdir/FOREST08.MAP" "$_destdir/MAPS/FOREST08.MAP"
  install -Dm644 "$srcdir/FOREST08.RMP" "$_destdir/ROUTES/FOREST08.RMP"
  install -Dm644 "$srcdir/FOREST09.MAP" "$_destdir/MAPS/FOREST09.MAP"
  install -Dm644 "$srcdir/FOREST09.RMP" "$_destdir/ROUTES/FOREST09.RMP"
  install -Dm644 "$srcdir/FOREST10.MAP" "$_destdir/MAPS/FOREST10.MAP"
  install -Dm644 "$srcdir/FOREST10.RMP" "$_destdir/ROUTES/FOREST10.RMP"
  install -Dm644 "$srcdir/FOREST11.MAP" "$_destdir/MAPS/FOREST11.MAP"
  install -Dm644 "$srcdir/FOREST11.RMP" "$_destdir/ROUTES/FOREST11.RMP"
  install -Dm644 "$srcdir/FRENCH.DAT"   "$_destdir/GEODATA/FRENCH.DAT"
  install -Dm644 "$srcdir/FRENCH2.DAT"  "$_destdir/GEODATA/FRENCH2.DAT"
  install -Dm644 "$srcdir/FRNITURE.MCD" "$_destdir/TERRAIN/FRNITURE.MCD"
  install -Dm644 "$srcdir/FRNITURE.PCK" "$_destdir/TERRAIN/FRNITURE.PCK"
  install -Dm644 "$srcdir/FRNITURE.TAB" "$_destdir/TERRAIN/FRNITURE.TAB"
  install -Dm644 "$srcdir/GEOBORD.SCR"  "$_destdir/GEOGRAPH/GEOBORD.SCR"
  install -Dm644 "$srcdir/GEODATA.DAT"  "$_destdir/MAPS/GEODATA.DAT"
  install -Dm644 "$srcdir/GERMAN.DAT"   "$_destdir/GEODATA/GERMAN.DAT"
  install -Dm644 "$srcdir/GERMAN2.DAT"  "$_destdir/GEODATA/GERMAN2.DAT"
  install -Dm644 "$srcdir/GM.CAT"       "$_destdir/SOUND/GM.CAT"
  install -Dm644 "$srcdir/GMDEFEND.MID" "$_destdir/SOUND/GMDEFEND.MID"
  install -Dm644 "$srcdir/GMENBASE.MID" "$_destdir/SOUND/GMENBASE.MID"
  install -Dm644 "$srcdir/GMGEO1.MID"   "$_destdir/SOUND/GMGEO1.MID"
  install -Dm644 "$srcdir/GMGEO2.MID"   "$_destdir/SOUND/GMGEO2.MID"
  install -Dm644 "$srcdir/GMINTER.MID"  "$_destdir/SOUND/GMINTER.MID"
  install -Dm644 "$srcdir/GMINTRO1.MID" "$_destdir/SOUND/GMINTRO1.MID"
  install -Dm644 "$srcdir/GMINTRO2.MID" "$_destdir/SOUND/GMINTRO2.MID"
  install -Dm644 "$srcdir/GMINTRO3.MID" "$_destdir/SOUND/GMINTRO3.MID"
  install -Dm644 "$srcdir/GMLOSE.MID"   "$_destdir/SOUND/GMLOSE.MID"
  install -Dm644 "$srcdir/GMMARS.MID"   "$_destdir/SOUND/GMMARS.MID"
  install -Dm644 "$srcdir/GMNEWMAR.MID" "$_destdir/SOUND/GMNEWMAR.MID"
  install -Dm644 "$srcdir/GMSTORY.MID"  "$_destdir/SOUND/GMSTORY.MID"
  install -Dm644 "$srcdir/GMTACTIC.MID" "$_destdir/SOUND/GMTACTIC.MID"
  install -Dm644 "$srcdir/GMWIN.MID"    "$_destdir/SOUND/GMWIN.MID"
  install -Dm644 "$srcdir/GRAPHS.SPK"   "$_destdir/GEOGRAPH/GRAPHS.SPK"
  install -Dm644 "$srcdir/HANDOB.PCK"   "$_destdir/UNITS/HANDOB.PCK"
  install -Dm644 "$srcdir/HANDOB.TAB"   "$_destdir/UNITS/HANDOB.TAB"
  install -Dm644 "$srcdir/HIT.PCK"      "$_destdir/UFOGRAPH/HIT.PCK"
  install -Dm644 "$srcdir/HIT.TAB"      "$_destdir/UFOGRAPH/HIT.TAB"
  install -Dm644 "$srcdir/ICONS.PCK"    "$_destdir/UFOGRAPH/ICONS.PCK"
  install -Dm644 "$srcdir/INTERWIN.DAT" "$_destdir/GEODATA/INTERWIN.DAT"
  install -Dm644 "$srcdir/ufo-INTICON.PCK"  "$_destdir/UFOGRAPH/INTICON.PCK"
  install -Dm644 "$srcdir/geo-INTICON.PCK"  "$_destdir/GEOGRAPH/INTICON.PCK"
  install -Dm644 "$srcdir/ufo-INTICON.TAB"  "$_destdir/UFOGRAPH/INTICON.TAB"
  install -Dm644 "$srcdir/geo-INTICON.TAB"  "$_destdir/GEOGRAPH/INTICON.TAB"
  install -Dm644 "$srcdir/INTRO.CAT"    "$_destdir/SOUND/INTRO.CAT"
  install -Dm644 "$srcdir/JUNGLE.MCD"   "$_destdir/TERRAIN/JUNGLE.MCD"
  install -Dm644 "$srcdir/JUNGLE.PCK"   "$_destdir/TERRAIN/JUNGLE.PCK"
  install -Dm644 "$srcdir/JUNGLE.TAB"   "$_destdir/TERRAIN/JUNGLE.TAB"
  install -Dm644 "$srcdir/JUNGLE00.MAP" "$_destdir/MAPS/JUNGLE00.MAP"
  install -Dm644 "$srcdir/JUNGLE00.RMP" "$_destdir/ROUTES/JUNGLE00.RMP"
  install -Dm644 "$srcdir/JUNGLE01.MAP" "$_destdir/MAPS/JUNGLE01.MAP"
  install -Dm644 "$srcdir/JUNGLE01.RMP" "$_destdir/ROUTES/JUNGLE01.RMP"
  install -Dm644 "$srcdir/JUNGLE02.MAP" "$_destdir/MAPS/JUNGLE02.MAP"
  install -Dm644 "$srcdir/JUNGLE02.RMP" "$_destdir/ROUTES/JUNGLE02.RMP"
  install -Dm644 "$srcdir/JUNGLE03.MAP" "$_destdir/MAPS/JUNGLE03.MAP"
  install -Dm644 "$srcdir/JUNGLE03.RMP" "$_destdir/ROUTES/JUNGLE03.RMP"
  install -Dm644 "$srcdir/JUNGLE04.MAP" "$_destdir/MAPS/JUNGLE04.MAP"
  install -Dm644 "$srcdir/JUNGLE04.RMP" "$_destdir/ROUTES/JUNGLE04.RMP"
  install -Dm644 "$srcdir/JUNGLE05.MAP" "$_destdir/MAPS/JUNGLE05.MAP"
  install -Dm644 "$srcdir/JUNGLE05.RMP" "$_destdir/ROUTES/JUNGLE05.RMP"
  install -Dm644 "$srcdir/JUNGLE06.MAP" "$_destdir/MAPS/JUNGLE06.MAP"
  install -Dm644 "$srcdir/JUNGLE06.RMP" "$_destdir/ROUTES/JUNGLE06.RMP"
  install -Dm644 "$srcdir/JUNGLE07.MAP" "$_destdir/MAPS/JUNGLE07.MAP"
  install -Dm644 "$srcdir/JUNGLE07.RMP" "$_destdir/ROUTES/JUNGLE07.RMP"
  install -Dm644 "$srcdir/JUNGLE08.MAP" "$_destdir/MAPS/JUNGLE08.MAP"
  install -Dm644 "$srcdir/JUNGLE08.RMP" "$_destdir/ROUTES/JUNGLE08.RMP"
  install -Dm644 "$srcdir/JUNGLE09.MAP" "$_destdir/MAPS/JUNGLE09.MAP"
  install -Dm644 "$srcdir/JUNGLE09.RMP" "$_destdir/ROUTES/JUNGLE09.RMP"
  install -Dm644 "$srcdir/JUNGLE10.MAP" "$_destdir/MAPS/JUNGLE10.MAP"
  install -Dm644 "$srcdir/JUNGLE10.RMP" "$_destdir/ROUTES/JUNGLE10.RMP"
  install -Dm644 "$srcdir/JUNGLE11.MAP" "$_destdir/MAPS/JUNGLE11.MAP"
  install -Dm644 "$srcdir/JUNGLE11.RMP" "$_destdir/ROUTES/JUNGLE11.RMP"
  install -Dm644 "$srcdir/LANG1.DAT"    "$_destdir/GEODATA/LANG1.DAT"
  install -Dm644 "$srcdir/LANG2.DAT"    "$_destdir/GEODATA/LANG2.DAT"
  install -Dm644 "$srcdir/LAPC1.PAT"    "$_destdir/SOUND/LAPC1.PAT"
  install -Dm644 "$srcdir/LIGHTNIN.MAP" "$_destdir/MAPS/LIGHTNIN.MAP"
  install -Dm644 "$srcdir/LIGHTNIN.MCD" "$_destdir/TERRAIN/LIGHTNIN.MCD"
  install -Dm644 "$srcdir/LIGHTNIN.PCK" "$_destdir/TERRAIN/LIGHTNIN.PCK"
  install -Dm644 "$srcdir/LIGHTNIN.RMP" "$_destdir/ROUTES/LIGHTNIN.RMP"
  install -Dm644 "$srcdir/LIGHTNIN.TAB" "$_destdir/TERRAIN/LIGHTNIN.TAB"
  install -Dm644 "$srcdir/LOFTEMPS.DAT" "$_destdir/GEODATA/LOFTEMPS.DAT"
  install -Dm644 "$srcdir/MAN_0F0.SPK"  "$_destdir/UFOGRAPH/MAN_0F0.SPK"
  install -Dm644 "$srcdir/MAN_0F1.SPK"  "$_destdir/UFOGRAPH/MAN_0F1.SPK"
  install -Dm644 "$srcdir/MAN_0F2.SPK"  "$_destdir/UFOGRAPH/MAN_0F2.SPK"
  install -Dm644 "$srcdir/MAN_0F3.SPK"  "$_destdir/UFOGRAPH/MAN_0F3.SPK"
  install -Dm644 "$srcdir/MAN_0M0.SPK"  "$_destdir/UFOGRAPH/MAN_0M0.SPK"
  install -Dm644 "$srcdir/MAN_0M1.SPK"  "$_destdir/UFOGRAPH/MAN_0M1.SPK"
  install -Dm644 "$srcdir/MAN_0M2.SPK"  "$_destdir/UFOGRAPH/MAN_0M2.SPK"
  install -Dm644 "$srcdir/MAN_0M3.SPK"  "$_destdir/UFOGRAPH/MAN_0M3.SPK"
  install -Dm644 "$srcdir/MAN_1F0.SPK"  "$_destdir/UFOGRAPH/MAN_1F0.SPK"
  install -Dm644 "$srcdir/MAN_1F1.SPK"  "$_destdir/UFOGRAPH/MAN_1F1.SPK"
  install -Dm644 "$srcdir/MAN_1F2.SPK"  "$_destdir/UFOGRAPH/MAN_1F2.SPK"
  install -Dm644 "$srcdir/MAN_1F3.SPK"  "$_destdir/UFOGRAPH/MAN_1F3.SPK"
  install -Dm644 "$srcdir/MAN_1M0.SPK"  "$_destdir/UFOGRAPH/MAN_1M0.SPK"
  install -Dm644 "$srcdir/MAN_1M1.SPK"  "$_destdir/UFOGRAPH/MAN_1M1.SPK"
  install -Dm644 "$srcdir/MAN_1M2.SPK"  "$_destdir/UFOGRAPH/MAN_1M2.SPK"
  install -Dm644 "$srcdir/MAN_1M3.SPK"  "$_destdir/UFOGRAPH/MAN_1M3.SPK"
  install -Dm644 "$srcdir/MAN_2.SPK"    "$_destdir/UFOGRAPH/MAN_2.SPK"
  install -Dm644 "$srcdir/MAN_3.SPK"    "$_destdir/UFOGRAPH/MAN_3.SPK"
  install -Dm644 "$srcdir/MAP3.MAP"     "$_destdir/MAPS/MAP3.MAP"
  install -Dm644 "$srcdir/MAP4.MAP"     "$_destdir/MAPS/MAP4.MAP"
  install -Dm644 "$srcdir/MARS.MCD"     "$_destdir/TERRAIN/MARS.MCD"
  install -Dm644 "$srcdir/MARS.PCK"     "$_destdir/TERRAIN/MARS.PCK"
  install -Dm644 "$srcdir/MARS.TAB"     "$_destdir/TERRAIN/MARS.TAB"
  install -Dm644 "$srcdir/MARS00.MAP"   "$_destdir/MAPS/MARS00.MAP"
  install -Dm644 "$srcdir/MARS00.RMP"   "$_destdir/ROUTES/MARS00.RMP"
  install -Dm644 "$srcdir/MARS01.MAP"   "$_destdir/MAPS/MARS01.MAP"
  install -Dm644 "$srcdir/MARS01.RMP"   "$_destdir/ROUTES/MARS01.RMP"
  install -Dm644 "$srcdir/MARS02.MAP"   "$_destdir/MAPS/MARS02.MAP"
  install -Dm644 "$srcdir/MARS02.RMP"   "$_destdir/ROUTES/MARS02.RMP"
  install -Dm644 "$srcdir/MARS03.MAP"   "$_destdir/MAPS/MARS03.MAP"
  install -Dm644 "$srcdir/MARS03.RMP"   "$_destdir/ROUTES/MARS03.RMP"
  install -Dm644 "$srcdir/MARS04.MAP"   "$_destdir/MAPS/MARS04.MAP"
  install -Dm644 "$srcdir/MARS04.RMP"   "$_destdir/ROUTES/MARS04.RMP"
  install -Dm644 "$srcdir/MARS05.MAP"   "$_destdir/MAPS/MARS05.MAP"
  install -Dm644 "$srcdir/MARS05.RMP"   "$_destdir/ROUTES/MARS05.RMP"
  install -Dm644 "$srcdir/MARS06.MAP"   "$_destdir/MAPS/MARS06.MAP"
  install -Dm644 "$srcdir/MARS06.RMP"   "$_destdir/ROUTES/MARS06.RMP"
  install -Dm644 "$srcdir/MARS07.MAP"   "$_destdir/MAPS/MARS07.MAP"
  install -Dm644 "$srcdir/MARS07.RMP"   "$_destdir/ROUTES/MARS07.RMP"
  install -Dm644 "$srcdir/MARS08.MAP"   "$_destdir/MAPS/MARS08.MAP"
  install -Dm644 "$srcdir/MARS08.RMP"   "$_destdir/ROUTES/MARS08.RMP"
  install -Dm644 "$srcdir/MARS09.MAP"   "$_destdir/MAPS/MARS09.MAP"
  install -Dm644 "$srcdir/MARS09.RMP"   "$_destdir/ROUTES/MARS09.RMP"
  install -Dm644 "$srcdir/MARS10.MAP"   "$_destdir/MAPS/MARS10.MAP"
  install -Dm644 "$srcdir/MARS10.RMP"   "$_destdir/ROUTES/MARS10.RMP"
  install -Dm644 "$srcdir/MEDIBITS.DAT" "$_destdir/UFOGRAPH/MEDIBITS.DAT"
  install -Dm644 "$srcdir/MEDIBORD.PCK" "$_destdir/UFOGRAPH/MEDIBORD.PCK"
  install -Dm644 "$srcdir/MOC1.LBM"     "$_destdir/UFOGRAPH/MOC1.LBM"
  install -Dm644 "$srcdir/MOUNT.MCD"    "$_destdir/TERRAIN/MOUNT.MCD"
  install -Dm644 "$srcdir/MOUNT.PCK"    "$_destdir/TERRAIN/MOUNT.PCK"
  install -Dm644 "$srcdir/MOUNT.TAB"    "$_destdir/TERRAIN/MOUNT.TAB"
  install -Dm644 "$srcdir/MOUNT00.MAP"  "$_destdir/MAPS/MOUNT00.MAP"
  install -Dm644 "$srcdir/MOUNT00.RMP"  "$_destdir/ROUTES/MOUNT00.RMP"
  install -Dm644 "$srcdir/MOUNT01.MAP"  "$_destdir/MAPS/MOUNT01.MAP"
  install -Dm644 "$srcdir/MOUNT01.RMP"  "$_destdir/ROUTES/MOUNT01.RMP"
  install -Dm644 "$srcdir/MOUNT02.MAP"  "$_destdir/MAPS/MOUNT02.MAP"
  install -Dm644 "$srcdir/MOUNT02.RMP"  "$_destdir/ROUTES/MOUNT02.RMP"
  install -Dm644 "$srcdir/MOUNT03.MAP"  "$_destdir/MAPS/MOUNT03.MAP"
  install -Dm644 "$srcdir/MOUNT03.RMP"  "$_destdir/ROUTES/MOUNT03.RMP"
  install -Dm644 "$srcdir/MOUNT04.MAP"  "$_destdir/MAPS/MOUNT04.MAP"
  install -Dm644 "$srcdir/MOUNT04.RMP"  "$_destdir/ROUTES/MOUNT04.RMP"
  install -Dm644 "$srcdir/MOUNT05.MAP"  "$_destdir/MAPS/MOUNT05.MAP"
  install -Dm644 "$srcdir/MOUNT05.RMP"  "$_destdir/ROUTES/MOUNT05.RMP"
  install -Dm644 "$srcdir/MOUNT06.MAP"  "$_destdir/MAPS/MOUNT06.MAP"
  install -Dm644 "$srcdir/MOUNT06.RMP"  "$_destdir/ROUTES/MOUNT06.RMP"
  install -Dm644 "$srcdir/MOUNT07.MAP"  "$_destdir/MAPS/MOUNT07.MAP"
  install -Dm644 "$srcdir/MOUNT07.RMP"  "$_destdir/ROUTES/MOUNT07.RMP"
  install -Dm644 "$srcdir/MOUNT08.MAP"  "$_destdir/MAPS/MOUNT08.MAP"
  install -Dm644 "$srcdir/MOUNT08.RMP"  "$_destdir/ROUTES/MOUNT08.RMP"
  install -Dm644 "$srcdir/MOUNT09.MAP"  "$_destdir/MAPS/MOUNT09.MAP"
  install -Dm644 "$srcdir/MOUNT09.RMP"  "$_destdir/ROUTES/MOUNT09.RMP"
  install -Dm644 "$srcdir/MOUNT10.MAP"  "$_destdir/MAPS/MOUNT10.MAP"
  install -Dm644 "$srcdir/MOUNT10.RMP"  "$_destdir/ROUTES/MOUNT10.RMP"
  install -Dm644 "$srcdir/MOUNT11.MAP"  "$_destdir/MAPS/MOUNT11.MAP"
  install -Dm644 "$srcdir/MOUNT11.RMP"  "$_destdir/ROUTES/MOUNT11.RMP"
  install -Dm644 "$srcdir/MOUNT12.MAP"  "$_destdir/MAPS/MOUNT12.MAP"
  install -Dm644 "$srcdir/MOUNT12.RMP"  "$_destdir/ROUTES/MOUNT12.RMP"
  install -Dm644 "$srcdir/MUSIC.COM"    "$_destdir/SOUND/MUSIC.COM"
  install -Dm644 "$srcdir/MUTON.PCK"    "$_destdir/UNITS/MUTON.PCK"
  install -Dm644 "$srcdir/MUTON.TAB"    "$_destdir/UNITS/MUTON.TAB"
  install -Dm644 "$srcdir/OBDATA.DAT"   "$_destdir/GEODATA/OBDATA.DAT"
  install -Dm644 "$srcdir/PABDUCT.MAP"  "$_destdir/MAPS/PABDUCT.MAP"
  install -Dm644 "$srcdir/PALETTES.DAT" "$_destdir/GEODATA/PALETTES.DAT"
  install -Dm644 "$srcdir/PHARVEST.MAP" "$_destdir/MAPS/PHARVEST.MAP"
  install -Dm644 "$srcdir/PICT1.LBM"    "$_destdir/UFOINTRO/PICT1.LBM"
  install -Dm644 "$srcdir/PICT2.LBM"    "$_destdir/UFOINTRO/PICT2.LBM"
  install -Dm644 "$srcdir/PICT3.LBM"    "$_destdir/UFOINTRO/PICT3.LBM"
  install -Dm644 "$srcdir/PICT4.LBM"    "$_destdir/UFOINTRO/PICT4.LBM"
  install -Dm644 "$srcdir/PICT5.LBM"    "$_destdir/UFOINTRO/PICT5.LBM"
  install -Dm644 "$srcdir/PICT6.LBM"    "$_destdir/UFOINTRO/PICT6.LBM"
  install -Dm644 "$srcdir/PICT7.LBM"    "$_destdir/UFOINTRO/PICT7.LBM"
  install -Dm644 "$srcdir/PLANE.MAP"    "$_destdir/MAPS/PLANE.MAP"
  install -Dm644 "$srcdir/PLANE.MCD"    "$_destdir/TERRAIN/PLANE.MCD"
  install -Dm644 "$srcdir/PLANE.PCK"    "$_destdir/TERRAIN/PLANE.PCK"
  install -Dm644 "$srcdir/PLANE.RMP"    "$_destdir/ROUTES/PLANE.RMP"
  install -Dm644 "$srcdir/PLANE.TAB"    "$_destdir/TERRAIN/PLANE.TAB"
  install -Dm644 "$srcdir/POLAR.MCD"    "$_destdir/TERRAIN/POLAR.MCD"
  install -Dm644 "$srcdir/POLAR.PCK"    "$_destdir/TERRAIN/POLAR.PCK"
  install -Dm644 "$srcdir/POLAR.TAB"    "$_destdir/TERRAIN/POLAR.TAB"
  install -Dm644 "$srcdir/POLAR00.MAP"  "$_destdir/MAPS/POLAR00.MAP"
  install -Dm644 "$srcdir/POLAR00.RMP"  "$_destdir/ROUTES/POLAR00.RMP"
  install -Dm644 "$srcdir/POLAR01.MAP"  "$_destdir/MAPS/POLAR01.MAP"
  install -Dm644 "$srcdir/POLAR01.RMP"  "$_destdir/ROUTES/POLAR01.RMP"
  install -Dm644 "$srcdir/POLAR02.MAP"  "$_destdir/MAPS/POLAR02.MAP"
  install -Dm644 "$srcdir/POLAR02.RMP"  "$_destdir/ROUTES/POLAR02.RMP"
  install -Dm644 "$srcdir/POLAR03.MAP"  "$_destdir/MAPS/POLAR03.MAP"
  install -Dm644 "$srcdir/POLAR03.RMP"  "$_destdir/ROUTES/POLAR03.RMP"
  install -Dm644 "$srcdir/POLAR04.MAP"  "$_destdir/MAPS/POLAR04.MAP"
  install -Dm644 "$srcdir/POLAR04.RMP"  "$_destdir/ROUTES/POLAR04.RMP"
  install -Dm644 "$srcdir/POLAR05.MAP"  "$_destdir/MAPS/POLAR05.MAP"
  install -Dm644 "$srcdir/POLAR05.RMP"  "$_destdir/ROUTES/POLAR05.RMP"
  install -Dm644 "$srcdir/POLAR06.MAP"  "$_destdir/MAPS/POLAR06.MAP"
  install -Dm644 "$srcdir/POLAR06.RMP"  "$_destdir/ROUTES/POLAR06.RMP"
  install -Dm644 "$srcdir/POLAR07.MAP"  "$_destdir/MAPS/POLAR07.MAP"
  install -Dm644 "$srcdir/POLAR07.RMP"  "$_destdir/ROUTES/POLAR07.RMP"
  install -Dm644 "$srcdir/POLAR08.MAP"  "$_destdir/MAPS/POLAR08.MAP"
  install -Dm644 "$srcdir/POLAR08.RMP"  "$_destdir/ROUTES/POLAR08.RMP"
  install -Dm644 "$srcdir/POLAR09.MAP"  "$_destdir/MAPS/POLAR09.MAP"
  install -Dm644 "$srcdir/POLAR09.RMP"  "$_destdir/ROUTES/POLAR09.RMP"
  install -Dm644 "$srcdir/POLAR10.MAP"  "$_destdir/MAPS/POLAR10.MAP"
  install -Dm644 "$srcdir/POLAR10.RMP"  "$_destdir/ROUTES/POLAR10.RMP"
  install -Dm644 "$srcdir/POLAR11.MAP"  "$_destdir/MAPS/POLAR11.MAP"
  install -Dm644 "$srcdir/POLAR11.RMP"  "$_destdir/ROUTES/POLAR11.RMP"
  install -Dm644 "$srcdir/POLAR12.MAP"  "$_destdir/MAPS/POLAR12.MAP"
  install -Dm644 "$srcdir/POLAR12.RMP"  "$_destdir/ROUTES/POLAR12.RMP"
  install -Dm644 "$srcdir/POLAR13.MAP"  "$_destdir/MAPS/POLAR13.MAP"
  install -Dm644 "$srcdir/POLAR13.RMP"  "$_destdir/ROUTES/POLAR13.RMP"
  install -Dm644 "$srcdir/PSCOUT.MAP"   "$_destdir/MAPS/PSCOUT.MAP"
  install -Dm644 "$srcdir/RINTRO.CAT"   "$_destdir/SOUND/RINTRO.CAT"
  install -Dm644 "$srcdir/ROADS.MCD"    "$_destdir/TERRAIN/ROADS.MCD"
  install -Dm644 "$srcdir/ROADS.PCK"    "$_destdir/TERRAIN/ROADS.PCK"
  install -Dm644 "$srcdir/ROADS.TAB"    "$_destdir/TERRAIN/ROADS.TAB"
  install -Dm644 "$srcdir/ROLAND.CAT"   "$_destdir/SOUND/ROLAND.CAT"
  install -Dm644 "$srcdir/SAMPLE.CAT"   "$_destdir/SOUND/SAMPLE.CAT"
  install -Dm644 "$srcdir/SAMPLE2.CAT"  "$_destdir/SOUND/SAMPLE2.CAT"
  install -Dm644 "$srcdir/SAMPLE3.CAT"  "$_destdir/SOUND/SAMPLE3.CAT"
  install -Dm644 "$srcdir/SCANBORD.PCK" "$_destdir/UFOGRAPH/SCANBORD.PCK"
  install -Dm644 "$srcdir/SCANG.DAT"    "$_destdir/GEODATA/SCANG.DAT"
  install -Dm644 "$srcdir/SECTOID.PCK"  "$_destdir/UNITS/SECTOID.PCK"
  install -Dm644 "$srcdir/SECTOID.TAB"  "$_destdir/UNITS/SECTOID.TAB"
  install -Dm644 "$srcdir/SILACOID.PCK" "$_destdir/UNITS/SILACOID.PCK"
  install -Dm644 "$srcdir/SILACOID.TAB" "$_destdir/UNITS/SILACOID.TAB"
  install -Dm644 "$srcdir/SINE.DAT"     "$_destdir/GEODATA/SINE.DAT"
  install -Dm644 "$srcdir/SMALLSET.DAT" "$_destdir/GEODATA/SMALLSET.DAT"
  install -Dm644 "$srcdir/SMOKE.PCK"    "$_destdir/UFOGRAPH/SMOKE.PCK"
  install -Dm644 "$srcdir/SMOKE.TAB"    "$_destdir/UFOGRAPH/SMOKE.TAB"
  install -Dm644 "$srcdir/SNAKEMAN.PCK" "$_destdir/UNITS/SNAKEMAN.PCK"
  install -Dm644 "$srcdir/SNAKEMAN.TAB" "$_destdir/UNITS/SNAKEMAN.TAB"
  install -Dm644 "$srcdir/SNDEND.EXE"   "$_destdir/SOUND/SNDEND.EXE"
  install -Dm644 "$srcdir/SNDSTART.EXE" "$_destdir/SOUND/SNDSTART.EXE"
  install -Dm644 "$srcdir/SOUND.CFG"    "$_destdir/SOUND/SOUND.CFG"
  install -Dm644 "$srcdir/SOUND1.CAT"   "$_destdir/SOUND/SOUND1.CAT"
  install -Dm644 "$srcdir/SOUND2.CAT"   "$_destdir/SOUND/SOUND2.CAT"
  install -Dm644 "$srcdir/SOUNDRV.COM"  "$_destdir/SOUND/SOUNDRV.COM"
  install -Dm644 "$srcdir/SPICONS.DAT"  "$_destdir/UFOGRAPH/SPICONS.DAT"
  install -Dm644 "$srcdir/TAC00.SCR"    "$_destdir/UFOGRAPH/TAC00.SCR"
  install -Dm644 "$srcdir/TAC01.SCR"    "$_destdir/UFOGRAPH/TAC01.SCR"
  install -Dm644 "$srcdir/TANKS.PCK"    "$_destdir/UNITS/TANKS.PCK"
  install -Dm644 "$srcdir/TANKS.TAB"    "$_destdir/UNITS/TANKS.TAB"
  install -Dm644 "$srcdir/TEMP.MAP"     "$_destdir/MAPS/TEMP.MAP"
  install -Dm644 "$srcdir/TEMP.RMP"     "$_destdir/ROUTES/TEMP.RMP"
  install -Dm644 "$srcdir/TEMP1.MAP"    "$_destdir/MAPS/TEMP1.MAP"
  install -Dm644 "$srcdir/TEMP1.RMP"    "$_destdir/ROUTES/TEMP1.RMP"
  install -Dm644 "$srcdir/TEMP2.MAP"    "$_destdir/MAPS/TEMP2.MAP"
  install -Dm644 "$srcdir/TEMP2.RMP"    "$_destdir/ROUTES/TEMP2.RMP"
  install -Dm644 "$srcdir/TEMP3.MAP"    "$_destdir/MAPS/TEMP3.MAP"
  install -Dm644 "$srcdir/TEMP3.RMP"    "$_destdir/ROUTES/TEMP3.RMP"
  install -Dm644 "$srcdir/TEXTURE.DAT"  "$_destdir/GEOGRAPH/TEXTURE.DAT"
  install -Dm644 "$srcdir/UBASE_00.MAP" "$_destdir/MAPS/UBASE_00.MAP"
  install -Dm644 "$srcdir/UBASE_00.RMP" "$_destdir/MAPS/UBASE_00.RMP"
  install -Dm644 "$srcdir/UBASE_01.MAP" "$_destdir/MAPS/UBASE_01.MAP"
  install -Dm644 "$srcdir/UBASE_01.RMP" "$_destdir/MAPS/UBASE_01.RMP"
  install -Dm644 "$srcdir/UBASE_02.MAP" "$_destdir/MAPS/UBASE_02.MAP"
  install -Dm644 "$srcdir/UBASE_02.RMP" "$_destdir/MAPS/UBASE_02.RMP"
  install -Dm644 "$srcdir/UBASE_03.MAP" "$_destdir/MAPS/UBASE_03.MAP"
  install -Dm644 "$srcdir/UBASE_03.RMP" "$_destdir/MAPS/UBASE_03.RMP"
  install -Dm644 "$srcdir/UBASE_04.MAP" "$_destdir/MAPS/UBASE_04.MAP"
  install -Dm644 "$srcdir/UBASE_04.RMP" "$_destdir/MAPS/UBASE_04.RMP"
  install -Dm644 "$srcdir/UBASE_05.MAP" "$_destdir/MAPS/UBASE_05.MAP"
  install -Dm644 "$srcdir/UBASE_05.RMP" "$_destdir/MAPS/UBASE_05.RMP"
  install -Dm644 "$srcdir/UBASE_06.MAP" "$_destdir/MAPS/UBASE_06.MAP"
  install -Dm644 "$srcdir/UBASE_06.RMP" "$_destdir/MAPS/UBASE_06.RMP"
  install -Dm644 "$srcdir/UBASE_07.MAP" "$_destdir/MAPS/UBASE_07.MAP"
  install -Dm644 "$srcdir/UBASE_07.RMP" "$_destdir/MAPS/UBASE_07.RMP"
  install -Dm644 "$srcdir/UBASE_08.MAP" "$_destdir/MAPS/UBASE_08.MAP"
  install -Dm644 "$srcdir/UBASE_08.RMP" "$_destdir/MAPS/UBASE_08.RMP"
  install -Dm644 "$srcdir/UBASE_09.MAP" "$_destdir/MAPS/UBASE_09.MAP"
  install -Dm644 "$srcdir/UBASE_09.RMP" "$_destdir/MAPS/UBASE_09.RMP"
  install -Dm644 "$srcdir/UBASE_10.MAP" "$_destdir/MAPS/UBASE_10.MAP"
  install -Dm644 "$srcdir/UBASE_10.RMP" "$_destdir/MAPS/UBASE_10.RMP"
  install -Dm644 "$srcdir/UBASE_11.MAP" "$_destdir/MAPS/UBASE_11.MAP"
  install -Dm644 "$srcdir/UBASE_11.RMP" "$_destdir/MAPS/UBASE_11.RMP"
  install -Dm644 "$srcdir/UBASE_12.MAP" "$_destdir/MAPS/UBASE_12.MAP"
  install -Dm644 "$srcdir/UBASE_12.RMP" "$_destdir/MAPS/UBASE_12.RMP"
  install -Dm644 "$srcdir/UBASE_13.MAP" "$_destdir/MAPS/UBASE_13.MAP"
  install -Dm644 "$srcdir/UBASE_13.RMP" "$_destdir/MAPS/UBASE_13.RMP"
  install -Dm644 "$srcdir/UBASE_14.MAP" "$_destdir/MAPS/UBASE_14.MAP"
  install -Dm644 "$srcdir/UBASE_14.RMP" "$_destdir/MAPS/UBASE_14.RMP"
  install -Dm644 "$srcdir/UBASE_15.MAP" "$_destdir/MAPS/UBASE_15.MAP"
  install -Dm644 "$srcdir/UBASE_15.RMP" "$_destdir/MAPS/UBASE_15.RMP"
  install -Dm644 "$srcdir/UFO1.MCD"     "$_destdir/TERRAIN/UFO1.MCD"
  install -Dm644 "$srcdir/UFO1.PCK"     "$_destdir/TERRAIN/UFO1.PCK"
  install -Dm644 "$srcdir/UFO1.TAB"     "$_destdir/TERRAIN/UFO1.TAB"
  install -Dm644 "$srcdir/UFO1A.MAP"    "$_destdir/MAPS/UFO1A.MAP"
  install -Dm644 "$srcdir/UFO1A.RMP"    "$_destdir/ROUTES/UFO1A.RMP"
  install -Dm644 "$srcdir/UFO1B.MAP"    "$_destdir/MAPS/UFO1B.MAP"
  install -Dm644 "$srcdir/UFOINT.FLI"   "$_destdir/UFOINTRO/UFOINT.FLI"
  install -Dm644 "$srcdir/UFO_000.MAP"  "$_destdir/MAPS/UFO_000.MAP"
  install -Dm644 "$srcdir/UFO_000.RMP"  "$_destdir/ROUTES/UFO_000.RMP"
  install -Dm644 "$srcdir/UFO_010.MAP"  "$_destdir/MAPS/UFO_010.MAP"
  install -Dm644 "$srcdir/UFO_010.RMP"  "$_destdir/ROUTES/UFO_010.RMP"
  install -Dm644 "$srcdir/UFO_110.MAP"  "$_destdir/MAPS/UFO_110.MAP"
  install -Dm644 "$srcdir/UFO_110.RMP"  "$_destdir/ROUTES/UFO_110.RMP"
  install -Dm644 "$srcdir/UFO_120.MAP"  "$_destdir/MAPS/UFO_120.MAP"
  install -Dm644 "$srcdir/UFO_120.RMP"  "$_destdir/ROUTES/UFO_120.RMP"
  install -Dm644 "$srcdir/UFO_130.MAP"  "$_destdir/MAPS/UFO_130.MAP"
  install -Dm644 "$srcdir/UFO_130.RMP"  "$_destdir/ROUTES/UFO_130.RMP"
  install -Dm644 "$srcdir/UFO_140.MAP"  "$_destdir/MAPS/UFO_140.MAP"
  install -Dm644 "$srcdir/UFO_140.RMP"  "$_destdir/ROUTES/UFO_140.RMP"
  install -Dm644 "$srcdir/UFO_150.MAP"  "$_destdir/MAPS/UFO_150.MAP"
  install -Dm644 "$srcdir/UFO_150.RMP"  "$_destdir/ROUTES/UFO_150.RMP"
  install -Dm644 "$srcdir/UFO_160.MAP"  "$_destdir/MAPS/UFO_160.MAP"
  install -Dm644 "$srcdir/UFO_160.RMP"  "$_destdir/ROUTES/UFO_160.RMP"
  install -Dm644 "$srcdir/UFO_170.MAP"  "$_destdir/MAPS/UFO_170.MAP"
  install -Dm644 "$srcdir/UFO_170.RMP"  "$_destdir/ROUTES/UFO_170.RMP"
  install -Dm644 "$srcdir/UNIBORD.PCK"  "$_destdir/UFOGRAPH/UNIBORD.PCK"
  install -Dm644 "$srcdir/UP001.SPK"    "$_destdir/GEOGRAPH/UP001.SPK"
  install -Dm644 "$srcdir/UP002.SPK"    "$_destdir/GEOGRAPH/UP002.SPK"
  install -Dm644 "$srcdir/UP003.SPK"    "$_destdir/GEOGRAPH/UP003.SPK"
  install -Dm644 "$srcdir/UP004.SPK"    "$_destdir/GEOGRAPH/UP004.SPK"
  install -Dm644 "$srcdir/UP005.SPK"    "$_destdir/GEOGRAPH/UP005.SPK"
  install -Dm644 "$srcdir/UP006.SPK"    "$_destdir/GEOGRAPH/UP006.SPK"
  install -Dm644 "$srcdir/UP007.SPK"    "$_destdir/GEOGRAPH/UP007.SPK"
  install -Dm644 "$srcdir/UP008.SPK"    "$_destdir/GEOGRAPH/UP008.SPK"
  install -Dm644 "$srcdir/UP009.SPK"    "$_destdir/GEOGRAPH/UP009.SPK"
  install -Dm644 "$srcdir/UP010.SPK"    "$_destdir/GEOGRAPH/UP010.SPK"
  install -Dm644 "$srcdir/UP011.SPK"    "$_destdir/GEOGRAPH/UP011.SPK"
  install -Dm644 "$srcdir/UP012.SPK"    "$_destdir/GEOGRAPH/UP012.SPK"
  install -Dm644 "$srcdir/UP013.SPK"    "$_destdir/GEOGRAPH/UP013.SPK"
  install -Dm644 "$srcdir/UP014.SPK"    "$_destdir/GEOGRAPH/UP014.SPK"
  install -Dm644 "$srcdir/UP015.SPK"    "$_destdir/GEOGRAPH/UP015.SPK"
  install -Dm644 "$srcdir/UP016.SPK"    "$_destdir/GEOGRAPH/UP016.SPK"
  install -Dm644 "$srcdir/UP017.SPK"    "$_destdir/GEOGRAPH/UP017.SPK"
  install -Dm644 "$srcdir/UP018.SPK"    "$_destdir/GEOGRAPH/UP018.SPK"
  install -Dm644 "$srcdir/UP019.SPK"    "$_destdir/GEOGRAPH/UP019.SPK"
  install -Dm644 "$srcdir/UP020.SPK"    "$_destdir/GEOGRAPH/UP020.SPK"
  install -Dm644 "$srcdir/UP021.SPK"    "$_destdir/GEOGRAPH/UP021.SPK"
  install -Dm644 "$srcdir/UP022.SPK"    "$_destdir/GEOGRAPH/UP022.SPK"
  install -Dm644 "$srcdir/UP023.SPK"    "$_destdir/GEOGRAPH/UP023.SPK"
  install -Dm644 "$srcdir/UP024.SPK"    "$_destdir/GEOGRAPH/UP024.SPK"
  install -Dm644 "$srcdir/UP025.SPK"    "$_destdir/GEOGRAPH/UP025.SPK"
  install -Dm644 "$srcdir/UP026.SPK"    "$_destdir/GEOGRAPH/UP026.SPK"
  install -Dm644 "$srcdir/UP027.SPK"    "$_destdir/GEOGRAPH/UP027.SPK"
  install -Dm644 "$srcdir/UP028.SPK"    "$_destdir/GEOGRAPH/UP028.SPK"
  install -Dm644 "$srcdir/UP029.SPK"    "$_destdir/GEOGRAPH/UP029.SPK"
  install -Dm644 "$srcdir/UP030.SPK"    "$_destdir/GEOGRAPH/UP030.SPK"
  install -Dm644 "$srcdir/UP031.SPK"    "$_destdir/GEOGRAPH/UP031.SPK"
  install -Dm644 "$srcdir/UP032.SPK"    "$_destdir/GEOGRAPH/UP032.SPK"
  install -Dm644 "$srcdir/UP033.SPK"    "$_destdir/GEOGRAPH/UP033.SPK"
  install -Dm644 "$srcdir/UP034.SPK"    "$_destdir/GEOGRAPH/UP034.SPK"
  install -Dm644 "$srcdir/UP035.SPK"    "$_destdir/GEOGRAPH/UP035.SPK"
  install -Dm644 "$srcdir/UP036.SPK"    "$_destdir/GEOGRAPH/UP036.SPK"
  install -Dm644 "$srcdir/UP037.SPK"    "$_destdir/GEOGRAPH/UP037.SPK"
  install -Dm644 "$srcdir/UP038.SPK"    "$_destdir/GEOGRAPH/UP038.SPK"
  install -Dm644 "$srcdir/UP039.SPK"    "$_destdir/GEOGRAPH/UP039.SPK"
  install -Dm644 "$srcdir/UP040.SPK"    "$_destdir/GEOGRAPH/UP040.SPK"
  install -Dm644 "$srcdir/UP041.SPK"    "$_destdir/GEOGRAPH/UP041.SPK"
  install -Dm644 "$srcdir/UP042.SPK"    "$_destdir/GEOGRAPH/UP042.SPK"
  install -Dm644 "$srcdir/UP_BORD1.SPK" "$_destdir/GEOGRAPH/UP_BORD1.SPK"
  install -Dm644 "$srcdir/UP_BORD2.SCR" "$_destdir/GEOGRAPH/UP_BORD2.SCR"
  install -Dm644 "$srcdir/UP_BORD2.SPK" "$_destdir/GEOGRAPH/UP_BORD2.SPK"
  install -Dm644 "$srcdir/UP_BORD3.SPK" "$_destdir/GEOGRAPH/UP_BORD3.SPK"
  install -Dm644 "$srcdir/URBAN.MCD"    "$_destdir/TERRAIN/URBAN.MCD"
  install -Dm644 "$srcdir/URBAN.PCK"    "$_destdir/TERRAIN/URBAN.PCK"
  install -Dm644 "$srcdir/URBAN.TAB"    "$_destdir/TERRAIN/URBAN.TAB"
  install -Dm644 "$srcdir/URBAN00.MAP"  "$_destdir/MAPS/URBAN00.MAP"
  install -Dm644 "$srcdir/URBAN00.RMP"  "$_destdir/ROUTES/URBAN00.RMP"
  install -Dm644 "$srcdir/URBAN01.MAP"  "$_destdir/MAPS/URBAN01.MAP"
  install -Dm644 "$srcdir/URBAN01.RMP"  "$_destdir/ROUTES/URBAN01.RMP"
  install -Dm644 "$srcdir/URBAN02.MAP"  "$_destdir/MAPS/URBAN02.MAP"
  install -Dm644 "$srcdir/URBAN02.RMP"  "$_destdir/ROUTES/URBAN02.RMP"
  install -Dm644 "$srcdir/URBAN03.MAP"  "$_destdir/MAPS/URBAN03.MAP"
  install -Dm644 "$srcdir/URBAN03.RMP"  "$_destdir/ROUTES/URBAN03.RMP"
  install -Dm644 "$srcdir/URBAN04.MAP"  "$_destdir/MAPS/URBAN04.MAP"
  install -Dm644 "$srcdir/URBAN04.RMP"  "$_destdir/ROUTES/URBAN04.RMP"
  install -Dm644 "$srcdir/URBAN05.MAP"  "$_destdir/MAPS/URBAN05.MAP"
  install -Dm644 "$srcdir/URBAN05.RMP"  "$_destdir/ROUTES/URBAN05.RMP"
  install -Dm644 "$srcdir/URBAN06.MAP"  "$_destdir/MAPS/URBAN06.MAP"
  install -Dm644 "$srcdir/URBAN06.RMP"  "$_destdir/ROUTES/URBAN06.RMP"
  install -Dm644 "$srcdir/URBAN07.MAP"  "$_destdir/MAPS/URBAN07.MAP"
  install -Dm644 "$srcdir/URBAN07.RMP"  "$_destdir/ROUTES/URBAN07.RMP"
  install -Dm644 "$srcdir/URBAN08.MAP"  "$_destdir/MAPS/URBAN08.MAP"
  install -Dm644 "$srcdir/URBAN08.RMP"  "$_destdir/ROUTES/URBAN08.RMP"
  install -Dm644 "$srcdir/URBAN09.MAP"  "$_destdir/MAPS/URBAN09.MAP"
  install -Dm644 "$srcdir/URBAN09.RMP"  "$_destdir/ROUTES/URBAN09.RMP"
  install -Dm644 "$srcdir/URBAN14.MAP"  "$_destdir/MAPS/URBAN14.MAP"
  install -Dm644 "$srcdir/URBAN14.RMP"  "$_destdir/ROUTES/URBAN14.RMP"
  install -Dm644 "$srcdir/URBAN15.MAP"  "$_destdir/MAPS/URBAN15.MAP"
  install -Dm644 "$srcdir/URBAN15.RMP"  "$_destdir/ROUTES/URBAN15.RMP"
  install -Dm644 "$srcdir/URBAN16.MAP"  "$_destdir/MAPS/URBAN16.MAP"
  install -Dm644 "$srcdir/URBAN16.RMP"  "$_destdir/ROUTES/URBAN16.RMP"
  install -Dm644 "$srcdir/URBAN17.MAP"  "$_destdir/MAPS/URBAN17.MAP"
  install -Dm644 "$srcdir/URBAN17.RMP"  "$_destdir/ROUTES/URBAN17.RMP"
  install -Dm644 "$srcdir/URBAN18.MAP"  "$_destdir/MAPS/URBAN18.MAP"
  install -Dm644 "$srcdir/URBAN18.RMP"  "$_destdir/ROUTES/URBAN18.RMP"
  install -Dm644 "$srcdir/URBITS.MCD"   "$_destdir/TERRAIN/URBITS.MCD"
  install -Dm644 "$srcdir/URBITS.PCK"   "$_destdir/TERRAIN/URBITS.PCK"
  install -Dm644 "$srcdir/URBITS.TAB"   "$_destdir/TERRAIN/URBITS.TAB"
  install -Dm644 "$srcdir/U_BASE.MCD"   "$_destdir/TERRAIN/U_BASE.MCD"
  install -Dm644 "$srcdir/U_BASE.PCK"   "$_destdir/TERRAIN/U_BASE.PCK"
  install -Dm644 "$srcdir/U_BASE.TAB"   "$_destdir/TERRAIN/U_BASE.TAB"
  install -Dm644 "$srcdir/U_BITS.MCD"   "$_destdir/TERRAIN/U_BITS.MCD"
  install -Dm644 "$srcdir/U_BITS.PCK"   "$_destdir/TERRAIN/U_BITS.PCK"
  install -Dm644 "$srcdir/U_BITS.TAB"   "$_destdir/TERRAIN/U_BITS.TAB"
  install -Dm644 "$srcdir/U_DISEC2.MCD" "$_destdir/TERRAIN/U_DISEC2.MCD"
  install -Dm644 "$srcdir/U_DISEC2.PCK" "$_destdir/TERRAIN/U_DISEC2.PCK"
  install -Dm644 "$srcdir/U_DISEC2.TAB" "$_destdir/TERRAIN/U_DISEC2.TAB"
  install -Dm644 "$srcdir/U_EXT02.MCD"  "$_destdir/TERRAIN/U_EXT02.MCD"
  install -Dm644 "$srcdir/U_EXT02.PCK"  "$_destdir/TERRAIN/U_EXT02.PCK"
  install -Dm644 "$srcdir/U_EXT02.TAB"  "$_destdir/TERRAIN/U_EXT02.TAB"
  install -Dm644 "$srcdir/U_OPER2.MCD"  "$_destdir/TERRAIN/U_OPER2.MCD"
  install -Dm644 "$srcdir/U_OPER2.PCK"  "$_destdir/TERRAIN/U_OPER2.PCK"
  install -Dm644 "$srcdir/U_OPER2.TAB"  "$_destdir/TERRAIN/U_OPER2.TAB"
  install -Dm644 "$srcdir/U_PODS.MCD"   "$_destdir/TERRAIN/U_PODS.MCD"
  install -Dm644 "$srcdir/U_PODS.PCK"   "$_destdir/TERRAIN/U_PODS.PCK"
  install -Dm644 "$srcdir/U_PODS.TAB"   "$_destdir/TERRAIN/U_PODS.TAB"
  install -Dm644 "$srcdir/U_WALL02.MCD" "$_destdir/TERRAIN/U_WALL02.MCD"
  install -Dm644 "$srcdir/U_WALL02.PCK" "$_destdir/TERRAIN/U_WALL02.PCK"
  install -Dm644 "$srcdir/U_WALL02.TAB" "$_destdir/TERRAIN/U_WALL02.TAB"
  install -Dm644 "$srcdir/VECTOR.COM"   "$_destdir/SOUND/VECTOR.COM"
  install -Dm644 "$srcdir/WORLD.DAT"    "$_destdir/GEODATA/WORLD.DAT"
  install -Dm644 "$srcdir/X1.PCK"       "$_destdir/UFOGRAPH/X1.PCK"
  install -Dm644 "$srcdir/X1.TAB"       "$_destdir/UFOGRAPH/X1.TAB"
  install -Dm644 "$srcdir/XBASE1.MCD"   "$_destdir/TERRAIN/XBASE1.MCD"
  install -Dm644 "$srcdir/XBASE1.PCK"   "$_destdir/TERRAIN/XBASE1.PCK"
  install -Dm644 "$srcdir/XBASE1.TAB"   "$_destdir/TERRAIN/XBASE1.TAB"
  install -Dm644 "$srcdir/XBASE2.MCD"   "$_destdir/TERRAIN/XBASE2.MCD"
  install -Dm644 "$srcdir/XBASE2.PCK"   "$_destdir/TERRAIN/XBASE2.PCK"
  install -Dm644 "$srcdir/XBASE2.TAB"   "$_destdir/TERRAIN/XBASE2.TAB"
  install -Dm644 "$srcdir/XBASE_00.MAP" "$_destdir/MAPS/XBASE_00.MAP"
  install -Dm644 "$srcdir/XBASE_00.RMP" "$_destdir/MAPS/XBASE_00.RMP"
  install -Dm644 "$srcdir/XBASE_01.MAP" "$_destdir/MAPS/XBASE_01.MAP"
  install -Dm644 "$srcdir/XBASE_01.RMP" "$_destdir/MAPS/XBASE_01.RMP"
  install -Dm644 "$srcdir/XBASE_02.MAP" "$_destdir/MAPS/XBASE_02.MAP"
  install -Dm644 "$srcdir/XBASE_02.RMP" "$_destdir/MAPS/XBASE_02.RMP"
  install -Dm644 "$srcdir/XBASE_03.MAP" "$_destdir/MAPS/XBASE_03.MAP"
  install -Dm644 "$srcdir/XBASE_03.RMP" "$_destdir/MAPS/XBASE_03.RMP"
  install -Dm644 "$srcdir/XBASE_04.MAP" "$_destdir/MAPS/XBASE_04.MAP"
  install -Dm644 "$srcdir/XBASE_04.RMP" "$_destdir/MAPS/XBASE_04.RMP"
  install -Dm644 "$srcdir/XBASE_05.MAP" "$_destdir/MAPS/XBASE_05.MAP"
  install -Dm644 "$srcdir/XBASE_05.RMP" "$_destdir/MAPS/XBASE_05.RMP"
  install -Dm644 "$srcdir/XBASE_06.MAP" "$_destdir/MAPS/XBASE_06.MAP"
  install -Dm644 "$srcdir/XBASE_06.RMP" "$_destdir/MAPS/XBASE_06.RMP"
  install -Dm644 "$srcdir/XBASE_07.MAP" "$_destdir/MAPS/XBASE_07.MAP"
  install -Dm644 "$srcdir/XBASE_07.RMP" "$_destdir/MAPS/XBASE_07.RMP"
  install -Dm644 "$srcdir/XBASE_08.MAP" "$_destdir/MAPS/XBASE_08.MAP"
  install -Dm644 "$srcdir/XBASE_08.RMP" "$_destdir/MAPS/XBASE_08.RMP"
  install -Dm644 "$srcdir/XBASE_09.MAP" "$_destdir/MAPS/XBASE_09.MAP"
  install -Dm644 "$srcdir/XBASE_09.RMP" "$_destdir/MAPS/XBASE_09.RMP"
  install -Dm644 "$srcdir/XBASE_10.MAP" "$_destdir/MAPS/XBASE_10.MAP"
  install -Dm644 "$srcdir/XBASE_10.RMP" "$_destdir/MAPS/XBASE_10.RMP"
  install -Dm644 "$srcdir/XBASE_11.MAP" "$_destdir/MAPS/XBASE_11.MAP"
  install -Dm644 "$srcdir/XBASE_11.RMP" "$_destdir/MAPS/XBASE_11.RMP"
  install -Dm644 "$srcdir/XBASE_12.MAP" "$_destdir/MAPS/XBASE_12.MAP"
  install -Dm644 "$srcdir/XBASE_12.RMP" "$_destdir/MAPS/XBASE_12.RMP"
  install -Dm644 "$srcdir/XBASE_13.MAP" "$_destdir/MAPS/XBASE_13.MAP"
  install -Dm644 "$srcdir/XBASE_13.RMP" "$_destdir/MAPS/XBASE_13.RMP"
  install -Dm644 "$srcdir/XBASE_14.MAP" "$_destdir/MAPS/XBASE_14.MAP"
  install -Dm644 "$srcdir/XBASE_14.RMP" "$_destdir/MAPS/XBASE_14.RMP"
  install -Dm644 "$srcdir/XBASE_15.MAP" "$_destdir/MAPS/XBASE_15.MAP"
  install -Dm644 "$srcdir/XBASE_15.RMP" "$_destdir/MAPS/XBASE_15.RMP"
  install -Dm644 "$srcdir/XBASE_16.MAP" "$_destdir/MAPS/XBASE_16.MAP"
  install -Dm644 "$srcdir/XBASE_16.RMP" "$_destdir/MAPS/XBASE_16.RMP"
  install -Dm644 "$srcdir/XBASE_17.MAP" "$_destdir/MAPS/XBASE_17.MAP"
  install -Dm644 "$srcdir/XBASE_17.RMP" "$_destdir/MAPS/XBASE_17.RMP"
  install -Dm644 "$srcdir/XBASE_18.MAP" "$_destdir/MAPS/XBASE_18.MAP"
  install -Dm644 "$srcdir/XBASE_18.RMP" "$_destdir/MAPS/XBASE_18.RMP"
  install -Dm644 "$srcdir/XBASE_19.MAP" "$_destdir/MAPS/XBASE_19.MAP"
  install -Dm644 "$srcdir/XBASE_19.RMP" "$_destdir/MAPS/XBASE_19.RMP"
  install -Dm644 "$srcdir/XBASE_20.MAP" "$_destdir/MAPS/XBASE_20.MAP"
  install -Dm644 "$srcdir/XBASE_20.RMP" "$_destdir/MAPS/XBASE_20.RMP"
  install -Dm644 "$srcdir/XCOM_0.PCK"   "$_destdir/UNITS/XCOM_0.PCK"
  install -Dm644 "$srcdir/XCOM_0.TAB"   "$_destdir/UNITS/XCOM_0.TAB"
  install -Dm644 "$srcdir/XCOM_1.PCK"   "$_destdir/UNITS/XCOM_1.PCK"
  install -Dm644 "$srcdir/XCOM_1.TAB"   "$_destdir/UNITS/XCOM_1.TAB"
  install -Dm644 "$srcdir/XCOM_2.PCK"   "$_destdir/UNITS/XCOM_2.PCK"
  install -Dm644 "$srcdir/XCOM_2.TAB"   "$_destdir/UNITS/XCOM_2.TAB"
  install -Dm644 "$srcdir/X_REAP.PCK"   "$_destdir/UNITS/X_REAP.PCK"
  install -Dm644 "$srcdir/X_REAP.TAB"   "$_destdir/UNITS/X_REAP.TAB"
  install -Dm644 "$srcdir/X_ROB.PCK"    "$_destdir/UNITS/X_ROB.PCK"
  install -Dm644 "$srcdir/X_ROB.TAB"    "$_destdir/UNITS/X_ROB.TAB"
  install -Dm644 "$srcdir/ZOMBIE.PCK"   "$_destdir/UNITS/ZOMBIE.PCK"
  install -Dm644 "$srcdir/ZOMBIE.TAB"   "$_destdir/UNITS/ZOMBIE.TAB"
  
  # Link dupes
  cd "$_destdir/ROUTES"
  for file in UBASE_00.RMP UBASE_01.RMP UBASE_02.RMP UBASE_03.RMP UBASE_04.RMP UBASE_05.RMP \
              UBASE_06.RMP UBASE_07.RMP UBASE_08.RMP UBASE_09.RMP UBASE_10.RMP UBASE_11.RMP \
              UBASE_12.RMP UBASE_13.RMP UBASE_14.RMP UBASE_15.RMP XBASE_00.RMP XBASE_01.RMP \
              XBASE_02.RMP XBASE_03.RMP XBASE_04.RMP XBASE_05.RMP XBASE_06.RMP XBASE_07.RMP \
              XBASE_08.RMP XBASE_09.RMP XBASE_10.RMP XBASE_11.RMP XBASE_12.RMP XBASE_13.RMP \
              XBASE_14.RMP XBASE_15.RMP XBASE_16.RMP XBASE_17.RMP XBASE_18.RMP XBASE_19.RMP \
              XBASE_20.RMP; do
    ln -s "../MAPS/$file" "$file"
  done
}
