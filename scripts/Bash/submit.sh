#!/bin/bash

cd /afs/cern.ch/work/t/tdiotale/test_2016/

export PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.4/x86_64-slc6-gcc48-opt/bin:$PATH
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.4/x86_64-slc6-gcc48-opt/lib:$LD_LIBRARY_PATH

python jsonUtilities.py --ifile dashb-wdt-251-data.1467324000030 --ohfile valid.csv
