#!/bin/bash

hhb -D -f efficientnet_b0.onnx --calibrate-dataset persian_cat.jpg --data-scale 0.017 --data-mean "124 117 104"  --board c920 --postprocess save_and_top5 -in "data" -on "prob" -is "1 3 224 224" --quantization-scheme float16

OPENCV_DIR=../../modules/opencv/
riscv64-unknown-linux-gnu-g++ main.cpp -I${OPENCV_DIR}/include/opencv4 -L${OPENCV_DIR}/lib   -lopencv_imgproc   -lopencv_imgcodecs -L${OPENCV_DIR}/lib/opencv4/3rdparty/ -llibjpeg-turbo -llibwebp -llibpng -llibtiff -llibopenjp2    -lopencv_core -ldl  -lpthread -lrt -lzlib -lcsi_cv -latomic -static -o efficientnet_example