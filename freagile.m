% fc = 10*1e9;
% Tr = 100*1e-6;
% N = 128;
% M = 64;
% Num = M*Tr*fc;
% K = 10;
% gamma_K = [0.1 0.2 0.3 0.25 0.15 0.35 0.4 0.6 0.05 0.15]; % 散射系数
% r_K = 800 + [ 6 4 7 5 0 3 1 6 8 9 ]; % 目标散射点径向距离
% t = 0:1/fc:(Num-1)/fc;
% 
% for i_M = 1:M
% 
% end
fs = 10e6;

[MPSK, t] = PSK_generator(fs,fc,phase_seq,M);