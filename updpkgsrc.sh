#!/usr/bin/env bash
# Update source array of Git submodules in PKGBUILD
#
# Contain functions:
# "echoSourceTextForSubModule": Echo source array of given Git repository
# "echoGitCMDForSubModule": Echo Git command for PKGBUILD to change submodule's url
# "updateBuildScriptForSubModule [Path to PKGBUILD]": Update source array and replace it in PKGBUILD 
#
# $1=[Path to Git repository]
#
# example:
# $ bash -c 'source ./updpkgsrc.sh [Path to Git repository] && echoSourceTextForSubModule'
# $ bash -c 'source ./updpkgsrc.sh [Path to Git repository] && echoGitCMDForSubModule'
# $ bash -c 'source ./updpkgsrc.sh [Path to Git repository] && updateBuildScriptForSubModule [Path to PKGBUILD]'

if ! type git > /dev/null 2>&1; then
    echo "This script needs \`git\` in order to work, aborting..." && exit 1
fi

gitRepo=${1:-.}
gitModulesStatus=$(git -C "$gitRepo" submodule status --recursive)
if [[ -z $gitModulesStatus ]]; then
    echo "No submodule in this repository, aborting..." && exit 1
else
    gitModulesFile=$(cat "$gitRepo/.gitmodules")
fi

# Submodule's Commit Array
declare -A subCommit
IFS=$'\n' && for line in $gitModulesStatus; do
    name=${line#* }
    commit=${line% *}
    subCommit+=(["$name"]="${commit:1}")
done && unset IFS

# Return Submodule's Git Command
function echoGitCMDForSubModule {
    gitCMDName="git "
    subModuleGitCMD+="$gitCMDName"
    for subName in "${!subCommit[@]}"; do
        configUrl="-c submodule.${subName}.url=\"\$srcdir/${subName/\//|}\" \\"
        subModuleGitCMD+="$configUrl"$'\n'$(printf %"${#gitCMDName}"s)
        ((count++))
    done
    subModuleGitCMD+="-c protocol.file.allow=always submodule update --init --progress"
    echo "$subModuleGitCMD"
}

declare subModuleSourceTextStart='# Auto generate, do not edit.'
declare subModuleSourceTextEnd='# End'

# Return Submodule's Source Text
function echoSourceTextForSubModule {
    sourceArrayName='source+=('
    subModuleSourceText+="${subModuleSourceTextStart}"$'\n'"${sourceArrayName}"
    count=1 && for subName in "${!subCommit[@]}"; do
        if [[ $subName =~ ^(src|pkg|PKGBUILD|.SRCINFO)$ ]]; then
            echo 'TODO: fix submodule that name as src,pkg,PKGBUILD or .SRCINFO.' && exit 1
        fi
        subUrl=$(echo "$gitModulesFile" | git config -f "/dev/stdin" --get "submodule.${subName}.url")
        subModule="${subName/\//|}::git+${subUrl}#commit=${subCommit[$subName]}"
        if [ "${#subCommit[@]}" == "$count" ]; then
            subModuleSourceText+="'$subModule'"
        else
            subModuleSourceText+="'$subModule'"$'\n'$(printf %"${#sourceArrayName}"s)
        fi
        ((count++))
    done
    subModuleSourceText+=") ${subModuleSourceTextEnd}"
    echo "$subModuleSourceText"
}

# Update source array in PKGBUILD
#
# $1=[Path to PKGBUILD]
function updateBuildScriptForSubModule {
    buildScriptFile=$1
    if [[ -n $buildScriptFile ]]; then
        buildScript=$(cat "$1" 2> /dev/null)
        SourceText="$(echoSourceTextForSubModule)"
        if [[ $buildScript != *$SourceText* ]]; then
            sourceTextForSed=$(echo "$SourceText"|sed -ze 's&\n&\\n&g' -e 's&|&\\|&g')
            sededbuildScript=$(echo "$buildScript" | sed -z "s|\n$subModuleSourceTextStart\nsource+=([^)]*) $subModuleSourceTextEnd\n|\n$sourceTextForSed|")

            if [ "$buildScript" == "$sededbuildScript" ]; then
                echo "$SourceText" >> "$buildScriptFile"
            else
                echo "$sededbuildScript" > "$buildScriptFile"
            fi

            # shellcheck disable=SC2181,SC2320
            if [[ $? != 0 ]]; then
                echo "Failed to update '$buildScriptFile'. The file has not been modified."
            else
                echo "The source of submodules in '$buildScriptFile' have updated! Please update checksums, do makepkg again."
            fi && exit 1
        else
            echo "Submodule not updated, continue..." && exit 0
        fi
    else
        echo "Failed to update '$buildScriptFile'. The file is not exist." && exit 1
    fi
}