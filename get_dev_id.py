from gmusicapi import Mobileclient

# Try to print out some valid device IDs.
if __name__ == '__main__':
    api = Mobileclient()
    email = input('Enter your email: ')
    password = input('Enter your password: ')

    if not api.login(email, password, Mobileclient.FROM_MAC_ADDRESS):
        print('Login failed, verify your email and password:'
              'enter any key to exit.')
        quit()

    devices = api.get_registered_devices()
    i = 1
    for device in devices:
        print('%d: %s' % (
            i, device['id'][2:] if device['id'].startswith('0x')
            else device['id']))
        i += 1
