function [acc] = compute_accuracy(probs_class, ground_truth_class)
%---------------inputs------------------
%probs_class : 10xn matrix of probabilities for each of the 10 test classes
%ground_truth_class: 1xn matrix of ground_truth class labels
%--------------outputs--------------------
%acc = accuracy of the probs_class to ground_truth_class

sum = 0;
total = size(ground_truth_class, 2);

for i = 1 : size(probs_class, 2)
   p = probs_class(:, i);
   [~, inds] = max(p);
   indice = ground_truth_class(1, i);
   if (inds == indice)
       sum = sum+1;
   end
    
end

acc = sum/total;

end

