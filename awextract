#!/bin/bash

## Argument parsing ##
while [ "${#}" -gt 0 ]; do
  case "${1}" in
    -s|--szsfile)
      shift
      SZSFILE="${1}"
      shift
      ;;
    -a|--awdir)
      shift
      AWDIR="${1%/}"
      shift
      ;;
    -o|--output)
      shift
      OUTPUTDIR="${1}"
      shift
      ;;
    *)
      echo "awextract - extract .wav files from .aw files"
      echo "            (requires yaz0dec (from szstools), baad, and wsyster)"
      echo ""
      echo "Usage: ${0} -s [FILE.szs] -a [DIRECTORY] [-o [DIRECTORY]]"
      echo ""
      echo "Options:"
      echo "  -s, --szsfile Path to the .szs file (required)"
      echo "  -a, --awdir   Path to the directory containing the .aw files (required)"
      echo "  -o, --output  Output directory for the .wav files (optional)"
      exit 0
      ;;
  esac
done

## Find required programs ##
if $(which yaz0dec >/dev/null); then
  YAZ0DEC='yaz0dec'
elif [ -x "$(pwd)/yaz0dec" ]; then
  YAZ0DEC="$(pwd)/yaz0dec"
else
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31myaz0dec not found in PATH or current directory\e[0m"
fi
if $(which baad >/dev/null); then
  BAAD='baad'
elif [ -x "$(pwd)/baad" ]; then
  BAAD="$(pwd)/baad"
else
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31mbaad not found in PATH or current directory\e[0m"
fi
if $(which wsyster >/dev/null); then
  WSYSTER='wsyster'
elif [ -x "$(pwd)/wsyster" ]; then
  WSYSTER="$(pwd)/wsyster"
else
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31mwsyster not found in PATH or current directory\e[0m"
fi

## Check for invalid files ##
# .szs file
if [ -d "${SZSFILE}" ]; then
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31m${SZSFILE} is a directory\e[0m"
elif [ ! -f "${SZSFILE}" ]; then
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31m${SZSFILE} not found\e[0m"
fi
# directory with .aw files
if [ -f "${AWDIR}" ]; then
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31m${AWDIR} is a file\e[0m"
elif [ ! -d "${AWDIR}" ]; then
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31m${AWDIR} not found\e[0m"
elif [ ! $(ls -1 "${AWDIR}" | grep "\\.aw$" | wc -l) -gt 0 ]; then
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31m${AWDIR} contains no .aw files\e[0m"
fi
# output directory
if [ -f "${OUTPUTDIR}" ]; then
  ERRORMSG[${#ERRORMSG[@]}]="\e[1;31m${OUTPUTDIR} is a file\e[0m"
fi

## Print error messages ##
if [ "${#ERRORMSG[@]}" != 0 ]; then
  for i in "${ERRORMSG[@]}"; do
    echo -e "${i}"
    done
  exit 2
fi

## Find output directory ##
if [ -z "${OUTPUTDIR}" ]; then
  OUTPUTDIR="$(pwd)"
elif [ ! -d "${OUTPUTDIR}" ]; then
  mkdir -p "${OUTPUTDIR}"
fi

## Print info ##
echo -e "\e[1;32m.szs file\e[0m:\t\t\e[1;33m${SZSFILE}\e[0m"
echo -e "\e[1;32m.aw files directory\e[0m:\t\e[1;33m${AWDIR}\e[0m"
echo -e "\e[1;36moutput directory\e[0m:\t\e[1;35m${OUTPUTDIR}\e[0m"
echo ""

## Create temporary directory and copy files over ##
echo -e "\e[1;32m==>\e[0m \e[1;37mCreating temporary directory...\e[0m"
TEMPDIR="${OUTPUTDIR}/_TEMP.${RANDOM}"
mkdir "${TEMPDIR}"
echo -e "\e[1;32m==>\e[0m \e[1;37mCopying files to temporary directory...\e[0m"
cp "${SZSFILE}" "${TEMPDIR}/"
cp "${AWDIR}"/*.aw "${TEMPDIR}/"

## Enter temporary directory ##
echo -e "\e[1;32m==>\e[0m \e[1;37mEntering temporary directory...\e[0m"
pushd "${TEMPDIR}" >/dev/null

## Decompress .szs file ##
echo -e "\e[1;32m==>\e[0m \e[1;37mDecompressing .szs file into .baa file...\e[0m"
${YAZ0DEC} "${SZSFILE##*/}" >/dev/null
echo -e "\e[1;32m==>\e[0m \e[1;37mRemoving .szs file...\e[0m"
rm "${SZSFILE##*/}"
mv "${SZSFILE##*/}"* TEMP.baa

## Extract .baa file ##
echo -e "\e[1;32m==>\e[0m \e[1;37mExtracting .baa file into .wsys and .bnk files...\e[0m"
${BAAD} TEMP.baa >/dev/null
echo -e "\e[1;32m==>\e[0m \e[1;37mRemoving .baa file...\e[0m"
rm TEMP.baa

## Convert .wsys files to wav ##
echo -e "\e[1;32m==>\e[0m \e[1;37mExtracting audio samples from .aw and .wsys files into .wav files...\e[0m"
for i in *.wsys; do
  ${WSYSTER} "${i}" >/dev/null
done
echo -e "\e[1;32m==>\e[0m \e[1;37mRemoving .wsys files...\e[0m"
rm *.wsys
echo -e "\e[1;32m==>\e[0m \e[1;37mRemoving .bnk files...\e[0m"
rm *.bnk
echo -e "\e[1;32m==>\e[0m \e[1;37mRemoving .baa.* files...\e[0m"
rm TEMP.baa.*
echo -e "\e[1;32m==>\e[0m \e[1;37mRemoving .aw files...\e[0m"
rm *.aw

## Move .wav files to output directory ##
echo -e "\e[1;32m==>\e[0m \e[1;37mMoving .wav files to output directory...\e[0m"
mv *.wav "${OUTPUTDIR}/"

## Exit temporary directory ##
echo -e "\e[1;32m==>\e[0m \e[1;37mExitting temporary directory...\e[0m"
popd >/dev/null

## Remove temporary directory ##
echo -e "\e[1;32m==>\e[0m \e[1;37mRemoving temporary directory...\e[0m"
rm -r "${TEMPDIR}"

## Done!! ##
echo ""
echo -e "\e[1;31mF\e[1;32mi\e[1;33mn\e[1;34mi\e[1;35ms\e[1;36mh\e[1;37me\e[1;31md\e[1;32m!\e[0m"
