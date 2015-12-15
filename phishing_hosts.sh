#!/usr/bin/env bash

wget -i feeds

echo -e "127.0.0.1    localhost.localdomain localhost" > hosts

cat ./*.csv ./*.txt | grep -v phish > temp_file
cat temp_file | cut -d "/" -f3 | sort -u >> hosts
sed -i -e 's/^/0.0.0.0 /' hosts
sed -i -e 's/0.0.0.0 127.0.0.1/127.0.0.1/' hosts

rm -rf ./*.csv ./*.txt ./temp_file
