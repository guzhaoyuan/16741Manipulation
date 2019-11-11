% 16-741 Mechanics of Manipulation, Fall 2015
% Author: Sung Kyun Kim (kimsk@cs.cmu.edu)
%
% n: inward-pointing direction of a contact normal [nx; ny; nz]; 3x1 vector
% R: a rotation matrix with positive x-axis aligned with n; 3x3 matrix
%
% NOTE: As only one direction vector is specified, there is one redundant degree of freedom in the determination of R

function [R] = computeRotMat(n)
% write your code here
    option_vec1 = [1,0,0]';
    option_vec2 = [0,1,0]';
    % Get a random vector that is perpendicular to n.
    ny = cross(n,option_vec1);
    if norm(ny) == 0 % Cover the case of parallel.
        ny = cross(n,option_vec2);
    end
    
    n = n / norm(n);
    ny = ny / norm(ny);
    nz = cross(n,ny);
    
    R = [n,ny,nz];
end
