# ln -s /usr/local/lib/libboost_python3.so /usr/lib/x86_64-linux-gnu/libboost_python36.so
make -j"$(nproc)" -Wno-deprecated-gpu-targets distribute
