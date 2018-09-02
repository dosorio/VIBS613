% Reading the keys;
inputFile = fopen('../data/input1.txt','r');
keys = textscan(inputFile,'%s');
fclose(inputFile);

% Reading the dictionary;
dictionaryFile = fopen('../data/input2.txt','r');
dictionary = textscan(inputFile,'%s %f');
fclose(dictionaryFile);

% Reporting output;
outputFile = fopen('../results/output.txt','w');
for key = 1:size(keys{1})
    % Identifying matches;
    matchElements = ismember(dictionary{1},keys{1}(key));
    for row = 1:size(matchElements)
        if matchElements(row)
            fprintf(outputFile,'%s %f\n',string(dictionary{1}(row)),(dictionary{2}(row)));
        end
    end
end
fclose(outputFile);