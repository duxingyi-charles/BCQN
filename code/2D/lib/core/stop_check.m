function [ output ] = stop_check( un2, un1, grad )
%STOP_CHECK Summary of this function goes here
%   Detailed explanation goes here

global tol_x_cnt tol_f_cnt stop_cnt tol_x tol_f perimeter_norm

global f_last gnorm_last stopped_type

output = 0;

if norm(un2 - un1) < tol_x * (1 + norm(un1))
    tol_x_cnt = tol_x_cnt + 1; 
else
    tol_x_cnt = 0;
end

if tol_x_cnt >= stop_cnt
    output = 1; 
    
    stopped_type = 1
    
    format long;
    f_last = energy_value(un2)
    gnorm_last = norm(grad)
    perimeter_norm
    
end

fn2 = energy_value(un2);
fn1 = energy_value(un1);
% 
if abs(fn1 - fn2) < tol_f * (1 + abs(fn1))
    tol_f_cnt = tol_f_cnt + 1;
else
    tol_f_cnt = 0;
end

if tol_f_cnt >= stop_cnt
    output = 1; 
    
    stopped_type = 2
    
    format long;
    f_last = fn2
    gnorm_last = norm(grad)
    perimeter_norm

end

if norm(grad) < 1e-3 * perimeter_norm
    output = 1;
    
    stopped_type = 3
    
    format long;
    f_last = fn2
    gnorm_last = norm(grad)
    perimeter_norm

end

end

