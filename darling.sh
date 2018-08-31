#!/bin/bash
cd /Users/ydf/gopath/src/darling
gox -osarch=linux/amd64
docker build -t sifan/darling .
docker tag sifan/darling 111.231.55.121:5000/sifan/darling
docker push 111.231.55.121:5000/sifan/darling

ssh sifan@111.231.55.121




