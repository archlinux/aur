#!/bin/bash
################################################################################
#
# Version: 1.5.4
# Name: dPluzz-cli.sh
# Last modification: 2018/08/10
#
# -------------------------------------- HISTORY -------------------------------
#
# 2018/08/10 (1.5.4): Correctifs pour FTV
#
# 2018/03/30 (1.5.3): Correctifs pour FTV, arte, M6&Cie
#
# 2017/12/23 (1.5.2): Correctifs pour M6&Cie, C+&Cie, Gulli, NRJ12&Cie
#                     Divers beugues corrigés
#                     Possibilité de mettre en pause les opérations dans certains cas
#
# 2017/07/27 (1.5.0): Caractères non-ASCII dans les titres peuvent être autorisés (--keep-non-ascii)
#                     Si échec, possibilité d'empêcher l'effacement des fichiers créés (--no-cleaning)
#                     Prise en charge de RTBF
#
# 2017/07/26 (1.4.6): Beugues corrigés (fin de téléchargement, arte)
#
# 2017/09/08 (1.5.1): Correctifs pour arte
#
# 2017/07/24 (1.4.5): Correction numéro de saison/épisodes
#
# 2017/07/01 (1.4.4): Ignore WGETRC
#
# 2017/05/19 (1.4.3): Correctifs pour FTV et arte (enfin !)
#
# 2017/03/05 (1.4.2): Correctifs pour M6
#
# 2016/12/20 (1.4.1): Correctifs pour arte
#
# 2016/10/30 (1.4.0): Correctifs pour dailymotion (donc les chaînes qui l'utilisent comme numéro 23 ou l'équipe), pluzz
#
# 2016/10/09 (1.3.1): Correction faux positif
#
# 2016/09/29 (1.3.0): Prise en charge de France Info (TV), Arte (+7, Concert), LCP-AN, Public Sénat, M6, W9, 6ter, Numéro23, L'Équipe, Dailymotion
#                     Beugues corrigés (ftv, kill_jobs, build_filenames, fusion des urls partielles)
#                     Nouvelles fonctions (clean_files, lowercase, uppercase, softly_normalisedcase, strictly_normalisedcase, fix_case, normalise_url)
#
# 2016/09/12 (1.2.0): Prise en charge de TV5 Monde+ et TV5 Monde+ Afrique
#
# 2016/09/10 (1.1.0): Réparation des chaînes C8 (ex-D8), CStar (ex-D17), NRJ12, Cherie25, Gulli
#                     Beugues corrigés (sanitise)
#                     Nouvelles dépendances (perl)
#
# 2016/08/29 (1.0.0): Libération officielle
#                     Désactivation des tests sur la disponibilité des codecs dans avconv/ffmpeg car non fiables
#
# 2016/02/25 (0.9.0): Fusion de dPluzz et dCplus développés principalement par Matthieugoua, melixgaro, gaara
#                     Merci aussi à Lulux3
#                     Voir ces scripts pour leur propre historique [melixgaro]
#
#-------------------------------------- DEPENDANCIES ---------------------------
#
# avconv (sudo apt-get install --no-install-recommends libav-tools)
# ou bien
# ffmpeg (sudo apt-get install --no-install-recommends ffmpeg)
#
################################################################################

# Probably deprecated. Delete at next release if nobody complains
# Workaround for grep 2.21 or later
# export LC_ALL=C

# Ignore WGETRC
unset WGETRC

# Traps
kill_jobs()
{
    pkill -TERM -P "$BASHPID"
    logger warning "Programme interrompu par l'utilisateur"
    clean_files
    exit 1
}

trap kill_jobs INT TERM #EXIT

# Script variables
version="1.5.4"
script_path="$(cd "$(dirname "$0")"; pwd -P)"
script_md5="$(md5sum "${script_path}/$(basename "$0")" | cut -d\  -f1)"
term_width=$(tput cols)

################################################################################

# Color definition
export black_fgc="\e[7;0;31m"
export red_fgc="\e[7;0;31m"
export green_fgc="\e[0;32m"
export yellow_fgc="\e[0;33m"
export blue_fgc="\e[1;34m"
export magenta_fgc="\e[0;35m"
export cyan_fgc="\e[0;36m"
export white_fgc="\e[0;37m"
export default_fgc="\e[0;39m"

################################################################################

# Exiting
clean_files ()
{
    local filename

    if ! ${clean_if_failure}
    then
	exit
    fi
    
    logger info "Effacement des fichiers temporaires…"
    for filename in "${files_to_clean[@]}"
    do
	[[ -f "${filename}" ]] && rm -v -- "${filename}"
    done
}

exit_if_empty ()
{
    if [[ ${#1} -eq 0 ]]
    then
	logger critical "${2}"
    fi
}

# Flagging functions
debug_flagger ()
{
    echo "$(date +"%d/%m/%Y %H:%M:%S") [DEBUG]    "
}

info_flagger ()
{
    echo "$(date +"%d/%m/%Y %H:%M:%S") [INFO]     "
}

warning_flagger ()
{
    echo "$(date +"%d/%m/%Y %H:%M:%S") [WARNING]  "
}

critical_flagger ()
{
    echo "$(date +"%d/%m/%Y %H:%M:%S") [CRITICAL] "
}

# Logging
logger ()
{
    cr='
'
    while read line
    do
	case "${1}" in
	    "debug")
		echo -e "${blue_fgc}$(debug_flagger)${line}${default_fgc}" >&2
		;;
	    "info")
		echo -e "${green_fgc}$(info_flagger)${line}${default_fgc}" >&2
		;;
	    "warning")
		echo -e "${yellow_fgc}$(warning_flagger)${line}${default_fgc}" >&2
		;;
	    "critical")
		echo -e "${red_fgc}$(critical_flagger)${line}${default_fgc}" >&2
		;;
	esac
    done <<< "${2//\\n/${cr}}"
    if [[ "${1}" == "critical" ]]
    then
	clean_files
	exit 1
    fi
}

# String handling
sanitise ()
{
    # echo "${1}" | recode h4..latin1 | sed 's+^[[:blank:]]*++g' | sed 's+[[:blank:]]*$++g' | sed 's+[[:blank:]]\{1,\}+_+g' | iconv -f utf-8 -t ascii//translit | sed 's/[\&"!?;]/_/g' | sed 's/[^[:alnum:]-]/_/g' | sed 's/_\{2,\}/_/g' | sed 's/-\{2,\}/-/g' | sed 's/_-/-/g' | sed 's/^_*\([^_].*[^_]\)_*/\1/g' | sed 's/.*/\u\0/g' | sed 's/^-*//g'
    echo "${1}" | perl -MHTML::Entities -alne 'print(decode_entities($_))' | sed 's+^[[:blank:]]*++g' | sed 's+[[:blank:]]*$++g' | sed 's+[[:blank:]]\{1,\}+_+g' | perl -Mutf8 -MText::Unidecode -alne 'use open ":std", ":encoding(utf-8)"; print(unidecode($_));' | sed 's/[\&"!?;]/_/g' | sed 's/[^[:alnum:]-]/_/g' | sed 's/_\{2,\}/_/g' | sed 's/-\{2,\}/-/g' | sed 's/_-/-/g' | sed 's/^_*\([^_].*[^_]\)_*/\1/g' | sed 's/.*/\u\0/g' | sed 's/^-*//g'
}

sanitise_but_keep_non_ascii ()
{
    echo "${1}" | perl -MHTML::Entities -alne 'print(decode_entities($_))' | sed 's+^[[:blank:]]*++g' | sed 's+[[:blank:]]*$++g' | sed 's+[[:blank:]]\{1,\}+_+g' | sed 's/[\&"!?;]/_/g' | sed 's/[^[:alnum:]-]/_/g' | sed 's/_\{2,\}/_/g' | sed 's/-\{2,\}/-/g' | sed 's/_-/-/g' | sed 's/^_*\([^_].*[^_]\)_*/\1/g' | sed 's/.*/\u\0/g' | sed 's/^-*//g'
}

lowercase ()
{
    sed 's/.*/\L\0/g' <<< "${1}"
}

uppercase ()
{
    sed 's/.*/\U\0/g' <<< "${1}"
}

softly_normalisedcase ()
{
    sed 's/.*/\u\0/g' <<< "${1}"
}

strictly_normalisedcase ()
{
    sed 's/.*/\L\u\0/g' <<< "${1}"
}

fix_case ()
{
    case "${2}" in
	"L")
	    lowercase "${1}"
	    ;;
	"U")
	    uppercase "${1}"
	    ;;
	"S")
	    softly_normalisedcase "${1}"
	    ;;
	"N")
	    strictly_normalisedcase "${1}"
	    ;;
	*)
	    echo "${1}"
	    ;;
	esac
}

progressfilt ()
{
    local line=""
    local prev_progression=0
    while read line
    do
	progression=$(grep -oE "[0-9.]{1,}%" <<< "${line}" | sed 's/%//g' | awk '{if ($1 ~ /[0-9]/) {printf "%6.2f", $1} else {printf "%6.2f", 0}}')
	if [[ "${progression}" != "${prev_progression}" && ${#progression} -ne 0 ]]
	then
	    prev_progression=${progression}
	    echo -ne "\e[F" >&2
	    logger info "Progression: ${progression}%"
	fi
    done
}

month_number ()
{
    local month=$(tr '[A-Z]' '[a-z]' <<< "${1}")
    local nmonth=""
    case "${1}" in
	"janvier")
	    nmonth="01"
	    ;;
	"février"|"fevrier")
	    nmonth="02"
	    ;;
	"mars")
	    nmonth="03"
	    ;;
	"avril")
	    nmonth="04"
	    ;;
	"mai")
	    nmonth="05"
	    ;;
	"juin")
	    nmonth="06"
	    ;;
	"juillet")
	    nmonth="07"
	    ;;
	"aout"|"août")
	    nmonth="08"
	    ;;
	"septembre")
	    nmonth="09"
	    ;;
	"octobre")
	    nmonth="10"
	    ;;
	"novembre")
	    nmonth="11"
	    ;;
	"décembre"|"decembre")
	    nmonth="12"
	    ;;
	*)
	    nmonth="00"
	    ;;
    esac
    echo "${nmonth}"
}

normalise_url ()
{
    local line=""
    local reference_url="${1}"
    local netloc
    netloc="$(sed 's+\(https\?://\)\?\([^/]*\).*+\1\2+g' <<< "${reference_url}")"

    while read line
    do
	if [[ "${line:0:4}" == "http" ]]
	then
	    echo "${line}"
	elif [[ "${line:0:2}" == ".." ]]
	then
	    echo "$(dirname "${reference_url}")/${line}"
	elif [[ "${line:0:1}" == "/" ]]   # DM
	then
	    echo "${netloc}${line}"
	elif [[ ! "${line}" =~ ^.*"/".*$ ]]   # Gulli, LCP
	then
	    echo "$(dirname "${reference_url}")/${line}"
	# else
    	#     echo "${line}"
	fi
    done < /dev/stdin
}

################################################################################

# Common variables
user_agent="Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:44.0) Gecko/20100101 Firefox/44.0"
advice_msg="Réessayer plus tard, ou si l'erreur persiste, attendez une mise-à-jour. Si vous êtes dans une zone géographique bloquée, il n'y a rien à faire"
lock_msg="Cette vidéo semble être verrouillée, il n'y a pas grand chose à faire (à part déplorer l'usage de mécanismes contraignants et restrictifs par les diffuseurs)"

timestamp=$(date +%s)

# User settings: display
is_coloured=true
is_verbose=false
keep_non_ascii=false
clean_if_failure=true

columns=$(tput cols)
if [[ ! ${columns} =~ [0-9] ]]
then
    columns=79
fi

# User settings: video
avconv_exec="avconv"
want_ffmpeg=false
video_container="mkv"
video_codec="copy"
video_codec_is_changed_by_user=false
audio_codec="aac"
audio_codec_is_changed_by_user=false
subtitle_codec="ass"
subtitle_codec_is_changed_by_user=false
want_mp3=false
want_vo=false
want_subtitles=false
subtitle_lang="vf"
colored_subtitles=false
keep_srt=false
keep_ass=false
mux_subtitles=false
conversion_log=false
video_quality="best"
forced_filename_root=""
accepted_keywords=("%(TITRE)" "%(SOUSTITRE)" "%(JOUR)" "%(MOIS)" "%(ANNEE)" "%(HEURE)" "%(MINUTE)" "%(RUBRIQUE)" "%(SAISON)" "%(EPISODE)" "%(QUALITE)" "%(URL)" "%(ID)")
number_format="%02d"
naming_convention="%(RUBRIQUE)-%(TITRE)-%(SOUSTITRE)_S%(SAISON)E%(EPISODE)_%(ANNEE)%(MOIS)%(JOUR)-%(HEURE)%(MINUTE)"
naming_convention="%(TITRE)-%(ANNEE)%(MOIS)%(JOUR)-%(HEURE)%(MINUTE)"

################################################################################

# Command line parsing
usage()
{
    fmt -w ${columns} -p" " << EOF
usage: $(basename $0) [OPTIONS] [-u|--url] URL

OPTIONS:
-u|--url STR            adresse de la vidéo

-d|--directory STR      dossier de destination

-o|--output STR         nom du fichier (sans extension). À la priorité sur le nommage automatique

--name-format           formatage du nom des fichiers [défaut: ${naming_convention}]
                        Mots-clefs acceptés: %(TITRE), %(SOUSTITRE), %(JOUR), %(MOIS), %(ANNEE), %(HEURE), %(MINUTE), %(RUBRIQUE), %(SAISON), %(EPISODE)

                        Vous pouvez appliquer un modificateur sur un mot-clef afin de contrôler la casse. Les modificateurs sont 'L' (basse casse intégrale), 'U' (haute casse intégrale), 'N' (haute casse pour la première lettre, basse casse pour le reste). Exemple d'utilisation pour avoir le titre en haute casse : %(TITRE:U)

--keep-non-ascii        garde les caractères non-ASCII dans le nom du fichier [défaut: false]

--no-cleaning           garde le fichier en cas d'échec [défaut: false]

-q|--quality            qualité de la vidéo, si pertinent (best, standard, worst) [défaut: best]

--video-codec STR       spécifie le codec video (copy, libx264) [défaut: copy]
                        il est conseillé de garder la valeur par défaut. Tout autre choix est encore expérimental. Si vous choisissez un codec autre que 'copy', la création de la vidéo sera plus longue (les réglages actuels peuvent aider à réduire la taille pour une qualité comparable)

--audio-codec STR       spécifie le codec audio (aac, mp3, copy) [défaut: aac]

--subtitle-codec STR    spécifie le codec de sous-titre (ass, srt, subrip) [défaut: ass]

--video-container STR   spécifie le conteneur vidéo (mkv, mp4) [défaut: mkv]

--subtitle-lang STR     spécifie la langue des sous-titres, si disponible (vf, vf-ad) [défaut: vf]
                        vf-ad fournit la version française avec audiodescription

--colored-subtitles     garde la couleur dans les sous-titre, si disponible [défaut]
                        activé pour les sous-titres avec audiodescription

--subtitle-mode STR     mode de sauvegarde des sous-titres (srt, ass, mux)
                                                                 [défaut: srt]
                        'srt' ou 'ass' active la sauvegarde des sous-titres dans un fichier séparé au format srt ou ass
                        'mux' est un mode expérimental qui permet de multiplexer la piste de sous-titres avec les autres pistes et de n'avoir qu'un seul fichier à la fin (mkv uniquement)

--vo                    requiert la langue originale, si disponible

-f|--ffmpeg             utilise ffmpeg [défaut: avconv]

--log                   conserve le journal de la conversion

--no-color              désactive la coloration du terminal

-v|--verbose            mode bavard

-V|--version            affiche la version du script

-h|--help               affiche cette aide

OPTIONS OBSOLÈTES:
-m                      OBSOLÈTE (conservée pour compatibilité,
                                                        utilisez --audio-codec)
                        convertit l'audio en MP3

SCHÉMAS D'URL ACCEPTÉS:
Les étoiles indiquent l'endroit à partir duquel vos urls peuvent différer
-> http://www.france.tv/*
-> http://www.francetvinfo.fr/*
-> http://www.arte.tv/fr/*
-> http://www.arte.tv/de/*
[La vidéo sera en allemand]
-> http://concert.arte.tv/fr/*
-> http://concert.arte.tv/de/*
[La vidéo sera en allemand]
-> http://www.lcp.fr/*
-> http://replay.publicsenat.fr/vod/*
-> http://www.publicsenat.fr/lcp/*
-> https://www.mycanal.fr/*
-> https://www.6play.fr/*
-> http://www.nrj-play.fr/nrj12/replay/*
-> http://www.nrj-play.fr/cherie25/replay/*
-> http://replay.gulli.fr/*
-> http://www.lequipe.fr/lachainelequipe/video/*
-> http://www.numero23.fr/*video_id*
[Il est important que l'adresse se termine par une chaîne similaire à '?video_id=123abcd'. Sur http://www.numero23.fr/replay, depuis votre navigateur, il faut faire un clique droit sur les miniatures des vidéos (les photos avec l'icône de lecture) et copier l'adresse.]
-> http://www.tv5mondeplus.com/*
-> http://www.tv5mondeplusafrique.com/*
-> http://www.dailymotion.com/*
-> http://www.rtbf.be/auvio/*

REMARQUES:
(1) En cas d'échec, veuillez réessayer plus tard avant d'invoquer un possible bogue
(2) Notez que le nom du fichier sera automatiquement nettoyé de certains caractères non recommendés (en particulier, les espaces, certains signes de ponctuations…)
(3) L'objectif de ce programme n'étant pas la conversion audio/vidéo, les options concernant les codecs/conteneurs resteront extrêmement basiques. Vous pouvez toujours utiliser avconv/ffmpeg par la suite
(4) Selon votre version de ffmpeg/avconv, certains codecs peuvent ne pas être disponibles
(5) Des cookies de session sont sauvegardés dans un fichier dont le nom ressemble à 'wget-1234567.cookies'. Ce fichier est effacé lorsque le programme se termine normalement. Sinon, vous pouvez les effacer manuellement
(6) Il est possible, pour certaines chaînes, de mettre en pause les opérations avec la touche p. Un nouvel appui sur la touche p relance les opérations. Attention, cette fonction est expérimentale ; il se peut que la reprise échoue

EOF
}

if [[ $# == 0 ]]
then
    usage
    exit 1
fi

while test -n "${1}"
do
    case "${1}" in
        "--no-color")
            shift
	    exit
	    is_coloured=false
	    black_fgc=""
	    red_fgc=""
	    green_fgc=""
	    yellow_fgc=""
	    blue_fgc=""
	    magenta_fgc=""
	    cyan_fgc=""
	    white_fgc=""
	    default_fgc=""
            ;;
        "-v"|"--verbose")
            shift
	    is_verbose=true
            ;;
        "-V"|"--version")
            shift
	    echo -e "${default_fgc}$(basename ${0} .sh): v. ${version}${default_fgc}" >&2
	    exit 1
            ;;
        "-h"|"--help")
	    usage
            exit 1
            ;;
        "-u"|"--url")
            shift
            url="${1}"
            shift
            ;;
        "-d"|"--directory")
            shift
            directory="${1}"
            shift
            ;;
        "-o"|"--output")
            shift
            forced_filename_root="${1}"
            shift
            ;;
        "--name-format")
            shift
            naming_convention="$(sed 's/\%(\([^)]*\))/%(\U\1)/g' <<< "${1}")"
	    for tag in $(grep -oE "%\([^\)]*\)" <<< "${naming_convention}")
	    do
		if [[ ! $(grep -G "${tag/:*/)}" <<< "${accepted_keywords[@]}") ]]
		then
		    logger critical "Ce mot-clef ${tag} est inconnu"
		fi
	    done
            shift
            ;;
        "--keep-non-ascii")
            shift
	    keep_non_ascii=true
	    sanitise ()
	    {
		sanitise_but_keep_non_ascii "${1}"
	    }
	    ;;
        "--no-cleaning")
            shift
	    clean_if_failure=false
            ;;
        "-q"|"--quality")
            shift
	    video_quality="$(tr '[A-Z]' '[a-z]' <<< "${1}")"
	    case "${video_quality}" in
		"best"|"standard"|"worst")
		    :
		    ;;
		*)
		    logger critical "Qualité non prise en charge"
		    ;;
	    esac
	    shift
	    ;;
        "--video-codec")
            shift
	    video_codec="$(tr '[A-Z]' '[a-z]' <<< "${1}")"
	    video_codec_is_changed_by_user=true
	    case "${video_codec}" in
		"copy"|"libx264")
		    :
		    ;;
		*)
		    logger critical "Codec video non pris en charge"
		    ;;
	    esac
	    shift
            ;;
        "--audio-codec")
            shift
	    audio_codec="$(tr '[A-Z]' '[a-z]' <<< "${1}")"
	    audio_codec_is_changed_by_user=true
	    case "${audio_codec}" in
		"aac"|"mp3"|"copy")
		    :
		    ;;
		*)
		    logger critical "Codec audio non pris en charge"
		    ;;
	    esac
	    shift
            ;;
        "--subtitle-codec")
            shift
	    subtitle_codec="$(tr '[A-Z]' '[a-z]' <<< "${1}")"
	    subtitle_codec_is_changed_by_user=true
	    case "${subtitle_codec}" in
		"ass"|"srt"|"subrip")
		    :
		    ;;
		*)
		    logger critical "Codec de sous-titres non pris en charge"
		    ;;
	    esac
	    shift
            ;;
        "--video-container")
            shift
	    video_container="$(tr '[A-Z]' '[a-z]' <<< "${1}")"
	    case "${video_container}" in
		"mkv"|"mp4")
		    :
		    ;;
		*)
		    logger critical "Conteneur vidéo non pris en charge"
		    ;;
	    esac
	    shift
            ;;
        "--subtitle-lang")
            shift
	    want_subtitles=true
	    subtitle_lang="$(tr '[A-Z]' '[a-z]' <<< "${1}")"
	    case "${subtitle_lang}" in
		"vf"|"vf-ad")
		    :
		    ;;
		*)
		    logger critical "Langue de sous-titres non prise en charge"
		    ;;
		esac
	    shift
            ;;
	"--colored-subtitles")
	    shift
	    colored_subtitles=true
	    ;;
	"--subtitle-mode")
	    shift
	    subtitle_mode="$(tr '[A-Z]' '[a-z]' <<< "${1}")"
	    case "${subtitle_mode}" in
	    	"srt")
	    	    keep_srt=true
	    	    keep_ass=false
	    	    mux_subtitles=false
	    	    ;;
	    	"ass")
	    	    keep_ass=true
	    	    keep_srt=false
	    	    mux_subtitles=false
	    	    ;;
	    	"mux")
	    	    mux_subtitles=true
	    	    keep_srt=false
	    	    keep_ass=false
	    	    ;;
	    	*)
	    	    logger critical "Mode de sauvegarde des sous-titres non pris en charge"
	    	    ;;
	    esac
	    shift
	    ;;
        "--vo")
            shift
	    want_vo=true
            ;;
        "-f"|"--ffmpeg")
            shift
	    want_ffmpeg=true
	    avconv_exec="ffmpeg"
	    ;;
        "--log")
            shift
	    conversion_log=true
            ;;
        "-m")
            shift
	    want_mp3=true
            ;;
        "--keep-srt")   # Private
            shift
	    keep_srt=true
            ;;
        "--keep-ass")   # Private
            shift
	    keep_srt=true
            ;;
        "-"*)
	    logger critical "Option inconnue"
            ;;
        *)
            url="${1}"
            shift
            ;;
    esac
done

################################################################################

# Main: functions

# Sanity checks: url
case "${url}" in
    http*://pluzz.francetv.fr*|http*://www.francetvinfo.fr*|http*://culturebox.francetvinfo.fr*)
	tvg="ftv-legacy"
	;;
    http*://www.france.tv*)
	tvg="ftv"
	;;
    http*://www.arte.tv*|http*://concert.arte.tv*)
	tvg="arte"
	;;
    http*://www.lcp.fr*)
	tvg="lcp"
	;;
    http*://www.publicsenat.fr*|http*://replay.publicsenat.fr*)
	tvg="ps"
	;;
    http*://www.canalplus.fr*|http*://www.c8.fr*|http*://replay.c8.fr*|http*://www.cstar.fr*|http*://replay.cstar.fr*|http*://www.itele.fr*)
	tvg="c+-legacy"
	;;
    http*://www.mycanal.fr*)
	tvg="c+"
	;;
    http*://www.6play.fr*)
	tvg="m6"
	;;
    http*://www.nrj-play.fr/nrj12*|http*://www.nrj-play.fr/cherie25*)
        tvg="nrj"
        ;;
    http*://replay.gulli.fr*)
	tvg="gulli"
	;;
    http*://www.lequipe.fr/lachainelequipe/video*)
	tvg="e21"
	;;
    http*://www.numero23.fr*video_id*)
	tvg="n23"
	;;
    http*://www.tv5mondeplus.com*)
	tvg="tv5"
	;;
    http*://www.tv5mondeplusafrique.com*)
	tvg="tv5-afrique"
	;;
    http*://www.dailymotion.com*)
    	tvg="dm"
    	;;
    http*://www.rtbf.be/auvio*)
    	tvg="rtbf"
    	;;
    *)
	logger critical "Chaîne non prise en charge ou url incorrecte"
	;;
esac

# Sanity checks: avconv/ffmpeg
if [[ ! $(which ${avconv_exec}) ]]
then
    logger critical "${avconv_exec} n'est pas présent sur votre machine"
fi

# Sanity checks: codec availability
case "${video_codec}" in
    "libx264")
	video_codec_test=$(${avconv_exec} -codecs 2> /dev/null | grep ".EV... h264 .*encoder.* libx264[^[:alnum:]]")
	;;
    "copy")
	video_codec_test="copy"
	;;
    *)
	logger critical "Erreur inconnue"
	;;
esac
# exit_if_empty "${video_codec_test}" "Codec video (${video_codec}) non pris en charge par votre version de ${avconv_exec}"

case "${audio_codec}" in
    "aac")
	audio_codec_test=$(${avconv_exec} -codecs 2> /dev/null | grep ".EA... aac .*encoder.* aac[^[:alnum:]]")
	;;
    "mp3")
	audio_codec_test=$(${avconv_exec} -codecs 2> /dev/null | grep ".EA... mp3 .*encoder.* libmp3lame[^[:alnum:]]")
	;;
    "copy")
	audio_codec_test="copy"
	;;
esac
# exit_if_empty "${audio_codec_test}" "Codec audio (${audio_codec}) non pris en charge par votre version de ${avconv_exec}"

case "${subtitle_codec}" in
    "ass")
	subtitle_codec_test=$(${avconv_exec} -codecs 2> /dev/null | grep ".ES... ssa\|ass" | head -n 1)
	;;
    "srt")
	subtitle_codec_test=$(${avconv_exec} -codecs 2> /dev/null | grep ".ES... srt")
	;;
    "subrip")
	subtitle_codec_test=$(${avconv_exec} -codecs 2> /dev/null | grep ".ES... subrip")
	;;
    "copy")
	subtitle_codec_test="copy"
	;;
esac
# exit_if_empty "${subtitle_codec_test}" "Codec de sous-titres (${subtitle_codec}) non pris en charge par votre version de ${avconv_exec}"

# Sanity checks: container
if [[ "${video_container}" == "mp4" ]]
then
    logger warning "Avec ce conteneur (mp4), il faudra attendre le téléchargement complet avant de pouvoir commencer la lecture. Préférez le conteneur mkv pour une lecture immédiate"
fi

# Sanity checks: video codec
if ${video_codec_is_changed_by_user} && [[ "${video_codec}" != "copy" ]]
then
    logger warning "Vous avez requis un recodage de la piste vidéo. Cette fonction est expérimentale et engendrera un traitement plus long"
fi

# Sanity checks: audio codec
if ${want_mp3} && ${audio_codec_is_changed_by_user} && [[ "${audio_codec}" != "mp3" ]]
then
    logger critical "Options '-m' et '--audio-codec aac' incompatibles. '-m' est obsolète, préférez-y '--audio-codec mp3'"
fi

if ${want_mp3} && ! ${audio_codec_is_changed_by_user}
then
    audio_codec="mp3"
    logger warning "L'option '-m' est obsolète, préférez-y '--audio-codec mp3'"
fi

# Sanity checks: subtitles
if ${want_subtitles}
then
    if [[ "${subtitle_lang}" == "vf-ad" ]]
    then
	colored_subtitles=true
    fi
    if ! ${keep_srt} && ! ${keep_ass} && ! ${mux_subtitles}
    then
	keep_srt=true
    fi

    if ${mux_subtitles} && [[ "${video_container}" == "mp4" ]]
    then
	keep_srt=true
	keep_ass=false
	mux_subtitles=false
	logger warning "Avec ce conteneur (mp4), les sous-titres seront dans un fichier séparé (srt). Préférez le conteneur mkv pour avoir un seul fichier"
    fi

    if ${mux_subtitles}
    then
	logger warning "Le multiplexage des sous-titres est expérimental. Il peut échouer selon la version de avconv/ffmpeg disponible sur votre machine"
    fi
fi

# Sanity checks: destination
if [[ ${#directory} -eq 0 ]] 
then
    directory="${HOME}"
else
    directory="$(readlink -f "${directory}")"
    if [[ ! -d "${directory}" ]]
    then
	logger critical "Le dossier de destination n'existe pas"
    fi
fi

# Main: functions
vtt2srt ()
{
    local srt_subtitle_filename="${1}"
    # sed -i 's+^[^[:print:][:blank:]]*<c[^>]*>\(.*\)</c>[^[:print:][:blank:]]*$+\1+g' "${srt_subtitle_filename}"
    sed -i 's+^[^[:print:]]*[[:blank:]]*$++g' "${srt_subtitle_filename}"
    sed -i 's+[^[:print:]]$++g' "${srt_subtitle_filename}"
    sed -i 's+^[^[:print:][:blank:]]*<c.\([^>]*\)>\(.*\)</c>[^[:print:][:blank:]]*$+<font color="\1">\2</font>+g' "${srt_subtitle_filename}"
    sed -i '/^[[:blank:]]*[0-9:.]\{3,\}/ s/\([0-9][0-9]\):\([0-9][0-9]\):\([0-9][0-9]\)\(\.\([0-9]*\)\)/\1:\2:\3,\5/g' "${srt_subtitle_filename}"
    sed -i '/^WEBVTT/d' "${srt_subtitle_filename}"
}

srt2ass ()
{
    local srt_subtitle_filename="${1}"
    local ass_subtitle_filename="${2}"
    ${avconv_exec} -y -i "${srt_subtitle_filename}" "${ass_subtitle_filename}" 2> /dev/null
}

check_desc ()
{
    if [[ $(grep "${2}" <<< "${1}") == "" ]]
    then
	logger critical "Impossible d'obtenir les informations\n${advice_msg}"
    fi
}

build_filenames ()
{
    local rules="${1}"
    if [[ ${#forced_filename_root} -eq 0 ]]
    then
	filename_root="${rules}"
	for subchain in $(grep -oE "%\([^)]*\)" <<< "${filename_root}")
	do
	    _match=""
	    _tag="$(sed -n 's/%(\([^:]*\)\(\:\(.\)\)\?)/\1/p' <<< "${subchain}")"
	    _case="$(sed -n 's/%(\([^:]*\)\(:\(.\)\)\?)/\3/p' <<< "${subchain}")"

	    case "${_tag}" in
		"TITRE")
		    _match="${video_title1:-}"
		    ;;
		"SOUSTITRE")
		    _match="${video_title2:-}"
		    ;;
		"JOUR")
		    _match="${video_date_day:-}"
		    ;;
		"MOIS")
		    _match="${video_date_month:-}"
		    ;;
		"ANNEE")
		    _match="${video_date_year:-}"
		    ;;
		"HEURE")
		    _match="${video_date_hour:-}"
		    ;;
		"MINUTE")
		    _match="${video_date_minute:-}"
		    ;;
		"RUBRIQUE")
		    _match="${video_code:-}"
		    ;;
		"SAISON")
		    _match="${video_season:-}"
		    ;;
		"EPISODE")
		    _match="${video_episode:-}"
		    ;;
		"URL")
		    _match="${video_uname:-}"
		    ;;
		"QUALITE")
		    # _match="${video_quality:-}"
		    case "${video_quality}" in
			"best")
			    _match="HQ"
			    ;;
			"standard")
			    _match="MQ"
			    ;;
			"worst")
			    _match="LQ"
			    ;;
		    esac
		    ;;
		"ID")
		    _match="${video_id:-}"
		    ;;
	    esac
	    _match="$(fix_case "${_match}" "${_case}")"
	    # filename_root="$(sed 's/'"${subchain}"'/'"${_match}"'/' <<< "${filename_root}")"
	    filename_root="${filename_root/"${subchain}"/"${_match}"}"
	done

	# Deprecated. Delete at next release
	# filename_root="${filename_root/\%(TITRE)/${video_title1:-}}"
	# filename_root="${filename_root/\%(SOUSTITRE)/${video_title2:-}}"
	# filename_root="${filename_root/\%(JOUR)/${video_date_day:-}}"
	# filename_root="${filename_root/\%(MOIS)/${video_date_month:-}}"
	# filename_root="${filename_root/\%(ANNEE)/${video_date_year:-}}"
	# filename_root="${filename_root/\%(HEURE)/${video_date_hour:-}}"
	# filename_root="${filename_root/\%(MINUTE)/${video_date_minute:-}}"
	# filename_root="${filename_root/\%(RUBRIQUE)/${video_code:-}}"
	# filename_root="${filename_root/\%(SAISON)/${video_season:-}}"
	# filename_root="${filename_root/\%(EPISODE)/${video_episode:-}}"
	# filename_root="${filename_root/\%(URL)/${video_uname:-}}"
	# filename_root="${filename_root/\%(QUALITE)/${video_quality:-}}"
    else
	filename_root="${forced_filename_root}"
    fi

    # Sanitise
    filename_root="$(sanitise "${filename_root}")"
    filename_root="$(sed 's/^\(.\{245\}\).*/\1/g' <<< "${filename_root}")"

    case "${video_container}" in
    	"mkv")
    	    video_filename="${directory}/${filename_root}.mkv"
    	    ;;
    	"mp4")
    	    video_filename="${directory}/${filename_root}.mp4"
    	    ;;
    esac
    files_to_clean[$((${#files_to_clean[@]}+1))]="${video_filename}"

    srt_subtitle_filename="${directory}/${filename_root}.srt"
    files_to_clean[$((${#files_to_clean[@]}+1))]="${srt_subtitle_filename}"

    ass_subtitle_filename="${directory}/${filename_root}.ass"
    files_to_clean[$((${#files_to_clean[@]}+1))]="${ass_subtitle_filename}"

    if ${conversion_log}
    then
    	log_filename="${directory}/${filename_root}.log"
	files_to_clean[$((${#files_to_clean[@]}+1))]="${log_filename}"
    else
    	log_filename="/dev/null"
    fi
}

parse_parent_m3u8 ()
{
    local tvg="${1}"
    local video_parent_m3u8="${2}"
    video_parent_m3u8_content=($(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${video_parent_m3u8}" -O - | sed 's/[^[:print:]]//g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+//g'))
    exit_if_empty "${video_parent_m3u8_content}" "Échec à cause d'une erreur inattendue (zone géographique bloquée, perte de connexion…)\n${advice_msg}"

    counter=-1
    slist=$(
	_resolutions=""
	for line in ${video_parent_m3u8_content[@]}
	do
	    counter=$((counter+1))
	    case "${line}" in
		*"RESOLUTION="*)
		    sbw=$(sed 's+.*\(BANDWIDTH\)[[:blank:]]*=[[:blank:]]*\([0-9]*\).*+\2+g' <<< "${line}")
		    surl="${video_parent_m3u8_content[$((counter+1))]}"
		    if [[ "${surl:0:1}" == "#" || "${surl}" == '' || "${surl:0:1}" == ' ' ]]
		    then
			continue
		    fi
		    if [[ "${surl:0:4}" != "http" ]]
		    then
			surl="$(dirname "${video_parent_m3u8}")/${surl}"
		    fi
		    if [[ "$(grep "r=${sbw:--1};" <<< "${_resolutions}")" == "" ]]
		    then
			echo "AV.|VF|${sbw:--1}|${surl}"
			if [[ ${sbw:--1} != -1 ]]
			then
			    _resolutions="${_resolutions}r=${sbw};"
			fi
		    fi
		    ;;
		*"TYPE=AUDIO"*)
		    case "${tvg}" in
			"ftv")
			    svourl="$(grep -Ei "^.*#EXT-X-MEDIA:.*TYPE=AUDIO.*LANGUAGE=.qaa." <<< "${line}" | sed -n 's+.*URI=\"\([^\"]*.m3u8\)\".*+\1+p')"
			    if [[ ${#svourl} -ne 0 ]]
			    then
				if [[ "${surl:0:4}" != "http" ]]
				then
				    svourl="$(dirname "${video_parent_m3u8}")/${svourl}"
				fi
				echo "A..|VO|-1|${svourl}"
			    fi

			    ssvfurl="$(grep -Ei "^.*#EXT-X-MEDIA:.*TYPE=AUDIO.*NAME=.Audio *Fran.ais..*LANGUAGE=.fr." <<< "${line}" | sed -n 's+.*URI=\"\([^\"]*.m3u8\)\".*+\1+p')"
			    if [[ ${#ssvfurl} -ne 0 ]]
			    then
				if [[ "${surl:0:4}" != "http" ]]
				then
				    ssvfurl="$(dirname "${video_parent_m3u8}")/${ssvfurl}"
				fi
				echo "A..|SVF|-1|${ssvfurl}"
			    fi
			    ;;
			*)
			    :
			    ;;
		    esac
		    ;;
	    esac
	done | sort -t\| -k1d,1d -k3n,3n
    )
    if [[ "$(grep "|SVF|" <<< "${slist[@]}")" != "" ]]
    then
	ssvfurl="$(grep "|SVF|" <<< "${slist[@]}" | awk -F '|' '{print $4}')"
	akey="$(sed 's/.*\(-audio[^=]*=[0-9]\+\).m3u8.*/\1/g' <<< "${ssvfurl}")"
	_slist=$(
	    for line in ${slist[@]}
	    do
		if [[ "$(grep -E "^AV..VF.[0-9]" <<< "${line}")" != "" ]]
		then
		    if [[ "$(grep -E -- "-audio" <<< "${line}")" == "" ]]
		    then
			sed 's/-video/'"${akey}"'-video/g' <<< "${line}"
		    else
			echo "${line}"
		    fi
		elif [[ "$(grep -E "|SVF|" <<< "${line}")" == "" ]]
		then
		    echo "${line}"
		fi
	    done
	      )
	slist="${_slist}"
    fi
}

get_dm_video ()
{
    local video_id1="${1}"
    local video_id2="${2}"

    if [[ "${video_id2}" == "" ]]
    then
	video_id2="${video_id1}"
    fi
    
    video_desc="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "https://api.dailymotion.com/video/${video_id2}?fields=id,duration,owner.screenname,title,uri,description,created_time" | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
    exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
    check_desc "${video_desc}" "${video_id1}"

    _video_date=$(sed -n 's+.*\"created_time\":\([0-9]*\).*+\1+p' <<< "${video_desc}")
    _video_date=($(date -d"@${_video_date}" +"%d %m %Y %H %M"))
    video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
    video_date_day=${_video_date[0]}
    video_date_month=${_video_date[1]}
    video_date_year=${_video_date[2]}
    video_date_hour=${_video_date[3]}
    video_date_minute=${_video_date[4]}

    video_code=""

    video_title1="$(sed -n 's+.*\"title\":\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"
    video_title2=""

    video_season=""
    video_episode=""

    video_method="http-m3u8"
    video_parent_m3u8="$(get_dm_video_url "${video_id2}" "http-m3u8")"
    exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
    parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

    video_subtitles=""
}

get_dm_video_url ()
{
    local video_id="${1}"
    local video_method="${2}"
    local json_content=""
    local dm_urls=""
    
    # get_dm_video_url "x4uvf9z"
    # get_dm_video_url "x4usn5f"
    # get_dm_video_url "x1a8ecs"
    # get_dm_video_url "x31f1qq"
    # json_content="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "http://www.dailymotion.com/json/video/${video_id}?fields=video_id,title,stream_h264_ld_url,stream_h264_url,stream_h264_hq_url,stream_h264_hd_url,stream_h264_hd1080_url,stream_hls_url" | sed 's+\\/+/+g')"
    # grep -a -oE "http[^\"]*H264-176x144-2[^\"]*" <<< "${json_content}"
    # grep -a -oE "http[^\"]*H264-320x240[^\"]*" <<< "${json_content}"
    # grep -a -oE "http[^\"]*H264-512x384[^\"]*" <<< "${json_content}"
    # grep -a -oE "http[^\"]*H264-848x480[^\"]*" <<< "${json_content}"
    # grep -a -oE "http[^\"]*H264-1280x720[^\"]*" <<< "${json_content}"
    # grep -a -oE "http[^\"]*H264-1920x1080[^\"]*" <<< "${json_content}"
    # grep -a -oE "http[^\"]*H264-2560x1440[^\"]*" <<< "${json_content}"
    # grep -a -oE "http[^\"]*H264-3840x2160[^\"]*" <<< "${json_content}"

    json_content="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "http://www.dailymotion.com/embed/video/${video_id}" | sed 's+\\/+/+g')"
    dm_urls="$((grep -a -oE "qualities.:.*" | grep -a -oE "http[^\"]*(m3u8|H264-)[^\"]*" | grep -v "&include=[0-9]*") <<< "${json_content}")"

    if [[ "${video_method}" == "http-m3u8" ]]
    then
	(grep -a -oE "http[^\"]*m3u8[^\"]*") <<< "${dm_urls}"
    elif [[ "${video_method}" == "http-mp4" ]]
    then
	(grep -a -oE "http[^\"]*H264-[^\"]*") <<< "${dm_urls}"
    else
	echo ""
    fi
}

# Main: misc
cookies_filename="${directory}/wget-${timestamp}.cookies"
files_to_clean[$((${#files_to_clean[@]}+1))]="${cookies_filename}"

# Main: get infos
logger debug "Exécutable: ${script_path}"
logger debug "Version:    ${version} (${script_md5})"
logger info "Obtention des information pour ${url}"

url_content="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${url}" | perl -MHTML::Entities -CS -alne 'print(decode_entities($_))')"
exit_if_empty "${url_content}" "Impossible d'obtenir la page\n${advice_msg}"

case "${tvg}" in
    "ftv-legacy")
	video_uname="$(basename "${url}" .html | sed 's/_\?,\([0-9]*\)[^0-9]*.*/_\1/g')"

	video_id=$(grep -a -oE "data-diffusion=.[0-9]*." <<< "${url_content}" | head -n 1 | grep -a -oE "[0-9]+")
	video_idc="Pluzz"
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "http://info.francetelevisions.fr/\?id-video=[^@]*@[^\"]*" | sed 's/.*id-video=//g') <<< "${url_content}")
	    video_idc=${video_id##*@}
	    video_id=${video_id%%@*}
	fi
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "http://videos.francetv.fr/video/[^@]*@[^\"]*" | sed 's/.*video\///g') <<< "${url_content}")
	    video_idc=${video_id##*@}
	    video_id=${video_id%%@*}
	fi
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

	video_desc="$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "http://webservices.francetelevisions.fr/tools/getInfosOeuvre/v2/?idDiffusion=${video_id}&catalogue=${video_idc}&callback=webserviceCallback_${video_id}" -O - | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
	exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
	check_desc "${video_desc}" "${video_id}"

	video_date="$(sed -n 's+.*\"date_debut..\"\(\([0-9]*\)/\([0-9]*\)/\([0-9]*\) *\([0-9]*\):\([0-9]*\)\)\".*+\4/\3/\2 \5:\6+p' <<< "${video_desc}")"
	_video_date=($(date -d "${video_date}" +"%d %m %Y %H %M"))
	video_date_day=${_video_date[0]}
	video_date_month=${_video_date[1]}
	video_date_year=${_video_date[2]}
	video_date_hour=${_video_date[3]}
	video_date_minute=${_video_date[4]}

	video_code="$(sed -n 's+.*\"code_programme..\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"

	video_title1="$(sed -n 's+.*\"titre..\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"
	video_title2="$(sed -n 's+.*\"sous_titre..\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"

	video_season="$(sed -n 's+.*\"saison..\([[0-9]]*\).*+\1+p' <<< "${video_desc}")"
	video_episode="$(sed -n 's+.*\"episode..\([[0-9]]*\).*+\1+p' <<< "${video_desc}")"

	video_method="http-m3u8"
    	video_parent_m3u8="$(sed -n 's+.*url..\"\(http[^\"]*m3u8[^\"]*\)\".*+\1+p' <<< "${video_desc}")"
	if [[ "${video_parent_m3u8}" =~ ^.*"replay.francetv.fr/startover/".*$ ]]
	then
	    logger critical "Cette vidéo n'est pas encore disponible, veuillez réessayer dans un moment"
	fi
	exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
	parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"
	if [[ "${slist}" =~ ^.*"cartons/carton".*$ ]]
	then
	    logger critical "${lock_msg}"
	fi
	if [[ "${video_parent_m3u8}" =~ ^.*"media-secure".*$ ]]
	then
	    logger warning "Cette vidéo est peut-être verrouillée. Si c'est le cas, il n'y a rien à faire"
	fi

    	video_subtitles="$(sed -n 's+.*\"url..\"\(http[^\"]*vtt\)\".*+\1+p' <<< "${video_desc}")"
	;;

    "ftv")
	video_uname="$(basename "${url}" .html | sed 's/_\?,\([0-9]*\)[^0-9]*.*/_\1/g')"

	# video_id=$(grep -a -oE "data-main-video=.[0-9]*." <<< "${url_content}" | head -n 1 | grep -a -oE "[0-9]+")
        if [[ "$(grep -a -oEi "> *indisponible *<" <<< "${url_content}")" != "" ]]
        then
            logger critical "Cette vidéo n'est plus disponible"
        fi
	video_id=$(grep -a -oE "videoId[^:]?: *[\"'][0-9a-z\-]*[\"']" <<< "${url_content}" | head -n 1 | sed 's/videoId[^:]\?: *.\(.*\)./\1/g')
	if [[ ${video_id} =~ ^[0-9]*$ ]]
	then
	    video_idc="Pluzz"
	    video_idcc="webserviceCallback_${video_id}"
	else
	    video_idc=""
	    video_idcc=""
	fi
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "http://info.francetelevisions.fr/\?id-video=[^@]*@[^\"]*" | sed 's/.*id-video=//g') <<< "${url_content}")
	    video_idc=${video_id##*@}
	    video_id=${video_id%%@*}
	fi
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "http://videos.francetv.fr/video/[^@]*@[^\"]*" | sed 's/.*video\///g') <<< "${url_content}")
	    video_idc=${video_id##*@}
	    video_id=${video_id%%@*}
	fi
	if [[ ${video_idc} == "" ]]
	then
	    video_idc=""
	    video_idcc="webserviceCallback_${video_id}"
	fi
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

	video_desc="$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "http://webservices.francetelevisions.fr/tools/getInfosOeuvre/v2/?idDiffusion=${video_id}&catalogue=${video_idc}&callback=${video_idcb}" -O - | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
	exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
	# check_desc "${video_desc}" "${video_id}"

	video_date="$(sed -n 's+.*\"date_debut..\"\(\([0-9]*\)/\([0-9]*\)/\([0-9]*\) *\([0-9]*\):\([0-9]*\)\)\".*+\4/\3/\2 \5:\6+p' <<< "${video_desc}")"
	_video_date=($(date -d "${video_date}" +"%d %m %Y %H %M"))
	video_date_day=${_video_date[0]}
	video_date_month=${_video_date[1]}
	video_date_year=${_video_date[2]}
	video_date_hour=${_video_date[3]}
	video_date_minute=${_video_date[4]}

	video_code="$(sed -n 's+.*\"code_programme..\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"

	video_title1="$(sed -n 's+.*\"titre..\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"
	video_title2="$(sed -n 's+.*\"sous_titre..\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"

	video_season="$(sed -n 's+.*\"saison..\([[0-9]]*\).*+\1+p' <<< "${video_desc}")"
	video_episode="$(sed -n 's+.*\"episode..\([[0-9]]*\).*+\1+p' <<< "${video_desc}")"

	video_method="http-m3u8"
    	video_parent_m3u8="$(sed -n 's+.*url..\"\(http[^\"]*m3u8[^\"]*\)\".*+\1+p' <<< "${video_desc}")"
        if [[ "${video_parent_m3u8}" != "" ]]   # Check availability
        then
      	    video_parent_m3u8="$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies -O - "https://player.webservices.francetelevisions.fr/v1/videos/${video_id}?country_code=FR&w=840&h=472&version=5.18.0&domain=www.france.tv&device_type=mobile&browser=firefox&browser_version=70&os=linux&gmt=%2B1" | sed 's+\\++g; s/u0026/\&/g' | grep -oE "https...hdf[^\"]*.m3u8[^\"]*")" -O - | grep -oE "http[^\"]*")"
        else
            video_parent_m3u8=""   # Not available no need to query
        fi
	if [[ "${video_parent_m3u8}" =~ ^.*"replay.francetv.fr/startover/".*$ ]]
	then
	    logger critical "Cette vidéo n'est pas encore disponible, veuillez réessayer dans un moment"
	fi
	exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
	parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"
	if [[ "${slist}" =~ ^.*"cartons/carton".*$ ]]
	then
	    logger critical "${lock_msg}"
	fi
	if [[ "${video_parent_m3u8}" =~ ^.*"media-secure".*$ ]]
	then
	    logger warning "Cette vidéo est peut-être verrouillée. Si c'est le cas, il n'y a rien à faire"
	fi

    	video_subtitles="$(sed -n 's+.*\"url..\"\(http[^\"]*vtt\)\".*+\1+p' <<< "${video_desc}")"
	;;

    "arte")
	video_uname="$(basename "${url}" .html | sed 's/_\?,\([0-9]*\)[^0-9]*.*/_\1/g')"

	video_id=$((grep -a -oE "http[^\"]*player[^\"]*api[^\"]*" | head -n 1 | grep -a -oE "[0-9]*-[0-9]*-[A-Z]" | head -n 1) <<< "${url_content}")
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "name=.[^\"]*programId[^\"]*. * value=.[0-9A-Z-]*." | sed -n 's/.*value=\"\([^\"]*\)\".*/\1/p') <<< "${url_content}")
	fi
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "http[^\"]*player*[^\"]*" | head -n 1 | grep -a -oE "[0-9]*-[0-9]*-[A-Z]" | head -n 1) <<< "${url_content}")
	fi
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "<iframe[^>]*http[^\"]*player*[^\"]*" | head -n 1 | grep -a -oE "[0-9]*-[0-9]*-[A-Z]" | head -n 1) <<< "${url_content}")
	fi
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$((grep -a -oE "api.arte.tv[^\"]*player*[^\"]*" | head -n 1 | grep -a -oE "[0-9]+-[0-9]+-[A-Z]" | head -n 1) <<< "${url_content}")
	fi
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

	case "${url}" in
	    *www.arte.tv/de/*)
		video_desc="$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "https://api.arte.tv/api/player/v1/config/de/${video_id}?platform=ARTE_NEXT&lang=de_DE&config=arte_tvguide" -O - | tr '\n' ' ' | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
		;;
	    *www.arte.tv/fr/*)
		video_desc="$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "https://api.arte.tv/api/player/v1/config/fr/${video_id}?platform=ARTE_NEXT&lang=fr_FR&config=arte_tvguide" -O - | tr '\n' ' ' | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
		;;
	esac
	exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
	check_desc "${video_desc}" "${video_id}"

	video_date="$(sed -n 's+.*\"VDA\": *\"\(\([0-9]*\)/\([0-9]*\)/\([0-9]*\) *\([0-9]*\):\([0-9]*\):\([0-9]*\) \(.[0-9]*\)\)\".*+\4/\3/\2 \5:\6:\7 \8+p' <<< "${video_desc}")"
	video_date=$(date -d "${video_date}" +"%Y/%m/%d %H:%M")
	_video_date=($(date -d "${video_date}" +"%d %m %Y %H %M"))
	video_date_day=${_video_date[0]}
	video_date_month=${_video_date[1]}
	video_date_year=${_video_date[2]}
	video_date_hour=${_video_date[3]}
	video_date_minute=${_video_date[4]}

	video_code="$(sed -n 's+.*\"label\": *\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"

	video_title1="$(sed -n 's+.*\"VTI\": *\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"
	video_title2="$(sed -n 's+.*\"VSU\": *\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"

	video_season=""
	video_episode=""

	video_method="http-m3u8"
    	video_parent_m3u8="$(sed -n 's+.*\"HLS_XQ_1\": *{[^{]*\"\(http[^\"]*m3u8[^\"]*\)\".*+\1+p' <<< "${video_desc}")"
 	if [[ "${video_parent_m3u8}" != "" ]]
 	then
 	    exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
 	    parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"
 	else
 	    video_method="http-mp4"
     	    video_parent_hq_mp4="$(sed -n 's+.*\"HTTPS_SQ_1\": *{[^{]*\"\(http[^\"]*mp4[^\"]*\)\".*+\1+p' <<< "${video_desc}")"
     	    video_parent_mq_mp4="$(sed -n 's+.*\"HTTPS_EQ_1\": *{[^{]*\"\(http[^\"]*mp4[^\"]*\)\".*+\1+p' <<< "${video_desc}")"
     	    video_parent_lq_mp4="$(sed -n 's+.*\"HTTPS_HQ_1\": *{[^{]*\"\(http[^\"]*mp4[^\"]*\)\".*+\1+p' <<< "${video_desc}")"
 	    if [[ "${video_parent_lq_mp4}" != "" ]]
 	    then
 		slist="AV.|VF|800|${video_parent_lq_mp4}"$'\n'
 	    fi
 	    if [[ "${video_parent_mq_mp4}" != "" ]]
 	    then
 		slist="${slist}AV.|VF|1500|${video_parent_mq_mp4}"$'\n'
 	    fi
 	    if [[ "${video_parent_hq_mp4}" != "" ]]
 	    then
 		slist="${slist}AV.|VF|2200|${video_parent_hq_mp4}"
 	    fi
 	    slist="$(grep -E "^A" <<< "${slist}")"
            exit_if_empty "${slist}" "Impossible d'obtenir la vidéo\n${advice_msg}"
 	fi

    	video_subtitles=""
	;;

    "lcp")
	video_uname="$(basename "${url}" .html)"

        video_id=$(grep -a -oE "http://play.lcp.fr/embed/[^\"]*" <<< "${url_content}" | sed -n 's/.*\/embed\/\([0-9]\+\).*/\1/p')
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

        video_desc="${url_content}"
        exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
        check_desc "${video_desc}" "${video_id}"

	_video_date=($(grep -a "<span class=.text-muted." <<< "${video_desc}" | sed -n 's+.*>.* \([0-9]*\)/\([0-9]*\)/\([0-9]*\).*+\1 \2 \3 00 00+p'))
        video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
        video_date_day=${_video_date[0]}
        video_date_month=${_video_date[1]}
        video_date_year=${_video_date[2]}
        video_date_hour=${_video_date[3]}
        video_date_minute=${_video_date[4]}

        video_code=""

        video_title1="$(grep -a -oE "<h2 class=.*tv-episode-infos-title.*<.h2>" <<< "${video_desc}" | sed -n 's+.*>\([^<]*\)<.h2>.*+\1+p')"
        video_title2="$(grep -a -oE "<h3 class=.tv-episode-infos-subtitle.>.*<.h3>" <<< "${video_desc}" | sed -n 's+.*>\([^<]*\)<.h3>.*+\1+p')"

        video_season=""
        video_episode=""

	video_method="http-m3u8"
	_video_parent_m3u8="$(grep -a -oE "http://play.lcp.fr/embed/[^\"]*" <<< "${url_content}")"
        exit_if_empty "${_video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        _video_parent_m3u8="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${_video_parent_m3u8}" | grep -a -oE "http[^\"]*play.arkena.com[^\"]*${video_id}[^\"]*")"
        exit_if_empty "${_video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        video_parent_m3u8="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${_video_parent_m3u8}" | grep -a -oE "http[^\"]*m3u8[^\"]*")"
        exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

        video_subtitles=""
	;;

    "ps")
	case "${url}" in
	     http*://replay.publicsenat.fr*)
		 video_uname="$((sed 's+.*vod/\(.*\)/[0-9]*+\1+g' | sed 's+/+_+g') <<< "${url}")"

		 video_id=$(grep -a -oE ".*idEmissionSelect.*value=.[0-9]*.*" <<< "${url_content}" | sed -n 's/.*value=.\([0-9]\+\).*/\1/p')
		 exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

		 video_desc="${url_content}"
		 exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
		 check_desc "${video_desc}" "${video_id}"
	
		 _video_date=($(grep -a "Diffus.*le *[0-9/]\+" <<< "${video_desc}" | sed -n 's+.*>.* \([0-9]*\)/\([0-9]*\)/\([0-9]*\).*+\1 \2 \3 00 00+p'))
		 video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
		 video_date_day=${_video_date[0]}
		 video_date_month=${_video_date[1]}
		 video_date_year=${_video_date[2]}
		 video_date_hour=${_video_date[3]}
		 video_date_minute=${_video_date[4]}

		 video_code=""

		 video_title1="$(grep -a -oE "<h2 style=.*text-transform: uppercase.*<.h2>" <<< "${video_desc}" | sed -n 's+.*>\([^<]*\)<.h2>.*+\1+p')"
		 video_title2="$(grep -a -oE "<h2 style=.*text-transform: uppercase.*>.*<.h1>" <<< "${video_desc}" | sed -n 's+.*>\([^<]*\)<.h1>.*+\1+p')"

		 video_season=""
		 video_episode=""

		 embed_dm_url=$((grep -a -oE ".*dmcloudUrlEmissionSelect.*value=.*" | grep -a -oE "http[^\"]*dailymotion[^\"]*") <<< "${url_content}")
		 video_dm_id=$(sed -n 's+.*/\([^/_]\{7\}\)\(_.*\)\?\(?.*\)\?+\1+p' <<< "${embed_dm_url}")
		 video_id="${video_id}${video_dm_id}"

       		 video_method="http-m3u8"
		 video_parent_m3u8="$(get_dm_video_url "${video_dm_id}" "http-m3u8")"
		 exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
		 parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

		 video_subtitles=""
		 ;;
	     
	     http*://www.publicsenat.fr*)
		 video_uname="$(basename "${url}" .html)"

		 video_id=$(grep -a -oE "[0-9]*$" <<< "${url}")
		 exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

		 video_desc="${url_content}"
		 exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
		 check_desc "${video_desc}" "${video_id}"

		 _video_date=($(grep -a "Le [0-9.]\+ à [0-9:]\+" <<< "${video_desc}" | sed -n 's+.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[[:blank:]]*à[[:blank:]]*\([0-9]*\):\([0-9]*\).*+\1 \2 \3 \4 \5+p'))
		 video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
		 video_date_day=${_video_date[0]}
		 video_date_month=${_video_date[1]}
		 video_date_year=${_video_date[2]}
		 video_date_hour=${_video_date[3]}
		 video_date_minute=${_video_date[4]}

		 video_code=""

		 video_title1="$(grep -a -oE "<title>.*<.title>" <<< "${video_desc}" | sed -n 's/.*>\(\([^<]*\) \+| *Public S.nat\)<.title>.*/\2/p')"
		 video_title2=""

		 video_season=""
		 video_episode=""

		 embed_dm_url=$((grep -a -oE "<iframe.*src=.*dailymotion.*" | head -n 1 | grep -a -oE "www.dailymotion[^\"]*" | sed 's+^.*www+http://www+g') <<< "${url_content}")
		 video_dm_id=$(sed 's+.*/\(.\{6\}\)\(_.*\)\?+\1+g' <<< "${embed_dm_url}")
		 video_id="${video_id}${video_dm_id}"

       		 video_method="http-m3u8"
		 video_parent_m3u8="$(get_dm_video_url "${video_dm_id}" "http-m3u8")"
		 exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
		 parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

		 video_subtitles=""
		 ;;
	esac
	;;

    "c+")
	video_uname="$(basename "${url/p/[0-9]*}" .html)"

        video_id=$(grep -a -oE "/[0-9]+$" <<< "${url}" | sed -n 's/.*[^0-9]\([0-9]\+\)$/\1/p')
        if [[ ${#video_id} -eq 0 ]]
        then
            video_id=$(grep -a -oE "contentID.:.[0-9]+" <<< "${url_content}" | head -n1 | grep -oE "[0-9]+")
        fi
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

	_key="$((sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C | grep -a -oE "http[^\"]*hodor[^\"]*" | grep -E "v1.search" | awk -F '/' '{print $7}') <<< "${url_content}")"
	exit_if_empty "${_key}" "Impossible d'obtenir les informations\n${advice_msg}"
	    
	video_desc="$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "https://hodor.canalplus.pro/api/v1/detail/${_key}/pfv/${video_id}.json?id=${video_id}&params[type]=pfv&cache=780000" -O - | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
	exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
	check_desc "${video_desc}" "${video_id}"

	video_date="$(sed -n 's/.*\"publicationDate\":\"\([^\"]*\).*/\1/p' <<< "${video_desc}")"
	video_date="$(sed -n 's+[[:alpha:]]* *\([0-9]*\) \([[:alpha:]]*\) *[aà] *\([0-9]*\)h\([0-9]*\).*+\2/\1 \3:\4+p' <<< "${video_date}")"
	_video_date_month=$(month_number ${video_date%%/*})
	_video_date_year=$(date +%Y)
	video_date="${_video_date_year}/${_video_date_month}/${video_date##*/}"
	if [[ $(date -d "${video_date}" +%s) -gt ${timestamp} ]]
	then
	    video_date="${video_date/${_video_date_year}\//$((_video_date_year - 1))\/}"
	fi
	_video_date=($(date -d "${video_date}" +"%d %m %Y %H %M"))
	video_date_day=${_video_date[0]}
	video_date_month=${_video_date[1]}
	video_date_year=${_video_date[2]}
	video_date_hour=${_video_date[3]}
	video_date_minute=${_video_date[4]}

	video_code="$(sed -n 's/.*\"eVar30\":\"\([^\"]*\).*/\1/p' <<< "${video_desc}")"

	video_title1="$((sed -n 's/.*\(\"informations\":{\"[^}]*}\).*/\1/p' | sed -n 's/.*\"title\":\"\([^\"]*\).*/\1/p') <<< "${video_desc}")"
	video_title2="$((sed -n 's/.*\(\"informations\":{\"[^}]*}\).*/\1/p' | sed -n 's/.*\"subtitle\":\"\([^\"]*\).*/\1/p') <<< "${video_desc}")"

	video_season=""
	video_episode=""

	video_method="http-m3u8"
	video_parent_m3u8="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "https://hodor.canalplus.pro/api/v1/getMediaUrl/${_key}/pfv/${video_id}.json?pfv=hls&cache=780000" | grep -a -oE "http[^\"]*.m3u8[^\"]*")"
	exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
	parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

    	video_subtitles=""
	;;

    "m6")
	video_uname="$(basename "${url}" .html)"

	video_id=$(grep -a -oE "catchup.:{.session.:{.clipId.:.[0-9]*." <<< "${url_content}" | head -n 1 | grep -a -oE "[0-9]+")
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

	video_desc="$(wget -q -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "https://pc.middleware.6play.fr/6play/v2/platforms/m6group_web/services/6play/videos/clip_${video_id}?csa=6&with=clips,freemiumpacks,program_images,service_display_images" -O - | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
	exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
	check_desc "${video_desc}" "${video_id}"

	video_date="$((grep -oE ".last_diffusion.*" | sed -n 's+.*\"last_diffusion\":\"\(\([0-9]*\)-\([0-9]*\)-\([0-9]*\) *\([0-9]*\):\([0-9]*\)\).*+\2/\3/\4 \5:\6+p') <<< "${url_content}")"
	_video_date=($(date -d "${video_date}" +"%d %m %Y %H %M"))
	video_date_day=${_video_date[0]}
	video_date_month=${_video_date[1]}
	video_date_year=${_video_date[2]}
	video_date_hour=${_video_date[3]}
	video_date_minute=${_video_date[4]}

	video_code="$(sed -n 's+.*\"code_programme..\"\([^\"]*\)\".*+\1+p' <<< "${video_desc}")"

	video_title1="$((sed -n 's/.*\(\"program\":{\"code[^}]*\"}[^{]*\).*/\1/p' | sed 's/title/\n\0/g' | grep title | head -n1 | sed -n 's/^title.:.\([^\"]*\).*/\1/p') <<< "${video_desc}")"
	video_title2="$((sed -n 's/.*\(\"program\":{\"code[^}]*\"}[^{]*\).*/\1/p' | sed 's/title/\n\0/g' | grep title | tail -n1 | sed -n 's/^title.:.\([^\"]*\).*/\1/p') <<< "${video_desc}")"

	video_season="$(sed -n 's+.*Saison *\([0-9]*\).*+\1+p' <<< "${video_title2}")"
	video_episode="$(sed -n 's+.*épisode *\([0-9]*\).*+\1+p' <<< "${video_title2}")"

	video_method="http-m3u8"
    	video_parent_m3u8="$(sed -n 's/.*full_physical_path.:.\([^\"]*unpnp[^\"]*m3u8[^\"]*\)\".*/\1/p' <<< "${video_desc}")"
        video_parent_m3u8="$(sed -n 's/.*full_physical_path.:.\([^\"]*unpnp[^\"]*m3u8[^\"]*\)\".*/\1/p' <<< "${video_desc}")"
        video_parent_m3u8="$(wget -O /dev/null -U "${user_agent}" "${video_parent_m3u8}" 2>&1 | grep Location | grep -oE "http[^ ]*")"
	if [[ "${video_parent_m3u8}" == "" && "$(sed -n 's/.*full_physical_path.:.\([^\"]*drmnp[^\"]*m3u8[^\"]*\)\".*/\1/p' <<< "${video_desc}")" != "" ]]
	then
	    logger critical "${lock_msg}"
	fi
	exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
	parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

    	video_subtitles=""
	;;

    "nrj")
        video_uname="$(basename "${url}" .html)"

        # video_id=$(grep -a -oE "<meta itemprop=.contentUrl. *content=.*" <<< "${url_content}" | sed -n 's/.*\/\([0-9]\+\)_.*/\1/p')
        video_id=$(grep -a -oE "data-options=.*" <<< "${url_content}" | sed -n 's/.*\/\([0-9]\+\)_.*/\1/p')
        exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

        video_desc="${url_content}"
        exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
        check_desc "${url_content}" "${video_id}"

        _video_date=($((grep -a "pageHead-pubdate" | sed -n 's/.*datetime="\([0-9]*\)-\([0-9]*\)-\([0-9]*\)".*/\3 \2 \1 00 00/p') <<< "${url_content}"))
	if [[ "${_video_date}" == '' ]]
	then
	    _video_date=("01" "01" "1970" "00" "00")
	fi
        video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
        video_date_day=${_video_date[0]}
        video_date_month=${_video_date[1]}
        video_date_year=${_video_date[2]}
        video_date_hour=${_video_date[3]}
        video_date_minute=${_video_date[4]}

        video_code=""

        video_title1="$((tr '\n' ' ' | sed 's/<h1/\n\0/g;s/<.h1/\0\n/g' | grep -a "pageHead-title" | sed 's/.*> *\([^<]*[^ ]\) *<.*/\1/g') <<< "${url_content}")"
        video_title2=""

        video_season=""
        video_episode=""

        video_method="http-mp4"
        video_final_url="$((grep -a -oE "http[^\"]*.mp4[^\"]*" | head -n 1) <<< "${url_content}")"
        exit_if_empty "${video_final_url}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        slist="AV.|VF|-1|${video_final_url}"

        video_subtitles=""
	;;

    "gulli")
	video_uname="$(basename "${url%%VOD*}" .html)"

        video_id=$(grep -a -oE "/replay/smil/VOD[0-9]+" <<< "${url_content}" | sed -n 's/.*\(VOD[0-9]\+\).*/\1/p')
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

        # video_desc="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "http://www.gulli.fr/replay/api?call={%22api_key%22:%22ipad%22,%22method%22:%22programme.getLatestEpisodes%22}" | grep -a -oE "\{.media_id.:[^}]*${video_id}[^}]*\}" | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C)"
        video_desc="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "http://replay.gulli.fr/jwplayer/embed/${video_id}" | sed 's+\\/+/+g' | sed 's/\\u\(....\)/\\x{\1}/g' | ascii2uni -q -a C | ascii2uni -q -a D)"
        exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
        check_desc "${video_desc}" "${video_id}"

	_video_date=$((grep -a -oE "data-end=.[0-9]+." | grep -oE "[0-9]+" ) <<< "${url_content}")
	# _video_date=$((_video_date - 7 * 86400))
	video_date=$(date -d "@${_video_date}" +"%Y/%m/%d %H:%M")
	_video_date=($(date -d "@${_video_date}" +"%d %m %Y %H %M"))
	video_date_day=${_video_date[0]}
	video_date_month=${_video_date[1]}
	video_date_year=${_video_date[2]}
	video_date_hour=${_video_date[3]}
	video_date_minute=${_video_date[4]}
	
        video_code=""

        video_title1="$((grep -a -B10 "mediaid: *.${video_id}" | grep -a "playlist_titleHTML:" | head -n1 | sed -n 's+.*playlist_titleHTML: *\"\([^\"]*\)\".*+\1+p' | sed -n 's/<p> *\([^<]*\) *<.p> *\(.*\) *<span> *\([^<]*\) *<.span>.*/\1/p') <<< "${video_desc}")"
        video_title2="$((grep -a -B10 "mediaid: *.${video_id}" | grep -a "playlist_titleHTML:" | head -n1 | sed -n 's+.*playlist_titleHTML: *\"\([^\"]*\)\".*+\1+p' | sed -n 's/<p> *\([^<]*\) *<.p> *\(.*\) *<span> *\([^<]*\) *<.span>.*/\3/p') <<< "${video_desc}")"

	video_season="$((grep -a -B10 "mediaid: *.${video_id}" | grep -a "playlist_titleHTML:" | head -n1 | sed -n 's+.*playlist_titleHTML: *\"\([^\"]*\)\".*+\1+p' | sed -n 's/<p> *\([^<]*\) *<.p> *\(.*\) *<span> *\([^<]*\) *<.span>.*/\2/p' | sed -n 's+.*[Ss]aison *\([0-9]*\).*+\1+p') <<< "${video_desc}")"
	video_episode="$((grep -a -B10 "mediaid: *.${video_id}" | grep -a "playlist_titleHTML:" | head -n1 | sed -n 's+.*playlist_titleHTML: *\"\([^\"]*\)\".*+\1+p' | sed -n 's/<p> *\([^<]*\) *<.p> *\(.*\) *<span> *\([^<]*\) *<.span>.*/\2/p' | sed -n 's+.*[EeÉé]pisode *\([0-9]*\).*+\1+p') <<< "${video_desc}")"

        video_method="http-m3u8"
        video_parent_m3u8="$((grep -a -B10 "mediaid: *.${video_id}" | grep -a -oE "http[^\"]*${video_id/VOD/}[^\"]*.m3u8[^\"]*" | head -n1) <<< "${video_desc}")"
        exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

        video_subtitles=""
	;;

    "e21")
	video_uname="$((sed 's+.*/\(.*\)/\(.\{7\}\)$+\1+g') <<< "${url}")"

	video_id="$((sed 's+.*/\(.*\)/\(.\{7\}\)$+\2+g') <<< "${url}")"
	embed_dm_url=$((grep -a -oE "<iframe.*src=.*dailymotion.*" | head -n 1 | grep -a -oE "www.dailymotion[^\"]*" | sed 's+^.*www+http://www+g') <<< "${url_content}")
	video_dm_id=$(sed -n 's+.*video/\([^/_?]*\)\(_.*\)\?\(?.*\)\?+\1+p' <<< "${embed_dm_url}")
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

	get_dm_video "${video_id}" "${video_dm_id}"
	;;

    "n23")
	video_uname="$(basename "${url%%/?video_id*}" .html)"

        video_id=$(grep -a -oE "<div *class=.video. *data-video-id=.*" <<< "${url_content}" | sed -n 's/.*data-video-id=.\([^\"]\+\).*/\1/p')
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

	get_dm_video "${video_id}" "${video_dm_id}"
	;;

    "tv5")
	video_uname="$(basename "${url}" .html)"

        video_id=$(grep -a -oE "http[^\"]*m3u8[^\"]*" <<< "${url_content}" | sed -n 's/.*\/\([0-9]\+\)_,.*/\1/p')
	_video_method="http-m3u8"
	if [[ "${video_id}" == "" ]]
	then
	    video_id=$(grep -a -oE "http[^\"]*mp4[^\"]*" <<< "${url_content}" | sed -n 's/.*\/\([0-9]\+\).mp4.*/\1/p')
	    _video_method="http-mp4"
	fi
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

        video_desc="${url_content}"
        exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
        check_desc "${video_desc}" "${video_id}"

	_video_date=($(grep -a -E "meta_uploadDate" <<< "${video_desc}" | head -n 1 | sed -n 's+.*content=\"\(\([0-9]*\)-\([0-9]*\)-\([0-9]*\)T\([0-9]*\):\([0-9]*\).*\)\".*+\4 \3 \2 \5 \6+p'))
        video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
        video_date_day=${_video_date[0]}
        video_date_month=${_video_date[1]}
        video_date_year=${_video_date[2]}
        video_date_hour=${_video_date[3]}
        video_date_minute=${_video_date[4]}

        video_code="$(grep -a -E "<div class=.label label--type.>" <<< "${video_desc}" | sed -n 's+.*>\([^\"^<]*\)<.a><.div>.*+\1+p')"

        video_title1="$(grep -a -E "<h3 class=.video-detail__title." <<< "${video_desc}" | sed -n 's+.*>\([^\"^<]*\)<.h3>.*+\1+p')"
        video_title2="$(grep -a -E "<p class=.video-detail__subtitle." <<< "${video_desc}" | sed -n 's+.*>\([^\"^<]*\)<.p>.*+\1+p')"

        video_season=""
        video_episode=""

	if [[ "${_video_method}" == "http-m3u8" ]]
	then
            video_method="http-m3u8"
            video_parent_m3u8="$(grep -a -oE "http[^\"]*m3u8[^\"]*" <<< "${url_content}" | sed 's/\\\//\//g')"
            exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
            parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"
	elif [[ "${_video_method}" == "http-mp4" ]]
	then
            video_method="http-mp4"
            video_final_url="$(grep -a -oE "http[^\"]*mp4[^\"]*" <<< "${url_content}" | sed 's/\\\//\//g')"
            exit_if_empty "${video_final_url}" "Impossible d'obtenir la vidéo\n${advice_msg}"
            slist="AV.|VF|-1|${video_final_url}"
	fi

        video_subtitles=""
	;;

    "tv5-afrique")
	video_uname="$(basename "${url}" .html)"

        video_id=$(grep -a -oE "http[^\"]*embed[^\"]*" <<< "${url_content}" | sed -n 's/.*_\([0-9]\+\)/\1/p')
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

        video_desc="${url_content}"
        exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
        check_desc "${video_desc}" "${video_id}"

	_video_date=($(grep -a -E "meta_uploadDate" <<< "${video_desc}" | head -n 1 | sed -n 's+.*content=\"\(\([0-9]*\)-\([0-9]*\)-\([0-9]*\)T\([0-9]*\):\([0-9]*\).*\)\".*+\4 \3 \2 \5 \6+p'))
	_video_date=("01" "01" "1970" "00" "00")
        video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
        video_date_day=${_video_date[0]}
        video_date_month=${_video_date[1]}
        video_date_year=${_video_date[2]}
        video_date_hour=${_video_date[3]}
        video_date_minute=${_video_date[4]}

        video_code="$(grep -a -E "title inTopHeader" <<< "${video_desc}" | sed -n 's/.*class=.parent..\([^<]*\)>.*/\1/p')"

        video_title1="$(grep -a -E "title inTopHeader" <<< "${video_desc}" | sed -n 's/.*class=.current..\([^<]*\)<.*/\1/p')"
        video_title2="$(grep -a -E "title JQCTE" <<< "${video_desc}" | sed -n 's/.*>\([^<]*\)<.*/\1/p')"

        video_season=""
        video_episode=""

        video_method="http-m3u8"
	_video_parent_m3u8="$(grep -a -oE "http[^\"]*embed[^\"]*" <<< "${url_content}")"
        exit_if_empty "${_video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        video_parent_m3u8="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${_video_parent_m3u8}" | grep -a -oE "http[^\"]*m3u8[^\"]*" | sed 's/\\\//\//g')"
        exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

        video_subtitles=""
	;;

    "dm")
	video_uname="$(basename "${url}" .html)"

        video_id=$(grep -a -E "DM_CurrentVideoXID" <<< "${url_content}" | sed -n "s/.*=.\([^']*\).*/\1/p")
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"
	
	get_dm_video "${video_id}" "${video_dm_id}"
	;;

    "rtbf")
	video_uname="$(basename "${url%%?id=*}" .html)"

        video_id=$(grep -a -oE "data-id=.[0-9]+." <<< "${url_content}" | head -n 1 | sed -n 's/[^0-9]*\([0-9]\+\).*/\1/p')
	exit_if_empty "${video_id}" "Impossible d'obtenir l'ID\n${advice_msg}"

        video_desc="$(tr '\n' ' ' <<< "${url_content}")"
        exit_if_empty "${video_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
        check_desc "${video_desc}" "${video_id}"
	video_alt_desc="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "https://www.rtbf.be/auvio/embed/media?id=${video_id}" | sed 's+\\/+/+g' | sed 's/&quot;/"/g')"
        exit_if_empty "${video_alt_desc}" "Impossible d'obtenir les informations\n${advice_msg}"
        check_desc "${video_alt_desc}" "${video_id}"

        _video_date=($((grep -a -oE "<time class=.www-time www-time--inline. datetime=\"[^\"]*\"" | head -n 1 | sed 's/.*datetime=.\(.*\)./\1/g' | sed -n 's+\(\([0-9]*\)-\([0-9]*\)-\([0-9]*\)T\([0-9]*\):\([0-9]*\).*\)+\4 \3 \2 \5 \6+p') <<< "${video_desc}"))
        video_date="$(sed 's/\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)/\3\/\2\/\1 \4:\5/g' <<< "${_video_date[@]}")"
        video_date_day=${_video_date[0]}
        video_date_month=${_video_date[1]}
        video_date_year=${_video_date[2]}
        video_date_hour=${_video_date[3]}
        video_date_minute=${_video_date[4]}

        video_code=""
        video_title1="$(sed -n 's+.*h1 class=\"rtbf-media-item__title..[[:blank:]]*\([^<]*[^[:blank:]]\)[[:blank:]]*<.*+\1+p' <<< "${video_desc}")"
        video_title2="$(sed -n 's+.*h2 class=\"rtbf-media-item__subtitle..[[:blank:]]*\([^<]*[^[:blank:]]\)[[:blank:]]*<.*+\1+p' <<< "${video_desc}")"

        video_season=""
        video_episode=""
	_video_season="$((grep -a -oE "[^[:alnum:]]?S[0-9]+" | sed -n 's/[^[:digit:]]*\([0-9]\+\)/\1/p') <<< "${video_title1}")"
	if [[ "${_video_season}" != "" ]]
	then
	    video_season=${_video_season}
	fi
	_video_episode="$((grep -a -oiE ".pisode[[:space:]]+[0-9]+" | sed -n 's/[^[:digit:]]*\([0-9]\+\)/\1/p') <<< "${video_title2}")"
	if [[ "${_video_episode}" != "" ]]
	then
	    video_episode=${_video_episode}
	fi
        if [[ ${#video_episode} -eq 0 ]]
        then
	    _video_episode="$((grep -a -oE "[0-9]+ .*" | sed -n 's/\([0-9]\+\) [^[:digit:]]*/\1/p') <<< "${video_title2}")"
	    if [[ "${_video_episode}" != "" ]]
	    then
		video_episode=${_video_episode}
	    fi
	fi

        video_method="http-m3u8"
        video_parent_m3u8="$(grep -a -oE "http[^\"']*.m3u8[^\"']*" <<< "${video_alt_desc}")"
        exit_if_empty "${video_parent_m3u8}" "Impossible d'obtenir la vidéo\n${advice_msg}"
        parse_parent_m3u8 "${tvg}" "${video_parent_m3u8}"

        video_subtitles=""
	;;

    *)
	logger critical "Erreur inconnue"
	;;
esac
exit_if_empty "${slist}" "Impossible d'obtenir la vidéo\n${advice_msg}"
if [[ ${#video_date} -eq 0 ]]
then
    video_date=$(date +"%Y/%m/%d %H:%M")
fi
if [[ "${video_title1}" == "${video_title2}" ]]
then
    video_title2=""
fi
# if [[ "${video_title2}" == "" ]]
# then
#     video_title2="${video_title1}"
# fi
# if [[ "${video_code}" == "" ]]
# then
#     video_code="${video_uname}"
# fi
case "${number_format}" in
    %[0-9]*d)
	video_season=$(awk '{printf "'"${number_format}"'", $1}' <<< "${video_season:-0}")
	video_episode=$(awk '{printf "'"${number_format}"'", $1}' <<< "${video_episode:-0}")
	;;
    *)
	logger critical "Format de nombre refusé"
	;;
esac

logger info "URL:                      ${url}"
logger info "Titre par défaut:         ${video_uname}"
logger info "Titre (1) :               ${video_title1}"
logger info "Titre (2, si pertinent) : ${video_title2:-null}"
logger info "Date de diffusion :       ${video_date}"
logger info "Saison (si pertinent) :   ${video_season:-null}"
logger info "Épisode (si pertinent) :  ${video_episode:-null}"
logger info "Code :                    ${video_code:-null}"

nqualities=$(wc -l <<< "${slist}")
if [[ ${nqualities} == 1 ]]
then
    logger warning "Une seule qualité est disponible pour cette vidéo. '-q worst', '-q standard' et '-q best' auront le même effet"
    if [[ "${video_quality}" != "best" ]]
    then
	video_quality="best"
    fi
elif [[ ${nqualities} == 2 ]]
then
    logger warning "Deux qualités sont disponible pour cette vidéo. '-q worst' et '-q standard' auront le même effet"
    if [[ "${video_quality}" == "worst" ]]
    then
	video_quality="standard"
    fi
fi

build_filenames "${naming_convention}"

if ${want_vo}
then
    video_vo="$(grep -E "^A..\|VO" <<< "${slist}" | head -n 1 | awk -F '|' '{print $NF}')"
    if [[ ${#video_vo} -eq 0 ]]
    then
	want_vo=false
	logger warning "Vous avez requis la langue originale (si autre que française) mais elle n'est pas disponible pour cette vidéo"
    fi
fi

if ${want_subtitles}
then
    if [[ ${#video_subtitles} -eq 0 ]]
    then
	want_subtitles=false
	logger warning "Vous avez requis les sous-titres mais ils ne sont pas disponibles pour cette vidéo"
    else

	case "${tvg}" in
	    "ftv")
		wget -q -U "${user_agent}" "${video_subtitles}" -O "${srt_subtitle_filename}"
		vtt2srt "${srt_subtitle_filename}"
		case "${subtitle_lang}" in
		    "vf-ad")
			:
			;;
		    "vf")
			sed -i 's/^<font color=.magenta..*//g' "${srt_subtitle_filename}"
			sed -i 's/^<font color=.red..*//g' "${srt_subtitle_filename}"
			sed -i '/^[0-9]*:[0-9]*.*/ {N; s/^[0-9]*:[0-9]*.*\n$//g}' "${srt_subtitle_filename}"
			if ! ${colored_subtitles}
			then
			    sed -i 's+^[^[:print:][:blank:]]*<font color=\([^>]*\)>\(.*\)</font>[^[:print:][:blank:]]*$+\2+g' "${srt_subtitle_filename}"
			fi    
			;;
		esac
		srt2ass "${srt_subtitle_filename}" "${ass_subtitle_filename}"
		logger warning "Vous avez requis les sous-titres. Si vous constatez un décalage entre les sous-titres et l'audio, il n'y a malheureusement rien à faire… À part corriger le fichier srt à la main!"
		;;
	    "c+")
		:
		;;
	    "nrj"|"cherie")
		:
		;;
	    "gulli")
		:
		;;
	    "tv5")
		:
		;;
	    "tv5-afrique")
		:
		;;
	    *)
		logger critical "Erreur inconnue"
		;;
	esac
		    
	if [[ "${video_container}" == "mp4" ]]
	then
	    logger warning "Avec ce conteneur (mp4), les sous-titres seront dans un fichier séparé (srt ou ass). Préférez le conteneur mkv pour avoir un seul fichier"
	fi
    fi
fi

case "${video_quality}" in
    "worst")
	video_final_url="$(grep -E "^AV.\|VF" <<< "${slist}" | head -n 1 | awk -F '|' '{print $NF}')"
	;;
    "standard")
	video_final_url="$(grep -E "^AV.\|VF" <<< "${slist}" | tail -n 2 | head -n 1 | awk -F '|' '{print $NF}')"
	;;
    "best")
	video_final_url="$(grep -E "^AV.\|VF" <<< "${slist}" | tail -n 1 | awk -F '|' '{print $NF}')"
	;;
esac

# Main: conversion options
special_opts=()
case "${video_codec}" in
    "copy")
	vcodec_opts=("-vcodec" "copy")
	;;
    "libx264")
	vcodec_opts=("-vcodec" "libx264")
	;;
    *)
	logger critical "Codec video non pris en charge"
	;;
esac

case "${audio_codec}" in
    "copy")
	acodec_opts=("-acodec" "copy")
	;;
    "aac")
	acodec_opts=("-strict" "experimental" "-acodec" "aac" "-ar" "44100" "-ac" "2" "-ab" "192k")
	;;
    "mp3")
	acodec_opts=("-acodec" "mp3" "-ar" "44100" "-ac" "2" "-ab" "192k")
	;;
    *)
	logger critical "Codec audio non pris en charge"
	;;
esac

istreams=0
ostreams=1
vo_stream=()
vo_map=()
vo_opts=()
subtitles_stream=()
subtitle_map=()
subtitles_opts=()

if ${want_vo}
then
    case "${tvg}" in
	"ftv")
	    istreams=$((istreams+1))
	    ostreams=$((ostreams+1))
	    vo_stream=("-i" "${video_vo}")
	    vo_map=("-map" "${istreams}")
	    vo_opts=("-metadata:s:${ostreams}" "language=und")
	    ;;
	"c+"|"nrj"|"cherie")
	    :
	    ;;
	*)
	    logger critical "Erreur inconnue"
	    ;;
    esac
fi

if ${want_subtitles} && ${mux_subtitles} && [[ "${video_container}" == "mkv" ]]
then
    case "${tvg}" in
	"ftv")
	    istreams=$((istreams+1))
	    ostreams=$((ostreams+1))
	    subtitles_stream=("-i" "${ass_subtitle_filename}")
	    subtitle_map=("-map" "${istreams}")
	    subtitles_opts=("-scodec" "ass" "-metadata:s:${ostreams}" "language=fra")
	    ;;
	"c+"|"nrj"|"cherie"|"gulli"|"tv5"|"tv5-afrique")
	    :
	    ;;
	*)
	    logger critical "Erreur inconnue"
	    ;;
    esac
fi

case "${video_method}" in
    "http-m3u8")
	special_opts=("-f" "mpegts" "-copyts" "-dump")
	# flist="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${video_final_url}" | grep "^[^#].*.ts*" | sed 's/[^[[:print:]]//g' | normalise_url "${video_final_url}")"
	plist="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${video_final_url}" | sed 's/[^[[:print:]]//g')"
	flist="$((grep "^[^#].*.ts*" | normalise_url "${video_final_url}") <<< "${plist}")"
	exit_if_empty "${flist}" "Échec à cause d'une erreur inattendue (zone géographique bloquée, perte de connexion…)\n${advice_msg}"
	craes=false
	if [[ "$(grep -E "^#EXT-X-KEY: *METHOD=" <<< "${plist}")" != "" ]]
	then
	    craes=true
	    crurl="$((grep -E "^#EXT-X-KEY: *METHOD=" | sed 's/.*URI=.\(http[^\"]*\).*/\1/g' | normalise_url "${video_final_url}") <<< "${plist}")"
	    exit_if_empty "${crurl}" "Échec à cause d'une erreur inattendue (zone géographique bloquée, perte de connexion…)\n${advice_msg}"
	    crk="$(wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${crurl}" | hexdump -e '16/1 "%02X"')"
	    exit_if_empty "${crurl}" "Échec à cause d'une erreur inattendue (zone géographique bloquée, perte de connexion…)\n${advice_msg}"
	    cri="00000000000000000000000000000001"
	fi
	;;
    "http-mp4")
	flist="${video_final_url}"
	;;
    *)
	logger critical "Erreur inconnue"
	;;
esac

logger info "Téléchargement…"
logger info "Destination (sauf si modifiée par le GUI): ${video_filename}"
wget_success=false
avconv_success=false
counter=0
counter_end=$(wc -l <<< "${flist}")
progression=$(awk '{printf "%6.2f", $1 / $2 * 100}' <<< "${counter} ${counter_end}")
logger info "Progression: ${progression}%"

# while read furl
for furl in ${flist}
do
    wget_success=false
    counter=$((counter+1))
    progression=$(awk '{printf "%6.2f", $1 / $2 * 100}' <<< "${counter} ${counter_end}")
    case "${video_method}" in
	"http-m3u8")
	    if ! ${craes}
	    then
		wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${furl}" && wget_success=true
	    else
		wget -q -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${furl}" | openssl aes-128-cbc -d -K "${crk}" -iv "${cri}" -nosalt 2> /dev/null && wget_success=true
	    fi
	    read -n1 -rs -t 0.1 pause_actions
	    if [[ "${pause_actions}" == 'p' ]]
	    then
		pause_warning=false
	    	while true
	    	do
		    echo -en "\r\e[K" 1>&2
		    if ! ${pause_warning}
		    then
	    		logger warning "Opérations en pause. Appuyez sur la touche p pour reprendre (fonction expérimentale disponible pour certaines chaînes seulement)"
			pause_warning=true
		    fi
		    read -n1 -rs -t 0.1 pause_actions
		    if [[ "${pause_actions}" == 'p' ]]
		    then
			echo -en "\r\e[K" 1>&2
			echo -en "\e[1A\e[K" 1>&2
			_n=$(echo "131 / $(tput cols)" | bc)
			for k in $(seq 1 ${_n})
			do
			    echo -en "\e[1A\e[K"
			done 1>&2
			break
		    fi
		    sleep 1s
	    	done
	    	pause_actions=''
	    fi
	    ;;
	"http-mp4")
            wget --progress=dot:default -O - -U "${user_agent}" --save-cookies "${cookies_filename}" --load-cookies "${cookies_filename}" --keep-session-cookies "${furl}" 2> >(progressfilt) && wget_success=true
	    ;;
    esac

    if ! ${wget_success}
    then
    	if [[ ${counter} -eq ${counter_end} ]]
    	then
    	    logger warning "Potentielle erreur à la toute fin du téléchargement. Vérifier le fichier manuellement\n"
    	    wget_success=true
    	fi
    fi
     
    if ! ${wget_success}
    then
	logger critical "Échec à cause d'une erreur inattendue (zone géographique bloquée, perte de connexion…)\n${advice_msg}"
    else
	echo -ne "\e[F" >&2
	logger info "Progression: ${progression}%"
    fi
    if [[ "${progression}" == "100.00" ]]
    then
	logger info "Patientez quelques instants…"
    fi
# done <<< "${flist}" | ${avconv_exec} -y "${special_opts[@]}" -i - "${vo_stream[@]}" "${subtitles_stream[@]}" -map 0 -map -0:d "${vo_map[@]}" "${subtitle_map[@]}" "${vcodec_opts[@]}" "${acodec_opts[@]}" -metadata:s:1 language=fra "${vo_opts[@]}" "${subtitles_opts[@]}" "${video_filename}" 2> "${log_filename}" && avconv_success=true
done | ${avconv_exec} -y "${special_opts[@]}" -i - "${vo_stream[@]}" "${subtitles_stream[@]}" -map 0 -map -0:d "${vo_map[@]}" "${subtitle_map[@]}" "${vcodec_opts[@]}" "${acodec_opts[@]}" -metadata:s:1 language=fra "${vo_opts[@]}" "${subtitles_opts[@]}" "${video_filename}" 2> "${log_filename}" && avconv_success=true

rm "${cookies_filename}"

if ! ${keep_srt} && [[ -e "${srt_subtitle_filename}" ]]
then
    rm "${srt_subtitle_filename}"
fi

if ! ${keep_ass} && [[ -e "${ass_subtitle_filename}" ]]
then
    rm "${ass_subtitle_filename}"
fi

if ${avconv_success}
then
    logger info "Succès !"
    exit 0
    # logger warning "Une ou des erreurs ont eu lieu mais étaient non bloquantes. Vérifier le fichier"
    # exit 2
else
    logger critical "Échec !"
    exit 1
fi
