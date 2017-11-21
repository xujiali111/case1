function [U, S, V] =svdUpdate(U,S,V,C)
c =size(C, 2);
r =size(S, 1);
q =size(V, 1);
%
% compute the projection of C onto the orthogonal subspace U
%
L =U'*C;
%
% compute the component of C orthogonal that is orthogonal to the =
%subspace U
%
H = C - U*L;
%
% compute an orthogonal basis of H and the projection of C onto the
% subspace orthogonal to U
%
[J, K] =qr(H,0);
%
% compute the center matrix Q
%
Q = [      S,  L;
        zeros(c,r),  K   ];
%
% compute the SVD of Q=20
%
[Uu, Su, Vu] =svd(Q, 0);
%
% compute the updated SVD of [M,C]
%
orth =U(:,1)'*U(:,end);
U =[U, J] * Uu;
S =Su;
V =[   V          , zeros(q, c); ...
        zeros(c, r), eye(c)     ] * Vu;
%
% compact the new SVD
%

r =min( size(U,1), size(V,2) );

U =U(:,1:r);
S =S(1:r,1:r);
V =V(:,1:r);
end
