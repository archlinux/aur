#!/bin/bash

# Wazuh installer
# Copyright (C) 2015, Wazuh Inc.
#
# This program is a free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License (version 2) as published by the FSF - Free Software
# Foundation.
adminpem="/etc/wazuh-indexer/certs/admin.pem"
adminkey="/etc/wazuh-indexer/certs/admin-key.pem"
readonly base_path="$(dirname "$(readlink -f "$0")")"
readonly config_file="${base_path}/config.yml"
readonly logfile="${base_path}/wazuh-certificates-tool.log"
cert_tmp_path="/tmp/wazuh-certificates"
debug=">> ${logfile} 2>&1"
readonly cert_tool_script_name=".*certs.*\.sh"

# ------------ certVariables.sh ------------ 

# ------------ certFunctions.sh ------------ 
function cert_cleanFiles() {
    
    common_logger -d "Cleaning certificate files."
    eval "rm -f ${cert_tmp_path}/*.csr ${debug}"
    eval "rm -f ${cert_tmp_path}/*.srl ${debug}"
    eval "rm -f ${cert_tmp_path}/*.conf ${debug}"
    eval "rm -f ${cert_tmp_path}/admin-key-temp.pem ${debug}"

}
function cert_checkOpenSSL() {

    common_logger -d "Checking if OpenSSL is installed."

    if [ -z "$(command -v openssl)" ]; then
        common_logger -e "OpenSSL not installed."
        exit 1
    fi

}
function cert_checkRootCA() {

    common_logger -d "Checking if the root CA exists."

    if  [[ -n ${rootca} || -n ${rootcakey} ]]; then
        # Verify variables match keys
        if [[ ${rootca} == *".key" ]]; then
            ca_temp=${rootca}
            rootca=${rootcakey}
            rootcakey=${ca_temp}
        fi
        # Validate that files exist
        if [[ -e ${rootca} ]]; then
            eval "cp ${rootca} ${cert_tmp_path}/root-ca.pem ${debug}"
        else
            common_logger -e "The file ${rootca} does not exists"
            cert_cleanFiles
            exit 1
        fi
        if [[ -e ${rootcakey} ]]; then
            eval "cp ${rootcakey} ${cert_tmp_path}/root-ca.key ${debug}"
        else
            common_logger -e "The file ${rootcakey} does not exists"
            cert_cleanFiles
            exit 1
        fi
    else
        cert_generateRootCAcertificate
    fi

}
function cert_executeAndValidate() {

    command_output=$(eval "$@" 2>&1)
    e_code="${PIPESTATUS[0]}"

    if [ "${e_code}" -ne 0 ]; then
        common_logger -e "Error generating the certificates."
        common_logger -d "Error executing command: $@"
        common_logger -d "Error output: ${command_output}"
        cert_cleanFiles
        exit 1
    fi

}
function cert_generateAdmincertificate() {

    common_logger "Generating Admin certificates."
    common_logger -d "Generating Admin private key."
    cert_executeAndValidate "openssl genrsa -out ${cert_tmp_path}/admin-key-temp.pem 2048"
    common_logger -d "Converting Admin private key to PKCS8 format."
    cert_executeAndValidate "openssl pkcs8 -inform PEM -outform PEM -in ${cert_tmp_path}/admin-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out ${cert_tmp_path}/admin-key.pem"
    common_logger -d "Generating Admin CSR."
    cert_executeAndValidate "openssl req -new -key ${cert_tmp_path}/admin-key.pem -out ${cert_tmp_path}/admin.csr -batch -subj '/C=US/L=California/O=Wazuh/OU=Wazuh/CN=admin'"
    common_logger -d "Creating Admin certificate."
    cert_executeAndValidate "openssl x509 -days 3650 -req -in ${cert_tmp_path}/admin.csr -CA ${cert_tmp_path}/root-ca.pem -CAkey ${cert_tmp_path}/root-ca.key -CAcreateserial -sha256 -out ${cert_tmp_path}/admin.pem"

}
function cert_generateCertificateconfiguration() {

    common_logger -d "Generating certificate configuration."
    cat > "${cert_tmp_path}/${1}.conf" <<- EOF
        [ req ]
        prompt = no
        default_bits = 2048
        default_md = sha256
        distinguished_name = req_distinguished_name
        x509_extensions = v3_req

        [req_distinguished_name]
        C = US
        L = California
        O = Wazuh
        OU = Wazuh
        CN = cname

        [ v3_req ]
        authorityKeyIdentifier=keyid,issuer
        basicConstraints = CA:FALSE
        keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
        subjectAltName = @alt_names

        [alt_names]
        IP.1 = cip
	EOF


    conf="$(awk '{sub("CN = cname", "CN = '"${1}"'")}1' "${cert_tmp_path}/${1}.conf")"
    echo "${conf}" > "${cert_tmp_path}/${1}.conf"

    if [ "${#@}" -gt 1 ]; then
        sed -i '/IP.1/d' "${cert_tmp_path}/${1}.conf"
        for (( i=2; i<=${#@}; i++ )); do
            isIP=$(echo "${!i}" | grep -P "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$")
            isDNS=$(echo "${!i}" | grep -P "^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])\.([A-Za-z]{2,})$" )            j=$((i-1))
            if [ "${isIP}" ]; then
                printf '%s\n' "        IP.${j} = ${!i}" >> "${cert_tmp_path}/${1}.conf"
            elif [ "${isDNS}" ]; then
                printf '%s\n' "        DNS.${j} = ${!i}" >> "${cert_tmp_path}/${1}.conf"
            else
                common_logger -e "Invalid IP or DNS ${!i}"
                exit 1
            fi
        done
    else
        common_logger -e "No IP or DNS specified"
        exit 1
    fi

}
function cert_generateIndexercertificates() {

    if [ ${#indexer_node_names[@]} -gt 0 ]; then
        common_logger "Generating Wazuh indexer certificates."

        for i in "${!indexer_node_names[@]}"; do
            indexer_node_name=${indexer_node_names[$i]}
            common_logger -d "Creating the certificates for ${indexer_node_name} indexer node."
            cert_generateCertificateconfiguration "${indexer_node_name}" "${indexer_node_ips[i]}"
            common_logger -d "Creating the Wazuh indexer tmp key pair."
            cert_executeAndValidate "openssl req -new -nodes -newkey rsa:2048 -keyout ${cert_tmp_path}/${indexer_node_name}-key.pem -out ${cert_tmp_path}/${indexer_node_name}.csr -config ${cert_tmp_path}/${indexer_node_name}.conf"
            common_logger -d "Creating the Wazuh indexer certificates."
            cert_executeAndValidate "openssl x509 -req -in ${cert_tmp_path}/${indexer_node_name}.csr -CA ${cert_tmp_path}/root-ca.pem -CAkey ${cert_tmp_path}/root-ca.key -CAcreateserial -out ${cert_tmp_path}/${indexer_node_name}.pem -extfile ${cert_tmp_path}/${indexer_node_name}.conf -extensions v3_req -days 3650"
        done
    else
        return 1
    fi

}
function cert_generateFilebeatcertificates() {

    if [ ${#server_node_names[@]} -gt 0 ]; then
        common_logger "Generating Filebeat certificates."

        for i in "${!server_node_names[@]}"; do
            server_name="${server_node_names[i]}"
            common_logger -d "Generating the certificates for ${server_name} server node."
            j=$((i+1))
            declare -a server_ips=(server_node_ip_"$j"[@])
            cert_generateCertificateconfiguration "${server_name}" "${!server_ips}"
            common_logger -d "Creating the Wazuh server tmp key pair."
            cert_executeAndValidate "openssl req -new -nodes -newkey rsa:2048 -keyout ${cert_tmp_path}/${server_name}-key.pem -out ${cert_tmp_path}/${server_name}.csr  -config ${cert_tmp_path}/${server_name}.conf"
            common_logger -d "Creating the Wazuh server certificates."
            cert_executeAndValidate "openssl x509 -req -in ${cert_tmp_path}/${server_name}.csr -CA ${cert_tmp_path}/root-ca.pem -CAkey ${cert_tmp_path}/root-ca.key -CAcreateserial -out ${cert_tmp_path}/${server_name}.pem -extfile ${cert_tmp_path}/${server_name}.conf -extensions v3_req -days 3650"
        done
    else
        return 1
    fi

}
function cert_generateDashboardcertificates() {
    if [ ${#dashboard_node_names[@]} -gt 0 ]; then
        common_logger "Generating Wazuh dashboard certificates."

        for i in "${!dashboard_node_names[@]}"; do
            dashboard_node_name="${dashboard_node_names[i]}"
            cert_generateCertificateconfiguration "${dashboard_node_name}" "${dashboard_node_ips[i]}"
            common_logger -d "Creating the Wazuh dashboard tmp key pair."
            cert_executeAndValidate "openssl req -new -nodes -newkey rsa:2048 -keyout ${cert_tmp_path}/${dashboard_node_name}-key.pem -out ${cert_tmp_path}/${dashboard_node_name}.csr -config ${cert_tmp_path}/${dashboard_node_name}.conf"
            common_logger -d "Creating the Wazuh dashboard certificates."
            cert_executeAndValidate "openssl x509 -req -in ${cert_tmp_path}/${dashboard_node_name}.csr -CA ${cert_tmp_path}/root-ca.pem -CAkey ${cert_tmp_path}/root-ca.key -CAcreateserial -out ${cert_tmp_path}/${dashboard_node_name}.pem -extfile ${cert_tmp_path}/${dashboard_node_name}.conf -extensions v3_req -days 3650"
        done
    else
        return 1
    fi

}
function cert_generateRootCAcertificate() {

    common_logger "Generating the root certificate."
    cert_executeAndValidate "openssl req -x509 -new -nodes -newkey rsa:2048 -keyout ${cert_tmp_path}/root-ca.key -out ${cert_tmp_path}/root-ca.pem -batch -subj '/OU=Wazuh/O=Wazuh/L=California/' -days 3650"

}
function cert_parseYaml() {

    local prefix=$2
    local separator=${3:-_}
    local indexfix
    # Detect awk flavor
    if awk --version 2>&1 | grep -q "GNU Awk" ; then
    # GNU Awk detected
    indexfix=-1
    elif awk -Wv 2>&1 | grep -q "mawk" ; then
    # mawk detected
    indexfix=0
    fi

    local s='[[:space:]]*' sm='[ \t]*' w='[a-zA-Z0-9_]*' fs=${fs:-$(echo @|tr @ '\034')} i=${i:-  }
    cat $1 2>/dev/null | \
    awk -F$fs "{multi=0; 
        if(match(\$0,/$sm\|$sm$/)){multi=1; sub(/$sm\|$sm$/,\"\");}
        if(match(\$0,/$sm>$sm$/)){multi=2; sub(/$sm>$sm$/,\"\");}
        while(multi>0){
            str=\$0; gsub(/^$sm/,\"\", str);
            indent=index(\$0,str);
            indentstr=substr(\$0, 0, indent+$indexfix) \"$i\";
            obuf=\$0;
            getline;
            while(index(\$0,indentstr)){
                obuf=obuf substr(\$0, length(indentstr)+1);
                if (multi==1){obuf=obuf \"\\\\n\";}
                if (multi==2){
                    if(match(\$0,/^$sm$/))
                        obuf=obuf \"\\\\n\";
                        else obuf=obuf \" \";
                }
                getline;
            }
            sub(/$sm$/,\"\",obuf);
            print obuf;
            multi=0;
            if(match(\$0,/$sm\|$sm$/)){multi=1; sub(/$sm\|$sm$/,\"\");}
            if(match(\$0,/$sm>$sm$/)){multi=2; sub(/$sm>$sm$/,\"\");}
        }
    print}" | \
    sed  -e "s|^\($s\)?|\1-|" \
        -ne "s|^$s#.*||;s|$s#[^\"']*$||;s|^\([^\"'#]*\)#.*|\1|;t1;t;:1;s|^$s\$||;t2;p;:2;d" | \
    sed -ne "s|,$s\]$s\$|]|" \
        -e ":1;s|^\($s\)\($w\)$s:$s\(&$w\)\?$s\[$s\(.*\)$s,$s\(.*\)$s\]|\1\2: \3[\4]\n\1$i- \5|;t1" \
        -e "s|^\($s\)\($w\)$s:$s\(&$w\)\?$s\[$s\(.*\)$s\]|\1\2: \3\n\1$i- \4|;" \
        -e ":2;s|^\($s\)-$s\[$s\(.*\)$s,$s\(.*\)$s\]|\1- [\2]\n\1$i- \3|;t2" \
        -e "s|^\($s\)-$s\[$s\(.*\)$s\]|\1-\n\1$i- \2|;p" | \
    sed -ne "s|,$s}$s\$|}|" \
        -e ":1;s|^\($s\)-$s{$s\(.*\)$s,$s\($w\)$s:$s\(.*\)$s}|\1- {\2}\n\1$i\3: \4|;t1" \
        -e "s|^\($s\)-$s{$s\(.*\)$s}|\1-\n\1$i\2|;" \
        -e ":2;s|^\($s\)\($w\)$s:$s\(&$w\)\?$s{$s\(.*\)$s,$s\($w\)$s:$s\(.*\)$s}|\1\2: \3 {\4}\n\1$i\5: \6|;t2" \
        -e "s|^\($s\)\($w\)$s:$s\(&$w\)\?$s{$s\(.*\)$s}|\1\2: \3\n\1$i\4|;p" | \
    sed  -e "s|^\($s\)\($w\)$s:$s\(&$w\)\(.*\)|\1\2:\4\n\3|" \
        -e "s|^\($s\)-$s\(&$w\)\(.*\)|\1- \3\n\2|" | \
    sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\(---\)\($s\)||" \
        -e "s|^\($s\)\(\.\.\.\)\($s\)||" \
        -e "s|^\($s\)-$s[\"']\(.*\)[\"']$s\$|\1$fs$fs\2|p;t" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p;t" \
        -e "s|^\($s\)-$s\(.*\)$s\$|\1$fs$fs\2|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\?\(.*\)$s\$|\1$fs\2$fs\3|" \
        -e "s|^\($s\)[\"']\?\([^&][^$fs]\+\)[\"']$s\$|\1$fs$fs$fs\2|" \
        -e "s|^\($s\)[\"']\?\([^&][^$fs]\+\)$s\$|\1$fs$fs$fs\2|" \
        -e "s|$s\$||p" | \
    awk -F$fs "{
        gsub(/\t/,\"        \",\$1);
        gsub(\"name: \", \"\");
        if(NF>3){if(value!=\"\"){value = value \" \";}value = value  \$4;}
        else {
        if(match(\$1,/^&/)){anchor[substr(\$1,2)]=full_vn;getline};
        indent = length(\$1)/length(\"$i\");
        vname[indent] = \$2;
        value= \$3;
        for (i in vname) {if (i > indent) {delete vname[i]; idx[i]=0}}
        if(length(\$2)== 0){  vname[indent]= ++idx[indent] };
        vn=\"\"; for (i=0; i<indent; i++) { vn=(vn)(vname[i])(\"$separator\")}
        vn=\"$prefix\" vn;
        full_vn=vn vname[indent];
        if(vn==\"$prefix\")vn=\"$prefix$separator\";
        if(vn==\"_\")vn=\"__\";
        }
        assignment[full_vn]=value;
        if(!match(assignment[vn], full_vn))assignment[vn]=assignment[vn] \" \" full_vn;
        if(match(value,/^\*/)){
            ref=anchor[substr(value,2)];
            if(length(ref)==0){
            printf(\"%s=\\\"%s\\\"\n\", full_vn, value);
            } else {
            for(val in assignment){
                if((length(ref)>0)&&index(val, ref)==1){
                    tmpval=assignment[val];
                    sub(ref,full_vn,val);
                if(match(val,\"$separator\$\")){
                    gsub(ref,full_vn,tmpval);
                } else if (length(tmpval) > 0) {
                    printf(\"%s=\\\"%s\\\"\n\", val, tmpval);
                }
                assignment[val]=tmpval;
                }
            }
        }
    } else if (length(value) > 0) {
        printf(\"%s=\\\"%s\\\"\n\", full_vn, value);
    }
    }END{
        for(val in assignment){
            if(match(val,\"$separator\$\"))
                printf(\"%s=\\\"%s\\\"\n\", val, assignment[val]);
        }
    }"

}
function cert_checkPrivateIp() {
    
    local ip=$1
    common_logger -d "Checking if ${ip} is private."

    # Check private IPv4 ranges
    if [[ $ip =~ ^10\.|^192\.168\.|^172\.(1[6-9]|2[0-9]|3[0-1])\.|^(127\.) ]]; then
        return 0
    fi

    # Check private IPv6 ranges (fc00::/7 prefix)
    if [[ $ip =~ ^fc ]]; then
        return 0
    fi

    return 1

}
function cert_readConfig() {

    common_logger -d "Reading configuration file."

    if [ -f "${config_file}" ]; then
        if [ ! -s "${config_file}" ]; then
            common_logger -e "File ${config_file} is empty"
            exit 1
        fi
        eval "$(cert_convertCRLFtoLF "${config_file}")"

        eval "indexer_node_names=( $(cert_parseYaml "${config_file}" | grep -E "nodes[_]+indexer[_]+[0-9]+=" | cut -d = -f 2 ) )"
        eval "server_node_names=( $(cert_parseYaml "${config_file}"  | grep -E "nodes[_]+server[_]+[0-9]+=" | cut -d = -f 2 ) )"
        eval "dashboard_node_names=( $(cert_parseYaml "${config_file}" | grep -E "nodes[_]+dashboard[_]+[0-9]+=" | cut -d = -f 2) )"
        eval "indexer_node_ips=( $(cert_parseYaml "${config_file}" | grep -E "nodes[_]+indexer[_]+[0-9]+[_]+ip=" | cut -d = -f 2) )"
        eval "server_node_ips=( $(cert_parseYaml "${config_file}"  | grep -E "nodes[_]+server[_]+[0-9]+[_]+ip=" | cut -d = -f 2) )"
        eval "dashboard_node_ips=( $(cert_parseYaml "${config_file}"  | grep -E "nodes[_]+dashboard[_]+[0-9]+[_]+ip=" | cut -d = -f 2 ) )"
        eval "server_node_types=( $(cert_parseYaml "${config_file}"  | grep -E "nodes[_]+server[_]+[0-9]+[_]+node_type=" | cut -d = -f 2 ) )"
        eval "number_server_ips=( $(cert_parseYaml "${config_file}" | grep -o -E 'nodes[_]+server[_]+[0-9]+[_]+ip' | sort -u | wc -l) )"
        all_ips=("${indexer_node_ips[@]}" "${server_node_ips[@]}" "${dashboard_node_ips[@]}")

        for ip in "${all_ips[@]}"; do
            isIP=$(echo "${ip}" | grep -P "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$")
            if [[ -n "${isIP}" ]]; then
                if ! cert_checkPrivateIp "$ip"; then
                    common_logger -e "The IP ${ip} is public."
                    exit 1
                fi
            fi
        done

        for i in $(seq 1 "${number_server_ips}"); do
            nodes_server="nodes[_]+server[_]+${i}[_]+ip"
            eval "server_node_ip_$i=( $( cert_parseYaml "${config_file}" | grep -E "${nodes_server}" | sed '/\./!d' | cut -d = -f 2 | sed -r 's/\s+//g') )"
        done

        unique_names=($(echo "${indexer_node_names[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
        if [ "${#unique_names[@]}" -ne "${#indexer_node_names[@]}" ]; then 
            common_logger -e "Duplicated indexer node names."
            exit 1
        fi

        unique_ips=($(echo "${indexer_node_ips[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
        if [ "${#unique_ips[@]}" -ne "${#indexer_node_ips[@]}" ]; then 
            common_logger -e "Duplicated indexer node ips."
            exit 1
        fi

        unique_names=($(echo "${server_node_names[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
        if [ "${#unique_names[@]}" -ne "${#server_node_names[@]}" ]; then 
            common_logger -e "Duplicated Wazuh server node names."
            exit 1
        fi

        unique_ips=($(echo "${server_node_ips[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
        if [ "${#unique_ips[@]}" -ne "${#server_node_ips[@]}" ]; then 
            common_logger -e "Duplicated Wazuh server node ips."
            exit 1
        fi

        unique_names=($(echo "${dashboard_node_names[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
        if [ "${#unique_names[@]}" -ne "${#dashboard_node_names[@]}" ]; then
            common_logger -e "Duplicated dashboard node names."
            exit 1
        fi

        unique_ips=($(echo "${dashboard_node_ips[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
        if [ "${#unique_ips[@]}" -ne "${#dashboard_node_ips[@]}" ]; then
            common_logger -e "Duplicated dashboard node ips."
            exit 1
        fi

        for i in "${server_node_types[@]}"; do
            if ! echo "$i" | grep -ioq master && ! echo "$i" | grep -ioq worker; then
                common_logger -e "Incorrect node_type $i must be master or worker"
                exit 1
            fi
        done

        if [ "${#server_node_names[@]}" -le 1 ]; then
            if [ "${#server_node_types[@]}" -ne 0 ]; then
                common_logger -e "The tag node_type can only be used with more than one Wazuh server."
                exit 1
            fi
        elif [ "${#server_node_names[@]}" -gt "${#server_node_types[@]}" ]; then
            common_logger -e "The tag node_type needs to be specified for all Wazuh server nodes."
            exit 1
        elif [ "${#server_node_names[@]}" -lt "${#server_node_types[@]}" ]; then
            common_logger -e "Found extra node_type tags."
            exit 1
        elif [ "$(grep -io master <<< "${server_node_types[*]}" | wc -l)" -ne 1 ]; then
            common_logger -e "Wazuh cluster needs a single master node."
            exit 1
        elif [ "$(grep -io worker <<< "${server_node_types[*]}" | wc -l)" -ne $(( ${#server_node_types[@]} - 1 )) ]; then
            common_logger -e "Incorrect number of workers."
            exit 1
        fi

        if [ "${#dashboard_node_names[@]}" -ne "${#dashboard_node_ips[@]}" ]; then
            common_logger -e "Different number of dashboard node names and IPs."
            exit 1
        fi

    else
        common_logger -e "No configuration file found."
        exit 1
    fi

}
function cert_setpermisions() {
    eval "chmod -R 744 ${cert_tmp_path} ${debug}"
}
function cert_convertCRLFtoLF() {
    if [[ ! -d "/tmp/wazuh-install-files" ]]; then
        eval "mkdir /tmp/wazuh-install-files ${debug}"
    fi
    eval "chmod -R 755 /tmp/wazuh-install-files ${debug}"
    eval "tr -d '\015' < $1 > /tmp/wazuh-install-files/new_config.yml"
    eval "mv /tmp/wazuh-install-files/new_config.yml $1 ${debug}"
}

# ------------ certMain.sh ------------ 
function getHelp() {

    echo -e ""
    echo -e "NAME"
    echo -e "        wazuh-cert-tool.sh - Manages the creation of certificates of the Wazuh components."
    echo -e ""
    echo -e "SYNOPSIS"
    echo -e "        wazuh-cert-tool.sh [OPTIONS]"
    echo -e ""
    echo -e "DESCRIPTION"
    echo -e "        -a,  --admin-certificates </path/to/root-ca.pem> </path/to/root-ca.key>"
    echo -e "                Creates the admin certificates, add root-ca.pem and root-ca.key."
    echo -e ""
    echo -e "        -A, --all </path/to/root-ca.pem> </path/to/root-ca.key>"
    echo -e "                Creates certificates specified in config.yml and admin certificates. Add a root-ca.pem and root-ca.key or leave it empty so a new one will be created."
    echo -e ""
    echo -e "        -ca, --root-ca-certificates"
    echo -e "                Creates the root-ca certificates."
    echo -e ""
    echo -e "        -v,  --verbose"
    echo -e "                Enables verbose mode."
    echo -e ""
    echo -e "        -wd,  --wazuh-dashboard-certificates </path/to/root-ca.pem> </path/to/root-ca.key>"
    echo -e "                Creates the Wazuh dashboard certificates, add root-ca.pem and root-ca.key."
    echo -e ""
    echo -e "        -wi,  --wazuh-indexer-certificates </path/to/root-ca.pem> </path/to/root-ca.key>"
    echo -e "                Creates the Wazuh indexer certificates, add root-ca.pem and root-ca.key."
    echo -e ""
    echo -e "        -ws,  --wazuh-server-certificates </path/to/root-ca.pem> </path/to/root-ca.key>"
    echo -e "                Creates the Wazuh server certificates, add root-ca.pem and root-ca.key."
    echo -e ""
    echo -e "        -tmp,  --cert_tmp_path </path/to/tmp_dir>"
    echo -e "                Modifies the default tmp directory (/tmp/wazuh-ceritificates) to the specified one."
    echo -e "                Must be used along with one of these options: -a, -A, -ca, -wi, -wd, -ws"
    echo -e ""

    exit 1

}
function main() {

    umask 177

    cert_checkOpenSSL

    if [ -n "${1}" ]; then
        while [ -n "${1}" ]
        do
            case "${1}" in
            "-a"|"--admin-certificates")
                if [[ -z "${2}" || -z "${3}" ]]; then
                    common_logger -e "Error on arguments. Probably missing </path/to/root-ca.pem> </path/to/root-ca.key> after -a|--admin-certificates"
                    getHelp
                    exit 1
                else
                    cadmin=1
                    rootca="${2}"
                    rootcakey="${3}"
                    shift 3
                fi
                ;;
            "-A"|"--all")
                if  [[ -n "${2}" && "${2}" != "-v" && "${2}" != "-tmp" ]]; then
                    # Validate that the user has entered the 2 files
                    if [[ -z ${3} ]]; then
                        if [[ ${2} == *".key" ]]; then
                            common_logger -e "You have not entered a root-ca.pem"
                            exit 1
                        else
                            common_logger -e "You have not entered a root-ca.key" 
                            exit 1
                        fi
                    fi
                    all=1
                    rootca="${2}"
                    rootcakey="${3}"
                    shift 3
                else
                    all=1
                    shift 1
                fi
                ;;
            "-ca"|"--root-ca-certificate")
                ca=1
                shift 1
                ;;
            "-h"|"--help")
                getHelp
                ;;
            "-v"|"--verbose")
                debugEnabled=1
                shift 1
                ;;
            "-wd"|"--wazuh-dashboard-certificates")
                if [[ -z "${2}" || -z "${3}" ]]; then
                    common_logger -e "Error on arguments. Probably missing </path/to/root-ca.pem> </path/to/root-ca.key> after -wd|--wazuh-dashboard-certificates"
                    getHelp
                    exit 1
                else
                    cdashboard=1
                    rootca="${2}"
                    rootcakey="${3}"
                    shift 3
                fi
                ;;
            "-wi"|"--wazuh-indexer-certificates")
                if [[ -z "${2}" || -z "${3}" ]]; then
                    common_logger -e "Error on arguments. Probably missing </path/to/root-ca.pem> </path/to/root-ca.key> after -wi|--wazuh-indexer-certificates"
                    getHelp
                    exit 1
                else
                    cindexer=1
                    rootca="${2}"
                    rootcakey="${3}"
                    shift 3
                fi
                ;;
            "-ws"|"--wazuh-server-certificates")
                if [[ -z "${2}" || -z "${3}" ]]; then
                    common_logger -e "Error on arguments. Probably missing </path/to/root-ca.pem> </path/to/root-ca.key> after -ws|--wazuh-server-certificates"
                    getHelp
                    exit 1
                else
                    cserver=1
                    rootca="${2}"
                    rootcakey="${3}"
                    shift 3
                fi
                ;;
            "-tmp"|"--cert_tmp_path")
                if [[ -n "${3}" || ( "${cadmin}" == 1 || "${all}" == 1 || "${ca}" == 1 || "${cdashboard}" == 1 || "${cindexer}" == 1 || "${cserver}" == 1 ) ]]; then
                    if [[ -z "${2}" || ! "${2}" == /* ]]; then
                        common_logger -e "Error on arguments. Probably missing </path/to/tmp_dir> or path does not start with '/'."
                        getHelp
                        exit 1
                    else
                        cert_tmp_path="${2}"
                        shift 2
                    fi
                else
                    common_logger -e "Error: -tmp must be used along with one of these options: -a, -A, -ca, -wi, -wd, -ws"
                    getHelp
                    exit 1
                fi
                ;;
            *)
                echo "Unknow option: ${1}"
                getHelp
            esac
        done

        common_logger "Verbose logging redirected to ${logfile}"

        if [[ -d "${base_path}"/wazuh-certificates ]]; then
            if [ -n "$(ls -A "${base_path}"/wazuh-certificates)" ]; then
                common_logger -e "Directory wazuh-certificates already exists in the same path as the script. Please, remove the certs directory to create new certificates."
                exit 1
            fi
        fi
        
        if [[ ! -d "${cert_tmp_path}" ]]; then
            mkdir -p "${cert_tmp_path}"
            chmod 744 "${cert_tmp_path}"
        fi

        cert_readConfig

        if [ -n "${debugEnabled}" ]; then
            debug="2>&1 | tee -a ${logfile}"
        fi

        if [[ -n "${cadmin}" ]]; then
            cert_checkRootCA
            cert_generateAdmincertificate
            common_logger "Admin certificates created."
            cert_cleanFiles
            cert_setpermisions
            eval "mv ${cert_tmp_path} ${base_path}/wazuh-certificates ${debug}"
        fi

        if [[ -n "${all}" ]]; then
            cert_checkRootCA
            cert_generateAdmincertificate
            common_logger "Admin certificates created."
            if cert_generateIndexercertificates; then
                common_logger "Wazuh indexer certificates created."
            fi
            if cert_generateFilebeatcertificates; then
                common_logger "Wazuh Filebeat certificates created."
            fi
            if cert_generateDashboardcertificates; then
                common_logger "Wazuh dashboard certificates created."
            fi
            cert_cleanFiles
            cert_setpermisions
            eval "mv ${cert_tmp_path} ${base_path}/wazuh-certificates ${debug}"
        fi

        if [[ -n "${ca}" ]]; then
            cert_generateRootCAcertificate
            common_logger "Authority certificates created."
            cert_cleanFiles
            eval "mv ${cert_tmp_path} ${base_path}/wazuh-certificates ${debug}"
        fi

        if [[ -n "${cindexer}" ]]; then
            if [ ${#indexer_node_names[@]} -gt 0 ]; then
                cert_checkRootCA
                cert_generateIndexercertificates
                common_logger "Wazuh indexer certificates created."
                cert_cleanFiles
                cert_setpermisions
                eval "mv ${cert_tmp_path} ${base_path}/wazuh-certificates ${debug}"
            else
                common_logger -e "Indexer node not present in config.yml."
                exit 1
            fi
        fi

        if [[ -n "${cserver}" ]]; then
            if [ ${#server_node_names[@]} -gt 0 ]; then
                cert_checkRootCA
                cert_generateFilebeatcertificates
                common_logger "Wazuh Filebeat certificates created."
                cert_cleanFiles
                cert_setpermisions
                eval "mv ${cert_tmp_path} ${base_path}/wazuh-certificates ${debug}"
            else
                common_logger -e "Server node not present in config.yml."
                exit 1
            fi
        fi

        if [[ -n "${cdashboard}" ]]; then
            if [ ${#dashboard_node_names[@]} -gt 0 ]; then
                cert_checkRootCA
                cert_generateDashboardcertificates
                common_logger "Wazuh dashboard certificates created."
                cert_cleanFiles
                cert_setpermisions
                eval "mv ${cert_tmp_path} ${base_path}/wazuh-certificates ${debug}"
            else
                common_logger -e "Dashboard node not present in config.yml."
                exit 1
            fi
        fi

    else
        getHelp
    fi

}
function common_checkAptLock() {

    attempt=0
    seconds=30
    max_attempts=10

    while fuser "${apt_lockfile}" >/dev/null 2>&1 && [ "${attempt}" -lt "${max_attempts}" ]; do
        attempt=$((attempt+1))
        common_logger "Another process is using APT. Waiting for it to release the lock. Next retry in ${seconds} seconds (${attempt}/${max_attempts})"
        sleep "${seconds}"
    done

}
function common_logger() {

    now=$(date +'%d/%m/%Y %H:%M:%S')
    mtype="INFO:"
    debugLogger=
    nolog=
    if [ -n "${1}" ]; then
        while [ -n "${1}" ]; do
            case ${1} in
                "-e")
                    mtype="ERROR:"
                    shift 1
                    ;;
                "-w")
                    mtype="WARNING:"
                    shift 1
                    ;;
                "-d")
                    debugLogger=1
                    mtype="DEBUG:"
                    shift 1
                    ;;
                "-nl")
                    nolog=1
                    shift 1
                    ;;
                *)
                    message="${1}"
                    shift 1
                    ;;
            esac
        done
    fi

    if [ -z "${debugLogger}" ] || { [ -n "${debugLogger}" ] && [ -n "${debugEnabled}" ]; }; then
        if [ -z "${nolog}" ] && { [ "$EUID" -eq 0 ] || [[ "$(basename "$0")" =~ $cert_tool_script_name ]]; }; then
            printf "%s\n" "${now} ${mtype} ${message}" | tee -a ${logfile}
        else
            printf "%b\n" "${now} ${mtype} ${message}"
        fi
    fi

}
function common_checkRoot() {

    common_logger -d "Checking root permissions."
    if [ "$EUID" -ne 0 ]; then
        echo "This script must be run as root."
        exit 1;
    fi

    common_logger -d "Checking sudo package."
    if ! command -v sudo > /dev/null; then 
        common_logger -e "The sudo package is not installed and it is necessary for the installation."
        exit 1;
    fi
}
function common_checkInstalled() {

    common_logger -d "Checking Wazuh installation."
    wazuh_installed=""
    indexer_installed=""
    filebeat_installed=""
    dashboard_installed=""

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q wazuh-manager --quiet && wazuh_installed=1"
    elif [ "${sys_type}" == "apt-get" ]; then
        wazuh_installed=$(apt list --installed  2>/dev/null | grep wazuh-manager)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-manager)
    fi

    if [ -d "/var/ossec" ]; then
        common_logger -d "There are Wazuh remaining files."
        wazuh_remaining_files=1
    fi

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q wazuh-indexer --quiet && indexer_installed=1"

    elif [ "${sys_type}" == "apt-get" ]; then
        indexer_installed=$(apt list --installed 2>/dev/null | grep wazuh-indexer)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-indexer)
    fi

    if [ -d "/var/lib/wazuh-indexer/" ] || [ -d "/usr/share/wazuh-indexer" ] || [ -d "/etc/wazuh-indexer" ] || [ -f "${base_path}/search-guard-tlstool*" ]; then
        common_logger -d "There are Wazuh indexer remaining files."
        indexer_remaining_files=1
    fi

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q filebeat --quiet && filebeat_installed=1"
    elif [ "${sys_type}" == "apt-get" ]; then
        filebeat_installed=$(apt list --installed  2>/dev/null | grep filebeat)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-filebeat)
    fi

    if [ -d "/var/lib/filebeat/" ] || [ -d "/usr/share/filebeat" ] || [ -d "/etc/filebeat" ]; then
        common_logger -d "There are Filebeat remaining files."
        filebeat_remaining_files=1
    fi

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q wazuh-dashboard --quiet && dashboard_installed=1"
    elif [ "${sys_type}" == "apt-get" ]; then
        dashboard_installed=$(apt list --installed  2>/dev/null | grep wazuh-dashboard)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-dashboard)
    fi

    if [ -d "/var/lib/wazuh-dashboard/" ] || [ -d "/usr/share/wazuh-dashboard" ] || [ -d "/etc/wazuh-dashboard" ] || [ -d "/run/wazuh-dashboard/" ]; then
        common_logger -d "There are Wazuh dashboard remaining files."
        dashboard_remaining_files=1
    fi

}
function common_checkSystem() {

    if [ -n "$(command -v yum)" ]; then
        sys_type="yum"
        sep="-"
        common_logger -d "YUM package manager will be used."
    elif [ -n "$(command -v apt-get)" ]; then
        sys_type="apt-get"
        sep="="
        common_logger -d "APT package manager will be used."
    elif [ -n "$(command -v pacman)" ]; then
        sys_type="pacman"
        sep="="
        common_logger -d "Pacman package manager will be used."
    else
        common_logger -e "Couldn't find YUM, APT, or PACMAN package manager. Try installing the one corresponding to your operating system and then, launch the installation assistant again."
        exit 1
    fi

}
function common_checkWazuhConfigYaml() {

    common_logger -d "Checking Wazuh YAML configuration file."
    filecorrect=$(cert_parseYaml "${config_file}" | grep -Ev '^#|^\s*$' | grep -Pzc "\A(\s*(nodes_indexer__name|nodes_indexer__ip|nodes_server__name|nodes_server__ip|nodes_server__node_type|nodes_dashboard__name|nodes_dashboard__ip)=.*?)+\Z")
    if [[ "${filecorrect}" -ne 1 ]]; then
        common_logger -e "The configuration file ${config_file} does not have a correct format."
        exit 1
    fi

}
function common_curl() {

    if [ -n "${curl_has_connrefused}" ]; then
        eval "curl $@ --retry-connrefused"
        e_code="${PIPESTATUS[0]}"
    else
        retries=0
        eval "curl $@"
        e_code="${PIPESTATUS[0]}"
        while [ "${e_code}" -eq 7 ] && [ "${retries}" -ne 12 ]; do
            retries=$((retries+1))
            sleep 5
            eval "curl $@"
            e_code="${PIPESTATUS[0]}"
        done
    fi
    return "${e_code}"

}
function common_remove_gpg_key() {

    common_logger -d "Removing GPG key from system."
    if [ "${sys_type}" == "yum" ]; then
        if { rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n' | grep "Wazuh"; } >/dev/null ; then
            key=$(rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n' | grep "Wazuh Signing Key" | awk '{print $1}' )
            rpm -e "${key}"
        else
            common_logger "Wazuh GPG key not found in the system"
            return 1
        fi
    elif [ "${sys_type}" == "apt-get" ]; then
        if [ -f "/usr/share/keyrings/wazuh.gpg" ]; then
            rm -rf "/usr/share/keyrings/wazuh.gpg" "${debug}"
        else
            common_logger "Wazuh GPG key not found in the system"
            return 1
        fi
    fi

}
function common_checkYumLock() {

    attempt=0
    seconds=30
    max_attempts=10

    while [ -f "${yum_lockfile}" ] && [ "${attempt}" -lt "${max_attempts}" ]; do
        attempt=$((attempt+1))
        common_logger "Another process is using YUM. Waiting for it to release the lock. Next retry in ${seconds} seconds (${attempt}/${max_attempts})"
        sleep "${seconds}"
    done

}

main "$@"
