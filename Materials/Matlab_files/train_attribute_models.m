function [models] = train_attribute_models(pmb_matrix, histograms)
%---------inputs-------------------
%pmb_matrix : the 50x85 double from the predicate-matrix-binary.txt file
%histograms : the 50x2000 containing the sum of the histograms of each
%directory and every file in that directory 
%----------outputs------------------
%models - 85x1 cell array of attribute classifer models

trainingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\trainclasses.txt';
testingClasses = 'C:\Users\Alec\Desktop\ComputerVision\Homework 5\AwA-base\Animals_with_Attributes\testclasses.txt';

models = cell(85, 1);
t=cputime;
for i = 1 : 85
   fprintf('Generating model %i\n', i);
   m = pmb_matrix(:, i); %50x1 feature descriptor for a single attribute
   model = fitcsvm(histograms, m); %model generated from all the histograms and their relation to the 50x1 feature just extracted
   model = fitSVMPosterior(model); %extra step described in #5
   models{i} = model; %add to the cell array of attribute models
end
e = cputime-t;
disp(e);

end

