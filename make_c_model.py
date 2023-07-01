# From https://github.com/AmirulOm/tensorflow_capi_sample
#  via https://medium.com/analytics-vidhya/deploying-tensorflow-2-1-as-c-c-executable-1d090845055c

def is_gfx1031():
    from pathlib import Path
    if not Path('/opt/rocm/bin/rocminfo').exists():
        return False
    import subprocess
    rocminfo = subprocess.check_output(['/opt/rocm/bin/rocminfo']).decode('utf-8')
    import re
    expression = re.compile(r'(gfx\d+)')
    matches = (expression.search(line) for line in rocminfo.splitlines())
    architectures = {match.groups()[0] for match in matches if not match is None}
    # if len(architectures) != 1, we ignore it since idk what to do then.
    return {'gfx1031'} == architectures

import os
if is_gfx1031():
    os.environ['HSA_OVERRIDE_GFX_VERSION'] = '10.3.0'

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '1' # 0 is everything; 1 is warnings and above, I guess
# os.environ['TF_CPP_MAX_VLOG_LEVEL'] = '-1' # Suppresses "ROCm fusion" message but not "NUMA node negative" message.

import numpy as np
import tensorflow as tf

class testModel(tf.keras.Model):
  def __init__(self):
    super(testModel, self).__init__()
    self.dense1 = tf.keras.layers.Dense(1, kernel_initializer='Ones', activation=tf.nn.relu)
  def call(self, inputs):
    return self.dense1(inputs)

input_data = np.asarray([[10]])
module = testModel()
# module._set_inputs(input_data) # This step does not change the output.
repr(module(input_data))

module.save('c_model_test') # save_format='tf' is the default.
