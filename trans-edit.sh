#!/bin/bash
function locale_var(){
    #指定所使用的语言
    locale=$(echo ${LANG}|tr '.' ' '|cut -f 1 -d ' '|tr '_' '-'|tr 'A-Z' 'a-z' )
    if [ ! -f "${source_path}/Translations/Language.${locale}.xml" ]
    then
	locale="$(echo "${locale}"|cut -f 1 -d '-')"
	if  [ ! -f "${source_path}/Translations/Language.${locale}.xml" ]
	then
	    echo "未找到所使用语言所对应的翻译文件${source_path}Translations/Language.${locale}.xml"
	    echo "The translation file ${source_path}/Translations/Language.${locale}.xml corresponding to the language used was not found"
	    exit ;
	else
	    download_attach_language_file
	fi
    else
	download_attach_language_file
    fi
}
function download_attach_language_file(){
    #下载补充语言包
    [ -f " ${source_path}/Translations/attach-${locale}-language.en.xml" ] ||\
	wget https://gitlab.com/crimsonote/veracrypt-trans/-/raw/master/Translations/attach-${locale}-language.en.xml -O Translations/attach-${locale}-language.en.xml||\
	wget https://github.com/crimsonote/veracrypt-trans/raw/master/Translations/attach-${locale}-language.en.xml -O Translations/attach-${locale}-language.en.xml||\
	echo "补充原文下载失败"
        [ -f " ${source_path}/Translations/attach-language.${locale}.xml" ] ||\
	wget https://gitlab.com/crimsonote/veracrypt-trans/-/raw/master/Translations/attach-language.${locale}.xml -O Translations/attach-language.${locale}.xml||\
	wget https://github.com/crimsonote/veracrypt-trans/raw/master/Translations/attach-language.${locale}.xml -O Translations/attach-language.${locale}.xml||\
	(echo "补充译文下载失败";rm -f "Translations/attach-${locale}-language.en.xml")
}
function xml_var(){
    #用于提取xml翻译文件至变量并做修补
    en_xml_end_line="$(grep '</localization>' -n "${en_xml_file}"|cut -f 1 -d ':')"
    let en_xml_end_line=en_xml_end_line-1  #因为sed的r会在行尾追加，所以需要减1
    locale_xml_end_line="$(grep '</localization>' -n "${locale_xml_file}"|cut -f 1 -d ':')"
    let locale_xml_end_line=locale_xml_end_line-1
    en_xml="$(sed "${en_xml_end_line} r ${source_path}/Translations/attach-${locale}-language.en.xml" "${en_xml_file}")"
    locale_xml="$(sed "${locale_xml_end_line} r ${source_path}/Translations/attach-language.${locale}.xml" "${locale_xml_file}")"
}
function no_makeself(){
    #make时禁用makeself
    if [ -n "${1}" ]
    then
	sed "/^  *makeself/ d" src/Main/Main.make -i
    fi
}
function sed_code_trans(){
    #替换源码文件显示文本
    en_sed_string="$(echo "${1}"|sed "s#[\][n]#[\\\][n]#g"|sed 's/#/\\\#/g')"
    locale_sed_string="$(echo "${2}"|sed "s#[\][n]#\\\\\\\\\\\n#g;s#&#\\\&#g"|sed 's/#/\\\#/g')"
    sed "s#\"${en_sed_string}\"#\"${locale_sed_string}\"#g" -i ${3}
    #echo "s#${1}#${2}#g" "-i"  "${3}"
}
function filter_code(){
    filter=${1}
    continue_filter ${filter} "${en_string}" "${locale_string}"
}
function continue_filter(){
    #根据grep搜索情况，进行替换操作
    case $1 in
	a|b)
	    edit_code_file_list="$(echo "${filter_result}"|cut -f 1 -d ":"|sort | uniq|tr '\n' ' ')"
	    sed_code_trans "${en_string}" "${locale_string}" "${edit_code_file_list}"
	    ;;
	c)
	    #黑名单
	    blacklist_line="84,85"
	    if (echo "${blacklist_line}"|tr ',' '\n'|sed "s/^/./g;s/$/..g"|grep "${keynum}")
	    then
		true
		#跳过翻译
	    else
		edit_code_file_list="$(echo "${filter_result}"|cut -f 1 -d ":"|sort | uniq|tr '\n' ' ')"
		sed_code_trans "${en_string}" "${locale_string}" "${edit_code_file_list}"
	    fi
	    ;;
	d)
	    #白名单
	    whitelist_line="1,260,"
	    if (echo "${whitelist_line}"|tr ',' '\n'|sed "s/^/./g;s/$/../g"|grep "${keynum}")
	    then
		edit_code_file_list="$(echo "${filter_result}"|cut -f 1 -d ":"|sort | uniq|tr '\n' ' ')"
		sed_code_trans "${en_string}" "${locale_string}" "${edit_code_file_list}"
	    else
		true
	    fi
	    ;;
	e|f)
	    ;;
    esac	    
}

TMPFILE="$(mktemp -td vera_transXXXXX)"
source_path="."
cd "${source_path}"
locale_var
en_xml_file="${source_path}/src/Common/Language.xml" 
locale_xml_file="${source_path}/Translations/Language.${locale}.xml"
no_makeself "${1}"
xml_var
key_total="$(echo "${locale_xml}"|xmllint --xpath "/VeraCrypt/localization/entry/@key" -|wc -l)"
keynum=1
while [ "${keynum}" -le "${key_total:-0}" ]
do
    num_key=$(echo "${locale_xml}"|xmllint --xpath "/VeraCrypt/localization/entry[${keynum}]/@key" -|cut -f 2 -d '=')
    key_xpath="/VeraCrypt/localization/entry[@key="${num_key}"]/text()"
    en_string="$(echo "${en_xml}"|xmllint --xpath ${key_xpath} -|sed "s#&amp;#\&#g"|sed 's#&lt;#<#g'|sed 's#&gt;#>#g')"
    locale_string="$(echo "${locale_xml}"|xmllint --xpath ${key_xpath} -|sed "s#&amp;#\&#g"|sed "s#&lt;#<#g"|sed "s#&gt;#>#g")"
    filter_result="$(grep -Er "[^=]\"$(echo "${en_string}"|sed 's#\\#\\\\#g')\"" * --binary-files=without-match --exclude="*.log" --exclude="*.txt" --exclude="*.sh" --exclude="Language.xml"|tr '\r' '\n'|sed "/^ *$/d")"
    if [ -z "${filter_result}" ]
    then
	filter_result="$(grep -ir "\"$(echo "${en_string}"|sed 's#\\#\\\\#g')\"" * --binary-files=without-match --exclude="*.log" --exclude="*.txt" --exclude="*.sh" --exclude="Language.xml"|tr '\r' '\n'|sed "/^ *$/d")"
    fi
    filter_num=$(echo -n "${filter_result}"|wc -l)
    if !(echo ${en_string}|grep ' ' >/dev/null)
    then #无空格输出
	if [ "${filter_num}" -le 10 ] && [ -n  "${filter_result}" ]
	then #无空格且筛选结果小于10
	    filter_code b ${TMPFILE}/b
	elif [ "${filter_num}" -gt 10 ] #无空格 大于10
	then
	    filter_code d ${TMPFILE}/d
	elif  [ -z "${filter_result}" ] #无空格 无结果
	then
	    filter_code f ${TMPFILE}/f
	fi 
    else
	if [ "${filter_num}" -le 10 ] && [ -n "${filter_result}" ]
	then #筛选结果小于10
	    filter_code a ${TMPFILE}/a
	elif [ "${filter_num}" -gt 10 ] #大于10
	then
    	    filter_code c ${TMPFILE}/c
	elif  [ -z "${filter_result}" ] #无结果
	then
	    filter_code e ${TMPFILE}/e
	fi
    fi
    if [ "${locale%%-*}" == "zh" ]
    then
    echo  "${keynum}"-"${filter}:""${en_string} >翻译为> ${locale_string}"
    echo -ne "搜索替换翻译中:${keynum}/${key_total}\r"
    else	
    echo  "${keynum}"-"${filter}""${en_string} >translate to> ${locale_string}"
    echo -ne "Searching and replacing:${keynum}/${key_total}\r"
    fi
    let keynum=keynum+1
done
mv src/Common/Language.xml Translations/Language.en.xml
cp Translations/Language.${locale}.xml src/Common/Language.xml
