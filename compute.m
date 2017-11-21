function [H,We,Wd]=compute(X,blta,k,batchsize)
[U,S,V]=svd(X,'econ');
[m,n]=size(X);
p=floor(blta*m);
We=V(1:p,:)*inv(S)*U';
H=sigmf(We*X,[1,0]);
Wd=X*H'*inv(H*H'+k*eye(size(H*H')));
We=Wd';
H=sigmf(We*X,[1,0]);
Wd=X*H'*inv(H*H'+k*eye(size(H*H')));
end




