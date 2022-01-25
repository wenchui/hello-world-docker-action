#!/bin/sh -l

wget https://obs-community.obs.cn-north-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz
tar -xzvf obsutil_linux_amd64.tar.gz
cd obsutil_linux_amd64_5.3.4
chmod 755 obsutil
./obsutil config -i=${{ secrets.ACCESSKEY }} -k=${{ secrets.SECRETACCESSKEY }} -e=obs.cn-north-4.myhuaweicloud.com  
cat /home/runner/.obsutilconfig
./obsutil cp ${{ github.workspace }}/src obs://hdn-github-action/ -f -r
