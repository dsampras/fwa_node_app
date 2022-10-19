#!/bin/sh
#Description: Script to create container tarball
#Process:
# 1. Extract /build/images/rootfs.tar to /fwa_buildroot/root/
# 2. Merge directory /fwa_build/custom and /fwa_buildroot/root to /fwa_buildroot/output
# 3. Compress /fwa_buildroot/output to rootfs.tar.gz
# 4. Compress /fwa_buildroot/rootfs.tar.gz and /fwa_buildroot/ADF to /fwa_build/

work_dir=${HOME}/Desktop/fwa_node_app
#0 Clean previous build
rm -rf ${work_dir}/testapp-1.0.tar.gz
rm -rf ${work_dir}/output/
rm -rf ${work_dir}/root/
mkdir ${work_dir}/tmp/

# 1
mkdir ${work_dir}/root/
tar -xf ${work_dir}/buildroot/rootfs.tar -C ${work_dir}/root/

#2
mkdir ${work_dir}/output
cp -r ${work_dir}/root/* ${work_dir}/output/
\cp -r ${work_dir}/custom/* ${work_dir}/output/

#3
cd ${work_dir}/output/
tar -czf ${work_dir}/tmp/rootfs.tar.gz *

#4

cp ${work_dir}/ADF ${work_dir}/tmp
cd ${work_dir}/tmp
tar -czf ${work_dir}/testapp-1.0.tar.gz *

#x - Cleanup
rm -rf ${work_dir}/tmp
