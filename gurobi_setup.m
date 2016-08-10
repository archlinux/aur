function gurobi_setup()
% gurobi_setup Setup and test the Gurobi Matlab interface

% Numeric version
ver = version;
ver(ver=='.') = ' ';
ver = sscanf(ver,'%d');

if (ver(1) ~= 7 && ver(1) ~= 8) || ...
   (ver(1) == 7 && ver(2) <  7) || ...
   (ver(1) == 8 && ver(2) >  3)
    warning('gurobi_setup:MATLABver', ...
            ['You are using MATLAB %s.\n' ...
             'The Gurobi MATLAB interface currently supports ' ...
             'R2008b-R2015b.'], version);
end

gurobipath = mfilename('fullpath');
slashes = strfind(gurobipath, '/');
gurobipath = gurobipath(1:slashes(end));
addpath(gurobipath)

try
    gurobi(1)
catch me
    if ~strcmp(me.identifier, 'gurobi:BadInput')
        throw(me)
    end
end

% gurobi.mex* is loaded, now test for license issues
model.obj = 1;
model.A  = sparse(1,1);
model.rhs = 0;
model.sense = '=';
params.outputflag = false;
result = gurobi(model, params);

fprintf('\nThe MATLAB interface for Gurobi %d.%d.%d has been installed.\n\n', ...
        result.versioninfo.major, result.versioninfo.minor, ...
        result.versioninfo.technical);


disp('The directory')
disp(['    ' gurobipath])
disp('has been added to the MATLAB path.')
disp('To use Gurobi regularly, you must save this new path definition.');
disp('To do this, type the command' );
disp('    savepath' );
disp('at the MATLAB prompt. Please consult the MATLAB documentation');
disp('if necessary.');
