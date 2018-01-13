#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region functions
alias bl.string.make_command_promt_prefix=bl_string_make_command_promt_prefix
bl_string_make_command_promt_prefix() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    Generates a new user prompt with useful runtime parameters.

    `bl.string.make_command_promt_prefix`
    '
    local errorNumber=$?
    local systemLoadAverage=$(uptime | grep --extended-regexp --only-matching \
        '[0-9]{1,2}\.[0-9]{1,2}' | head --lines 1)
    local errorPromt="(${ILU_RED}${errorNumber}${ILU_DEFAULT_COLOR})"
    if [[ "$errorNumber" == '0' ]]; then
        errorPromt="${ILU_GREEN}>${ILU_DEFAULT_COLOR}"
    fi
    local gitBranch=$(git branch 2>/dev/null | sed --regexp-extended \
        "s/^\* (.*)$/ $(bl.string.validate_regular_expression_replacement "$ILU_RED")\1$(bl.string.validate_regular_expression_replacement "$ILU_CYAN")/g" \
        | tr --delete "\n" | sed 's/  / /g' | sed 's/^ *//g' | \
        sed 's/ *$//g')
    if [ "$gitBranch" ]; then
        gitBranch="(${ILU_GRAY}git${ILU_DEFAULT_COLOR})-(${ILU_CYAN}${gitBranch}${ILU_DEFAULT_COLOR})"
    fi
    if [[ "$(id --user)" == '0' ]]; then
        local userName="${ILU_RED}"
    fi
    local userName+="\u$ILU_DEFAULT_COLOR"
    if [[ "$TERM" != 'linux' ]]; then
        local titleBar="\[\e]0;\u@\h:$(pwd)\a\]"
    fi
    export PS1="$titleBar$errorPromt ${ILU_CYAN}${userName}${ILU_GRAY}@${ILU_CYAN}\h${ILU_BLUE} (${systemLoadAverage}) ${ILU_GRAY}\w${ILU_DEFAULT_COLOR}\n${gitBranch}${ILU_DARK_GRAY}> ${ILU_DEFAULT_COLOR}"
    return $?
}
alias bl.string.generate_random=bl_string_generate_random
bl_string_generate_random() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c "$1"
}
alias bl.string.validate_argument=bl_string_validate_argument
bl_string_validate_argument() {
    # shellcheck disable=SC2016,SC2034
    local __doc__="
    Validates a given bash argument.

    >>> bl.string.validate_argument hans
    'hans'
    >>> bl.string.validate_argument ha'n's
    \"ha'n's\"
    >>> bl.string.validate_argument h\"a\"'n's
    'h\"a\"\'n\'s'
    "
    if [[ ! "$(grep "'" <<< "$1")" ]]; then
        echo "'$1'"
    elif [[ ! "$(grep '"' <<< "$1")" ]]; then
        echo "\"$1\""
    else
        echo "'$(sed "s/'/\\'/g" <<< "$1")'"
    fi
    return $?
}
alias bl.string.validate_regular_expression_replacement=bl_string_validate_regular_expression_replacement
bl_string_validate_regular_expression_replacement() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    This functions escapes every special meaning character for a sed
    replacement.

    >>> sed "s/myInputString/$(bl.string.validate_regular_expression_replacement "\hans/peter&klaus")/g"
    '
    echo "$1" | sed --expression 's/\\/\\\\/g' --expression 's/\//\\\//g' \
        --expression 's/&/\\\&/g'
    return $?
}
alias bl.string.images_to_css_classes=bl_string_images_to_css_classes
bl_string_images_to_css_classes() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    This function converts a folder of images to a single includeable css
    file.

    ```
        bl.string.images_to_css_casses \
            /path/to/image/directory/ \
            .*\.\(png\|jpg\|jpeg\)
        bl.string.images_to_css_classes \
            /path/to/image/directory/ \
            .*\.\(png\|jpg\|jpeg\) \
            /first/exclude/location \
            /second/exclude/location ...
        bl.string.images_to_css_classes
    ```
    '
    local source='.'
    if [ -d "$1" ]; then
        source="$1"
        shift
    fi
    local pathPattern='.*\.\(png\|jpg\|jpeg\|ico\)'
    if [[ "$1" ]]; then
        pathPattern="$1"
        shift
    fi
    find "$source" -regex "^$pathPattern$" | while read imageFilePath; do
        local validPath=true
        local excludePath
        for excludePath in $@; do
            excludePath=$(echo $excludePath | sed 's/\/$//g')
            if [[ "$excludePath" == $(dirname "$imageFilePath") ]] || \
               [[ "$excludePath" == "$imageFilePath" ]]; then
                validPath=false
                break
            fi
        done
        if $validPath; then
            local imageClassName="$(echo "$imageFilePath" | tr '@#&%+./_{; ' '-' | \
                grep --only-matching --extended-regexp '[^-].+$')"
            echo ".image-data-${imageClassName}{background-image: url(\"data:$(file --brief --mime-type "$imageFilePath");base64,$(base64 --wrap 0 "$imageFilePath")\")}"
        fi
    done
    return $?
}
alias bl.string.merge_text_files=bl_string_merge_text_files
bl_string_merge_text_files() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    Concatenate files and print on the standard output.

    ```
        bl.string.merge_text_files a.txt b.txt
        bl.string.merge_text_files \
            a.txt \
            b.txt \
            c.txt \
            --append "\n# endregion\n" \
            --between "\n# endregion\n\n# region %s\n"
            --prepend "# region %s\n"
    ```
    '
    local append='\n// endregion'
    local prep end='// region %s\n\n'
    local between='\n// endregion\n\n// region %s\n\n'
    while true; do
        case $1 in
            -p|--prepend)
                shift
                prepend=$1
                shift
                ;;
            -a|--append)
                shift
                append=$1
                shift
                ;;
            -b|--between)
                shift
                between=$1
                shift
                ;;
            '')
                break ;;
            *)
                if [ "$files" ]; then
                    files+=" $1"
                else
                    local files="$1"
                fi
                shift
                ;;
        esac
    done
    printf "$prepend" "$(echo "$files" | grep --only-matching \
        --extended-regexp '^[^ ]+')"
    local index=0
    local filePath
    for filePath in ${files[*]}; do
        if [[ $index > 0 ]]; then
            printf "$between" "$filePath"
        fi
        cat $filePath
        index+=1
    done
    printf "$append"
    return $?
}
alias bl.string.translate=bl_string_translate
bl_string_translate() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    Translates a given string in a given (or automatic detected) language and
    gives a translation in given language (German by default) back. Accesses
    "http://translate.google.com" from terminal.

    >>> bl.string.translate hello
    Hallo
    >>> bl.string.translate 'Hello my darling'
    Hallo mein Schatz
    >>> bl.string.translate hello fr
    bonjour
    >>> bl.string.translate hello en fr
    bonjour
    '
    local defaultTargetLanguage=de
    local help="translate <text> [[<source language>] <target language>]\n
                if target missing, use $defaultTargetLanguage\n
                if source missing, use auto\n
                list supported languages: translate -l"
    local languages="af=Afrikaans\n sq=Albanisch\n ar=Arabisch\n hy=Armenisch\n
                     az=Aserbaidschanisch\n eu=Baskisch\n bn=Bengalisch\n
                     bg=Bulgarisch\n zh-TW=Chinesisch (traditionell)\n
                     zh-CN=Chinesisch (vereinfacht)\n da=DÃ¤nisch\n
                     de=Deutsch\n en=Englisch\n eo=Esperanto\n et=Estnisch\n
                     fi=Finnisch\n fr=FranzÃ¶sisch\n gl=Galizisch\n 
                     ka=Georgisch\n el=Griechisch\n gu=Gujarati\n 
                     ht=Haitianisch\n iw=HebrÃ¤isch\n hi=Hindi\n 
                     id=Indonesisch\n ga=Irisch\n is=IslÃ¤ndisch\n 
                     it=Italienisch\n ja=Japanisch\n yi=Jiddisch\n kn=Kannada\n
                     ca=Katalanisch\n ko=Koreanisch\n hr=Kroatisch\n
                     la=Lateinisch\n lv=Lettisch\n lt=Litauisch\n 
                     ms=Malaysisch\n mt=Maltesisch\n mk=Mazedonisch\n
                     nl=NiederlÃ¤ndisch\n no=Norwegisch\n fa=Persisch\n 
                     pl=Polnisch\n pt=Portugiesisch\n ro=RumÃ¤nisch\n
                     ru=Russisch\n sv=Schwedisch\n sr=Serbisch\n
                     sk=Slowakisch\n sl=Slowenisch\n es=Spanisch\n sw=Suaheli\n
                     tl=Tagalog\n ta=Tamil\n te=Telugu\n th=ThailÃ¤ndisch\n
                     cs=Tschechisch\n tr=TÃ¼rkisch\n uk=Ukrainisch\n
                     hu=Ungarisch\n ur=Urdu\n vi=Vietnamesisch\n cy=Walisisch\n
                     be=WeiÃrussisch"
    if [[ "$1" = -h || "$1" = --help || "$#" < 1 ]]; then
        echo -e "$help"
    elif [[ "$1" = -l || "$1" = --languages ]]; then
        echo -e "$languages"
    else
        if [ "$3" ]; then
            source="$2"
            local target="$3"
        else
            source=auto
            if [ "$2" ]; then
                local target="$2"
            else
                local target="$defaultTargetLanguage"
            fi
        fi
        local result=$(curl -s -i --user-agent "" -d "sl=$source" -d \
            "tl=$target" --data-urlencode "text=$1" \
            http://translate.google.com)
        # NOTE Temporary outcomment to have right code highlighting.
        # local encoding=$(awk '/Content-Type: .* charset=/ {sub(/^.*charset=["'\'']?/,""); sub(/[ "'\''].*$/,""); print}' <<<"$result")
        # NOTE Alternativly use:
        # iconv -f $encoding <<<"$result" | awk 'BEGIN {RS="<div"};/<span[^>]* id=["'\'']?result_box["'\'']?/ {sub(/^.*id=["'\'']?result_box["'\'']?(>| [^>]*>)([ \n\t]*<[^>]*>)*/,"");sub(/<.*$/,"");print}' | html2text -utf8
        # NOTE Temporary outcomment to have right code highlighting.
        # iconv -f "$encoding" <<<"$result" | awk 'BEGIN {RS="</div>"};/<span[^>]* id=["'\'']?result_box["'\'']?/' | html2text -utf8
        return $?
    fi
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
