
function[] = Algorithm(NUMBER_OF_AGENTS,ITERATIONS,VMAX,C1,C2,W,SEARCH_MIN_OR_MAX,WHICH_FUNCTION,PAUSE_TIME)

SEARCH_MAX = 1;
SEARCH_MIN = 2;

ShowFunction(WHICH_FUNCTION);
XMIN=-30;   
XMAX=30;    
YMIN=XMIN;
YMAX=XMAX;

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
    case SEARCH_MAX
        [maxValue,whichParticle, bla]=maxind(particleValue);
        globalBestValue=maxValue;
    case SEARCH_MIN
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
    if(t>1) 
        set(scatters(t-1),'Visible','off')
    end
    
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
    xPosition = xPosition+speedXAxis;
    yPosition = yPosition+speedYAxis;

    pause(PAUSE_TIME);
 
end

hold on 
scatter3(xPosition,yPosition,particleValue,70,'r','filled');
particleValue
meanParticleValue = mean(particleValue)
globalBestValue
end


