function X_transform = normalize(X, method)

d = size(X, 1);
% 每列2范数为1
if strcmp(method, 'L2')
    X_transform  =  X ./ repmat(sqrt(sum(X.*X)), [d,1]);
end

% 每类归一化到[0,1]
if strcmp(method, 'MinMax')
    X_transform = rescale(X, 'InputMin', min(X), 'InputMax', max(X));
end

% 每列无穷范数为1
if strcmp(method, 'Inf')
    X_transform = X ./ max(abs(X));
end

end