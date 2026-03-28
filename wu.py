from __future__ import annotations

import base64
import html
import os
import re
import ssl
import urllib.error
import urllib.request
import uuid
import xml.etree.ElementTree as ET
from datetime import datetime, timedelta, timezone
from typing import TYPE_CHECKING, Callable, Iterable

if TYPE_CHECKING:
    from fonts import CabEntry


MICROSOFT_UPDATE_CA_BUNDLE_PEM = """-----BEGIN CERTIFICATE-----
MIIHADCCBOigAwIBAgITMwAAAAq4kaLIClCl3wAAAAAACjANBgkqhkiG9w0BAQsF
ADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UE
AxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcN
MTIwNjIxMTczMzM1WhcNMjcwNjIxMTc0MzM1WjCBhDELMAkGA1UEBhMCVVMxEzAR
BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
Y3Jvc29mdCBDb3Jwb3JhdGlvbjEuMCwGA1UEAxMlTWljcm9zb2Z0IFVwZGF0ZSBT
ZWN1cmUgU2VydmVyIENBIDIuMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoC
ggIBAIsV6r17t2cxpIcOFIqSCXjB1Wi28ppZ4H/IGmdG3jGaAqrI50dJ6ak6h0yF
/jwuG0cERatWEbtguFI2idurX8gorvMbOaC/BqJk2azmI0PNaZWQ5a+Ib5jb+yLC
ByxI8UyFA1pqzUBh4SIaIuObKz3s44ubK8xVZYEUuszhiv7QvDonFzpHQfu4MPEE
MtHVOW56RssyKuFzdos1OhXYjpSCZni+kXwLowGugOMJhCxpK9mMJNTyPzUHd+Gf
41RDX+yK/SRYT6NUYNIAX3VEK9Lvf7s+tl77d/vhnmalQB8xPNDjMgS4p+ulEt9w
Gmrwo1IQuFjDiH2kszH5f2FTri3Mgjr2SotDZPLMk93g1RQuSAZmEED2I+efOVC4
dyESKUB7/Hf0MNNeujezZyA7ih3/mXg5ppuFz61acjBRKlmNKBc1MnqUHbBSBX9K
BuBNfeqW1SsMoy2JWrVcKqvEtqbTX2mfEEMA/aecmMO6S7vo2CM8c7OBFjY9sbxh
msAS3TC0kLffSK3YF2oDMqdgW57PGm14ZVSP01KO5W6E8sq43xkd2rT6KZ7IHqPW
18QwPsHbffy5eQbgumeadF3cryR7ElIt1VccANw9mqA+km1DWoL3tYb+nlS0MMKd
YNFPT903Vx0chN5ej9CQXHBu4zq3Rkmz7wF5YJVEO9gZ0CJlAgMBAAGjggFjMIIB
XzAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQU0vI9hHSGG1CFql3lpQea8EfT
LmkwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAUci06AjGQQ7kUBU7h6qfHMdEjiTQw
WgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9j
cmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0MjAxMV8yMDExXzAzXzIyLmNybDBeBggr
BgEFBQcBAQRSMFAwTgYIKwYBBQUHMAKGQmh0dHA6Ly93d3cubWljcm9zb2Z0LmNv
bS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0MjAxMV8yMDExXzAzXzIyLmNydDATBgNV
HSUEDDAKBggrBgEFBQcDATANBgkqhkiG9w0BAQsFAAOCAgEAopvuA2tH2+meSVsn
VatGbRha0QgVj4Saq5ZlNJW0Qpyf4pRyuZT+KLK2/Ia6ZzUugrtLAECro+hIEB5K
29S+pnY1nzSMn+lSZJwGWfRZTWn466g21wKFMInPpO3QB8yfzr2zwniissTh8Jkn
8Uejsz/EkGU520E3FCT26dlU1YtzHnrcZ7d8qp4tLFEVeSsrxkqpYJQxalJIZ3HH
uhOG3BQLmLtJDs822W1knAR6c+iYuLDbJ9o8TnOY9/lIWy8Vv2z3i+LEn27O7QSl
vTZHyCgFJMgjhELOSLliGhA3411RX8kyCE9AJ1OLufdcejOYwMG0POpmrj3s/Q5n
+Bfm5JQHaGGCUy7XfKMRbyYJejjcC1YtLS5HVxBf/Smh7nruCYIpDimr8AIgJCVz
ekbVxTHzuSYdXLZgnpUzu71MgFGSBh5DAHaErUmwwztK/TIyak9zwodWouV+2clp
HYgCWASmHOkRysH6T3n46pDmexplqG5dGM5QNrCjn5u1ptgVdDPR1LGHTT+KGT+F
45owrOFOwUOuz2H6RFUPgwPkCOYnK4bM17tdlaQ4DrtghSqL03ZaPFdASXHa+fZB
1ro0E6c8fv9vqaf7NvhIQE+BepDH87/f3gCGCzZ0pTNnbRH2k2VCc4CbaWZRKWg8
5c95ZPsdlHeynrIjVZ76ubrfiuM=
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIDIzCCAqigAwIBAgIQFJgmZtx8zY9AU2d7uZnshTAKBggqhkjOPQQDAzCBlDEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1TWlj
cm9zb2Z0IEVDQyBQcm9kdWN0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIw
MTgwHhcNMTgwMjI3MjA0MjA4WhcNNDMwMjI3MjA1MDQ2WjCBlDELMAkGA1UEBhMC
VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1TWljcm9zb2Z0IEVD
QyBQcm9kdWN0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTgwdjAQBgcq
hkjOPQIBBgUrgQQAIgNiAATHERYqdh1Wjr65YmXUw8608MMw7I9t1245vMhJq6u4
40N41YEGXe/HfZ/O1rOQdd4MsJDeI7rI0T5n4BmpG4YxHl80Le4X/RX7fieKMqHq
yY/JfhjLLzssSHp9pvQBB6yjgbwwgbkwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0OBBYEFEPvcIe4nb/siBncxsRrdQ11NDMIMBAGCSsGAQQB
gjcVAQQDAgEAMGUGA1UdIAReMFwwBgYEVR0gADBSBgwrBgEEAYI3TIN9AQEwQjBA
BggrBgEFBQcCARY0aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2Nz
L1JlcG9zaXRvcnkuaHRtADAKBggqhkjOPQQDAwNpADBmAjEAocBJRF0yVSfMPpBu
JSKdJFubUTXHkUlJKqP5b08czd2c4bVXyZ7CIkWbBhVwHEW/AjEAxdMo63LHPrCs
Jwl/Yj1geeWS8UUquaUC5GC7/nornGCntZkU8rC+8LsFllZWj8Fo
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIEYjCCA+igAwIBAgITMwAAAASh9bWIPT8AIgAAAAAABDAKBggqhkjOPQQDAzCB
lDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1
TWljcm9zb2Z0IEVDQyBQcm9kdWN0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
IDIwMTgwHhcNMTgwOTI4MjEzNDIwWhcNMzMwOTI4MjE0NDIwWjCBiDELMAkGA1UE
BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0
IEVDQyBVcGRhdGUgU2VjdXJlIFNlcnZlciBDQSAyLjEwdjAQBgcqhkjOPQIBBgUr
gQQAIgNiAAT9OT77VaoVe/kkF//JYg4ecyNmzNAYR+ra7lrEUnLImpL17URMD3ZI
SAWZJRmmCUamcVxfrXuRJXc2wYMnAmOQu4j7ze0C6AwotcsbKK7/B3NYhyv/Y9Ez
TmE37hV8JUCjggIEMIICADAOBgNVHQ8BAf8EBAMCAYYwEAYJKwYBBAGCNxUBBAMC
AQAwHQYDVR0OBBYEFBZBsQfHi/PSBhSQJgrbsSvARGLDMFUGA1UdIAROMEwwSgYE
VR0gADBCMEAGCCsGAQUFBwIBFjRodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtp
b3BzL0RvY3MvUmVwb3NpdG9yeS5odG0AMBMGA1UdJQQMMAoGCCsGAQUFBwMBMBkG
CSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0j
BBgwFoAUQ+9wh7idv+yIGdzGxGt1DXU0MwgwegYDVR0fBHMwcTBvoG2ga4ZpaHR0
cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwRUND
JTIwUHJvZHVjdCUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIw
MTguY3JsMIGHBggrBgEFBQcBAQR7MHkwdwYIKwYBBQUHMAKGa2h0dHA6Ly93d3cu
bWljcm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwRUNDJTIwUHJv
ZHVjdCUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIwMTguY3J0
MAoGCCqGSM49BAMDA2gAMGUCMD1rHjP2KzG2WB8lj37wdcOm2dPKNDy0YAQ4uSWb
o9RCHVzY6ISZMHau7HFsYRUkDQIxAJ1NrsRkVSJ0qr4y8wJ0QfY5LR4ibp/nX/nh
Rt0ZZxCmacm3e/Q/CP1zOzzbQWdQug==
-----END CERTIFICATE-----
"""

FE3_CLIENT_ENDPOINT = (
    "https://fe3.delivery.mp.microsoft.com/ClientWebService/client.asmx"
)
FE3_SECURED_ENDPOINT = (
    "https://fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx/secured"
)
FE3_SECURED_TO = (
    "https://fe3.delivery.mp.microsoft.com/ClientWebService/client.asmx/secured"
)
WINDOWS_UPDATE_USER_AGENT = "Windows-Update-Agent/10.0.10011.16384 Client-Protocol/2.50"

INSTALLED_NON_LEAF_UPDATE_IDS = (
    1,
    10,
    105939029,
    105995585,
    106017178,
    107825194,
    10809856,
    11,
    117765322,
    129905029,
    130040030,
    130040031,
    130040032,
    130040033,
    133399034,
    138372035,
    138372036,
    139536037,
    139536038,
    139536039,
    139536040,
    142045136,
    158941041,
    158941042,
    158941043,
    158941044,
    159776047,
    160733048,
    160733049,
    160733050,
    160733051,
    160733055,
    160733056,
    161870057,
    161870058,
    161870059,
    17,
    19,
    2,
    23110993,
    23110994,
    23110995,
    23110996,
    23110999,
    23111000,
    23111001,
    23111002,
    23111003,
    23111004,
    2359974,
    2359977,
    24513870,
    28880263,
    296374060,
    3,
    30077688,
    30486944,
    5143990,
    5169043,
    5169044,
    5169047,
    59830006,
    59830007,
    59830008,
    60484010,
    62450018,
    62450019,
    62450020,
    69801474,
    8788830,
    8806526,
    9125350,
    9154769,
    98959022,
    98959023,
    98959024,
    98959025,
    98959026,
)

WU_NS = {"w": "http://www.microsoft.com/SoftwareDistribution/Server/ClientWebService"}
BUILD_RE = re.compile(r"^\d+\.\d+\.\d+\.\d+$")
COOKIE_ERROR_RE = re.compile(
    r"<ErrorCode>(ConfigChanged|CookieExpired|InvalidCookie)</ErrorCode>"
)


class ResolverError(RuntimeError):
    pass


class CookieRefreshRequired(ResolverError):
    pass


def build_windows_update_ssl_context() -> ssl.SSLContext:
    context = ssl.create_default_context()
    context.load_verify_locations(cadata=MICROSOFT_UPDATE_CA_BUNDLE_PEM)
    return context


def local_name(tag: str) -> str:
    return tag.rsplit("}", 1)[-1]


def iter_elements(element: ET.Element, name: str) -> Iterable[ET.Element]:
    for item in element.iter():
        if local_name(item.tag) == name:
            yield item


def first_element(element: ET.Element, name: str) -> ET.Element | None:
    return next(iter_elements(element, name), None)


def child_text(element: ET.Element, name: str) -> str | None:
    for child in element:
        if local_name(child.tag) == name:
            return child.text
    return None


def parse_xml_document(xml_text: str, context: str) -> ET.Element:
    try:
        return ET.fromstring(xml_text)
    except ET.ParseError as exc:
        raise ResolverError(f"failed to parse {context} XML") from exc


def parse_xml_fragment(xml_text: str, context: str) -> ET.Element:
    fragment = re.sub(r"^\s*<\?xml[^>]*\?>", "", xml_text).strip()
    if not fragment:
        raise ResolverError(f"missing {context} XML fragment")
    try:
        return ET.fromstring(f"<root>{fragment}</root>")
    except ET.ParseError as exc:
        raise ResolverError(f"failed to parse {context} XML fragment") from exc


def parse_file_locations(response: str) -> dict[str, str]:
    root = parse_xml_document(response, "GetExtendedUpdateInfo2 response")
    locations: dict[str, str] = {}
    for location in iter_elements(root, "FileLocation"):
        digest = child_text(location, "FileDigest")
        url = child_text(location, "Url")
        if digest and url:
            locations[digest.strip()] = url.strip()
    return locations


def parse_cookie(response: str) -> tuple[str, str]:
    root = parse_xml_document(response, "GetCookie response")
    result = first_element(root, "GetCookieResult")
    if result is None:
        raise ResolverError("failed to parse GetCookie response")

    expiration = child_text(result, "Expiration")
    encrypted = child_text(result, "EncryptedData")
    if not expiration or not encrypted:
        raise ResolverError("GetCookie response is missing cookie fields")
    return expiration.strip(), encrypted.strip()


def now_utc() -> datetime:
    return datetime.now(timezone.utc)


def validate_build(build: str) -> str:
    if not BUILD_RE.fullmatch(build):
        raise ResolverError(
            f"invalid build {build!r}; expected major.minor.build.revision"
        )
    return build


def format_ts(value: datetime) -> str:
    return value.isoformat(timespec="seconds").replace("+00:00", "Z")


def xml_escape(value: str) -> str:
    return html.escape(value, quote=False)


def build_device_token() -> str:
    prefix = "13003002c377040014d5bcac7a66de0d50beddf9bba16c87edb9e019898000"
    suffix = "b401"
    random_hex = os.urandom(527).hex()
    inner = base64.b64encode(bytes.fromhex(prefix + random_hex + suffix)).decode()
    return base64.b64encode(f"t={inner}&p=".encode("utf-16le")).decode()


def branch_from_build(build: str) -> str:
    validate_build(build)
    build_number = int(build.split(".")[2])
    if build_number == 22000:
        return "co_release"
    if build_number in {22621, 22631, 22635}:
        return "ni_release"
    if build_number in {26100, 26120, 26200}:
        return "ge_release"
    raise ResolverError(f"unknown branch for build {build}; pass --branch to override")


def build_device_attributes(build: str, branch: str) -> str:
    now = int(now_utc().timestamp())
    data_exp = now + 82800
    recent = now - 3600
    fields = [
        "App=WU_OS",
        f"AppVer={build}",
        "AttrDataVer=281",
        "AllowInPlaceUpgrade=1",
        "AllowOptionalContent=1",
        "AllowUpgradesWithUnsupportedTPMOrCPU=1",
        "BlockFeatureUpdates=0",
        "BranchReadinessLevel=CB",
        "CIOptin=1",
        f"CurrentBranch={branch}",
        f"DataExpDateEpoch_GE24H2={data_exp}",
        f"DataExpDateEpoch_GE24H2Setup={data_exp}",
        f"DataExpDateEpoch_CU23H2={data_exp}",
        f"DataExpDateEpoch_CU23H2Setup={data_exp}",
        f"DataExpDateEpoch_NI22H2={data_exp}",
        f"DataExpDateEpoch_NI22H2Setup={data_exp}",
        f"DataExpDateEpoch_CO21H2={data_exp}",
        f"DataExpDateEpoch_CO21H2Setup={data_exp}",
        f"DataExpDateEpoch_23H2={data_exp}",
        f"DataExpDateEpoch_22H2={data_exp}",
        f"DataExpDateEpoch_21H2={data_exp}",
        f"DataExpDateEpoch_21H1={data_exp}",
        f"DataExpDateEpoch_20H1={data_exp}",
        f"DataExpDateEpoch_19H1={data_exp}",
        "DataVer_RS5=2000000000",
        "DefaultUserRegion=191",
        "DeviceFamily=Windows.Desktop",
        "DeviceInfoGatherSuccessful=1",
        "EKB19H2InstallCount=1",
        "EKB19H2InstallTimeEpoch=1255000000",
        "FlightingBranchName=",
        "FlightRing=Retail",
        "Free=gt64",
        "GStatus_GE24H2=2",
        "GStatus_GE24H2Setup=2",
        "GStatus_CU23H2=2",
        "GStatus_CU23H2Setup=2",
        "GStatus_NI23H2=2",
        "GStatus_NI22H2=2",
        "GStatus_NI22H2Setup=2",
        "GStatus_CO21H2=2",
        "GStatus_CO21H2Setup=2",
        "GStatus_22H2=2",
        "GStatus_21H2=2",
        "GStatus_21H1=2",
        "GStatus_20H1=2",
        "GStatus_20H1Setup=2",
        "GStatus_19H1=2",
        "GStatus_19H1Setup=2",
        "GStatus_RS5=2",
        f"GenTelRunTimestamp_19H1={recent}",
        "InstallDate=1438196400",
        "InstallLanguage=en-US",
        "InstallationType=Client",
        "IsDeviceRetailDemo=0",
        "IsFlightingEnabled=0",
        "IsRetailOS=1",
        "LCUVer=0.0.0.0",
        "MediaBranch=",
        f"MediaVersion={build}",
        "CloudPBR=1",
        "DUScan=1",
        "OEMModel=21F6CTO1WW",
        "OEMModelBaseBoard=21F6CTO1WW",
        "OEMName_Uncleaned=LENOVO",
        "OemPartnerRing=UPSFlighting",
        "OSArchitecture=amd64",
        "OSSkuId=48",
        "OSUILocale=en-US",
        f"OSVersion={build}",
        "ProcessorIdentifier=Intel64 Family 6 Model 186 Stepping 3",
        "ProcessorManufacturer=GenuineIntel",
        "ProcessorModel=13th Gen Intel(R) Core(TM) i7-1355U",
        "ProductType=WinNT",
        "ReleaseType=Production",
        "SdbVer_20H1=2000000000",
        "SdbVer_19H1=2000000000",
        "SecureBootCapable=1",
        "TelemetryLevel=3",
        f"TimestampEpochString_GE24H2={recent}",
        f"TimestampEpochString_GE24H2Setup={recent}",
        f"TimestampEpochString_CU23H2={recent}",
        f"TimestampEpochString_CU23H2Setup={recent}",
        f"TimestampEpochString_NI23H2={recent}",
        f"TimestampEpochString_NI22H2={recent}",
        f"TimestampEpochString_NI22H2Setup={recent}",
        f"TimestampEpochString_CO21H2={recent}",
        f"TimestampEpochString_CO21H2Setup={recent}",
        f"TimestampEpochString_22H2={recent}",
        f"TimestampEpochString_21H2={recent}",
        f"TimestampEpochString_21H1={recent}",
        f"TimestampEpochString_20H1={recent}",
        f"TimestampEpochString_19H1={recent}",
        "TPMVersion=2",
        "UpdateManagementGroup=2",
        "UpdateOfferedDays=0",
        "UpgEx_GE24H2Setup=Green",
        "UpgEx_GE24H2=Green",
        "UpgEx_CU23H2=Green",
        "UpgEx_NI23H2=Green",
        "UpgEx_NI22H2=Green",
        "UpgEx_CO21H2=Green",
        "UpgEx_23H2=Green",
        "UpgEx_22H2=Green",
        "UpgEx_21H2=Green",
        "UpgEx_21H1=Green",
        "UpgEx_20H1=Green",
        "UpgEx_19H1=Green",
        "UpgEx_RS5=Green",
        "UpgradeAccepted=1",
        "UpgradeEligible=1",
        "UserInPlaceUpgrade=1",
        "VBSState=2",
        "Version_RS5=2000000000",
        f"WuClientVer={build}",
    ]
    return "E:" + "&".join(fields)


def build_products(build: str, branch: str) -> str:
    products = [
        f"PN=Client.OS.rs2.amd64&Branch={branch}&PrimaryOSProduct=1&Repairable=1&V={build}&ReofferUpdate=1",
        "PN=Adobe.Flash.amd64&Repairable=1&V=0.0.0.0",
        "PN=Microsoft.Edge.Stable.amd64&Repairable=1&V=0.0.0.0",
        "PN=Microsoft.NETFX.amd64&V=0.0.0.0",
        "PN=Windows.Autopilot.amd64&Repairable=1&V=0.0.0.0",
        "PN=Windows.AutopilotOOBE.amd64&Repairable=1&V=0.0.0.0",
        f"PN=Windows.Appraiser.amd64&Repairable=1&V={build}",
        f"PN=Windows.AppraiserData.amd64&Repairable=1&V={build}",
        f"PN=Windows.EmergencyUpdate.amd64&V={build}",
        "PN=Windows.FeatureExperiencePack.amd64&Repairable=1&V=0.0.0.0",
        f"PN=Windows.ManagementOOBE.amd64&IsWindowsManagementOOBE=1&Repairable=1&V={build}",
        f"PN=Windows.OOBE.amd64&IsWindowsOOBE=1&Repairable=1&V={build}",
        f"PN=Windows.UpdateStackPackage.amd64&Name=Update Stack Package&Repairable=1&V={build}",
        "PN=Hammer.amd64&Source=UpdateOrchestrator&V=0.0.0.0",
        "PN=MSRT.amd64&Source=UpdateOrchestrator&V=0.0.0.0",
        "PN=SedimentPack.amd64&Source=UpdateOrchestrator&V=0.0.0.0",
        "PN=UUS.amd64&Source=UpdateOrchestrator&V=0.0.0.0",
    ]
    return ";".join(products)


def build_security_header(action: str, device: str, to_endpoint: str) -> str:
    created = now_utc()
    expires = created + timedelta(minutes=2)
    return (
        "<s:Header>"
        f'<a:Action s:mustUnderstand="1">{action}</a:Action>'
        f"<a:MessageID>urn:uuid:{uuid.uuid4()}</a:MessageID>"
        f'<a:To s:mustUnderstand="1">{to_endpoint}</a:To>'
        '<o:Security s:mustUnderstand="1" '
        'xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">'
        '<Timestamp xmlns="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">'
        f"<Created>{format_ts(created)}</Created>"
        f"<Expires>{format_ts(expires)}</Expires>"
        "</Timestamp>"
        '<wuws:WindowsUpdateTicketsToken wsu:id="ClientMSA" '
        'xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" '
        'xmlns:wuws="http://schemas.microsoft.com/msus/2014/10/WindowsUpdateAuthorization">'
        '<TicketType Name="MSA" Version="1.0" Policy="MBI_SSL">'
        f"<Device>{device}</Device>"
        "</TicketType>"
        "</wuws:WindowsUpdateTicketsToken>"
        "</o:Security>"
        "</s:Header>"
    )


class Fe3Client:
    def __init__(self, build: str, branch: str | None = None) -> None:
        self.build = validate_build(build)
        self.branch = branch or branch_from_build(build)
        self.device = build_device_token()
        self.cookie_expiration: str | None = None
        self.cookie_value: str | None = None
        self.ssl_context = build_windows_update_ssl_context()

    @staticmethod
    def _action_name(action: str) -> str:
        return action.rsplit("/", 1)[-1]

    def _invalidate_cookie(self) -> None:
        self.cookie_expiration = None
        self.cookie_value = None

    def _post(self, endpoint: str, action: str, body: str) -> str:
        request = urllib.request.Request(
            endpoint,
            data=body.encode(),
            headers={
                "User-Agent": WINDOWS_UPDATE_USER_AGENT,
                "Content-Type": "application/soap+xml; charset=utf-8",
                "SOAPAction": action,
            },
            method="POST",
        )
        try:
            with urllib.request.urlopen(
                request,
                context=self.ssl_context,
                timeout=180,
            ) as response:
                return response.read().decode()
        except urllib.error.HTTPError as exc:
            error_body = exc.read().decode(errors="replace")
            if exc.code == 500 and COOKIE_ERROR_RE.search(error_body):
                raise CookieRefreshRequired(
                    f"{self._action_name(action)} request requires a fresh cookie"
                ) from exc
            raise ResolverError(
                f"{self._action_name(action)} request failed with HTTP {exc.code}"
            ) from exc
        except (urllib.error.URLError, ssl.SSLError, OSError) as exc:
            raise ResolverError(
                f"{self._action_name(action)} request failed: {exc}"
            ) from exc

    def _post_with_cookie_retry(
        self,
        endpoint: str,
        action: str,
        body_factory: Callable[[], str],
    ) -> str:
        self.ensure_cookie()
        try:
            return self._post(endpoint, action, body_factory())
        except CookieRefreshRequired:
            self._invalidate_cookie()
            self.ensure_cookie()
            return self._post(endpoint, action, body_factory())

    def ensure_cookie(self) -> None:
        if self.cookie_value is not None and self.cookie_expiration is not None:
            return

        action = (
            "http://www.microsoft.com/SoftwareDistribution/Server/ClientWebService/"
            "GetCookie"
        )
        created = format_ts(now_utc())
        body = (
            '<s:Envelope xmlns:a="http://www.w3.org/2005/08/addressing" '
            'xmlns:s="http://www.w3.org/2003/05/soap-envelope">'
            f"{build_security_header(action, self.device, FE3_CLIENT_ENDPOINT)}"
            "<s:Body>"
            '<GetCookie xmlns="http://www.microsoft.com/SoftwareDistribution/Server/ClientWebService">'
            "<oldCookie>"
            f"<Expiration>{created}</Expiration>"
            "</oldCookie>"
            f"<lastChange>{created}</lastChange>"
            f"<currentTime>{created}</currentTime>"
            "<protocolVersion>2.0</protocolVersion>"
            "</GetCookie>"
            "</s:Body>"
            "</s:Envelope>"
        )
        response = self._post(FE3_CLIENT_ENDPOINT, action, body)
        self.cookie_expiration, self.cookie_value = parse_cookie(response)

    def sync_updates(self) -> str:
        action = (
            "http://www.microsoft.com/SoftwareDistribution/Server/ClientWebService/"
            "SyncUpdates"
        )
        installed = "".join(
            f"<int>{value}</int>" for value in INSTALLED_NON_LEAF_UPDATE_IDS
        )

        def build_body() -> str:
            assert self.cookie_value is not None
            return (
                '<s:Envelope xmlns:a="http://www.w3.org/2005/08/addressing" '
                'xmlns:s="http://www.w3.org/2003/05/soap-envelope">'
                f"{build_security_header(action, self.device, FE3_CLIENT_ENDPOINT)}"
                "<s:Body>"
                '<SyncUpdates xmlns="http://www.microsoft.com/SoftwareDistribution/Server/ClientWebService">'
                "<cookie>"
                f"<Expiration>{format_ts(now_utc() + timedelta(days=7))}</Expiration>"
                f"<EncryptedData>{self.cookie_value}</EncryptedData>"
                "</cookie>"
                "<parameters>"
                "<ExpressQuery>false</ExpressQuery>"
                f"<InstalledNonLeafUpdateIDs>{installed}</InstalledNonLeafUpdateIDs>"
                "<OtherCachedUpdateIDs/>"
                "<SkipSoftwareSync>false</SkipSoftwareSync>"
                "<NeedTwoGroupOutOfScopeUpdates>true</NeedTwoGroupOutOfScopeUpdates>"
                "<AlsoPerformRegularSync>true</AlsoPerformRegularSync>"
                "<ComputerSpec/>"
                "<ExtendedUpdateInfoParameters>"
                "<XmlUpdateFragmentTypes>"
                "<XmlUpdateFragmentType>Extended</XmlUpdateFragmentType>"
                "<XmlUpdateFragmentType>LocalizedProperties</XmlUpdateFragmentType>"
                "</XmlUpdateFragmentTypes>"
                "<Locales><string>en-US</string></Locales>"
                "</ExtendedUpdateInfoParameters>"
                "<ClientPreferredLanguages/>"
                "<ProductsParameters>"
                "<SyncCurrentVersionOnly>false</SyncCurrentVersionOnly>"
                f"<DeviceAttributes>{xml_escape(build_device_attributes(self.build, self.branch))}</DeviceAttributes>"
                "<CallerAttributes>E:Profile=AUv2&amp;Acquisition=1&amp;Interactive=1&amp;IsSeeker=1&amp;SheddingAware=1&amp;Id=MoUpdateOrchestrator</CallerAttributes>"
                f"<Products>{xml_escape(build_products(self.build, self.branch))}</Products>"
                "</ProductsParameters>"
                "</parameters>"
                "</SyncUpdates>"
                "</s:Body>"
                "</s:Envelope>"
            )

        response = self._post_with_cookie_retry(
            FE3_CLIENT_ENDPOINT,
            action,
            build_body,
        )
        if "<Truncated>true</Truncated>" in response:
            raise ResolverError("SyncUpdates response is truncated")
        return response

    def get_file_urls(self, entries: Iterable[CabEntry]) -> dict[str, str]:
        action = (
            "http://www.microsoft.com/SoftwareDistribution/Server/ClientWebService/"
            "GetExtendedUpdateInfo2"
        )
        update_ids = "".join(
            (
                "<UpdateIdentity>"
                f"<UpdateID>{entry.update_id}</UpdateID>"
                f"<RevisionNumber>{entry.revision}</RevisionNumber>"
                "</UpdateIdentity>"
            )
            for entry in entries
        )

        def build_body() -> str:
            return (
                '<s:Envelope xmlns:a="http://www.w3.org/2005/08/addressing" '
                'xmlns:s="http://www.w3.org/2003/05/soap-envelope">'
                f"{build_security_header(action, self.device, FE3_SECURED_TO)}"
                "<s:Body>"
                '<GetExtendedUpdateInfo2 xmlns="http://www.microsoft.com/SoftwareDistribution/Server/ClientWebService">'
                f"<updateIDs>{update_ids}</updateIDs>"
                "<infoTypes>"
                "<XmlUpdateFragmentType>FileUrl</XmlUpdateFragmentType>"
                "<XmlUpdateFragmentType>FileDecryption</XmlUpdateFragmentType>"
                "<XmlUpdateFragmentType>EsrpDecryptionInformation</XmlUpdateFragmentType>"
                "<XmlUpdateFragmentType>PiecesHashUrl</XmlUpdateFragmentType>"
                "<XmlUpdateFragmentType>BlockMapUrl</XmlUpdateFragmentType>"
                "</infoTypes>"
                f"<deviceAttributes>{xml_escape(build_device_attributes(self.build, self.branch))}</deviceAttributes>"
                "</GetExtendedUpdateInfo2>"
                "</s:Body>"
                "</s:Envelope>"
            )

        response = self._post_with_cookie_retry(
            FE3_SECURED_ENDPOINT,
            action,
            build_body,
        )
        return parse_file_locations(response)
