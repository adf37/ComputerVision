function [probs_attr] = compute_attribute_probs(train_attr, featuretype )
%--------------inputs-------------------------
%train_attr : 85x1 cell array of models trained for each attribute
%--------------outputs-----------------------
%probs_attr : 85xn matrix of probabilities, where n is the number of test
%images used

testingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\testclasses.txt';
test = textread(testingClasses, '%s');
%featureType1 = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-features-sift.tar\AwA-features-sift\Animals_with_Attributes\Features\sift-hist';
features = dir(featuretype);
features = features(3 : end);
probs = [];
probs_a = [];

for a = 1 : 10
    val = test{a};
    ftemp = dir([featuretype '/' val]);
    ftemp = ftemp(3 : end);
    hist = [];
    v = randperm(size(ftemp, 1), 200);
    %probs_attr = zeros(85, 100); %only doing first 100 images for now
    for i = 1 : 200
        fprintf('Reading image %i of directory %s\n', i, val);
        probs = [];
        d = [featuretype '/' val '/' ftemp(v(i)).name];
        h = load(d);
        for j = 1 : 85
            model = train_attr{j};
            [label, scores] = predict(model, h);
            assert(sum(scores) == 1);
            %probs_attr(j, i) = scores(:, 2);
            probs = [probs; scores(:, 2)];
        end
        probs_a = [probs_a probs];
    end
end

probs_attr = probs_a;

