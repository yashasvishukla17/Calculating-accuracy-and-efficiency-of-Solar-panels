clc;
clear;
close all;

% Read data
data = xlsread('solar_data.xlsx');

% Extract 5 materials
data = data(3:end, 1:5);

% Number of days
num_days = size(data,1);

% Total generation
total_generation = sum(data,1);

% Try different load values
L_values = 100:10:1000;   % you can adjust range

% Store efficiency
eff_matrix = zeros(length(L_values), 5);

for i = 1:length(L_values)
    L = L_values(i);
    eff_matrix(i,:) = ((total_generation - (550 * num_days)) ./ (550 * num_days)) * 100;
end

% Find maximum efficiency and corresponding load
[max_eff, idx] = max(eff_matrix);

optimal_load = L_values(idx);

% Display results
disp('Maximum Efficiency for each material:');
disp(max_eff);

disp('Optimal Load for each material:');
disp(optimal_load);