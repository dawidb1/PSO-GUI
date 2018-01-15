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