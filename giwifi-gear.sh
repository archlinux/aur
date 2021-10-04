#!/usr/bin/env bash

#############################################
## User Config
#############################################

GW_GTW=''
GW_USER=''
GW_PWD=''

AUTH_TYPE='' # pc/pad/staff for web auth, windows/mac for desktop app auth, android/ios/apad/ipad for mobile app auth, token for directly auth by token
AUTH_TOKEN=''

SERVICE_TYPE='1' # 1: GiWiFi用户 2: 移动用户 3: 联通用户 4: 电信用户

HEART_BEAT=5
HEART_BROKEN_TIME=10

AUTH_IFACE=''       # the base interface (get auth info)
EXTRA_IFACE_LIST='' # 'vwan1 vwan2 vwan3' the extra interface list (Recommended for less than two)

GW_PORT='8060'

IS_MAGIC_PRO=0     # 0: disable 1: enable
MAGIC_PRO_TIME=240 # will make magic when ${MAGIC_PRO_TIME} > $(ONLINE_TIME)
PRE_BUILD_TOKEN_NUM=2 # the number of getting tokens after fisrt auth

TOKEN_BUILD_SPEED=30
MAX_TOKEN_LIST_LEN=5 # the max size of token pool

# do not edit
TOKEN_IOTA=0
AUTH_TOKEN_LIST=''
AUTH_INFO_LIST=''

AP_MAC=''

BANNED_WAIT_TIME=20

#ISDAEMON=1
#ISQUIT=1
#ISBIND=1

#ISLOG=1

#############################################
## Web Auth Mode Config
#############################################

GW_REDIRECT_PORT='8062'
GW_REDIRECT_URL='http://www.baidu.com'
PC_UA='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36'
PAD_UA='Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25'

#############################################
## Desktop App Auth Mode Config
#############################################

WIN_UA='Asynchronous WinHTTP/1.0 GiWiFiAssist/1.1.4.3'
MAC_UA='GiWiFi/1.1.6.2 (Mac OS X Version 11.3.1 (Build 20D91))'

WIN_APP_VERSION='1.1.4.3'
MAC_APP_VERSION='1.1.6.2'

WIN_MODEL='Microsoft Windows 10, 64-bit'
MAC_MODEL='mac11.3'

WIN_APP_UUID='18C6037B-6379-4315-8FE5-8C9B8E593CF8'
MAC_APP_UUID='gad82d424cb15452938cf3602c7f3f02'

STA_NIC_TYPE='2' # 1: Wireless 2: Ethernet

#############################################
## Mobile App Auth Mode Config
#############################################

ANDROID_UA='(GiWiFi;Android11;Samsung;Galaxy S20)'
IOS_UA='(GiWiFi;iPhone OS 14_3;Apple;iPad11,6)'

ANDROID_STA_MODEL='Samsung,Galaxy S20,30,11' # MANUFACTURER,MODEL,SDK,RELEASE
IOS_STA_MODEL='Apple,iPad11,14,3'

PHONE_BTYPE='1'
PAD_BTYPE='2'

PHONE_STA_TYPE='phone'
PAD_STA_TYPE='pad'

MOBILE_IM='00000000-023e-0e94-ffff-ffffef05ac4a'  # IMEI UUID
MOBILE_IS_INSTALL_WX='1'                          # is installed WeChat?
MOBILE_AUTH_MODE='1'                              # 1: Cloud Mode 2: Local Mode
MOBILE_IMSI='00000000-6142-4378-a94954'           # xxx-xxx-xxx-xxx
MOBILE_UUID='b88a2e1b-6142-4378-a94954ea3287cce5' # xxx-xxx-xxx-xxx
# MOBILE_APP_ID='gi752e58b11af83d96'
# MOBILE_APP_KEY='YXJjc29mdGZhY2VyZWNvZ25pemVkZXRlY3Q'
MOBILE_APP_ENCRYPT_KEY='5447c08b53e8dac4'
MOBILE_APP_VERSION='2.4.1.4'

#############################################
## Tool Config
#############################################

AWK_TOOL='awk' # it will be upgrade to gawk, when you have gawk...
VERSION='1.2.6'

#############################################
## Network Util
#############################################

check_ip() {
	# check_ip <string>

	printf '%s' "$1" | grep "^[0-9]\{1,3\}\.\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}$" >/dev/null
	if [ $? -ne 0 ]; then
		return 1
	fi
	local ipaddr=$1
	local a
	local b
	local c
	local d

	a="$(echo "$ipaddr" | ${AWK_TOOL} -F . '{print $1}')"
	b="$(echo "$ipaddr" | ${AWK_TOOL} -F . '{print $2}')"
	c="$(echo "$ipaddr" | ${AWK_TOOL} -F . '{print $3}')"
	d="$(echo "$ipaddr" | ${AWK_TOOL} -F . '{print $4}')"
	for num in $a $b $c $d; do
		if [ "$num" -gt 255 ] || [ "$num" -lt 0 ]; then
			return 1
		fi
	done
	return 0

}

get_os_type() {

	local os
	# Mac OS X
	if [ "$(uname)" = "Darwin" ]; then
		os="darwin"
	# GNU/Linux
	elif [ "$(uname)" = "Linux" ]; then
		os="linux"
		# Android
		if [ "$(getprop 2>/dev/null)" ]; then
			os="android"
		fi
		# IOS (ISH)
		if [ "$(ls /dev/clipboard 2>/dev/null)" ]; then
			os="ish"
		fi
	# Windows
	elif [ "$(chcp.com 2>/dev/null)" ]; then
		os="windows"
	else
		os="$(uname)"
	fi
	printf '%s' "$os"

}

get_nic_gateway() {
	# get_nic_gateway <nic_name>

	local gateway

	if [ "$OS" == 'windows' ]; then
		gateway="$(chcp.com 437 >/dev/null && netsh interface ip show address "$1" 2>/dev/null | grep 'Default Gateway' | ${AWK_TOOL} '{print $3}')"
	elif [ "$OS" == 'linux' ] || [ "$OS" == 'android' ]; then
		gateway="$(ip route list match 0 table all scope global 2>/dev/null | grep 'proto' | grep "$1" | ${AWK_TOOL} '{print $3}')"
	elif [ "$OS" == 'darwin' ]; then
		gateway="$(netstat -rn 2>/dev/null | grep 'default' | grep "$1" | ${AWK_TOOL} '{print $2}')"
	fi

	if check_ip "$gateway"; then
		printf '%s' "$gateway"
	fi

}

displaytime() {
	local T=$1
	local D=$((T / 60 / 60 / 24))
	local H=$((T / 60 / 60 % 24))
	local M=$((T / 60 % 60))
	local S=$((T % 60))
	[ $D -gt 0 ] && printf '%d days ' $D
	[ $H -gt 0 ] && printf '%d hours ' $H
	[ $M -gt 0 ] && printf '%d minutes ' $M
	[ $S -ge 0 ] && printf '%d seconds\n' $S
}

#############################################
## Json Handle
#############################################

cat_json_value() {
	${AWK_TOOL} -v json="$1" -v key="$2" -v defaultValue="$3" 'BEGIN{
        foundKeyCount = 0
        while (length(json) > 0) {
            pos = match(json, "\""key"\"[ \\t]*?:[ \\t]*");
            if (pos == 0) {if (foundKeyCount == 0) {print defaultValue;} exit 0;}
            ++foundKeyCount;
            start = 0; stop = 0; layer = 0;
            for (i = pos + length(key) + 1; i <= length(json); ++i) {
                lastChar = substr(json, i - 1, 1)
                currChar = substr(json, i, 1)
                if (start <= 0) {
                    if (lastChar == ":") {
                        start = currChar == " " ? i + 1: i;
                        if (currChar == "{" || currChar == "[") {
                            layer = 1;
                        }
                    }
                } else {
                    if (currChar == "{" || currChar == "[") {
                        ++layer;
                    }
                    if (currChar == "}" || currChar == "]") {
                        --layer;
                    }
                    if ((currChar == "," || currChar == "}" || currChar == "]") && layer <= 0) {
                        stop = currChar == "," ? i : i + 1 + layer;
                        break;
                    }
                }
            }
            if (start <= 0 || stop <= 0 || start > length(json) || stop > length(json) || start >= stop) {
                if (foundKeyCount == 0) {print defaultValue;} exit 0;
            } else {
                print substr(json, start, stop - start);
            }
            json = substr(json, stop + 1, length(json) - stop)
        }
    }'
}

get_json_value() {
	# get_json_value <json> <key>

	local value
	value="$(cat_json_value "$1" "$2")"
	local temp="${value%\"}"
	printf '%s' "${temp#\"}"

}

#############################################
## url handle
#############################################

url_encode() {
	# urlencode <string>

	local length="${#1}"
	for i in $(seq $length); do
		local c="${1:$((i - 1)):1}"
		case $c in
		[a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
		*) printf '%%%02X' "'$c" ;;
		esac
	done

}

url_decode() {
	# urldecode <string>

	local url_encoded="${1//+/ }"
	printf '%b' "${url_encoded//%/\\x}"

}

#############################################
## String Handle
#############################################

str_str() {
	# str_str <string> <string> <string>

	local str
	str="${1#*${2}}"
	str="${str%%$3*}"
	printf '%s' "$str"

}

str2hex() {
	# str2hex <string>

	local length="${#1}"
	for i in $(seq $length); do
		printf '%x' "'${1:$((i - 1)):1}"
	done

}

logcat() {
	# logcat <string> <level>

	#%Y-%m-%d
	local t
	t="$(date "+%H:%M:%S")"

	# check the log flag
	if [ "$2" ]; then
		local flag=$2
	else
		local flag='I'
	fi

	if [ "$1" ]; then
		echo "$t" "$flag": "$1"
	fi
}

#############################################
## GiWiFi Encrypt Util
#############################################

get_encrypt() {
	# get_encrypt <plain>

	# aes-128-ecb PKCS5Padding
	# default key: 5447c08b53e8dac4
	# don't need iv
	printf '%s' "$1" | openssl enc -e -aes-128-ecb -K "$(str2hex "$MOBILE_APP_ENCRYPT_KEY")" -nosalt -base64 -A

}

get_challge() {
	#get_challge <password> <token>

	local make_pass
	make_pass="$(printf '%s' "$1" | openssl base64)"
	local token_challge="$2"
	local length="${#make_pass}"
	for i in $(seq "$length"); do
		printf '%s' "${make_pass:$i-1:1}${token_challge:32-$i:1}"
	done

}

#############################################
## GiWiFi API
#############################################

gw_get_gateway() {
	local nettest
	local delayurl
	nettest="$(curl $CURL_OPT -s 'http://nettest.gwifi.com.cn' | grep 'delayURL')"
	delayurl="$(str_str "$nettest" 'delayURL("' '")')"
	printf '%s' "$(str_str "$delayurl" 'http://' ":$GW_REDIRECT_PORT/redirect")"
}

gw_get_hotspot_group() {
	printf '%s' "$(curl $CURL_OPT -s -A "$AUTH_UA" "http://$GW_GTW:$GW_PORT/wifidog/get_hotspot_group")"
}

gw_get_auth_state() {
	printf '%s' "$(curl $CURL_OPT -s -A "$AUTH_UA" "http://$GW_GTW:$GW_PORT/wifidog/get_auth_state")"
}

# for web
gw_web_get_login_page() {
	printf '%s' "$(curl $CURL_OPT -s -L -A "$AUTH_UA" "http://$GW_GTW:$GW_REDIRECT_PORT/redirect?oriUrl=$GW_REDIRECT_URL" | grep 'name')"
	# &account_type= 1: 教职工 2: 特殊终端 3: 校外访客
}

gw_web_loginaction() {
	# create random three-digit numbers
	local str
	str="$(date +%S%M)"
	local rannum="${str:1:3}"

	printf '%s' "$(
		curl $CURL_OPT -s \
			-A "$AUTH_UA" \
			-X POST \
			-d "$1" \
			"http://login.gwifi.com.cn/cmps/admin.php/api/loginaction?round=$rannum"
	)"
}

gw_web_rebindmac() {
	# create random three-digit numbers
	local str
	str="$(date +%S%M)"
	local rannum="${str:1:3}"

	printf '%s' "$(
		curl $CURL_OPT -s \
			-A "$AUTH_UA" \
			-X POST \
			-d "$1" \
			"http://login.gwifi.com.cn/cmps/admin.php/api/reBindMac?round=$rannum"
	)"
}

gw_desktop_auth_identity() {
	printf '%s' "$(curl $CURL_OPT -s -A "$AUTH_UA" "http://login.gwifi.com.cn/cmps/admin.php/ppi/authIdentity?name=$GW_USER&version=$DESKTOP_APP_VERSION")"
}

gw_desktop_auth_challege() {
	printf '%s' "$(
		curl $CURL_OPT -s \
			-A "$AUTH_UA" \
			-X POST \
			-d "$1" \
			'http://login.gwifi.com.cn/cmps/admin.php/ppi/authChallege'
	)"
}

gw_desktop_rebindmac() {
	printf '%s' "$(
		curl $CURL_OPT -s \
			-A "$AUTH_UA" \
			-X POST \
			-d "$1" \
			'http://login.gwifi.com.cn/cmps/admin.php/ppi/reBindMac'
	)"
}

# discard
# gw_web_get_gtw_auth() {
# 	printf '%s' "$(curl_by_nic -s -A "\'$AUTH_UA\'" "http://"$GW_GTW"/getApp.htm?action=getAuthState&os=mac")"
# }
#
# gw_web_logout() {
# 	printf '%s' "$(curl_by_nic -s "http://"$GW_GTW"/getApp.htm?action=logout")"
#

# gw_mobile_get_user() {
# 	# gw_phone_get_user <gw_mobile_app_login_data>

# 	printf '%s' "$(
# 		curl $CURL_OPT -s \
# 		-A "$AUTH_UA" \
# 		-X POST \
# 		-d "$1" \
# 		'http://login.gwifi.com.cn:8080/wocloud_v2/appUser/getUser.bin'
# 	)"

# }

# gw_mobile_login() {
#     # gw_phone_app_login <gw_mobile_app_login_data>

#     printf '%s' "$(curl $CURL_OPT -s \
# 		-A "$GW_PHONE_UA" \
# 		-X POST \
# 		-d "$1" \
# 		'http://login.gwifi.com.cn:8080/wocloud_v2/appUser/appLogin.bin'
# 	)"

# }

# gw_mobile_get_token() {
# 	# gw_mobile_get_token <project_id> <timestamp> <user_id>
# 	local sign="$(printf '%s' "app_id="$MOBILE_APP_ID"&project_id="$ORG_ID"&timestamp="$TIMESTAMP"&user_id="$1"&key="$MOBILE_APP_KEY"" | openssl md5)"
# 	sign=${sign#*= }
# 	printf '%s' "$(curl $CURL_OPT -s "http://login.gwifi.com.cn/shop/app/getToken?app_id="$MOBILE_APP_ID"&project_id="$ORG_ID"&sign="$sign"&timestamp="$TIMESTAMP"&user_id=$1")"
# }

gw_mobile_relogin() {
	# gw_mobile_relogin <gw_mobile_login_data>

	printf '%s' "$(
		curl $CURL_OPT -s -i \
			-A "$AUTH_UA" \
			-X POST \
			-d "$1" \
			'http://login.gwifi.com.cn:8080/wocloud_v2/appUser/reLogin.bin'
	)"

}

gw_mobile_rebindmac() {
	# gw_mobile_app_rebindmac <gw_mobile_app_login_data>

	printf '%s' "$(
		curl $CURL_OPT -s \
			-A "$AUTH_UA" \
			-X POST \
			-d "$1" \
			'http://login.gwifi.com.cn:8080/wocloud_v2/appUser/reBindMac.bin'
	)"

}

gw_logout() {
	printf '%s' "$(curl $CURL_OPT -s -L -A "$AUTH_UA" "http://$GW_GTW:$GW_PORT/wifidog/userlogout?ip=$CLIENT_IP&mac=$(url_encode "$CLIENT_MAC")")"
	for EXTRA_IFACE in ${EXTRA_IFACE_LIST}; do
		printf '%s' "$(curl --interface "${EXTRA_IFACE}" -s -L -A "$AUTH_UA" "http://$GW_GTW:$GW_PORT/wifidog/userlogout?ip=$CLIENT_IP&mac=$(url_encode "$CLIENT_MAC")")"
	done
}

gw_auth_token() {
	# gw_auth_token <token>

	printf '%s' "$(curl $CURL_OPT -s -L -A "$AUTH_UA" "http://$GW_GTW:$GW_PORT/wifidog/auth?token=$1&info=$2")"
	for EXTRA_IFACE in ${EXTRA_IFACE_LIST}; do
		printf '%s' "$(curl --interface "${EXTRA_IFACE}" -s -L -A "$AUTH_UA" "http://$GW_GTW:$GW_PORT/wifidog/auth?token=$1&info=$2")"
	done

}

#############################################
## Parts
#############################################

get_auth_state() {
	AUTH_STATE_RTE="$(gw_get_auth_state)"
	##{"resultCode":0,"data":"{\"auth_state\":1,\"gw_id\":\"GWIFI-luoyangligong4\",\"access_type\":\"1\",\"authStaType\":\"0\",\"station_sn\":\"c400ada4a45a\",\"client_ip\":\"172.21.219.234\",\"client_mac\":\"60:F1:89:4A:5C:CB\",\"online_time\":680,\"logout_reason\":32,\"contact_phone\":\"400-038-5858\",\"suggest_phone\":\"400-038-5858\",\"station_cloud\":\"login.gwifi.com.cn\",\"orgId\":\"930\",\"timestamp\":\"1619174989\",\"sign\":\"29C2348DCE52C1E47C9B52076DE26C32\"}"}

	[ ! "$AUTH_STATE_RTE" ] && {
		logcat "Fail to get the auth state! (visit https://blog.icepie.net/project/giwifi-gear for more info)" "E"
		[ ! $ISDAEMON ] && exit 1
		return 1
	} || {
		[ $ISLOG ] && echo "" &&
			echo "AUTH_STATE_RTE:" &&
			echo "--> $AUTH_STATE_RTE" &&
			echo ''

		# Deserialization auth_state json data
		AUTH_STATE_DATA="$(get_json_value "$AUTH_STATE_RTE" 'data')"
		AUTH_STATE="$(get_json_value "$AUTH_STATE_DATA" 'auth_state')"
		GW_ID="$(get_json_value "$AUTH_STATE_DATA" 'gw_id')"
		ACCESS_TYPE="$(get_json_value "$AUTH_STATE_DATA" 'access_type')"
		AUTH_STA_TYPE="$(get_json_value "$AUTH_STATE_DATA" 'authStaType')"
		STATION_SN="$(get_json_value "$AUTH_STATE_DATA" 'station_sn')"
		CLIENT_IP="$(get_json_value "$AUTH_STATE_DATA" 'client_ip')"
		CLIENT_MAC="$(get_json_value "$AUTH_STATE_DATA" 'client_mac')"
		ONLINE_TIME="$(get_json_value "$AUTH_STATE_DATA" 'online_time')"
		LOGOUT_REASON="$(get_json_value "$AUTH_STATE_DATA" 'logout_reason')"
		CONTACT_PHONE="$(get_json_value "$AUTH_STATE_DATA" 'contact_phone')"
		SUGGEST_PHONE="$(get_json_value "$AUTH_STATE_DATA" 'suggest_phone')"
		STATION_CLOUD="$(get_json_value "$AUTH_STATE_DATA" 'station_cloud')"
		# ORG_ID="$(get_json_value "$AUTH_STATE_DATA" 'orgId')"
		# TIMESTAMP="$(get_json_value "$AUTH_STATE_DATA" 'timestamp')"
		SIGN="$(get_json_value "$AUTH_STATE_DATA" 'sign')"
		return 0
	}
}

auth_token_magic() {

	[ $TOKEN_IOTA -gt 0 ] && {
		logcat "Trying to make magic..."

		AUTH_TOKEN="$(echo $AUTH_TOKEN_LIST | ${AWK_TOOL} '{print $1}')"
		AUTH_TOKEN_LIST=${AUTH_TOKEN_LIST#"$AUTH_TOKEN "}

		[ "$AUTH_INFO" ] && {
			AUTH_INFO="$(echo $AUTH_INFO_LIST | ${AWK_TOOL} '{print $1}')"
			AUTH_INFO_LIST=${AUTH_INFO_LIST#"$AUTH_INFO "}
		}

		TOKEN_IOTA=$((TOKEN_IOTA - 1))

		[ $ISLOG ] && {
			echo "DEL TOKEN: $AUTH_TOKEN"
			[ "$AUTH_INFO" ] && {
				echo "DEL INFO: $AUTH_INFO"
			}
		}

		AUTH_TOKEN_RTE="$(gw_auth_token "$AUTH_TOKEN" "$AUTH_INFO")"

		[ $ISLOG ] && echo "" &&
			echo "AUTH_TOKEN_RTE:" &&
			echo "--> $AUTH_TOKEN_RTE" &&
			echo ''

		[ "$AUTH_TOKEN_RTE" ] && logcat "OK!" || logcat "Fail to make magic by the token!" 'E'

	} || logcat "No energy to make magic!" 'E'

}

log_out() {
	LOGOUT_RTE="$(gw_logout)"
	LOGOUT_RTE_CODE="$(get_json_value "$LOGOUT_RTE" 'resultCode')"

	[ $ISLOG ] && echo "" &&
		echo "LOGOUT_RTE" &&
		echo "--> $LOGOUT_RTE" &&
		echo ''

	[ "$LOGOUT_RTE_CODE" = '0' ] && {
		logcat "Successfully logged out!"
	} || {
		logcat "Fail to logout!" 'E'
	}
}

web_build_data() {
	# login to get the auth token
	LOGIN_PAGE="$(gw_web_get_login_page)"
	# get some values from login page
	PAGE_SIGN=$(str_str "$LOGIN_PAGE" 'name="sign" value="' '"')
	PAGE_TIME=$(str_str "$LOGIN_PAGE" 'name="page_time" value="' '"')

	[ $ISLOG ] && echo '' &&
		echo "PAGE_SIGN:" &&
		echo "--> $PAGE_SIGN" &&
		echo ''

	[ $ISLOG ] && echo '' &&
		echo "PAGE_TIME:" &&
		echo "--> $PAGE_TIME" &&
		echo ''
}

desktop_build_data() {
	AUTH_IDENTITY_RTE="$(printf "$(gw_desktop_auth_identity)" | sed "s@\\\\@@g")"

	[ $ISLOG ] && echo "" &&
		echo "AUTH_IDENTITY_RTE:" &&
		echo "--> $AUTH_IDENTITY_RTE" &&
		echo ''

	AUTH_IDENTITY_RTE_CODE="$(get_json_value "$AUTH_IDENTITY_RTE" 'resultCode')"
	AUTH_IDENTITY_RTE_MSG="$(get_json_value "$AUTH_IDENTITY_RTE" 'resultMsg')"

	[ ! "$AUTH_IDENTITY_RTE_CODE" = "0" ] && { logcat "$AUTH_IDENTITY_RTE_MSG" "E" && exit 1; }

	AUTH_IDENTITY_RTE_DATA="$(get_json_value "$AUTH_IDENTITY_RTE" 'data')"
	CHALLEGE_ID="$(get_json_value "$AUTH_IDENTITY_RTE_DATA" 'challege_id')"
}

mobile_build_data() {
	# MOBILE_GET_USER_DATA="$(
	# 	printf '{"data":"{\\"staticPassword\\":\\"%s\\",\\"phone\\":\\"%s\\"}","version":"%s","mac":"%s","gatewayId":"%s","token":"%s"}' \
	# 	"$(get_encrypt "$GW_PWD")" \
	# 	"$(get_encrypt "$GW_USER")" \
	# 	"$MOBILE_APP_VERSION" \
	# 	"$(get_encrypt "$CLIENT_MAC")" \
	# 	"$(get_encrypt "$GW_ID")" \
	# 	"$(get_encrypt '')"
	# )"

	# [ $ISLOG ] && echo "" && \
	# echo "MOBILE_GET_USER_DATA:" && \
	# echo "--> "$MOBILE_GET_USER_DATA"" && \
	# echo ''

	# MOBILE_USER_RTE="$(printf "$(printf "$(gw_mobile_get_user "$MOBILE_GET_USER_DATA")")" | sed "s@\\\\@@g")"
	# MOBILE_USER_RTE_CODE="$(get_json_value "$MOBILE_USER_RTE" 'resultCode')"

	# [ $ISLOG ] && echo "" && \
	# echo "MOBILE_USER_RTE:" && \
	# echo "--> "$MOBILE_USER_RTE"" && \
	# echo ''

	# [ "$MOBILE_USER_RTE_CODE" != '0' ] && { MOBILE_USER_RTE_MSG="$(get_json_value "$MOBILE_USER_RTE" 'resultMsg')" && logcat "$MOBILE_USER_RTE_MSG" 'E' && exit 1; }

	# MOBILE_USER_RTE_DATA="$(get_json_value "$MOBILE_USER_RTE" 'data')"
	# GW_USER_UID="$(get_json_value "$MOBILE_USER_RTE" 'uid')"

	# MOBILE_TOKEN_RTE="$(printf "$(printf "$(gw_mobile_get_token "$GW_USER_UID")")" | sed "s@\\\\@@g")"

	# [ $ISLOG ] && echo "" && \
	# echo "MOBILE_TOKEN_RTE:" && \
	# echo "--> "$MOBILE_TOKEN_RTE"" && \
	# echo ''

	# MOBILE_TOKEN_RTE_CODE="$(get_json_value "$MOBILE_TOKEN_RTE" 'errcode')"

	# [ "$MOBILE_TOKEN_RTE_CODE" != '0' ] && { MOBILE_TOKEN_RTE_MSG="$(get_json_value "$MOBILE_TOKEN_RTE" 'resultMsg')" && logcat "$MOBILE_TOKEN_RTE_MSG" 'E' && exit 1; }

	# MOBILE_TOKEN_RTE_DATA="$(get_json_value "$MOBILE_TOKEN_RTE" 'data')"
	# ACCESS_TOKEN="$(get_json_value "$MOBILE_TOKEN_RTE" 'access_token')"
	ACCESS_TOKEN=''

}

web_rebindmac() {
	WEB_LOGIN_DATA=$WEB_LOGIN_DATA+"&is_signed=2"
	WEB_REBINDMAC_RTE="$(printf "$(gw_web_rebindmac "$WEB_LOGIN_DATA")" | sed "s@\\\\@@g")"

	[ $ISLOG ] && echo "" &&
		echo "WEB_REBINDMAC_RTE:" &&
		echo "--> $WEB_REBINDMAC_RTE" &&
		echo ''

	WEB_REBINDMAC_RTE_STATUS="$(get_json_value "$WEB_REBINDMAC_RTE" 'status')"
	# WEB_REBINDMAC_DATA="$(get_json_value "$WEB_REBINDMAC_RTE" 'data')"
	# WEB_REBINDMAC_DATA_REASONCODE="$(get_json_value "$WEB_REBINDMAC_RTE_DATA" 'reasoncode')"
	WEB_REBINDMAC_RTE_INFO="$(str_str "$WEB_REBINDMAC_RTE" '"info":"' '","')"

	[ "$WEB_REBINDMAC_RTE_STATUS" = '1' ] && logcat "$WEB_REBINDMAC_RTE_INFO" || { logcat "$WEB_REBINDMAC_RTE_INFO" 'E' && exit 1; }
}

desktop_rebindmac() {
	DESKTOP_REBINDMAC_RTE="$(printf "$(gw_desktop_rebindmac "$DESKTOP_LOGIN_DATA")" | sed "s@\\\\@@g")"

	[ $ISLOG ] && echo "" &&
		echo "DESKTOP_REBINDMAC_RTE:" &&
		echo "--> $DESKTOP_REBINDMAC_RTE" &&
		echo ''

	DESKTOP_REBINDMAC_RTE_CODE="$(get_json_value "$DESKTOP_REBINDMAC_RTE" 'resultCode')"
	DESKTOP_REBINDMAC_RTE_MSG="$(get_json_value "$DESKTOP_REBINDMAC_RTE" 'resultMsg')"

	[ "$DESKTOP_REBINDMAC_RTE_CODE" = '0' ] && logcat "$DESKTOP_REBINDMAC_RTE_MSG" || { logcat "$DESKTOP_REBINDMAC_RTE_MSG" "E" && exit 1; }
}

mobile_rebindmac() {
	MOBILE_REBINDMAC_RTE="$(printf "$(gw_mobile_rebindmac "$MOBILE_LOGIN_DATA")" | sed "s@\\\\@@g")"

	[ $ISLOG ] && echo "" &&
		echo "MOBILE_REBINDMAC_RTE:" &&
		echo "--> $MOBILE_REBINDMAC_RTE" &&
		echo ''

	MOBILE_REBINDMAC_RTE_CODE="$(get_json_value "$MOBILE_REBINDMAC_RTE" 'resultCode')"
	MOBILE_REBINDMAC_RTE_MSG="$(get_json_value "$MOBILE_REBINDMAC_RTE" 'resultMsg')"

	[ "$MOBILE_REBINDMAC_RTE_CODE" = '0' ] && logcat "$MOBILE_REBINDMAC_RTE_MSG" || { logcat "$MOBILE_REBINDMAC_RTE_MSG" "E" && exit 1; }
}

web_get_token() {
	# login to get the auth token
	WEB_LOGIN_DATA="""\
access_type=$ACCESS_TYPE&acsign=$SIGN&btype=$AUTH_TYPE&client_mac=$(url_encode "$CLIENT_MAC")\
&contact_phone=$CONTACT_PHONE&devicemode=""\
&gw_address=$GW_GTW&gw_id=$GW_ID&gw_port=$GW_PORT&lastaccessurl=""\
&logout_reason=$LOGOUT_REASON&mac=$(url_encode "$CLIENT_MAC")\
&name=$GW_USER&online_time=$ONLINE_TIME&page_time=$PAGE_TIME&password=$GW_PWD&sign=$(url_encode "$PAGE_SIGN")\
&station_cloud=$STATION_CLOUD&station_sn=$STATION_SN&suggest_phone=$SUGGEST_PHONE&url=$(url_encode "$GW_REDIRECT_URL")\
&user_agent=""\
&link_data=""\
"""
	[ "$AUTH_TYPE" = 'staff' ] && WEB_LOGIN_DATA="account_type=1&$WEB_LOGIN_DATA"

	[ $ISLOG ] && echo "" &&
		echo "WEB_LOGIN_DATA:" &&
		echo "--> $WEB_LOGIN_DATA" &&
		echo ''

	if [ $ISBIND ]; then
		web_rebindmac
		logcat "exit"
		exit
	fi

	WEB_LOGIN_RTE="$(printf "$(gw_web_loginaction "$WEB_LOGIN_DATA")" | sed "s@\\\\@@g")"

	[ $ISLOG ] && echo "" &&
		echo "WEB_LOGIN_RTE:" &&
		echo "--> $WEB_LOGIN_RTE" &&
		echo ''

	WEB_LOGIN_RTE_STATUS="$(get_json_value "$WEB_LOGIN_RTE" 'status')"
	WEB_LOGIN_RTE_INFO="$(str_str "$WEB_LOGIN_RTE" '"info":"' '","')"
	WEB_LOGIN_RTE_DATA="$(get_json_value "$WEB_LOGIN_RTE" 'data')"
	WEB_LOGIN_RTE_DATA_REASONCODE="$(get_json_value "$WEB_LOGIN_RTE_DATA" 'reasoncode')"

	if [ ! "$WEB_LOGIN_RTE_STATUS" = '1' ]; then
		logcat "$WEB_LOGIN_RTE_INFO" 'E'
		if [ "$WEB_LOGIN_RTE_DATA_REASONCODE" = '43' ]; then
			printf '%s' 'Are you sure to rebind your device? [Y/n] '
			local input
			read -t 20 input
			case $input in
			[yY][eE][sS] | [yY])
				web_rebindmac
				logcat "exit"
				exit
				;;

			[nN][oO] | [nN])
				logcat "Ok, is ending..."
				;;

			*)
				logcat "Invalid input..."
				;;
			esac
		elif [ "$WEB_LOGIN_RTE_DATA_REASONCODE" = '55' ]; then
			[ $ISDAEMON ] && {

				[ "$AUTH_TOKEN_LIST" ] && auth_token_magic

				logcat "The state of the user is being banned..."
				logcat "Will try again after $BANNED_WAIT_TIME seconds..."
				sleep $BANNED_WAIT_TIME
				# restart main
				logcat "restart..."
				main
			}
		fi

		[ ! $ISDAEMON ] && logcat "exit" && exit 0

	fi

	[ "$(echo "$WEB_LOGIN_RTE_INFO" | grep 'token')" ] && AUTH_TOKEN="$(str_str "$WEB_LOGIN_RTE_INFO" 'token=' '&')" || AUTH_TOKEN=''

}

desktop_get_token() {
	DESKTOP_LOGIN_DATA="""\
ap_mac=$AP_MAC&app_uuid=$(url_encode "$DESKTOP_APP_UUID")\
&challege=$(url_encode "$(get_challge "$GW_PWD" "$CHALLEGE_ID")")\
&gw_address=$GW_GTW&gw_id=$GW_ID&ip=$CLIENT_IP&mac=$(url_encode "$CLIENT_MAC")\
&name=$GW_USER&service_type=$SERVICE_TYPE&sta_model=$(url_encode "$DESKTOP_MODEL")\
&sta_nic_type=$STA_NIC_TYPE&sta_type=pc\
&version=$DESKTOP_APP_VERSION"""

	[ $ISLOG ] && echo "" &&
		echo "DESKTOP_LOGIN_DATA:" &&
		echo "--> $DESKTOP_LOGIN_DATA" &&
		echo ''

	if [ $ISBIND ]; then
		desktop_rebindmac
		logcat "exit"
		exit
	fi

	DESKTOP_LOGIN_RTE="$(printf "$(gw_desktop_auth_challege "$DESKTOP_LOGIN_DATA")" | sed "s@\\\\@@g")"

	[ $ISLOG ] && echo "" &&
		echo "DESKTOP_LOGIN_RTE:" &&
		echo "--> $DESKTOP_LOGIN_RTE" &&
		echo ''

	DESKTOP_LOGIN_RTE_CODE="$(get_json_value "$DESKTOP_LOGIN_RTE" 'resultCode')"
	DESKTOP_LOGIN_RTE_MSG="$(get_json_value "$DESKTOP_LOGIN_RTE" 'resultMsg')"
	DESKTOP_LOGIN_RTE_DATA="$(get_json_value "$DESKTOP_LOGIN_RTE" 'data')"

	if [ ! "$DESKTOP_LOGIN_RTE_CODE" = '0' ]; then
		logcat "$DESKTOP_LOGIN_RTE_MSG" 'E'
		if [ "$DESKTOP_LOGIN_RTE_CODE" = '43' ]; then
			printf '%s' 'Are you sure to rebind your device? [Y/n] '
			local input
			read -t 20 input
			case $input in
			[yY][eE][sS] | [yY])
				desktop_rebindmac
				logcat "exit"
				exit
				;;

			[nN][oO] | [nN])
				logcat "Ok, is ending..."
				;;

			*)
				logcat "Invalid input..."
				;;
			esac
		elif [ "$DESKTOP_LOGIN_RTE_CODE" = '55' ]; then
			[ $ISDAEMON ] && {

				[ "$AUTH_TOKEN_LIST" ] && auth_token_magic

				logcat "The state of the user is being banned..."
				logcat "Will try again after $BANNED_WAIT_TIME seconds..."
				sleep $BANNED_WAIT_TIME
				# restart main
				logcat "restart..."
				main
			}
		fi

		[ ! $ISDAEMON ] && logcat "exit" && exit 0

	fi

	[ "$(echo "$DESKTOP_LOGIN_RTE_DATA" | grep 'token')" ] && {
		AUTH_TOKEN="$(str_str "$DESKTOP_LOGIN_RTE_DATA" 'token=' '&')"
		AUTH_INFO="$(str_str "$DESKTOP_LOGIN_RTE_DATA" 'info=' '"')"
	} || {
		AUTH_TOKEN=''
		AUTH_INFO=''
	}

}

mobile_get_token() {
	MOBILE_LOGIN_DATA="$(
		printf '{"data":"{\\"gwAddress\\":\\"%s\\",\\"service_type\\":\\"%s\\",\\"staticPassword\\":\\"%s\\",\\"im\\":\\"%s\\",\\"app_uuid\\":\\"%s\\",\\"phone\\":\\"%s\\",\\"ip\\":\\"%s\\",\\"staType\\":\\"%s\\",\\"installWX\\":\\"%s\\",\\"btype\\":\\"%s\\",\\"staModel\\":\\"%s\\",\\"apMac\\":\\"\\",\\"auth_mode\\":\\"%s\\",\\"imsi\\":\\"%s\\",\\"ssid\\":\\"%s\\",\\"filter_id\\":\\"%s\\"}","version":"%s","mac":"%s","gatewayId":"%s","token":"%s"}' \
			"$(get_encrypt "$GW_GTW")" \
			"$(get_encrypt "$SERVICE_TYPE")" \
			"$(get_encrypt "$GW_PWD")" \
			"$(get_encrypt "$MOBILE_IM")" \
			"$(get_encrypt "$MOBILE_UUID")" \
			"$(get_encrypt "$GW_USER")" \
			"$(get_encrypt "$CLIENT_IP")" \
			"$(get_encrypt "$MOBILE_STA_TYPE")" \
			"$(get_encrypt "$MOBILE_IS_INSTALL_WX")" \
			"$(get_encrypt "$MOBILE_BTYPE")" \
			"$(get_encrypt "$MOBILE_STA_MODEL")" \
			"$(get_encrypt "$MOBILE_AUTH_MODE")" \
			"$(get_encrypt "$MOBILE_IMSI")" \
			"$(get_encrypt "$GW_ID")" \
			"$(get_encrypt '')" \
			"$MOBILE_APP_VERSION" \
			"$(get_encrypt "$CLIENT_MAC")" \
			"$(get_encrypt "$GW_ID")" \
			"$(get_encrypt $ACCESS_TOKEN)"
	)"

	[ $ISLOG ] && echo "" &&
		echo "MOBILE_LOGIN_DATA:" &&
		echo "--> $MOBILE_LOGIN_DATA" &&
		echo ''

	if [ $ISBIND ]; then
		mobile_rebindmac
		logcat "exit"
		exit
	fi

	MOBILE_LOGIN_RTE="$(printf "$(printf "$(gw_mobile_relogin $MOBILE_LOGIN_DATA)")" | sed "s@\\\\@@g")"
	MOBILE_LOGIN_RTE_CODE="$(get_json_value "$MOBILE_LOGIN_RTE" 'resultCode')"
	MOBILE_LOGIN_RTE_MSG="$(get_json_value "$MOBILE_LOGIN_RTE" 'resultMsg')"

	[ $ISLOG ] && echo "" &&
		echo "MOBILE_LOGIN_RTE:" &&
		echo "--> $MOBILE_LOGIN_RTE" &&
		echo ''

	if [ $MOBILE_LOGIN_RTE_CODE ]; then
		logcat "$MOBILE_LOGIN_RTE_MSG" 'E'
		if [ "$MOBILE_LOGIN_RTE_CODE" = '43' ]; then
			printf '%s' 'Are you sure to rebind your device? [Y/n] '
			local input
			read -t 20 input
			case $input in
			[yY][eE][sS] | [yY])
				mobile_rebindmac
				logcat "exit"
				exit
				;;

			[nN][oO] | [nN])
				logcat "Ok, is ending..."
				;;

			*)
				logcat "Invalid input..."
				;;
			esac
		elif [ "$MOBILE_LOGIN_RTE_CODE" = '55' ]; then
			[ $ISDAEMON ] && {

				[ "$AUTH_TOKEN_LIST" ] && auth_token_magic

				logcat "The state of the user is being banned..."

				logcat "Will try again after $BANNED_WAIT_TIME seconds..."
				sleep $BANNED_WAIT_TIME
				# restart main
				logcat "restart..."
				main
			}
		fi
		[ ! $ISDAEMON ] && logcat "exit" && exit 0
	fi

	MOBILE_LOGIN_RTE="$(echo $MOBILE_LOGIN_RTE | grep 'Location')"

	[ "$(echo "$MOBILE_LOGIN_RTE" | grep 'token')" ] && {
		AUTH_TOKEN="$(str_str "$MOBILE_LOGIN_RTE" 'token=' '&')"
		AUTH_INFO="$(str_str "$MOBILE_LOGIN_RTE" 'info=' 'D')"
	} || {
		AUTH_TOKEN=''
		AUTH_INFO=''
	}

}

#############################################
## CLI Related
#############################################

init() {

	OS="$(get_os_type)"
	# check dep

	if [ $OS = 'android' ]; then

		[ -x "$(command -v curl)" ] || {
			logcat 'Error: curl is not installed.' 'E'
			exit 1
		}

		[ -x "$(command -v openssl)" ] || ISNOSSL=1

		[ -x "$(command -v gawk)" ] && AWK_TOOL='gawk'

	else

		hash curl 2>/dev/null || {
			logcat 'Error: curl is not installed.' 'E'
			exit 1
		}

		hash openssl 2>/dev/null || { ISNOSSL=1; }

		hash gawk 2>/dev/null && { AWK_TOOL='gawk'; }

	fi

}

detect_gateway() {

	if [ "$AUTH_IFACE" ]; then
		CURL_OPT="--interface $AUTH_IFACE"
		logcat "Will use the interface $AUTH_IFACE to auth..."
		if [ ! "$GW_GTW" ]; then
			logcat "Try to get the gateway from interface $AUTH_IFACE..."
			GW_GTW="$(get_nic_gateway "$AUTH_IFACE")"
		fi
	fi

	[ ! "$GW_GTW" ] && logcat "Try to get the gateway from redirect url..." && GW_GTW="$(gw_get_gateway)"

	[ "$GW_GTW" ] && logcat "Gateway detected as $GW_GTW"

}

ver() {

	echo "\
giwifi-gear.sh version $VERSION ($OS) \
"

}

usage() {
	echo "\
giwifi-gear.sh
  A cli tool for login giwifi by cloud auth mode (multi-platform, fast, small)
usage:
  giwifi-gear.sh [-h] [-g <GATEWAY>] [-u <USERNAME>] [-p <PASSWORD>] [-t <TYPE>] [-T <TOKEN>] [-i <IFACE>] [-e <EXTRA_IFACE>] [-q] [-b] [-d] [-l] [-v]
optional arguments:
  -h                    show this help message and exit
  -g <GATEWAY>          set the gateway
  -u <USERNAME>         set the username
  -p <PASSWORD>         set the password
  -i <IFACE>            set the interface by name or ip
  -e <EXTRA_IFACE>      set the extra interface (-e vwan1 -e vwan2)
  -t <TYPE>             auth type (pc/pad/staff for web auth, android/ios/windows/mac/apad/ipad for app auth, token for directly auth by token, and default value is pc)
  -T <TOKEN>            set the token (need to use -t token)
  -b                    bind or rebind your device
  -q                    sign out of account authentication
  -d                    running in the daemon mode (remove sharing restrictions)
  -l                    print the log info
  -v                    show the tool version and exit
(c) 2021 icepie.dev@gmail.com\
"
}

do_auth() {
	# login and get token...
	case "$AUTH_MODE" in
	'web')
		web_build_data
		web_get_token
		;;
	'desktop')
		desktop_build_data
		desktop_get_token
		;;
	'mobile')
		mobile_build_data
		mobile_get_token
		;;
	esac
}

main() {

	[ $ISLOG ] && echo '' &&
		echo "TOOL_PATH:" &&
		echo "--> $0" &&
		echo ''

	# check the conflicting parameters
	if ([ $ISBIND ] && [ $ISQUIT ]) || ([ $ISBIND ] && [ $ISDAEMON ]) || ([ $ISQUIT ] && [ $ISDAEMON ]); then
		logcat "Don't use bind, quit or daemon at same time!" 'E'
		exit 1
	fi

	if [ "$EXTRA_IFACE_LIST" ] && [ ! "$AUTH_IFACE" ]; then
		logcat "If you want to use the extra interfaces, plz set the auth interface!" 'E'
		exit 1
	fi

	# check the auth type
	[ ! "$AUTH_TYPE" ] && AUTH_TYPE="pc"

	case "$AUTH_TYPE" in
	'staff')
		AUTH_UA="$PC_UA"
		AUTH_MODE='web'
		;;
	'pc')
		AUTH_UA="$PC_UA"
		AUTH_MODE='web'
		;;
	'pad')
		AUTH_UA="$PAD_UA"
		AUTH_MODE='web'
		;;
	'windows')
		AUTH_UA="$WIN_UA"
		AUTH_MODE='desktop'
		DESKTOP_APP_VERSION="$WIN_APP_VERSION"
		DESKTOP_MODEL="$WIN_MODEL"
		DESKTOP_APP_UUID="$WIN_APP_UUID"
		;;
	'mac')
		AUTH_UA="$MAC_UA"
		AUTH_MODE='desktop'
		DESKTOP_APP_VERSION="$MAC_APP_VERSION"
		DESKTOP_MODEL="$MAC_MODEL"
		DESKTOP_APP_UUID="$MAC_APP_UUID"
		;;
	'android')
		AUTH_UA="$ANDROID_UA"
		AUTH_MODE='mobile'
		MOBILE_BTYPE="$PHONE_BTYPE"
		MOBILE_STA_TYPE="$PHONE_STA_TYPE"
		MOBILE_STA_MODEL="$ANDROID_STA_MODEL"
		;;
	'apad')
		AUTH_UA="$ANDROID_UA"
		AUTH_MODE='mobile'
		MOBILE_BTYPE="$PAD_BTYPE"
		MOBILE_STA_TYPE="$PAD_STA_TYPE"
		MOBILE_STA_MODEL="$ANDROID_STA_MODEL"
		;;
	'ios')
		AUTH_UA="$IOS_UA"
		AUTH_MODE='mobile'
		MOBILE_BTYPE="$PHONE_BTYPE"
		MOBILE_STA_TYPE="$PHONE_STA_TYPE"
		MOBILE_STA_MODEL="$IOS_STA_MODEL"
		;;
	'ipad')
		AUTH_UA="$IOS_UA"
		AUTH_MODE='mobile'
		MOBILE_BTYPE="$PAD_BTYPE"
		MOBILE_STA_TYPE="$PAD_STA_TYPE"
		MOBILE_STA_MODEL="$IOS_STA_MODEL"
		;;
	'token')
		AUTH_MODE="fxxk"
		[ ! "$AUTH_TOKEN" ] && { logcat "Plz use -T <TOKEN>" 'E' && exit 1; }
		;;
	*)
		echo "Error: Do not support the $AUTH_TYPE type!"
		exit 1
		;;
	esac


	[ $ISNOSSL ] && [ ! $AUTH_MODE = 'web' ] && {
		logcat 'openssl is not installed. you can only use the web auth type (staff/pc/pad)!' 'E'
		exit 1
	}

	[ $ISLOG ] &&
		echo "AUTH_UA:" &&
		echo "--> $AUTH_UA" &&
		echo ''

	logcat "You are running with $AUTH_TYPE $AUTH_MODE auth mode!"

	# get the gateway
	detect_gateway

	[ ! "$GW_GTW" ] && {
		printf '%s' "Plz enter gateway: "
		read GW_GTW
	}

	[ $ISLOG ] && echo '' &&
		echo "GW_HOTSPOT_GROUP:" &&
		echo "--> $(gw_get_hotspot_group)" &&
		echo ''

	# reacquire details
	while get_auth_state; do
		break
	done

	if [ "$AUTH_STATE" = '2' ]; then
		logcat "Good! You are already authed!"
		if [ $ISQUIT ]; then
			log_out
			exit 0
		fi

		[ ! $ISDAEMON ] && {
			logcat "exit"
			exit 0
		} || {
			logcat "Will be automatically logged out after $HEART_BEAT seconds!"
			sleep $HEART_BEAT
			log_out
			sleep $HEART_BEAT
		}

	fi

	[ $ISQUIT ] && logcat "You do not need to logout!" 'E' && exit 0

	if [ ! "$AUTH_TYPE" = 'token' ]; then
		[ ! "$GW_USER" ] && {
			printf '%s' "Plz enter username: "
			read GW_USER
		}

		[ ! "$GW_PWD" ] && {
			printf '%s' "Plz enter password: "
			read -s -t 20 GW_PWD
			echo ''
		}
	fi

	do_auth

	sleep $HEART_BEAT

	# reacquire details
	while get_auth_state; do
		break
	done

	[ "$AUTH_TOKEN" ] && {
		logcat "Successfully get the token! ($AUTH_TOKEN)"

		[ ! "$AUTH_STATE" = '2' ] && {
			AUTH_TOKEN_RTE="$(gw_auth_token "$AUTH_TOKEN" "$AUTH_INFO")"

			[ $ISLOG ] && echo "" &&
				echo "AUTH_TOKEN_RTE:" &&
				echo "--> $AUTH_TOKEN_RTE" &&
				echo ''

			[ "$AUTH_TOKEN_RTE" ] && logcat "OK!" || { logcat "Fail to auth by the token!" 'E' && [ ! $ISDAEMON ] && exit 1; }
		} || {
			logcat "Token (In one hand): $AUTH_TOKEN"

			[ "$AUTH_TOKEN_LIST" ] && AUTH_TOKEN_LIST="$AUTH_TOKEN ${AUTH_TOKEN_LIST}" || AUTH_TOKEN_LIST="$AUTH_TOKEN"

			[ "$AUTH_INFO" ] && {
				logcat "Info (In one hand): $AUTH_INFO"

				[ "$AUTH_INFO_LIST" ] && AUTH_INFO_LIST="$AUTH_INFO ${AUTH_INFO_LIST}" || AUTH_INFO_LIST="$AUTH_INFO"
			}

			TOKEN_IOTA=$((TOKEN_IOTA + 1))
		}

		# reacquire details
		while get_auth_state; do
			break
		done

		# clear screen
		[ ! $ISLOG ] && { clear || cls; }

		echo "\
--------------------------------------------
SSID:             $GW_ID
GateWay:          $GW_GTW
Interface:        $([ "$ACCESS_TYPE" = '1' ] && echo 'wireless' || echo 'ethernet')
IP:               $CLIENT_IP
MAC:              $CLIENT_MAC
Station SN:       $STATION_SN
Type:             $AUTH_MODE-$AUTH_TYPE $([ "$AUTH_STA_TYPE" = '2' ] && echo '(app)' || echo)
Token:            $AUTH_TOKEN
Info:             $([ "$AUTH_INFO" ] && echo "$AUTH_INFO" || echo 'none')
Logged:           $([ "$AUTH_STATE" = '2' ] && echo 'yes' || echo 'no')
--------------------------------------------\
"
	} ||
		{
			logcat "Fail to get the token!" 'E'
			[ ! $ISDAEMON ] && exit 1
		}

	if [ $ISDAEMON ]; then

		[ "$OS" = 'android' ] && {
			termux-wake-lock >/dev/null &
		}

		[ "$OS" = 'ish' ] && {
			cat /dev/location >/dev/null &
		}

		local iota=1
		local data_iota=0
		local fail_iota=0

		while true; do
			sleep $HEART_BEAT

			# Reacquire details
			while get_auth_state; do
				break
			done

			[ "$AUTH_STATE" = '2' ] && {
				logcat "Heartbeat: $iota" && iota=$((iota + 1))
				logcat "Online Time: $(displaytime "$ONLINE_TIME")"
				fail_iota=0
				# AUTH_TOKEN_RTE="$(gw_auth_token "$AUTH_TOKEN")"
			} || {
				logcat "Heartache: $fail_iota" 'E' && fail_iota=$((fail_iota + 1))
				auth_token_magic
			}

			[ $iota -le $((PRE_BUILD_TOKEN_NUM + 1)) ] && data_iota=$TOKEN_BUILD_SPEED || data_iota=$((data_iota + 1))

			[ $fail_iota -gt $HEART_BROKEN_TIME ] && {
				logcat "My heart is broken!" 'E'
				logcat "Will try again after $BANNED_WAIT_TIME seconds..."
				sleep $BANNED_WAIT_TIME
				logcat "restart..."
				main
			}

			[ $ISLOG ] && {
				echo "iota: $iota"
				echo "data_iota: $data_iota"
				echo "fail_iota: $fail_iota"
			}

			[ $ISLOG ] && {
				echo "TOKEN POOL: $AUTH_TOKEN_LIST"
				echo "INFO POOL: $AUTH_INFO_LIST"
				echo "POOL SIZE: $TOKEN_IOTA"
			}

			[ $IS_MAGIC_PRO -gt 1 ] && {
				[ $ONLINE_TIME -ge $MAGIC_PRO_TIME ] && {
					auth_token_magic
				}
			}

			[ $data_iota -ge $TOKEN_BUILD_SPEED ] && {
				do_auth

				[ "$AUTH_TOKEN" ] && {
					logcat "Token (In one hand): $AUTH_TOKEN"

					[ "$AUTH_TOKEN_LIST" ] && AUTH_TOKEN_LIST="$AUTH_TOKEN ${AUTH_TOKEN_LIST}" || AUTH_TOKEN_LIST="$AUTH_TOKEN"

					[ "$AUTH_INFO" ] && {
						logcat "Info (In one hand): $AUTH_INFO"

						[ "$AUTH_INFO_LIST" ] && AUTH_INFO_LIST="$AUTH_INFO ${AUTH_INFO_LIST}" || AUTH_INFO_LIST="$AUTH_INFO"
					}

					TOKEN_IOTA=$((TOKEN_IOTA + 1))
					data_iota=0
				}

				# max AUTH_TOKEN_LIST limit
				[ $TOKEN_IOTA -ge $((MAX_TOKEN_LIST_LEN + 1)) ] && {

					AUTH_TMP_TOKEN="$(echo $AUTH_TOKEN_LIST | ${AWK_TOOL} '{print $NF}')"
					AUTH_TOKEN_LIST=${AUTH_TOKEN_LIST%" $AUTH_TMP_TOKEN"}

					[ "$AUTH_INFO" ] && {
						AUTH_TMP_INFO="$(echo $AUTH_INFO_LIST | ${AWK_TOOL} '{print $NF}')"
						AUTH_INFO_LIST=${AUTH_INFO_LIST%" $AUTH_TMP_INFO"}
					}

					[ $ISLOG ] && {
						echo "DEL TOKEN: $AUTH_TMP_TOKEN"
						[ "$AUTH_INFO" ] && {
							echo "DEL INFO: $AUTH_TMP_INFO"
						}
					}

					TOKEN_IOTA=$MAX_TOKEN_LIST_LEN
				}
			}

		done
	fi
}

#start
(
	# init setting
	init

	# paser the opts
	while getopts "g:u:p:t:T:i:e:qbdlvh" option; do
		case "$option" in
		g)
			GW_GTW="$OPTARG"
			;;
		u)
			GW_USER="$OPTARG"
			;;
		p)
			GW_PWD="$OPTARG"
			;;
		t)
			AUTH_TYPE="$OPTARG"
			;;
		T)
			AUTH_TOKEN="$OPTARG"
			AUTH_TYPE='token'
			;;
		i)
			AUTH_IFACE="$OPTARG"
			;;
		e)
			[ "$EXTRA_IFACE_LIST" ] && EXTRA_IFACE_LIST="${EXTRA_IFACE_LIST} $OPTARG" || EXTRA_IFACE_LIST="$OPTARG"
			;;
		q)
			ISQUIT=1
			;;
		b)
			ISBIND=1
			;;
		d)
			ISDAEMON=1
			;;
		l)
			ISLOG=1
			;;
		v)
			ver
			exit 0
			;;
		h)
			usage
			exit 0
			;;
		*)
			echo "Error: plz use the right options!"
			usage
			exit 1
			;;
		esac
	done

	# main func
	main
)
