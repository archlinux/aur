import magic

def what(_, img):
    mime = magic.Magic(mime=True)
    img_type = mime.from_buffer(img)
    if img_type.startswith("image/jpeg"):
        return 'jpeg'
    elif img_type.startswith("image/png"):
        return 'png'
    elif img_type.startswith("image/gif"):
        return 'gif'
    return None
