function [MIN W K]=minind(X)
[a b]=min(X);
[q p]=min(a);
MIN=q;
K=p;
W=b(p);
end

