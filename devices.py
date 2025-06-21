from textwrap import dedent


class ArctisDevice:
    name: str
    product_id: int

    def __init__(self, name: str, product_id: int):
        self.name = name
        self.product_id = product_id

    def gen_entry(self) -> str:
        pid = hex(self.product_id)[2:]
        pid = pid.zfill(4)
        lines = f'''
            # {self.name}
            SUBSYSTEMS=="usb", ATTRS{{idVendor}}=="1038", ATTRS{{idProduct}}=="{pid}", MODE="0660", TAG+="uaccess"
        '''  # noqa: E501

        return dedent(lines).strip()


devices = [
    ArctisDevice("Arctis Pro Wireless", 4752),
    ArctisDevice("Arctis 7 2017", 4704),
    ArctisDevice("Arctis 7 2019", 4781),
    ArctisDevice("Arctis Pro 2019", 4690),
    ArctisDevice("Arctis Pro GameDac", 4736),
    ArctisDevice("Arctis 9", 4802),
    ArctisDevice("Arctis 1 Wireless", 4787),
    ArctisDevice("Arctis 1 Xbox", 4790),
    ArctisDevice("Arctis 7X", 4823),
    ArctisDevice("Arctis 7 Plus", 8718),
    ArctisDevice("Arctis 7P Plus", 8722),
    ArctisDevice("Arctis 7X Plus", 8726),
    ArctisDevice("Arctis 7 Destiny Plus", 8758),
    ArctisDevice("Arctis Nova 7", 8706),
    ArctisDevice("Arctis Nova 7X", 8710),
    ArctisDevice("Arctis Nova 7X v2", 8792),
    ArctisDevice("Arctis Nova 7P", 8714),
    ArctisDevice("Arctis Nova 7 Diablo IV", 8762),
    ArctisDevice("Arctis Nova 5", 8754),
    ArctisDevice("Arctis Nova 5X", 8787),
]

OUTPUT_FILE = "71-steelseries-arctis.rules"

with open(OUTPUT_FILE, "w") as f:
    for device in devices:
        f.write(device.gen_entry() + "\n\n")
