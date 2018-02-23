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
Vmax - maximal start particle speed 
C1 - factor describing local result influence on each particle
C2 - factor describing global result influence on each particle
W - factor describing previous speed vector influence on new speed vector.
