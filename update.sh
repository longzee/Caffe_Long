cd distribute/bin && \
for file in *.bin; do mv "$file" "${file%%.bin}"; done && \
cd  ../distribute
cp -r bin include lib proto /usr/local/ && \
cp -r python/caffe /usr/local/lib/python3.6/dist-packages/ && \
ldconfig
