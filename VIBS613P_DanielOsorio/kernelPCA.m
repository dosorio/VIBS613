clear all; clc;
%% How PCA works - Data
rng(0);
data(:,1) = randn(30,1);
data(:,2) = 3.4 + 1.2 * data(:,1);
data(:,2) = data(:,2) + 0.2*randn(size(data(:,1)));
data = sortrows(data,1);

figure
axes('LineWidth',0.6,...
    'FontName','Helvetica',...
    'FontSize',8,...
    'XAxisLocation','Origin',...
    'YAxisLocation','Origin');
line(data(:,1),data(:,2),...
    'LineStyle','None',...
    'Marker','o');
axis equal

%% How PCA works - Step 1 Center the data
data(:,1) = data(:,1)-mean(data(:,1));
data(:,2) = data(:,2)-mean(data(:,2));

%% How PCA works - Step 2 Calculate the covariance matrix of data
(size(data,1)-1)^-1 * data' * data
C = cov(data);

%% How PCA works - Step 3 The eigenvalues
[V,D] = eig(C);

%% How PCA works - Step 4 The components
figure
axes('LineWidth',0.6,...
    'FontName','Helvetica',...
    'FontSize',8,...
    'XAxisLocation','Origin',...
    'YAxisLocation','Origin');
line(data(:,1),data(:,2),...
    'LineStyle','None',...
    'Marker','o');
line([0 V(1,1)],[0 V(2,1)],...
    'Color',[0.8 0.5 0.3],...
    'LineWidth',0.75);
line([0 V(1,2)],[0 V(2,2)],...
    'Color',[0.8 0.5 0.3],...
    'LineWidth',0.75);
axis equal

%% How PCA works - Step 5 The new coordinate system
newdata = V * data';
newdata = newdata';
newdata = fliplr(newdata);
figure
axes('LineWidth',0.6,...
    'FontName','Helvetica',...
    'FontSize',8,...
    'XAxisLocation','Origin',...
    'YAxisLocation','Origin');
line(newdata(:,1),newdata(:,2),...
    'LineStyle','None',...
    'Marker','o');
axis equal

%% How Kernel works - Data
x = randn(250,1); 
y = randn(250,1);
z = randn(250,1);
group = (abs(x) < 1 & abs(y) < 1)+1;
x(group==2) = x(group==2)*0.7
y(group==2) = y(group==2)*0.7
data = [x y z];
figure
plot3(data(group==1,1),data(group==1,2),data(group==1,3),'bo',data(group==2,1),data(group==2,2),data(group==2,3),'ro') 
legend('Group 1', 'Group 2');

%% PCA without Kernel
[W pc] = pca(data);
pc = pc'; W = W';
group1 = pc(:,group==1);
group2 = pc(:,group==2);
figure
plot(group1(1,:), group1(2,:), 'bo', group2(1,:), group2(2,:), 'ro');  
legend('Group 1', 'Group 2');

%% How Kernel works - Step 1 The kernel function
kernelFunction=@(z)exp(-z.*z/2)/sqrt(2*pi);
kData = kernelFunction(data);

%% How Kernel PCA works 
[W,pc] = pca(kData);

%% Kernel PCA result
pc = pc'; W = W';
group1 = pc(:,group==1);
group2 = pc(:,group==2);
figure
plot(group1(1,:), group1(2,:), 'bo', group2(1,:), group2(2,:), 'ro');  
legend('Group 1', 'Group 2');