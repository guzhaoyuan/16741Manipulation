% 16-741 Mechanics of Manipulation, Fall 2015
% Author: Sung Kyun Kim (kimsk@cs.cmu.edu)
%
% W: a set of normalized contact screws [[cix; ciy; ciz; c0ix; c0iy; c0iz] ...]; 6x(NM) matrix
% bFC: a flag which is true if the grasp is force closure; boolean
% zmax: the maximum value of the objective function at the optimal point; scalar

function [bFC, zmax] = isForceClosure(W)
% write your code here
    %% Get interior point P.
    MN = size(W,2);
    P = mean(W,2);
    assert(norm(P) ~= 0);
    %% Construct Convex Polytope Inequality by using dual. (Constraint)
    A = zeros(MN,6);
    b = ones(MN,1);
    for i = 1:MN
       A(i,:) = (W(:,i) - P)';
    end
    %% Construct Linear Programming problem.
    t = -P;
    [~, zmax, exitflag] = linprog(-t,A,b);
    if exitflag == 1
        zmax = -zmax;
        bFC = zmax < 1;
        return;
    end
    bFC = false;
end