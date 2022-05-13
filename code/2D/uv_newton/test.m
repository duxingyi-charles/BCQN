addpath(genpath('../'))

example_uv_init

vert = newton_solver(u_n, 1);

save('/Users/charlesdu/MEGAsync/winshare/BCQN/MIPS-PN1/tmp.mat','vert');