clear
close all
clc

% TECHNICAL CONSTANTS
PAUSE_TIME = 0.1;
SEARCH_MAX = 1;
SEARCH_MIN = 0;

SEARCH_MIN_OR_MAX = SEARCH_MIN;

WHICH_FUNCTION=4;   % 1 Gauss
                    % 2 Roof
                    % 3 
                    % 4 Ripple
                    % 5 Bumps
                    
% ALGORITM CONSTANTS
NUMBER_OF_AGENTS=20;    %input('Podaj liczbe agentow: ');
ITERATIONS=50;  %input('Podaj liczbe iteracji: ');
XMIN=-30;    %input('Podaj dolny zakres x: ');
XMAX=30;    %input('Podaj gorny zakres x: ');

YMIN=XMIN;
YMAX=XMAX;

VMAX=0.1;%input('Podaj maksymalna poczatkowa predkosc: ');
                
C1=0.003;   % wp³yw lokalnego wyszukiwania ka¿dej cz¹steczki
C2=0.3;     % wp³yw globalnego wyszukiwania najlepszej wartoœci
W=0.2;      % wp³yw dotychczasowego wektora prêdkoœci na nowy wektor

%bestPosition - najlepsze polozenie lokalnie czastki
%bestValue - najlepsza warotsc fitowania lokalnie dla czastki

%% Wyswietlanie wykresu analizowanej funkcji

figure('units','normalized','outerposition',[0 0 1 1])
xStart=XMIN-round(0.3*(XMAX-XMIN));
xStop=XMAX+round(0.3*(XMAX-XMIN));
yStart=xStart;
yStop=xStop;

functionSamples = (xStop-xStart)*2;
xToShow=linspace(xStart, xStop, functionSamples);
xToShow=repmat(xToShow,functionSamples,1);
yToShow=xToShow';

fToShow=testowanaFunkcja(WHICH_FUNCTION, xToShow, yToShow);
surf(xToShow,yToShow,fToShow);
xlabel('X axes');
ylabel('Y axes');
view(45,45);

%% INITIALIZATION
e=exp(1);
VMIN=-VMAX;

% PARTICLE POSITIONS
xPosition=XMIN+(XMAX-XMIN).*rand(NUMBER_OF_AGENTS,1);
yPosition=YMIN+(YMAX-YMIN).*rand(NUMBER_OF_AGENTS,1);

% SPEED VECTORS FOR PARTICLES
speedXAxis=VMIN+(VMAX-VMIN).*rand(NUMBER_OF_AGENTS,1);
speedYAxis=VMIN+(VMAX-VMIN).*rand(NUMBER_OF_AGENTS,1);

%GENERATE PARTICLE VALUE
particleValue=testowanaFunkcja(WHICH_FUNCTION, xPosition,yPosition);
bestValue=particleValue; 
bestPosition=[xPosition yPosition];

switch SEARCH_MIN_OR_MAX
    case 1
        [maxValue,whichParticle, bla]=maxind(particleValue);
        globalBestValue=maxValue;
    case 0
        [minValue,whichParticle, bla]=minind(particleValue);
        globalBestValue=minValue;
end

globalBestPosition=[xPosition(whichParticle) yPosition(whichParticle)];
scatters = zeros(1,ITERATIONS);

%% ALGORITM
for t=1:ITERATIONS
    %fitowanie
    particleValue=testowanaFunkcja(WHICH_FUNCTION, xPosition,yPosition);
    hold on
    scatters(t) = scatter3(xPosition,yPosition,particleValue,70,'r','filled');

    switch SEARCH_MIN_OR_MAX
        case SEARCH_MAX
            % local best
            for i=1:NUMBER_OF_AGENTS
                if particleValue(i) < bestValue(i)
                 bestValue(i)=particleValue(i);
                 bestPosition(1,:)=[xPosition(i) yPosition(i)];
                end
            end         
            [maxValue,whichParticle,bla]=maxind(particleValue);
            % global best
            if maxValue > globalBestValue
                globalBestValue=maxValue;
                globalBestPosition= [xPosition(whichParticle) yPosition(whichParticle)];
            end    
            
        case SEARCH_MIN
            % local best
            for i=1:NUMBER_OF_AGENTS
                if particleValue(i) > bestValue(i)
                 bestValue(i)=particleValue(i);
                 bestPosition(1,:)=[xPosition(i) yPosition(i)];
                end
             end
            [minValue,whichParticle,bla]=minind(particleValue);
            % global best
            if minValue < globalBestValue
                globalBestValue=minValue;
                globalBestPosition= [xPosition(whichParticle) yPosition(whichParticle)];
            end    
    end
    
    %modify v
    xLocal=C1*rand(1,1)*(bestPosition(:,1)-xPosition);
    yLocal=C1*rand(1,1)*(bestPosition(:,2)-yPosition);
        
    xGlob=C2*rand(1,1)*(globalBestPosition(:,1)-xPosition);  
    yGlob=C2*rand(1,1)*(globalBestPosition(:,2)-yPosition); 
    
    speedXAxis=speedXAxis*(W)+xLocal+xGlob;
    speedYAxis=speedYAxis*(W)+yLocal+yGlob;

    %modify x    
    xPosition = xPosition+speedXAxis;s
    yPosition = yPosition+speedYAxis;

    pause(PAUSE_TIME);
    set(scatters(t),'Visible','off')
end
hold on 
scatter3(xPosition,yPosition,particleValue,70,'r','filled');
globalBestValue
particleValue
meanParticleValue = mean(particleValue)
