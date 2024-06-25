function Prices = importCommodityData(filename)

% Detect the import options for the file CMO-Historical-Data-Monthly.xlsx.
opts = detectImportOptions(filename, ...
    "Sheet", "Monthly Prices", ...
    "VariableNamingRule", "preserve", ...
    "TextType", "string");

% Rename the first variable to Date.
opts.VariableNames = replace(opts.VariableNames, "Var1", "Date");

% Ensure that all variables apart from the first are numeric.
numVars = length(opts.VariableTypes);
opts.VariableTypes = ["string", repmat("double", 1, numVars - 1)];

% Ensure that the variable units are imported in addition to the data.
opts.VariableUnitsRange = "A6";

% Import the data.
Prices = readtable(filename, opts);

end % importCommodityData