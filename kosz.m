%% Parametry
% v- wektor predkosci
% x- po³o¿enie cz¹steczki
% gbest - globalnie najlepsze po³o¿enie
% contp - po³o¿enie w chwili czasowej wszystkich cz¹stek
% contv - wartoœæ w chwili czasowej wektora prêdkoœci

%% Schemat algorytmu
% 1. wylosowanie wektora po³o¿eñ cz¹stek miêdzy granicznymi wartoœciami po³o¿eñ
% 2. wylosowanie wektora prêdkoœci cz¹stek miêdzy granicznymi wartoœciami
% prêdkoœci
% 3. Wyznaczenie wartoœci funkcji w punktach po³o¿eñ cz¹stek
% 4. wyznacznie najmmniejszej wartoœci funkcji oraz po³o¿enia tej wartoœci
% 5. Wybór najlepszej cz¹steczki lokalnie - w pokoleniu - zapisujemy
% wartoœæ i po³o¿enie
% 6. Wybór najlepszej cz¹steczki globalnie - porównanie wyników miêdzy
% pokoleniami
% 7. Modyfikacja wektora prêdkoœci po ka¿dym pokoleniu
% 8. Modyfikacja po³o¿enia o nowy wektor prêdkoœci
% 9. Wyœwietlenie wyniku

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
% C1=0.003;   % wp³yw lokalnego wyszukiwania ka¿dej cz¹steczki
% C2=0.3;     % wp³yw globalnego wyszukiwania najlepszej wartoœci
% W=0.2;      % wp³yw dotychczasowego wektora prêdkoœci na nowy wektor
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