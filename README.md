# IP2Proxy Python Library

This library allows user to query an IP address if it was being used as open proxy, web proxy, VPN anonymizer and TOR exits. It lookup the proxy IP address from **IP2Proxy BIN Data** file. This data file can be downloaded at

* Free IP2Proxy BIN Data: https://lite.ip2location.com
* Commercial IP2Proxy BIN Data: https://www.ip2location.com/proxy-database

For more details, please visit:
[https://www.ip2location.com/ip2proxy/developers/python](https://www.ip2location.com/ip2proxy/developers/python)

## Methods

Below are the methods supported in this library.

|Method Name|Description|
|---|---|
|open|Open the IP2Proxy BIN data with **File I/O** mode for lookup.|
|close|Close and clean up the file pointer.|
|get_package_version|Get the package version (1 to 11 for PX1 to PX11 respectively).|
|get_module_version|Get the module version.|
|get_database_version|Get the database version.|
|is_proxy|Check whether if an IP address was a proxy. Returned value:<ul><li>-1 : errors</li><li>0 : not a proxy</li><li>1 : a proxy</li><li>2 : a data center IP address</li></ul>|
|get_all|Return the proxy information in array.|
|get_proxy_type|Return the proxy type. Please visit <a href="https://www.ip2location.com/database/px11-ip-proxytype-country-region-city-isp-domain-usagetype-asn-lastseen-threat-residential" target="_blank">IP2Location</a> for the list of proxy types supported|
|get_country_short|Return the ISO3166-1 country code (2-digits) of the proxy.|
|get_country_long|Return the ISO3166-1 country name of the proxy.|
|get_region|Return the ISO3166-2 region name of the proxy. Please visit <a href="https://www.ip2location.com/free/iso3166-2" target="_blank">ISO3166-2 Subdivision Code</a> for the information of ISO3166-2 supported|
|get_city|Return the city name of the proxy.|
|get_isp|Return the ISP name of the proxy.|
|get_domain|Return the domain name of proxy's IP address or domain name.|
|get_usage_type|Return the ISP's usage type of proxy's IP address or domain name. Please see [Usage Type](https://github.com/ip2location/ip2proxy-python#usage-type) for details.|
|get_asn|Return the autonomous system number (ASN) of proxy's IP address or domain name.|
|get_as_name|Return the autonomous system (AS) name of proxy's IP address or domain name.|
|get_last_seen|Return the last seen days ago value of proxy's IP address or domain name.|
|get_threat|Return the threat types reported to proxy's IP address or domain name.|
|get_provider|Returns the VPN service provider name if available.|

## Web Service

Below is the description of the functions available in the **Web Service** lookup.

| Method Name | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| Constructor | Expect 3 input parameters:<ul><li>IP2Proxy API Key.</li><li>Package (PX1 - PX11)</li><li>Use HTTPS or HTTP</li></ul> |
| lookup      | Return the proxy information in array.<ul><li>countryCode</li><li>countryName</li><li>regionName</li><li>cityName</li><li>isp</li><li>domain</li><li>usageType</li><li>asn</li><li>as</li><li>lastSeen</li><li>threat</li><li>proxyType</li><li>isProxy</li></ul> |
| getcredit   | Return remaining credit of the web service account.          |

## Requirements

1. Python 2.2 and above

## Installation
1. Unzip the package.
2. Execute python setup.py build
3. Execute python setup.py install

or

To install this module type the following (for PyPI):

	pip install IP2Proxy


## Usage
```python
import IP2Proxy

db = IP2Proxy.IP2Proxy()

# open IP2Proxy BIN database for proxy lookup
db.open("IP2PROXY-IP-PROXYTYPE-COUNTRY-REGION-CITY-ISP-DOMAIN-USAGETYPE-ASN-LASTSEEN-THREAT-RESIDENTIAL.BIN")

# get versioning information
print ('Module Version: ' + db.get_module_version())
print ('Package Version: ' + db.get_package_version())
print ('Database Version: ' + db.get_database_version())

# individual proxy data check
print ('Is Proxy: ' + str(db.is_proxy("4.0.0.47")))
print ('Proxy Type: ' + db.get_proxy_type("4.0.0.47"))
print ('Country Code: ' + db.get_country_short("4.0.0.47"))
print ('Country Name: ' + db.get_country_long("4.0.0.47"))
print ('Region Name: ' + db.get_region("4.0.0.47"))
print ('City Name: ' + db.get_city("4.0.0.47"))
print ('ISP: ' + db.get_isp("4.0.0.47"))
print ('Domain: ' + db.get_domain("4.0.0.47"))
print ('Usage Type: ' + db.get_usage_type("4.0.0.47"))
print ('ASN: ' + db.get_asn("4.0.0.47"))
print ('AS Name: ' + db.get_as_name("4.0.0.47"))
print ('Last Seen: ' + db.get_last_seen("4.0.0.47"))
print ('Threat: ' + db.get_threat("4.0.0.47"))
print ('Provider: ' + db.get_provider("4.0.0.47"))

# single function to get all proxy data returned in array
record = db.get_all("4.0.0.47")

print ('Is Proxy: ' + str(record['is_proxy']))
print ('Proxy Type: ' + record['proxy_type'])
print ('Country Code: ' + record['country_short'])
print ('Country Name: ' + record['country_long'])
print ('Region Name: ' + record['region'])
print ('City Name: ' + record['city'])
print ('ISP: ' + record['isp'])
print ('Domain: ' + record['domain'])
print ('Usage Type: ' + record['usage_type'])
print ('ASN: ' + record['asn'])
print ('AS Name: ' + record['as_name'])
print ('Last Seen: ' + record['last_seen'])
print ('Threat: ' + record['threat'])
print ('Provider: ' + record['provider'])

# close IP2Proxy BIN database
db.close()

# Web Service
ws = IP2Proxy.IP2ProxyWebService("demo","PX11",True)
rec = ws.lookup("8.8.8.8")
print (rec)
print ("\n")
print ("Credit Remaining: {}\n".format(ws.getcredit()))
```

## Proxy Type

| Proxy Type | Description                    |
| ---------- | ------------------------------ |
| VPN        | Anonymizing VPN services.      |
| TOR        | Tor Exit Nodes.                |
| PUB        | Public Proxies.                |
| WEB        | Web Proxies.                   |
| DCH        | Hosting Providers/Data Center. |
| SES        | Search Engine Robots.          |
| RES        | Residential Proxies [PX10+]    |

## Usage Type

| Usage Type | Description                     |
| ---------- | ------------------------------- |
| COM        | Commercial                      |
| ORG        | Organization                    |
| GOV        | Government                      |
| MIL        | Military                        |
| EDU        | University/College/School       |
| LIB        | Library                         |
| CDN        | Content Delivery Network        |
| ISP        | Fixed Line ISP                  |
| MOB        | Mobile ISP                      |
| DCH        | Data Center/Web Hosting/Transit |
| SES        | Search Engine Spider            |
| RSV        | Reserved                        |

## Threat Type

| Threat Type | Description                |
| ----------- | -------------------------- |
| SPAM        | Spammer                    |
| SCANNER     | Security Scanner or Attack |
| BOTNET      | Spyware or Malware         |



## Support

Email: support@ip2location.com.
URL: [https://www.ip2location.com](https://www.ip2location.com)
