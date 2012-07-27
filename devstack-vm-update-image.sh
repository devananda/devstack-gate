#!/bin/bash -xe

# Update the VM used in devstack deployments.

# Copyright (C) 2011-2012 OpenStack LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.

GATE_SCRIPT_DIR=$(cd $(dirname "$0") && pwd)
cd $WORKSPACE

if [[ ! -e devstack ]]; then
    git clone https://github.com/openstack-dev/devstack
fi
cd devstack
git remote update
git remote prune origin
cd $WORKSPACE

$GATE_SCRIPT_DIR/devstack-vm-update-image.py $1

