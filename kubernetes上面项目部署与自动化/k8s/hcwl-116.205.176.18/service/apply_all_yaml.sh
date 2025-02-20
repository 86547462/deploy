#!/bin/bash

# 遍历当前目录下的所有 .yaml 文件
for yaml_file in *.yaml; do
  echo "Applying $yaml_file"
  kubectl apply -f "$yaml_file"
done
