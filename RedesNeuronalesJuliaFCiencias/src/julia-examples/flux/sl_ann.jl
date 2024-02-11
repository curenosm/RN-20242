using Flux, Images, MLDatasets, GLMakie
using Flux: crossentropy, onecold, onehotbatch, train!
using LinearAlgebra, Random, Statistics


Random.seed!(1)

X_train_raw, y_train = MLDatasets.MNIST.traindata(Float32)
X_test_raw, y_test = MLDatasets.MNIST.testdata(Float32)

X_train_raw
index = 1
img = X_train_raw[:, :, index]
colorview(Gray, img')


y_train_raw
y_train_raw[index]

X_test_raw
img = X_test_raw[:, :, index]
