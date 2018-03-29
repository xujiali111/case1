function [H,We,Wd,e]=compute(X,blta,k,increSize,firstSize)
[U,S,V]=svd(X(:,1:firstSize),'econ');
for i=1:(size(X,1)-firstSize)/increSize
    [U,S,V]=svdUpdate(U,S,V,X(:,firstSize+(i-1)*increSize:firstSize+i*increSize));
end
[m,n]=size(X);
r=rank(X)
    if r<min(m,n)
        p=r;
    else
        p=floor(blta*m);
    end
    p
We=V(1:p,:)*inv(S)*U';
H=sigmf(We*X,[1,0]);
Hni=H'*inv(H*H'+k*eye(size(H*H')));
Wd=X*Hni;
We=Wd';
H=sigmf(We*X,[1,0]);
Wd=X*Hni;
%e=det(Hni*H-eye(size(Hni*H)))^2;
end




