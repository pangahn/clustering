function D=sqdist(X, Y)
% 计算两列数据点矩阵，点点之间的距离
D=bsxfun(@plus,dot(X,X,1)',dot(Y,Y,1))-2*(X'*Y);
end