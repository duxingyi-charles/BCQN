addpath(genpath('../'))

global f_last gnorm_last total_iter perimeter_norm stopped_type u_n

%% 

% dataDir = '/Users/charlesdu/Desktop/sigAsia2021/BCQN/data/';
% resDir = '/Users/charlesdu/Desktop/sigAsia2021/BCQN/BCQN_result/';

dataDir = '/Volumes/share/BCQN/experiment/20220508/Letters_input/';
ourResDir = '/Volumes/share/BCQN/experiment/20220508/Letters_sTGC(iso)_result/';
resDir = '/Volumes/share/BCQN/experiment/20220508/';


exampleName = 'david_o_G';

initName = 'david_o_G';

type = 'iso';

%%

uv_init(join([dataDir, exampleName]),...
    join([dataDir, exampleName, '_handles.mat']),...
    join([ourResDir, initName, '_result.mat']),...
    type);

total_iter = 0;
f_last = -1;
gnorm_last = -1;

tic
vert = newton_solver(u_n, 1);
time = toc;

save(join([resDir, initName, '-', type, '(newton).mat']),'vert',...
    'stopped_type','total_iter','f_last','gnorm_last','perimeter_norm','time');
