%Wyswietlanie wykresu analizowanej funkcji
function [] = ShowFunction(WHICH_FUNCTION)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cla
XMIN=-30;   
XMAX=30;    
YMIN=XMIN;
YMAX=XMAX;


xStart=XMIN-round(0.3*(XMAX-XMIN));
xStop=XMAX+round(0.3*(XMAX-XMIN));
yStart=xStart;
yStop=xStop;
xlim([xStart xStop])
ylim([yStart yStop])


functionSamples = (xStop-xStart)*2;
xToShow=linspace(xStart, xStop, functionSamples);
xToShow=repmat(xToShow,functionSamples,1);
yToShow=xToShow';

fToShow=testowanaFunkcja(WHICH_FUNCTION, xToShow, yToShow);
surf(xToShow,yToShow,fToShow);
xlabel('X axes');
ylabel('Y axes');
view(45,45);

end

