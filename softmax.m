%% step0:Initialise constants and parameters
inputSize = 28 * 28;
numClasses = 10;
lamda = 1e-4;

%% step1:oad data
%The input data is image,the output data is labels
images = loadMNISTImages('mnist/t10k-images.idx3-ubyte');
labels = loadMNISTLabels('mnist/t10k-labels.idx1-ubyte');
inputData = images;
theta = 0.005 * randn(numClasses * inputSize,1)

%% Step2:Implement softmaxCost

[cost,grad]=softmaxCost(theta,lamda,inputData,labels);

%% step3:Learning parameters

options.maxIter = 100;
softmaxModel = softmaxTrain(inputSize,numClass,lambda,inputData,labels,options);

%% step4:Testing
images = loadMNISTImages('/mnist/t10k-images-idx3-ubyte');
labels=loadMNISTLabels('/mnist/t10k-labels-idx1-ubyte');
labels(labels==0)= 10;
inputData = images;
[pred] = softmaxPredict(softmaxModel,inputData);

acc=mean(labels(:)==pred(:));
fprintf('Accuracy:%0.3f%%\n',acc*100);


