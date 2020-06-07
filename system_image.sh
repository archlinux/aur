#!/bin/bash
# welcome to system_image_backup(sib)-source-code
# do you want to run with colors? recommended

USECOLOR="yes"

# some functions from archlinux' /etc/rc.d/functions, gives us nice colors and layout
# width:
STAT_COL=80
if [ ! -t 1 ]; then
  USECOLOR=""

# stty will fail when stdin isn't a terminal
elif [ -t 0 ]; then
  STAT_COL="$(/bin/stty size)"
  # stty gives "rows cols"; strip the rows number, we just want columns
  STAT_COL="${STAT_COL##* }"

else
  # is /usr/share/terminfo already mounted, and TERM recognized?
  /bin/tput cols &>/dev/null
  if [ $? -eq 0 ]; then
    STAT_COL=$(/bin/tput cols)
  fi
fi
if [ "0$STAT_COL" -eq 0 ]; then
  # if output was 0 (serial console), set default width to 80
  STAT_COL=80
  USECOLOR=""
fi

# we use 13 characters for our own stuff
STAT_COL=$(($STAT_COL - 13))

# disable colors on broken terminals
TERM_COLORS="$(/bin/tput colors 2>/dev/null)"
if [ $? = 3 ]; then
        TERM_COLORS=8
elif [ -n "${TERM_COLORS}" ]; then
        case "${TERM_COLORS}" in
                *[!0-9]*)
                        USECOLOR=""
                        ;;
                *)
                        [ "${TERM_COLORS}" -lt 8 ] && USECOLOR=""
                        ;;
        esac
else
        USECOLOR=""
fi
unset TERM_COLORS

# colors:
if [ "$USECOLOR" = "YES" -o "$USECOLOR" = "yes" ]; then
        C_MAIN="\033[1;37;40m"      # main text
        C_OTHER="\033[1;34;40m"     # prefix & brackets
        C_SEPARATOR="\033[1;30;40m" # separator

        C_BUSY="\033[0;36;40m"      # busy
        C_FAIL="\033[1;31;40m"      # failed
        C_DONE="\033[1;37;40m"      # completed

        C_H1="\033[1;37;40m"        # highlight text 1
        C_H2="\033[1;36;40m"        # highlight text 2
	C_OK="\033[01;32m"	    # green text
        C_CLEAR="\033[1;0m"	    # clear color
fi

if [ -t 1 ]; then
        SAVE_POSITION="\033[s"
        RESTORE_POSITION="\033[u"
        DEL_TEXT="\033[$(($STAT_COL+4))G"
else
        SAVE_POSITION=""
        RESTORE_POSITION=""
        DEL_TEXT=""
fi

# prefixes:
PREFIX_REG=":::"
PREFIX_HL="(O)"

# different little functions:
deltext() {
        printf "${DEL_TEXT}"
}

printhl() {
        printf "${C_OTHER}${PREFIX_HL} ${C_H1}${1}${C_CLEAR} \n"
}

printsep() {
        printf "\n${C_SEPARATOR}   ------------------------------  ------------------------------\n"
}

stat_busy() {
        printf "${C_OTHER}${PREFIX_REG} ${C_MAIN}${1}${C_CLEAR} "
        printf "${SAVE_POSITION}"
        deltext
        printf "   ${C_OTHER}[${C_BUSY}BUSY${C_OTHER}]${C_CLEAR} "
}

stat_done() {
        deltext
        printf "   ${C_OTHER}[${C_DONE}DONE${C_OTHER}]${C_CLEAR} \n"
}

stat_fail() {
        deltext
        printf "   ${C_OTHER}[${C_FAIL}FAIL${C_OTHER}]${C_CLEAR} \n"
}
input_err() {
	printf "   ${C_FAIL}Wrong input! ${1}${C_CLEAR}\n"
}
prompt() {
	printf "=> "
}
cancel() {
	cd /
	sleep 1
	umount /dev/disk/by-label/$SOURCE 2> /dev/null
	sleep 1
	umount /dev/disk/by-label/$AIM 2> /dev/null
	stat_fail
	exit 1
}
#regular expression, integer only
RE='^[0-9]+$'
# coordinates our input for $SOURCE
input_source() {
	DEV_NR=$[$DEV_NR-1]
	prompt
	read SOURCE || cancel
	if ( [[ $SOURCE =~ $RE ]]  && [ $SOURCE -ge 0 ] && [ $SOURCE -le $DEV_NR ] ); then
	  SOURCE=${DEV[$SOURCE]}
	  DEV_NR=$[$DEV_NR+1]
	else
	  input_err "Choose between 0 and $DEV_NR!"
	  DEV_NR=$[$DEV_NR+1]
	  input_source
	fi || cancel
}
# coordinates our input for $AIM
input_aim() {
	DEV_NR=$[$DEV_NR-1]
	prompt
	read AIM || cancel
	if ( [[ $AIM =~ $RE ]]  && [ $AIM -ge 0 ] && [ $AIM -le $DEV_NR ] ); then
	  AIM=${DEV[$AIM]}
	  if [[ $AIM = $SOURCE ]]; then
	    input_err "Choose between 0 and $DEV_NR, but not '$SOURCE'!${C_CLEAR}"
	    DEV_NR=$[$DEV_NR+1]
	    input_aim
	  fi
	else
	  input_err "Choose between 0 and $DEV_NR, but not '$SOURCE'!${C_CLEAR}"
	  DEV_NR=$[$DEV_NR+1]
	  input_aim
	fi || cancel
	DEV_NR=$[$DEV_NR+1]
}
# function which runs, when we call "image-creation"
backup() {
	clear
	echo " "
	stat_busy "[1/3] Configuring System Backup"
	echo " "
	echo " "
	echo "   Enter the number of device-label you want to backup as image:"
	dev_list
	echo " "
	input_source
	printf "  ${C_SEPARATOR}"
	mount | grep $SOURCE | grep "on / type"
	if [ $? = 0 ]; then
	  printf "   ${C_FAIL}For System-Backups You need to be root from live-CD${C_CLEAR}"
	  cancel
	fi
	printf "  ${C_CLEAR}"
	echo " "  
	echo "   Enter the number of the device-label where you want to store the image:"
	dev_list
	echo " "
	input_aim
	stat_done
	printf "\n\n\n\n"
	stat_busy "[2/3] Preparing Backup and Processing Image"
	printf "${C_SEPARATOR}"
	mkdir $MNT_SYSTEM 2> /dev/null
	mkdir $MNT_BACKUP  2> /dev/null
	printf "${C_CLEAR}"
	mount -o ro -L $SOURCE $MNT_SYSTEM || cancel
	mount -L $AIM $MNT_BACKUP || cancel
	printf "${C_SEPARATOR}"
	echo " "
	echo " "
	ls -d $MNT_BACKUP/system > /dev/null 2> /dev/null
	if [ $? != 0 ]; then
	  echo "   Creating folder for backup-images..."
	  mkdir $MNT_BACKUP/system > /dev/null 2> /dev/null
	fi
	printf "${C_CLEAR}"
	cd $MNT_SYSTEM || cancel
	printf "\n   Create backup-image of /dev/disk/by-label/${C_H2}${SOURCE}${C_CLEAR} at /dev/disk/by-label/${C_H2}${AIM}${C_CLEAR}/system/${SOURCE}-${DATE}.tar.bz2 ?\n"
	backup_command() {
	    echo "   Packing tarball, this can take a long time..."
	    printf "${C_SEPARATOR}tar cpflv ${MNT_BACKUP}/system/${SOURCE}-${DATE}.tar --index-file=${MNT_BACKUP}/system/${SOURCE}-${DATE}.log --wildcards --verify --xattrs --anchored --exclude=\"home/*/.config/Slack\" --exclude=\"home/*/Eigene_Dateien\" --exclude=\"home/*/.cache\" --exclude=\"var/tmp/*\" --exclude=\"proc/*\" --exclude=\"sys/*\" --exclude=\"tmp/*\" *${C_CLEAR}\n"
	    tar cpflv $MNT_BACKUP/system/$SOURCE-$DATE.tar --index-file=$MNT_BACKUP/system/$SOURCE-$DATE.log --wildcards --verify --xattrs --anchored --exclude="home/*/.config/Slack" --exclude="home/*/Eigene_Dateien" --exclude="home/*/.cache" --exclude="var/tmp/*" --exclude="proc/*" --exclude="sys/*" --exclude="tmp/*" *  || cancel
	    if [ $? = 0 ]; then
	      echo "   Tarball created and verified successfully."
	      echo " "
	      echo "   Compressing Tarball, this can take a long time on single core cpu..." && which pbzip2 > /dev/null 2> /dev/null
	      case "$?" in
		0)
		  printf "${C_SEPARATOR}"
		  pbzip2 -z -m768 -v --best $MNT_BACKUP/system/$SOURCE-$DATE.tar || cancel
		;;
		1)
		  printf "${C_SEPARATOR}"
		  bzip2 -z -v --best $MNT_BACKUP/system/$SOURCE-$DATE.tar || cancel
		;;
	      esac
	      printf "${C_CLEAR}"
	      echo "   Tarball compressed successfully, now verifying..."
	      printf "${C_SEPARATOR}"
	      which pbzip2 > /dev/null 2> /dev/null
	      case "$?" in
		0)
		  printf "${C_SEPARATOR}"
		  pbzip2 -t -m768 -v $MNT_BACKUP/system/$SOURCE-$DATE.tar.bz2 || cancel
		;;
		1)
		  printf "${C_SEPARATOR}"
		  bzip2 -t -v $MNT_BACKUP/system/$SOURCE-$DATE.tar.bz2 || cancel
		;;
	      esac
	      printf "${C_CLEAR}"
	      echo "   ...successful!"
	    else
	      cancel
	    fi
	}
	PROGRAM=backup_command
	case_program
	stat_done
	printf "\n\n\n\n"
	stat_busy "[3/3] Creating Checksum and Cleaning System"
	cd $MNT_BACKUP/system/ || cancel
	md5sum $SOURCE-$DATE.tar.bz2 > $SOURCE-$DATE.md5 || cancel
	echo " "
	printf "${C_SEPARATOR}\n   $(cat $SOURCE-$DATE.md5 || cancel)${C_CLEAR}\n"
	echo " "
	echo "   Created Files:"
	echo "   --------------"
	printf "$(ls -ash $MNT_BACKUP/system/ | grep $SOURCE-$DATE || cancel)"
	cd / || cancel
}
# function which runs, when we call "restore"
restore () {
	clear
	echo " "
	stat_busy "[1/3] Configuring System Restore"
	echo " "
	echo " "
	echo "   Enter the number of the device-label where an 'system'-folder (backup) is located:"
	dev_list
	echo " "
	source_device () {
	      input_source
	      mkdir $MNT_BACKUP 2> /dev/null
	      mount -o ro -L $SOURCE $MNT_BACKUP || cancel
	      ls -d $MNT_BACKUP/system > /dev/null 2> /dev/null
	      if [[ $? != 0 ]]; then
		input_err "No backup-image folder $MNT_BACKUP/system found!"
		sleep 1
		umount /dev/disk/by-label/$SOURCE || cancel
		rmdir $MNT_BACKUP 2> /dev/null
		source_device
	      fi
	}
	source_device
	echo " "
	echo "   Enter the number of the backup you want to restore:"
	declare -a FILE
	FILE=( $(ls $MNT_BACKUP/system|grep tar.bz2) )
	FILE_NR=$(echo ${FILE[@]} | wc -w)
	NR=0
	until [ $NR = $FILE_NR ]; do
	printf "   ${C_H2}$NR${C_SEPARATOR}:${C_CLEAR}${FILE[$NR]} "
	NR=$[$NR+1]
        done
	echo " "
	FILE_NR=$[$FILE_NR-1]
	input_aimfile() {
	      prompt
	      read AIMFILE || cancel
	      if [[ $AIMFILE = [0-$FILE_NR] ]]; then
		AIMFILE=${FILE[$AIMFILE]}
	      else
		input_err "Choose between 0 and $FILE_NR!"
		input_aimfile
	      fi || cancel
	}
	input_aimfile
	echo " "  
	echo "   Enter the number of the device-label where you want to extract the image:"
	dev_list
	echo " "
	input_aim
	printf "  ${C_SEPARATOR}"
	mount | grep $AIM | grep "on / type" > /dev/null 2> /dev/null
	if [ $? = 0 ]; then
	  printf " ${C_FAIL}You want to extract to /${C_CLEAR}\n"
	  PROGRAM=$(printf "")
	  case_program
	fi
	printf "  ${C_CLEAR}"
	echo " "  
	stat_done
	printf "\n\n\n\n"
	stat_busy "[2/3] Checking MD5-sum and Processing Image"
	echo " "
	mkdir $MNT_SYSTEM  2> /dev/null
	mount -L $AIM $MNT_SYSTEM || cancel
	cd $MNT_BACKUP/system || cancel
	AIMFILE=$(echo $AIMFILE|cut --delimiter="." -f1)
	printf "${C_SEPARATOR}"
	md5sum -c $AIMFILE.md5 || cancel
	printf "${C_CLEAR}"
	echo " "
	printf "\n   Restore backup-image of /dev/disk/by-label/${SOURCE}/system/${C_H2}$AIMFILE.tar.bz2${C_CLEAR} at /dev/disk/by-label/${C_H2}${AIM}${C_CLEAR}?\n"
	restore_command() {
		echo "   Unpacking tarball, this can take a long time..."
		printf "${C_SEPARATOR}tar xpjfv --xattrs ${MNT_BACKUP}/system/${AIMFILE}.tar.bz2 --index-file=${MNT_SYSTEM}/system_restore-${DATE}.log --directory ${MNT_SYSTEM}${C_CLEAR}\n"
		tar xpjfv --xattrs $MNT_BACKUP/system/$AIMFILE.tar.bz2 --index-file=$MNT_SYSTEM/system_restore-$DATE.log --directory $MNT_SYSTEM || cancel
		if [ $? = 0 ]; then
		  echo "   Tarball extracted successfully."
		  echo " "
		fi
	  }
	  PROGRAM=restore_command
	  case_program
	  stat_done
	printf "\n\n\n\n"
	stat_busy "[3/3] Cleaning System"
	echo " "
	echo "   If you unpacked an image on another PC you have to check/adjust:"
	echo "   - /etc/xorg.conf (X11-Server, another graphics card?)"
	echo "   - /etc/fstab (devices you mount while booting, changed uuid, device-label,other devices?)"
	echo "   - /boot/grub/menu.lst or /etc/lilo.conf (same as above, bootloader has to find /)"
	cd / || cancel
}
# asks if we want to continue with a special function
case_program() {
	printf "   ${C_SEPARATOR}Continue? [${C_H2}y${C_SEPARATOR}es/${C_H2}n${C_SEPARATOR}o]${C_CLEAR}\n"
	prompt
	read INPUT
	echo " "
	case "$INPUT" in
	  y)
	    $PROGRAM
	  ;;
	  n)
	    printf "   ${C_SEPARATOR}Aborted by user $(whoami)${C_CLEAR}"
	    cancel
	  ;;
	  *)
	    input_err "Type 'y' for Yes or 'n' for No"
	    case_program
	esac
}
# here starts the program with functions from above
if [[ $(whoami) != root ]]; then
  printf "${C_FAIL}You need to be root!${C_CLEAR}\n"
  exit 1
fi
DATE=$(date -I);
MNT_BACKUP="/mnt/sib_backup"
MNT_SYSTEM="/mnt/sib_system"
declare -a DEV
DEV=( $(ls /dev/disk/by-label/) )
dev_list () {
	DEV_NR=$(echo ${DEV[@]} | wc -w)
	NR=0
	until [ $NR = $DEV_NR ]; do
	printf "   ${C_H2}$NR${C_SEPARATOR}:${C_CLEAR}${DEV[$NR]} "
	NR=$[$NR+1]
        done
}
echo " "
printhl "${C_H2}System Backup (image)"
printhl "Copyright 2010-2011 Manuel Conzelmann"
printhl "Distributed under the GNU General Public License (GPL)"
printhl ""
printhl "using $(tar --version | head -1)"
printsep
printf "${C_CLEAR}   For creating an image type ${C_H2}1${C_CLEAR}."
printf "   For restoring an image type ${C_H2}2${C_CLEAR}.\n"
abfrage () {
prompt
read INPUT
echo " "
case "$INPUT" in
  1)
      printf "   ${C_SEPARATOR}For System-Backups You need to be root from live-CD\n"
      printf "   Hidden files in the root-directory of the imaged system won't be backed up${C_CLEAR}\n"
      PROGRAM=backup
      case_program
      echo " "
  ;;
  2)
      printf "   ${C_SEPARATOR}For System-Restore You need to be root from live-CD\n"
      printf "   Remember: you need enough space on your target-device${C_CLEAR}\n"
      PROGRAM=restore
      case_program
      echo " "
  ;;
  *)
    input_err "Type '1' for image-creation or '2' for extracting an existing one."
    abfrage
esac
}
abfrage
umount /dev/disk/by-label/$SOURCE || cancel
umount /dev/disk/by-label/$AIM || cancel
rmdir $MNT_SYSTEM || cancel
rmdir $MNT_BACKUP || cancel
echo " "
printf "${C_OK}${PROGRAM} ran successfully!${C_CLEAR}"
stat_done


#exclude.lst ?
#/usr/src
