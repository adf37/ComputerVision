function [probs_class] = compute_class_probs(probs_attr, pmb_matrix)
%-----------input---------------------
%probs_attr: 85xn matrix of probabilities for each descriptor of each image used in 
%the compute_attribute_probs function
%pmb_matrix: 50x85 matrix of labels 
%-----------output--------------------
%probs_class: 10xn matrix of probabilities where probs_class(i, l) is the
%probability that the i-th class is present in the l-th image
%---------------------------------------

testingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\testclasses.txt';
test = textread(testingClasses, '%s');
%8, 17, 26, 33, 34, 24, 22, 37, 38, 40 -- indices in pmb_matrix of test
%classes
pmb_indices = [8, 17, 26, 33, 34, 24, 22, 37, 38, 40];
%probs_attr : entry (i, j) is image i probability of attribute j
%entry (1, 2) corresponds to image 1's probability of having attribute 2
probs = [];
% prb = pmb_matrix(8, :);
% prb = prb';
% x = probs_attr(:, 1);
% x = round(x);
% sum = 0;
% for i = 1 : 85
%     val1 = x(i);
%     val2 = prb(i);
%     if (val1 == val2)
%         sum = sum + 1;
%     end
% end
p = [];
adjusted_pmb = zeros(100, 85);
probs_class =[];

for i = 1 : 10 %get the predicate matrices if each test image in order
    p = [p; pmb_matrix(pmb_indices(1, i), :)];
end
for i = 1 : size(probs_attr, 2) %go through each of the test images
    probs = [];
    for k = 1 : 10 %calculate probabilities for each of the 10 classes
       prob_c = 1;
    for j = 1 : size(probs_attr, 1) %for each attribute
        probability = probs_attr(j, i);
        attr = p(k, j);
        if (attr == 0)
            probability = (1-probability);
        end
        prob_c = prob_c * probability;
    end
    probs = [probs; prob_c];
   end
   probs_class = [probs_class probs];
    
end

