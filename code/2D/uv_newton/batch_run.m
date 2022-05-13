addpath(genpath('../'))

global f_last gnorm_last total_iter perimeter_norm stopped_type u_n

%% 
% dataDir = '/Users/charlesdu/MEGAsync/winshare/BCQN/input/';
% initDir = '/Users/charlesdu/MEGAsync/winshare/BCQN/QN/';
% resDir = '/Users/charlesdu/MEGAsync/winshare/BCQN/MIPS-QN/';

dataDir= '/Volumes/share/BCQN/experiment/20220510/Letters_input/';
initDir= '/Volumes/share/BCQN/experiment/20220510/Letters_sTGC(iso)_result/';
resDir = '/Volumes/share/BCQN/experiment/20220510/Letters_BCQN_after_sTGC(iso)/';

% type = 'mips';
type = 'iso';

% exampleNameList = readtable('/Users/charlesdu/MEGAsync/winshare/BCQN/namelist_QN.csv','ReadVariableNames',false);
exampleNameList = readtable('/Volumes/share/BCQN/experiment/20220510/namelist_Letters.csv','ReadVariableNames',false);
exampleNameList = exampleNameList.(1);
%%

for exampleName = exampleNameList.'
    
    name = exampleName{1};
    uv_init(join([dataDir, name]),...
    join([dataDir, name, '_handles.mat']),...
    join([initDir, name, '_result.mat']),...
    type);

    

    total_iter = 0;
    f_last = -1;
    gnorm_last = -1;

    tic
    vert = newton_solver(u_n, 1);
    time = toc;
    
    save(join([resDir, name, '-', type, '.mat']),'vert',...
    'stopped_type','total_iter','f_last','gnorm_last','perimeter_norm','time');
    
end

