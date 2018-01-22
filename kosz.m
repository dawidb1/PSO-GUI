%% Parametry
% v- wektor predkosci
% x- po�o�enie cz�steczki
% gbest - globalnie najlepsze po�o�enie
% contp - po�o�enie w chwili czasowej wszystkich cz�stek
% contv - warto�� w chwili czasowej wektora pr�dko�ci

%% Schemat algorytmu
% 1. wylosowanie wektora po�o�e� cz�stek mi�dzy granicznymi warto�ciami po�o�e�
% 2. wylosowanie wektora pr�dko�ci cz�stek mi�dzy granicznymi warto�ciami
% pr�dko�ci
% 3. Wyznaczenie warto�ci funkcji w punktach po�o�e� cz�stek
% 4. wyznacznie najmmniejszej warto�ci funkcji oraz po�o�enia tej warto�ci
% 5. Wyb�r najlepszej cz�steczki lokalnie - w pokoleniu - zapisujemy
% warto�� i po�o�enie
% 6. Wyb�r najlepszej cz�steczki globalnie - por�wnanie wynik�w mi�dzy
% pokoleniami
% 7. Modyfikacja wektora pr�dko�ci po ka�dym pokoleniu
% 8. Modyfikacja po�o�enia o nowy wektor pr�dko�ci
% 9. Wy�wietlenie wyniku

%% parametry poczatkowe
% clear
% close all
% clc
% 
% % TECHNICAL CONSTANTS
% PAUSE_TIME = 0.1;
% SEARCH_MAX = 1;
% SEARCH_MIN = 0;
% 
% SEARCH_MIN_OR_MAX = SEARCH_MIN;
% 
% WHICH_FUNCTION=4;   % 1 Gauss
%                     % 2 Roof
%                     % 3 
%                     % 4 Ripple
%                     % 5 Bumps
%                     
% % ALGORITM CONSTANTS
% NUMBER_OF_AGENTS=20;    %input('Podaj liczbe agentow: ');
% ITERATIONS=50;  %input('Podaj liczbe iteracji: ');
% XMIN=-30;    %input('Podaj dolny zakres x: ');
% XMAX=30;    %input('Podaj gorny zakres x: ');
% 
% YMIN=XMIN;
% YMAX=XMAX;
% 
% VMAX=0.1;%input('Podaj maksymalna poczatkowa predkosc: ');
%                 
% C1=0.003;   % wp�yw lokalnego wyszukiwania ka�dej cz�steczki
% C2=0.3;     % wp�yw globalnego wyszukiwania najlepszej warto�ci
% W=0.2;      % wp�yw dotychczasowego wektora pr�dko�ci na nowy wektor
% 
% %bestPosition - najlepsze polozenie lokalnie czastki
% %bestValue - najlepsza warotsc fitowania lokalnie dla czastki

%%
% figure('units','normalized','outerposition',[0 0 1 1])

%% wyswietlanie wynikow najlepszej czasteczki

% hold on 
% scatter3(xPosition,yPosition,particleValue,70,'r','filled');
% globalBestValue
% particleValue
% meanParticleValue = mean(particleValue)