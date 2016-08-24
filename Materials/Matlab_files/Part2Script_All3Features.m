pmb = load('C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\predicate-matrix-binary.txt');
featureType1 = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-features-sift.tar\AwA-features-sift\Animals_with_Attributes\Features\sift-hist';
featureType2 = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-features-cq.tar\AwA-features-cq\Animals_with_Attributes\Features\cq-hist';
featureType3 = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-features-phog.tar\AwA-features-phog\Animals_with_Attributes\Features\phog-hist';
trainingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\trainclasses.txt';
testingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\testclasses.txt';

features = dir(featureType1);
features = features(3 : end);
%histogramTotal = cell(size(features, 1), 1);
histogramTotal = [];
histTest = [];
histSingle = [];
adj_pmb = [];



for i = 1 : size(features, 1) %go through each directory
    %t = cputime;
    fprintf('reading directory %s\n', features(i).name);
    ftemp = dir([featureType1 '/' features(i).name]); %get each txt file inside each directory
    ftemp = ftemp(3: end);
    histograms = zeros(1, 2000);
    val = pmb(i, :);
    v = randperm(size(ftemp, 1), 50);
    for j = 1 : 50 %go through every file in directory
        d = [featureType1 '/' features(i).name '/' ftemp(v(j)).name];
        adj_pmb = [adj_pmb; val];
        hist = load(d); %load histogram
        histogramTotal = [histogramTotal; hist];
        %histograms = histograms + hist; 
    end
    %histogramTotal = [histogramTotal; histograms];
end
%e = cputime-t;
%disp(e);
models = train_attribute_models(adj_pmb, histogramTotal);
commputed_attr = compute_attribute_probs(models, featureType1);
 computed_probs = compute_class_probs(commputed_attr, pmb);
 ground_truth_class = zeros(1, 1000); %contains which class each test image belongs to
 for i = 1 : 10
    ground_truth_class((((i-1)*100)+1): (100*i)) = i; 
 end
 acc1 = compute_accuracy(computed_probs, ground_truth_class);
 disp(acc1);


features = dir(featureType2);
features = features(3 : end);
%histogramTotal = cell(size(features, 1), 1);
histogramTotal2 = [];
histTest = [];
histSingle = [];
adj_pmb2 = [];



for i = 1 : size(features, 1) %go through each directory
    %t = cputime;
    fprintf('reading directory %s\n', features(i).name);
    ftemp = dir([featureType2 '/' features(i).name]); %get each txt file inside each directory
    ftemp = ftemp(3: end);
    histograms = zeros(1, 2688);
    val = pmb(i, :);
    v = randperm(size(ftemp, 1), 50);
    for j = 1 : 50 %go through every file in directory
        d = [featureType2 '/' features(i).name '/' ftemp(v(j)).name];
        adj_pmb2 = [adj_pmb2; val];
        hist = load(d); %load histogram
        histogramTotal2 = [histogramTotal2; hist];
         
    end
    
end
%e = cputime-t;
%disp(e);
models2 = train_attribute_models(adj_pmb2, histogramTotal2);
commputed_attr2 = compute_attribute_probs(models2, featureType2);
computed_probs2 = compute_class_probs(commputed_attr2, pmb);
ground_truth_class2 = zeros(1, 1000); %contains which class each test image belongs to
for i = 1 : 10
   ground_truth_class2((((i-1)*100)+1): (100*i)) = i; 
end
acc2 = compute_accuracy(computed_probs2, ground_truth_class2);
disp(acc2);

features = dir(featureType3);
features = features(3 : end);
%histogramTotal = cell(size(features, 1), 1);
histogramTotal3 = [];
histTest = [];
histSingle = [];
adj_pmb3 = [];



for i = 1 : size(features, 1) %go through each directory
    %t = cputime;
    fprintf('reading directory %s\n', features(i).name);
    ftemp = dir([featureType3 '/' features(i).name]); %get each txt file inside each directory
    ftemp = ftemp(3: end);
    val = pmb(i, :);
    v = randperm(size(ftemp, 1), 75);
    for j = 1 : 75 %go through every file in directory
        d = [featureType3 '/' features(i).name '/' ftemp(v(j)).name];
        adj_pmb3 = [adj_pmb3; val];
        hist = load(d); %load histogram
        histogramTotal3 = [histogramTotal3; hist];
         
    end
    
end
%e = cputime-t;
%disp(e);
models3 = train_attribute_models(adj_pmb3, histogramTotal3);
commputed_attr3 = compute_attribute_probs(models3, featureType3);
computed_probs3 = compute_class_probs(commputed_attr3, pmb);
ground_truth_class3 = zeros(1, 2000); %contains which class each test image belongs to
for i = 1 : 10
   ground_truth_class3((((i-1)*200)+1): (200*i)) = i; 
end
acc3 = compute_accuracy(computed_probs3, ground_truth_class3);
disp(acc3);