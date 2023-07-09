#!/bin/python3

# If you're really having trouble, turn on set_log_device_placement.
# This will print a bunch of gobbledegook,
#  but at the end of every line, it will say what device something is located on.
#tf.debugging.set_log_device_placement(True)
# These lines enable VERY verbose logs
# os.environ['AMD_LOG_LEVEL'] = '4'
# os.environ['TF_CPP_MAX_VLOG_LEVEL'] = '99'
# os.environ['TF_CPP_MIN_VLOG_LEVEL'] = '0'
# os.environ['HIPCC_VERBOSE'] = '99'

# Note: tf.device('/GPU:0') fails silently if the device does not exist,
#  and otherwise does not appear to honor requests e.g. to use CPU instead of GPU.
# Doesn't anyone notice this? I feel like I'm taking crazy pills.
# That said, you can use `os.environ['HSA_OVERRIDE_GFX_VERSION'] = 'dummy'` to force CPU usage for comparison.

import sys, os, subprocess
from pathlib import Path
script_dir = Path(__file__).resolve().parent

# This line suppresses most warnings.
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '1'

def is_gfx1031():
    if not Path('/opt/rocm/bin/rocminfo').exists():
        return False
    rocminfo = subprocess.check_output(['/opt/rocm/bin/rocminfo']).decode('utf-8')
    import re
    expression = re.compile(r'(gfx\d+)')
    matches = (expression.search(line) for line in rocminfo.splitlines())
    architectures = {match.groups()[0] for match in matches if not match is None}
    # if len(architectures) != 1, we ignore it since idk what to do then.
    return {'gfx1031'} == architectures

def set_gfx_override():
    # You can use environment variables if your GPU works but is not officially supported.
    # For example, I have a Radeon RX 6750 XT, which is detected as the unsupported gfx1031 arch,
    #  but the supported gfx1030 architecture works just dandy.
    # This test, when run on such a machine, will override the architecture.
    if is_gfx1031():
        os.environ['HSA_OVERRIDE_GFX_VERSION'] = '10.3.0'

def uninstall(package_name):
    subprocess.run(['sudo', 'pacman', '-Rdd', package_name])

def uninstall_all():
    print('Cleaning old install and installing tensorflow c libraries...')
    for t in ['python-keras', 'python-tensorflow-opt-amd-git', 'python-tensorflow-amd-git', 'tensorflow-opt-amd-git', 'tensorflow-amd-git']:
        uninstall(t)

def install(path):
    subprocess.run(['sudo', 'pacman', '-U', path])

def exception_on_error_code(cmd, message):
    process = subprocess.Popen(cmd)
    process.communicate()
    if process.returncode != 0:
        raise Exception(message)

def test_compile():
    print('Compiling against tensorflow c libraries...')
    if not script_dir.joinpath('c_model').exists():
        subprocess.run(['tar', '-xzf', './c_model.tar.gz'])
    subprocess.run(['rm', './a.out'], stderr=subprocess.DEVNULL)
    subprocess.run(['gcc', '-I/usr/include/tensorflow', 'load_c_model.c', '-ltensorflow', '-ltensorflow_framework'])
    exception_on_error_code(
        ['./a.out'],
        'Testing the c library to load a saved model failed somehow.'
    )
    print('tensorflow c library compiles ok.')

def test_save():
    print('Checking if we can save a model...')

    import numpy as np
    import tensorflow as tf

    tf.keras.utils.set_random_seed(531)
    expected_model = tf.keras.Sequential([
        tf.keras.layers.Dense(4, activation='relu'),
        tf.keras.layers.Dense(4, activation='sigmoid'),
        tf.keras.layers.Dense(4, activation='tanh'),
        tf.keras.layers.Dense(4, activation='linear'),
    ])

    i = tf.constant([[10, 20, 99, 10000], [0.1, -12, -0.4, 0]])
    expected_model(i)
    expected_model.save('c_model_test')
    observed_model = tf.keras.models.load_model('c_model_test')
    if np.any((expected_model(i) != observed_model(i))):
        print('Expected:', expected_model(i))
        print('Observed:', observed_model(i))
        raise Exception('Saving python model fails somehow')
    print('Model saves ok.')

def test_libiomp5_so():
    print('Testing if https://bugs.archlinux.org/task/75571 is resoloved...')
    # Confirm if https://bugs.archlinux.org/task/75571 has been resolved.
    subprocess.run(['python', '-c', 'import ctypes; ctypes.CDLL("/usr/lib/libtensorflow.so")'])
    # Note: you MUST run this test in a separate process,
    #  or else protobuf will error for loading tensorflow twice when we import tensorflow.
    print('It\'s probably ok.')

def test_tf_sees_gpu():
    import tensorflow as tf
    if not len(tf.config.list_physical_devices('GPU')) > 0:
        raise Exception('tf.config.list_physical_devices(\'GPU\') returns empty list; no GPUs found')
    print(tf.config.list_physical_devices())

def test_tf_short():
    import tensorflow as tf
    tf.random.uniform((1,))
    model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
    model.build(input_shape=(1,1))

    with tf.device("/GPU:0"):
        a = tf.random.normal([1, 2])

    def temp(x):
        return tf.shape(x)[0]

    tf.autograph.to_graph(temp)

def test_tf_mnist():
    seed = 531
    import tensorflow as tf
    tf.random.set_seed(seed)
    tf.keras.utils.set_random_seed(531)
    
    # Taken from tensorflow.org/tutorials/quickstart/beginner.
    mnist = tf.keras.datasets.mnist
    (x_train, y_train), (x_test, y_test) = mnist.load_data()
    x_train, x_test = x_train / 255., x_test / 255.
    
    import time
    start = time.time()

    model = tf.keras.Sequential([
        tf.keras.layers.Flatten(input_shape=(28, 28)),
        # This should run pretty slow on CPU, but fast enough on GPU.
        tf.keras.layers.Dense(1280, activation='relu'),
        tf.keras.layers.Dropout(0.2),
        tf.keras.layers.Dense(10),
    ])

    loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
    prediction = model(x_train[:1])
    print('Expected loss: 2.3. Actual: ', loss_fn(y_train[:1], prediction))
    print('Probabilities: ', tf.nn.softmax(prediction))

    model.compile(loss=loss_fn, optimizer='adam', metrics=['accuracy'])
    model.fit(x_train, y_train, epochs=5)
    model.evaluate(x_test, y_test, verbose=2)

    end = time.time()
    print('Your run took %f seconds. ' % (end - start))
    print('My GPU takes 17 seconds.')
    print('My CPU takes 74 seconds.')
    print('Your mileage may vary.')

def check_packages(tensorflow_path, python_tensorflow_path):
    set_gfx_override()
    uninstall_all()
    install(tensorflow_path)

    test_compile()
    install(python_tensorflow_path)

    test_save()
    test_libiomp5_so()

    test_tf_sees_gpu()
    test_tf_short()
    test_tf_mnist()

def main():
    patterns = [
        ('tensorflow-amd-git-*.pkg.tar.zst', 'python-tensorflow-amd-git-*.pkg.tar.zst'),
        # ('tensorflow-opt-amd-git-*.pkg.tar.zst', 'python-tensorflow-opt-amd-git-*.pkg.tar.zst'),
        # When I run the haswell optimized instructions on my machine, I get a wall of HIP_ERROR_OutOfMemory errors.
        # I suspect I cannot test this, since I have an AMD cpu.
    ]
    
    for tensorflow_pattern, python_tensorflow_pattern in patterns:
        tensorflow_path ,= script_dir.glob(tensorflow_pattern)
        python_tensorflow_path ,= script_dir.glob(python_tensorflow_pattern)
        check_packages(tensorflow_path, python_tensorflow_path)

if __name__ == '__main__':
    main()


