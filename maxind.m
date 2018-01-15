function [MAX W K]=maxind(X)
[a b]=max(X);
[q p]=max(a);
MAX=q;
K=p;
W=b(p);
end

