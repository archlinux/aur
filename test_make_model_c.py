# From https://github.com/AmirulOm/tensorflow_capi_sample
#  via https://medium.com/analytics-vidhya/deploying-tensorflow-2-1-as-c-c-executable-1d090845055c

import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '1' # 0 is everything; 1 is warnings and above, I guess

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

module.save('test_model_c') # save_format='tf' is the default.
import subprocess
subprocess.run(['tar', '-czvf', 'test_model_c.tar.gz', 'test_model_c'])
