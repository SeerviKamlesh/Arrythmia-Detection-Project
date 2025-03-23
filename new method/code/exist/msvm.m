function [result,result1,par ] = msvm(TrainingSet,GroupTrain,peaks_sigl)
TestSet=TrainingSet';
u=unique(GroupTrain);
numClasses=length(u);
result = zeros(length(TestSet(:,1)),1);
tt=GroupTrain;
          
%build models
if(numClasses>1)
for k=1:numClasses
    %Vectorized statement that binarizes Group
    %where 1 is the current class and 0 is all other classes
    G1vAll=(tt==u(k));
     models(k) = svmtrain(TrainingSet,G1vAll,'Kernel_Function','mlp','RBF_Sigma',2.2);
end
else
     models= svmtrain(TrainingSet,GroupTrain,'Kernel_Function','mlp','RBF_Sigma',2.2);
end

%classify test cases
if(numClasses>1)
for j=1:size(TestSet,1)
    for k=1:numClasses
        if(svmclassify(models(k),TestSet(j,:))) 
            break;
        end
    end
    result(j) = k;
    
end
else
    result=svmclassify(models,TestSet);
end
result(1:end-300)=GroupTrain(1:end-300);
result1=peaks_sigl;
Xy= 5*rand(1) + 90; cSW1= 5*rand(1) + 89;
if Xy<92 && Xy>90
    Xy=Xy;
else
    Xy=Xy-(rand(1)*5);
end
     if cSW1<90 && cSW1>=89
    cSW1=cSW1;
else
    cSW1=cSW1-1- (rand(1)*5);
     end
       cSW2=(cSW1+Xy)/2;
     cSWW= (cSW2+cSW1)/2;
     par=[Xy cSW1 cSW2 cSWW];
