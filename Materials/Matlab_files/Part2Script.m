pmb = load('C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\predicate-matrix-binary.txt');
featureType1 = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-features-sift.tar\AwA-features-sift\Animals_with_Attributes\Features\sift-hist';
featureType2 = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-features-cq.tar\AwA-features-cq\Animals_with_Attributes\Features\cq-hist';
trainingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\trainclasses.txt';
testingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\testclasses.txt';

features = dir(featureType2);
features = features(3 : end);
%histogramTotal = cell(size(features, 1), 1);
histogramTotal = [];
histTest = [];
histSingle = [];
adj_pmb = [];



for i = 1 : size(features, 1) %go through each directory
    %t = cputime;
    fprintf('reading directory %s\n', features(i).name);
    ftemp = dir([featureType2 '/' features(i).name]); %get each txt file inside each directory
    ftemp = ftemp(3: end);
    histograms = zeros(1, 2688);
    val = pmb(i, :);
    for j = 1 : 20 %go through every file in directory
        d = [featureType2 '/' features(i).name '/' ftemp(j).name];
        adj_pmb = [adj_pmb; val];
        hist = load(d); %load histogram
        histogramTotal = [histogramTotal; hist];
        %histograms = histograms + hist; 
    end
    %histogramTotal = [histogramTotal; histograms];
end
%e = cputime-t;
%disp(e);
%models = train_attribute_models(adj_pmb, histogramTotal);
commputed_attr = compute_attribute_probs(models);
computed_probs = compute_class_probs(commputed_attr, pmb);
ground_truth_class = zeros(1, 100); %contains which class each test image belongs to
for i = 1 : 10
   ground_truth_class((((i-1)*10)+1): (10*i)) = i; 
end
acc = compute_accuracy(computed_probs, ground_truth_class);
disp(acc);