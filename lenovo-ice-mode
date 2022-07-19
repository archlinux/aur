#!/bin/bash
#Script to apply desired Lenovo bios System Cooling mode using acpi_call

clrarr=( "$(tput bold ; tput setaf 5)" "$(tput bold ; tput setaf 6)" "$(tput bold ; tput setaf 4)" "$(tput bold ; tput setaf 1)" "$(tput setab 5 ; tput bold ; tput setaf 6)" "$(tput setab 1)" "$(tput sgr0)" )
pnk=0 ; lcn=1 ; lbl=2 ; lrd=3 ; purbg=4 ; redbg=5 ; noc=6  #no color

if [ -a /proc/acpi/call ]; then
    curcoolmode() {
        echo '\_SB.PCI0.LPC0.EC0.FCMO' > /proc/acpi/call
        cat /proc/acpi/call | cut -d '' -f1
    }

    hcoolmodearr=( "${clrarr[$pnk]}Intelligent Cooling${clrarr[$noc]}" "${clrarr[$lrd]}Extreme Performance${clrarr[$noc]}" "${clrarr[$lcn]}Battery Saving${clrarr[$noc]}" )
    hcoolmodei=0 ; hcoolmodep=1 ; hcoolmodeb=2

    modepusharr=( "0x000FB001" "0x0012B001" "0x0013B001" )
    modepushi=0 ; modepushp=1 ; modepushb=2

    noticetext="${clrarr[$purbg]}Notice:${clrarr[$noc]}"

    helptext="$hcurrmode \n$noticetext ${clrarr[$lbl]}Provide a case insensitive option to set system cooling mode:\n\n ${clrarr[$pnk]}[-i${clrarr[$pnk]}] ${clrarr[$lbl]}for "${hcoolmodearr[$hcoolmodei]}" \n ${clrarr[$lrd]}[-p${clrarr[$lrd]}] ${clrarr[$lbl]}for "${hcoolmodearr[$hcoolmodep]}" \n ${clrarr[$lcn]}[-b${clrarr[$lcn]}] ${clrarr[$lbl]}for "${hcoolmodearr[$hcoolmodeb]}" ${clrarr[$noc]} \n "

    case `curcoolmode` in
        0x0)
            coolmodei="${hcoolmodearr[$hcoolmodei]}"
            coolmode="$coolmodei"
            ;;
        0x1)
            coolmodep="${hcoolmodearr[$hcoolmodep]}"
            coolmode="$coolmodep"
            ;;
        0x2)
            coolmodeb="${hcoolmodearr[$hcoolmodeb]}"
            coolmode="$coolmodeb"
            ;;
    esac

    hcurrmode="\n$noticetext ${clrarr[$lbl]}Current cooling mode is set as $coolmode ${clrarr[$noc]}\n"

    [ $# -eq 0 ] && { echo -e "$hcurrmode"; echo -e "$helptext"; exit 1; }

    while getopts ':[iI][pP][bB]' optgiv
    do
        case "$optgiv" in
            [iI] )
                modepush="${modepusharr[$modepushi]}"
                hmodepush="${hcoolmodearr[$hcoolmodei]}"
                ;;
            [pP] )
                modepush="${modepusharr[$modepushp]}"
                hmodepush="${hcoolmodearr[$hcoolmodep]}"
                ;;
            [bB] )
                modepush="${modepusharr[$modepushb]}"
                hmodepush="${hcoolmodearr[$hcoolmodeb]}"
                ;;
            \? )
                echo -e "$hcurrmode"
                echo -e "$helptext"
                exit;;
        esac

        echo "\_SB.PCI0.LPC0.EC0.VPC0.DYTC $modepush" > /proc/acpi/call
        echo -e "\n$noticetext ${clrarr[$lbl]}Successfully updated system cooling from $coolmode ${clrarr[$lbl]}to $hmodepush ${clrarr[$lbl]}mode.${clrarr[$noc]}\n"
        exit
    done
else
    echo -e "\n${clrarr[$redbg]}ERROR: No /proc/acpi/call found! Please make sure acpi_call is installed and has been modprobed. ${clrarr[$noc]}\n"
fi

