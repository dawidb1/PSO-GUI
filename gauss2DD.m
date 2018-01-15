function [Z] = gauss2DD(X,Y)
    A = 1;
    x0 = 0; y0 = 0;

    sigma_x = 10;
    sigma_y = 10;

    for theta = 0:pi/100:pi
        a = cos(theta)^2/(2*sigma_x^2) + sin(theta)^2/(2*sigma_y^2);
        b = -sin(2*theta)/(4*sigma_x^2) + sin(2*theta)/(4*sigma_y^2);
        c = sin(theta)^2/(2*sigma_x^2) + cos(theta)^2/(2*sigma_y^2);
        Z = A*exp( - (a*(X-x0).^2 + 2*b*(X-x0).*(Y-y0) + c*(Y-y0).^2)) ;
    end
end