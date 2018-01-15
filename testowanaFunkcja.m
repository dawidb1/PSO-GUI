function [f]=testowanaFunkcja(nr_funkcji, X,Y)

switch nr_funkcji
    case 1
      f= gauss2DD(X,Y);
    case 2
      f= 1 - abs(Y);
    case 3
      f=(exp(-X.^2 - Y.^2)).*X ;
    case 4
      a = 0.005;
      f = sin((X.^2+Y.^2).*a)./a
    case 5
      f = ((sin(X.*0.1)).*(cos(Y.*0.1)))./0.1
end

end
