# AUR package regression tests for optional dependencies.
# Licensed under 0BSD; see LICENSE.

from io import BytesIO
from types import SimpleNamespace

from PIL import Image

from extract_msg.attachments.custom_att_handler.outlook_image_dib import OutlookImageDIB
from extract_msg.enums import InsecureFeatures
from extract_msg.utils import guessEncoding, tryGetMimetype


class EncodingMessage:
    def listDir(self, *_args):
        return [('__substg1.0_1000001E',)]

    def getStream(self, _name):
        return b'plain ascii text ' * 64


class MimeAttachment:
    data = b'%PDF-1.7\n%\xe2\xe3\xcf\xd3\n'
    dataType = bytes


def test_chardet():
    assert guessEncoding(EncodingMessage()) == 'ascii'


def test_python_magic():
    assert tryGetMimetype(MimeAttachment(), None) == 'application/pdf'


def test_pillow():
    image_data = BytesIO()
    Image.new('RGB', (2, 2), 'white').save(image_data, 'BMP')

    handler = OutlookImageDIB.__new__(OutlookImageDIB)
    handler._CustomAttachmentHandler__att = SimpleNamespace(
        msg=SimpleNamespace(insecureFeatures=InsecureFeatures.PIL_IMAGE_PARSING)
    )
    handler._OutlookImageDIB__data = image_data.getvalue()
    handler._OutlookImageDIB__xtwips = 10
    handler._OutlookImageDIB__ytwips = 10

    rtf = handler.generateRtf()
    assert b'\\pngblip ' in rtf
    assert b'89504e470d0a1a0a' in rtf


def main():
    test_chardet()
    test_python_magic()
    test_pillow()


if __name__ == '__main__':
    main()
