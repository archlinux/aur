#! /usr/bin/python
# nordquery - A tool to find the right NordVPN server, written in Python
# Copyright (C) 2022  Simon Williams

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import sys, os
from pathlib import Path
from urllib import request
import json
import argparse
import configparser
from pycountry import countries
import socket
from timeit import default_timer as timer

features_dict = {'any':'','sta':'Standard VPN servers', 'ded':'Dedicated IP','doub':'Double VPN','obf':'Obfuscated Servers','p2p':'P2P', 'tor':'Onion Over VPN'}

def list_protocols():
    print('ikev2\nopenvpn_udp\nopenvpn_tcp\nsocks\nproxy\npptp\nl2tp\nopenvpn_xor_udp\nopenvpn_xor_tcp\nproxy_cybersec\n'
        'proxy_ssl\nproxy_ssl_cybersec\nikev2_v6\nopen_udp_v6\nopen_tcp_v6\nwireguard_udp\nopenvpn_udp_tls_crypt\n'
        'openvpn_tcp_tls_crypt\nopenvpn_dedicated_udp\nopenvpn_dedicated_tcp\nskylark\nmesh_relay')
    return
                
def ping(ip,port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1)
    try:
        s_start = timer()
        s.connect((ip,port))
        s.shutdown(socket.SHUT_RD)
        s_stop = timer()
        return int((s_stop - s_start)*1000)
    except:
        return -1
    finally:
        s.close()

def main(argv):
    db_path = '.cache/nordquery'
    db_filename = 'servers.db'
    
    config_path = '.config/nordquery'
    config_filename = 'nordquery.conf'
    
    parser = argparse.ArgumentParser(description='A tool to find the right NordVPN server')
        #usage='%(prog)s [-c COUNTRY -f FEATURES -p PROTOCOL]',)
    
    parser.add_argument('-c', '--country', help='Filter by country (ISO3166 codes)', type=str, default='')
    parser.add_argument('-f', '--features', help='Filter by features (any, sta(ndard), doub(le), obf(uscated), p2p, tor', 
        type=str, default='', nargs='+', choices=['any', 'sta', 'ded', 'doub', 'obf', 'p2p', 'tor'], metavar='features')
    parser.add_argument('-p', '--protocol', help='Filter by supported protocol', type=str, default='', nargs='+',
        choices=['ikev2','openvpn_udp','openvpn_tcp','socks','proxy','pptp','l2tp','openvpn_xor_udp','openvpn_xor_tcp',
        'proxy_cybersec','proxy_ssl','proxy_ssl_cybersec','ikev2_v6','open_udp_v6','open_tcp_v6','wireguard_udp',
        'openvpn_udp_tls_crypt','openvpn_tcp_tls_crypt','openvpn_dedicated_udp','openvpn_dedicated_tcp','skylark','mesh_relay'],
        metavar='protocol')
    parser.add_argument('-e', '--exclude' , help='Exclude these servers from the selection', type=str, default='', nargs='+')
    parser.add_argument('--list-protocols', help='Show list of protocols', action='store_true')
    parser.add_argument('-u', '--update', help='Update the server database', action='store_true')
    parser.add_argument('--server-url', help='Override the default server info URL', type=str, default='https://nordvpn.com/api/server')
    parser.add_argument('--no-ping', help='Don\'t ping the server to check connectivity', action='store_true')
    parser.add_argument('-v', '--verbose', help='Be verbose', action='store_true')
    
    args = parser.parse_args()
    
    if(args.list_protocols):
        list_protocols()
        sys.exit()
        
    ## Parse config file
    config_fullpath = os.path.join(os.environ['HOME'], config_path)
    
    confparse = configparser.ConfigParser()
    if(os.path.exists(os.path.join(config_fullpath, config_filename))): #Check file exists
        if(args.verbose): print('Config found: ' + os.path.join(config_fullpath, config_filename))
        confparse.read(os.path.join(config_fullpath, config_filename))
        try:
            defaults = confparse['defaults']
            if(args.verbose):
                print('Always update:', confparse.get('defaults','always_update',fallback=''))
                print('Country:', confparse.get('defaults','country',fallback=''))
                print('Features:', confparse.get('defaults','features',fallback=''))
        except:
            print("Warning: Config file invalid")
    ####
    
    ## Get server database
    if(confparse.get('defaults','db_path',fallback='') != ''):
        db_fullpath = defaults['db_path']
    else:
        db_fullpath = os.path.join(os.environ['HOME'], db_path)
        if(os.path.exists(db_fullpath) == False):
            if(args.verbose): print('DB path does not exist, making folder ' + db_fullpath)
            os.mkdir(db_fullpath)
    
    if(confparse.get('defaults','db_filename',fallback='') != ''):
        db_filename = defaults['db_filename']
    
    # Download server file if requested by argument, config or if file doesn't exist    
    if(args.update or 
    (not os.path.exists(os.path.join(db_fullpath, db_filename))) or 
    confparse.get('defaults','always_update',fallback='no') == 'yes'):
        if(args.verbose): print('Downloading server information from ' + args.server_url)
        try:
            data = request.urlopen(args.server_url).read()  # Download the server file
            db = json.loads(data)   # Parse the JSON data
            with open(os.path.join(db_fullpath, db_filename), 'w') as outfile:
                if(args.verbose): print('Writing DB file to ' + os.path.join(db_fullpath, db_filename))
                json.dump(db, outfile)  # Write the db file to disk
        except request.URLError:
            print('Download from:', args.server_url, 'failed')
            sys.exit()
        except json.decoder.JSONDecodeError:
            print('JSON decoding error, download from', args.server_url, 'invalid')
            sys.exit()
        except PermissionError:
            print('You don\'t have permission to write to', str(db_fullpath))
            sys.exit()
    else:
        if(args.verbose): print('Reading server information from ' + os.path.join(db_fullpath, db_filename))
        try:
            with open(os.path.join(db_fullpath, db_filename), 'r') as infile:
                db = json.load(infile)  # Load the db file from disk
        except:
            print('Reading database file', os.path.join(db_fullpath, db_filename), 'failed')
            sys.exit()
            
    ##Build server dictionary
    if(args.verbose): print('Building server dictionary')
    db_dict = {}
    for server in db:
        db_dict[server.get('id')] = server  # Link the server info to ID
    
    if(args.verbose): print('Database contains ' + str(len(db_dict)) + ' servers')
    
    ##Parse country argument
    if(args.country.upper() == 'ANY'):
        country_code = ''   # Match any country
    elif(args.country != ''):
        if(args.country.upper() == 'UK'):   ##Cleanup UK special case
            args.country = 'GB'
        try:
            country_list = countries.search_fuzzy(args.country) # Attempt to find the country
        except LookupError:
            print('Error: country', args.country, 'not found')
            sys.exit()
        country_code = country_list[0].alpha_2  # Take the first country from the returned list
        if(args.verbose): print('Country: ' + country_list[0].name)
    elif(confparse.get('defaults','country',fallback='ANY').upper() != 'ANY'):
        country_code = defaults['country'].upper()  # The country in config file
    else:
        country_code = ''   # Match any country
    
    ##Parse features argument
    features_input = []
    if(args.features != ''):
        features_input = args.features
    elif(confparse.get('defaults','features',fallback='') != ''):
        for string in defaults['features'].split(' '):
            features_input.append(string)
    else:
        features_input = ''
    #print(features_input)
    
    parsed_features = []
    for f in features_input:
        parsed_features.append(features_dict[f])
        if(args.verbose): print('Features: ' + features_dict[f])
    #print(parsed_features)
    
    if(args.verbose and args.protocol != ''): print('Protocols:', args.protocol)
    
    ##Merge --exlude and blacklist lists
    exclude_list = []
    for e in args.exclude:
        exclude_list.append(e)
    
    for e in confparse.get('defaults','blacklist',fallback='').split(' '):
        if((e != '') and (e not in exclude_list)): exclude_list.append(e)
        
    if(args.verbose and exclude_list != ''): print("Exclude list:", exclude_list)

    list_servers = []

    ##Filter the server list
    for server in db_dict.items():
        features = []
        if(parsed_features != []):  # Parse the features list
            for feature in server[1]['categories']:
                features.append(feature['name'])

        protocols = []
        if(args.protocol != ''):    # Parse the protocol list
            for protocol in server[1]['features'].keys():
                if(server[1]['features'][protocol] == True):
                    protocols.append(protocol)

        if((server[1]['flag'] == country_code or country_code == '') and    # Match country code
            (set(parsed_features).issubset(set(features)) or parsed_features == ['']) and # Match features
            (set(args.protocol).issubset(set(protocols)) or args.protocol == '') and    # Match protocols
            (server[1]['domain'].split('.')[0] not in exclude_list)):  # Filter out exluded servers
            list_servers.append((server[1]['domain'],server[1]['load'],server[1]['ip_address']))    # Add matched server to list
    
    if(args.verbose): 
        print('Found ' + str(len(list_servers)) + ' servers') 
        for server in list_servers:
            print(server[0] + ' load: ' + str(server[1]))
    
    if(list_servers != []):        
        list_servers.sort(key=lambda y: y[1])   # Sort the list of matched servers
        for server in list_servers:             
            if('Obfuscated Servers' in parsed_features):
                port = 80   # Obfuscated servers don't open port 443
            else:
                port = 443
                
            if(not args.no_ping):
                pinged = ping(server[2],port)
            else:
                pinged = 1
                
            if(pinged != -1):
                if(args.verbose): print('Recommended server: ')
                print(server[0].split('.')[0])
                if(args.verbose and not args.no_ping): print('Ping:', pinged, 'ms')
                break
            elif(args.verbose):
                print(server[0], 'timed out')
    else:
        if(args.verbose): print('No matching server found')
        
    return
    
if __name__ == '__main__':
    main(sys.argv[1:])
