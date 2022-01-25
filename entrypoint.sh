#!/bin/sh -l

if [ -z "$INPUT_ACCESS_KEY" ]; then
  echo "ak is not set. Quitting."
  exit 1
fi
if [ -z "$INPUT_SECRET_KEY" ]; then
  echo "sk is not set. Quitting."
  exit 1
fi
pwd 
ls -al
yum -y install wget

wget https://obs-community.obs.cn-north-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz
tar -xzvf obsutil_linux_amd64.tar.gz
# cd obsutil_linux_amd64_5.3.4
chmod 755 obsutil_linux_amd64_5.3.4/obsutil
ls -al
./obsutil_linux_amd64_5.3.4/obsutil config -i=${INPUT_ACCESS_KEY} -k=${INPUT_SECRET_KEY} -e=obs.cn-north-4.myhuaweicloud.com  
./obsutil_linux_amd64_5.3.4/obsutil cp README.md obs://hdn-github-action/ -f -r

#cd /usr/local
#wget https://obs-community.obs.cn-north-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz
#mkdir obsutil_linux_amd64
#tar -xzvf obsutil_linux_amd64.tar.gz -C obsutil_linux_amd64 --strip-components 1
#cd obsutil_linux_amd64
#chmod 755 obsutil
#ln -s /usr/local/obsutil_linux_amd64/obsutil /usr/bin/obsutil
#/usr/bin/obsutil config -i=${INPUT_ACCESS_KEY} -k=${INPUT_SECRET_KEY} -e=obs.cn-north-4.myhuaweicloud.com  
#/usr/bin/obsutil cp ${{ github.workspace }}/README.md obs://hdn-github-action/ -f -r
