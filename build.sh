#!/bin/bash

pushd installers
./build.sh
popd

pushd fsw
./build.sh
popd

echo "If you want to build another image, for switchyard, dtgov or rtgov, just go into the proper directory and execute build.sh"
