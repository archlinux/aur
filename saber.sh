#!/bin/bash
# Wrapper for saber binary to prevent loader error by changing LD path
LD_LIBRARY_PATH=/opt/saber/lib /opt/saber/saber
