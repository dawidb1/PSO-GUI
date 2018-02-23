# PSO 2D algorithm
Particle Swarm Optimization simulator in Matlab environment. You can test algorithm on 5th 3D functions build in and search maximum or minimum function value. 

## Algorithm schema

1. Initialize random particle vector.
2. Initialize random speed vector of particles.
3. Checking values of particles.
4. Choosing best local particle and save it. 
5. Choosing best global particle - beetween generations.
6. Modifying speed vector after each generation.
7. Modifying particle coordination using new speed vector.
8. Displaying results.


## Parameters
- Vmax - maximal start particle speed 
- C1 - factor describing local result influence on each particle
- C2 - factor describing global result influence on each particle
- W - factor describing previous speed vector influence on new speed vector.

*Polish version - Polska wersja*
1. wylosowanie wektora położeń cząstek między granicznymi wartościami położeń
2. wylosowanie wektora prędkości cząstek między granicznymi wartościami
prędkości
3. Wyznaczenie wartości funkcji w punktach położeń cząstek
5. Wybór najlepszej cząsteczki lokalnie - w pokoleniu - zapisujemy
wartość i położenie
6. Wybór najlepszej cząsteczki globalnie - porównanie wyników między
pokoleniami
7. Modyfikacja wektora prędkości po każdym pokoleniu
8. Modyfikacja położenia o nowy wektor prędkości
9. Wyświetlenie wyniku

- Vmax - maksymalna prędkość początkowa
- C1 -  współczynnik określający wpływ lokalnego wyszukiwania każdej cząsteczki
- C2 - współczynnik określający wpływ globalnego wyszukiwania najlepszej wartości, inaczej - wpływ przewodnika stada.
- W - współczynnik określający wpływ dotychczasowego wektora prędkości na nowy wektor prędkości
