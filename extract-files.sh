#!/bin/sh

# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/common/generate-blob-scripts.sh - DO NOT EDIT

VENDOR=samsung
COMMON=p31xx
DEVICE=p3100
COMMONBASE=../../../vendor/$VENDOR/$COMMON/common
DEVICEBASE=../../../vendor/$VENDOR/$COMMON/$DEVICE

echo "Pulling common files..."
for FILE in `cat proprietary-common-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $COMMONBASE/$DIR ]; then
        mkdir -p $COMMONBASE/$DIR
    fi
    adb pull /$FILE $COMMONBASE/$FILE
done

echo "Pulling device specific files..."
for FILE in `cat proprietary-$DEVICE-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $DEVICEBASE/$DIR ]; then
        mkdir -p $DEVICEBASE/$DIR
    fi
    adb pull /$FILE $DEVICEBASE/$FILE
done

./setup-makefiles.sh
